"""
    Basic script to load the NPI database into a mysql database table.

    http://nppes.viva-it.com/NPI_Files.html

    Maps Number data types to char
    Converts data times
    Empty strings and empty dates are interpreted to be nulls

    Also load taxonomies with descriptions

    http://www.nucc.org/index.php?option=com_content&task=view&id=107&Itemid=57

    Author: Janos G. Hajagos (@jhajagos) risk DOT limits AT gmail DOT com
"""

from string import join
import csv
import sys


def generate_load_table_script(filename,table_name,row_terminator=r"\n",escape_char=r"\0"):
    return """LOAD DATA INFILE '%s' INTO TABLE %s
      FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '%s'
      LINES TERMINATED BY '%s'
      IGNORE 1 LINES""" % (filename, table_name, escape_char, row_terminator) # The csv file is in Unix format


def split_and_join(text_to_split, split_by, join_by):
    split_text = text_to_split.split(split_by)
    return join(split_text, join_by)


def transform_text_into_field(text_to_transform):
    text1_transform = split_and_join(text_to_transform.lower()," ","_")
    text2_transform = split_and_join(text1_transform, "_&_","_and_")
    text3_transform = split_and_join(text2_transform, ",","")
    text4_transform = split_and_join(text3_transform, "/","_")
    text5_transform = split_and_join(text4_transform, "(","")
    text6_transform = split_and_join(text5_transform, ")","")
    text7_transform = split_and_join(text6_transform, ".","")
    text8_transform = split_and_join(text7_transform, "-","")
    text9_transform = split_and_join(text8_transform, "__","_")
    return text9_transform


def generate_alter_update_for_provider_taxonomy(fields_to_create, table_name_to_alter, target_taxonomy_field):
    alter_table_sql = ""
    update_table_sql = ""
    fields = fields_to_create.keys()
    fields.sort()

    for field in fields:
        new_field_name = "is_" + transform_text_into_field(field)
        alter_table_sql += "alter table %s add %s boolean;\n\n" % (table_name_to_alter, new_field_name)

        taxonomy_string = ""
        for taxonomy_code in fields_to_create[field]:
            taxonomy_string += " %s like '%%%s%%' or" % (target_taxonomy_field, taxonomy_code)
        update_table_sql += "update %s set %s = case when %s then 1 else 0 end;\n\n" % (table_name_to_alter,
                                                                                      new_field_name, taxonomy_string[:-3])

    return alter_table_sql, update_table_sql


def generate_fields_and_populate_flattened_fields(file_name="nucc_taxonomy_121_with_annotations.csv",
                                                  table_name_to_alter="", target_taxonomy_field=""):
    f = open(file_name)
    csv_annotations = csv.reader(f)

    i = 0
    header = []
    classification_fields_to_create = {}
    type_fields_to_create = {}
    type_fields_to_rename = {}
    specialty_fields_to_create = {}

    for row in csv_annotations:

        if i == 0:
            header = row
        else:
            type_field = row[header.index("Type")]
            classification_field = row[header.index("Classification")]
            specialty_field = row[header.index("Specialization")]
            code_field = row[header.index("Code")]
            add_type_field = row[header.index("build_type_field")]
            add_classification_field = row[header.index("build_classification_field")]
            classification_field_rename = row[header.index("classification_field_rename")]
            type_field_rename = row[header.index("type_field_rename")]
            add_specialty_field = row[header.index("build_specialty_field")]

            if add_classification_field == "1":
                if len(classification_field_rename) > 0:
                    classification_field = classification_field_rename

                if classification_field in classification_fields_to_create:
                    classification_fields_to_create[classification_field] += [code_field]
                else:
                    classification_fields_to_create[classification_field] = [code_field]

            if add_type_field == '1':
                if len(type_field_rename) > 0:
                    type_field = type_field_rename

                if type_field in type_fields_to_create:
                    type_fields_to_create[type_field] += [code_field]
                else:
                    type_fields_to_create[type_field] = [code_field]
                    if len(classification_field_rename) > 0:
                        type_fields_to_rename[type_field] = type_field_rename

            if add_specialty_field == '1':
                if specialty_field in specialty_fields_to_create:
                    specialty_fields_to_create[specialty_field] += [code_field]
                else:
                    specialty_fields_to_create[specialty_field] = [code_field]

        i += 1

    f.close()

    (alter_table_sql1, update_table_sql1) = generate_alter_update_for_provider_taxonomy(classification_fields_to_create,
                                                                                      table_name_to_alter,
                                                                                      target_taxonomy_field)


    (alter_table_sql2, update_table_sql2) = generate_alter_update_for_provider_taxonomy(type_fields_to_create,
                                                                                      table_name_to_alter,
                                                                                      target_taxonomy_field)


    (alter_table_sq3, update_table_sql3) = generate_alter_update_for_provider_taxonomy(specialty_fields_to_create,
                                                                                      table_name_to_alter,
                                                                                      target_taxonomy_field)
    return alter_table_sql1 + alter_table_sql2 + alter_table_sq3, update_table_sql1 + update_table_sql2 \
                                                                  + update_table_sql3


def main(nppes_data_file_name, taxonomy_file_name = None):
    f = open("npi_schema.txt","r")
    npi_lines=f.readlines()
    npi_split = [npi_line.split('\t') for npi_line in npi_lines]

    #First pass through build a dictionary connecting names to
    # select friendly names e.g. transform "Last name (U.S. Legal name)"
    # into "Last_name_US_Legal_name"

    field_name_db_field_names = {}

    for npi_row in npi_split:
            field_name = npi_row[0].strip()
            db_field_name = join(field_name.split(),"_")
            db_field_name = join(db_field_name.split("."),"")
            db_field_name = join(db_field_name.split("("),"")
            db_field_name = join(db_field_name.split(")"),"")

            if db_field_name[-1] == "_":
                db_field_name = db_field_name[:-1]

            try:
                position = db_field_name.index("_If_outside_US")
                db_field_name = db_field_name[0:position-1]
            except ValueError:
                pass

            field_name_db_field_names[field_name] = db_field_name

    #Second pass through we build a data type hash
    field_name_data_types = {}
    for npi_row in npi_split:
            field_name = npi_row[0].strip()
            data_type = npi_row[2].strip()
            field_length = npi_row[1].strip()

            if data_type == "NUMBER":
                data_type = "CHAR"

            if data_type == "DATE":
                field_length = ""
            else:
                field_length = "(%s)" % field_length

            field_name_data_types[field_name] = data_type + field_length

    #Third pass through we write the ddl script

    ddl_table_script = """
    drop table if exists NPPES_flat;
    create table NPPES_flat (
    """
    for npi_row in npi_split:
        field_name = npi_row[0].strip()
        db_field_name = field_name_db_field_names[field_name]
        data_type = field_name_data_types[field_name]
        ddl_table_script += "    %s %s,\n" % (db_field_name, data_type)
    ddl_table_script = ddl_table_script[:-2] + ")"

    # The fourth pass through we create the Mysql load script
    # Because of date time fields we need to do custom mappings and we also
    # set null values when fields are empty strings

    load_table_script = generate_load_table_script(nppes_data_file_name,"NPPES_flat")

    set_string = ""
    fields_string = ""

    for npi_row in npi_split:
        field_name = npi_row[0].strip()
        db_field_name = field_name_db_field_names[field_name]
        data_type = field_name_data_types[field_name]

        fields_string += "@%s," % db_field_name
        set_string += "%s = case @%s when '' then NULL else " % (db_field_name,db_field_name)
        if data_type == "DATE":
            set_string += "str_to_date(@%s, '%%m/%%d/%%Y') " % db_field_name
        else:
            set_string += "@%s " % db_field_name
        set_string += "end,\n"

    # Fifth pass through we now build a commented view to NPPES_flat
    # Because some of the fields are too long for mysql we leave the view
    # commented out. View can be used to emulate NPPESdata import with original fields
    # with a database that supports long field names. We escape field names with
    # [] because we ultimately import this into a SQLServer Database

    create_view_script = "create view NPPESdata as (select\n"

    for npi_row in npi_split:
        field_name = npi_row[0].strip()
        db_field_name = field_name_db_field_names[field_name]
        create_view_script += "   %s as [%s],\n" % (db_field_name,field_name)

    create_view_script = create_view_script[:-2] + " from NPPES_flat);"

    # Now we begin the process of normalizing the flat table
    # NPPES_header will be the main table

    # We now need to reverse our dictionary of field names
    db_field_name_field_names = {}
    for (field_name,db_field_name) in field_name_db_field_names.iteritems():
        db_field_name_field_names[db_field_name] = field_name

    # We first generate the schema for other_provider_identifiers
    other_provider_identifier_base_fields = ["Other_Provider_Identifier", "Other_Provider_Identifier_Type_Code",
                                             "Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State"]
    other_provider_identifier_maximum_flat_n = 50
    normalized_field_names = []  # Store fields that we normalized so that we can generate NPPES_header table

    opi_create_table_script = """drop table if exists other_provider_identifiers;
    create table other_provider_identifiers (
    npi char(10),
    sequence_id integer,
"""

    for db_field_name in other_provider_identifier_base_fields:
        first_db_field_name = db_field_name + "_1"
        first_field_name = db_field_name_field_names[first_db_field_name]
        first_data_type = field_name_data_types[first_field_name]

        opi_create_table_script += "    %s %s,\n" % (db_field_name,first_data_type)

    opi_create_table_script = opi_create_table_script[:-2] + ");"

    opi_load_table_script = ""
    for i in range(1,other_provider_identifier_maximum_flat_n + 1):
        opi_db_field_names = [opi_db_field_name + "_" + str(i) for opi_db_field_name in other_provider_identifier_base_fields]
        opi_load_table_script += """insert into other_provider_identifiers (npi,sequence_id,%s)
    select npf.npi, %s, %s from NPPES_flat npf
where %s is not NULL;\n\n""" % (join(other_provider_identifier_base_fields,","), i, join(opi_db_field_names,","), join(opi_db_field_names," is not NULL or "))
        normalized_field_names += opi_db_field_names

    license_base_field_names = ["Healthcare_Provider_Taxonomy_Code","Provider_License_Number",
                                "Provider_License_Number_State_Code", "Healthcare_Provider_Primary_Taxonomy_Switch"]
    license_maximum_flat_n = 15

    license_create_table_script = """drop table if exists provider_licenses;
create table provider_licenses (
    npi char(10),
    sequence_id integer,
"""

    for db_field_name in license_base_field_names:
        first_db_field_name = db_field_name + "_1"
        first_field_name = db_field_name_field_names[first_db_field_name]
        first_data_type = field_name_data_types[first_field_name]

        license_create_table_script += "    %s %s,\n" % (db_field_name,first_data_type)
    license_create_table_script = license_create_table_script[:-2] + ");"

    license_load_table_script = ""
    for i in range(1,license_maximum_flat_n + 1):
        license_db_field_names = [license_db_field_name + "_" + str(i) for license_db_field_name in license_base_field_names]
        license_load_table_script += """insert into provider_licenses (npi,sequence_id,%s)
    select npf.npi, %s, %s from NPPES_flat npf
where %s is not NULL;\n\n""" % (join(license_base_field_names,","), i, join(license_db_field_names,","), join(license_db_field_names," is not NULL or "))
        normalized_field_names += license_db_field_names

    nppes_header_create_table_script = """drop table if exists NPPES_header;
    create table NPPES_header (\n"""
    nppes_header_db_field_names = []
    for npi_row in npi_split:
        field_name = npi_row[0].strip()
        db_field_name = field_name_db_field_names[field_name]
        data_type = field_name_data_types[field_name]

        if db_field_name not in normalized_field_names:
            nppes_header_create_table_script += "    " + db_field_name + " " + data_type + ",\n"
            nppes_header_db_field_names.append(db_field_name)

    nppes_header_create_table_script = nppes_header_create_table_script[:-2] + ");"

    nppes_header_load_table_script = """insert into NPPES_header (%s)
    select %s from NPPES_flat;""" % (join(nppes_header_db_field_names,","),join(nppes_header_db_field_names,","))


    load_table_script = """%s
       (%s)
       set
       %s""" % (load_table_script,fields_string[:-1],set_string[:-2])


    if taxonomy_file_name:
        taxonomy_create_table_script = """drop table if exists healthcare_provider_taxonomy_processed;
create table healthcare_provider_taxonomies (
    taxonomy_code char(10) not null,
    provider_type varchar(255),
    classification varchar(255),
    specialization varchar(1024),
    definition text,
    notes text);
        """

        taxonomy_load_table_script = generate_load_table_script(taxonomy_file_name,"healthcare_provider_taxonomies",r"\r\n")
        taxonomy_load_table_script += "\n;\n"


    taxonomy_processed_create_table_script = """drop table if exists healthcare_provider_taxonomy_processed;
    create table  healthcare_provider_taxonomy_processed
        (npi char(11),
        depth integer,
         flattened_taxonomy_string varchar(200)
    );
    """

    provider_taxonomy_processed_string = ""
    provider_taxonomy_insert_statement = "insert into healthcare_provider_taxonomy_processed (npi, depth, flattened_taxonomy_string)\n"

    for i in range(0,license_maximum_flat_n):
        fields_to_aggregrate = ""
        for j in range(0, i + 1):
            fields_to_aggregrate += "'|', Healthcare_Provider_Taxonomy_Code_%s, '|'," % (j + 1,)

        if i == license_maximum_flat_n - 1:
            where_clause = ""
            for j in range(0, i + 1):
                where_clause += " Healthcare_Provider_Taxonomy_Code_%s is not null and" % (j + 1,)
            where_clause = where_clause[:-4]
        else:
            where_clause = """Healthcare_Provider_Taxonomy_Code_%s is null
and Healthcare_Provider_Taxonomy_Code_%s is not null""" % (i + 2, i + 1)

        provider_taxonomy_processed_string += """%s select nf.npi, %s, concat(%s) as taxonomy_string
from nppes_flat nf where %s;\n\n""" % (provider_taxonomy_insert_statement, i + 1, fields_to_aggregrate[:-1], where_clause)

    print("""/*
 MySQL Script to Load monthly NPPES into a
 database.

 Author: Janos G. Hajagos 1/13/13
*/""")

    print(ddl_table_script)
    print(";\n")
    print(load_table_script)
    print(";\n")

    print("/*")
    print(create_view_script)
    print("*/")
    print("")
    print(opi_create_table_script)
    print("")
    print(opi_load_table_script)
    print("")
    print(license_create_table_script)
    print("")
    print(license_load_table_script)
    print("")
    print(nppes_header_create_table_script)
    print("")
    print(nppes_header_load_table_script)

    if taxonomy_file_name:
        print("")
        print(taxonomy_create_table_script)
        print(taxonomy_load_table_script)

    print("")
    print(taxonomy_processed_create_table_script)
    print("")

    alter_table_sql, update_table_sql = generate_fields_and_populate_flattened_fields(table_name_to_alter="healthcare_provider_taxonomy_processed",
                                                  target_taxonomy_field='flattened_taxonomy_string')
    
    print(alter_table_sql)
    print(provider_taxonomy_processed_string)
    print(update_table_sql)

    create_address_table = """
 drop table if exists nppes_contact;
create table nppes_contact (
 id  integer auto_increment primary key,
 address_type varchar(15),
 npi char(10),
 First_Line varchar(55),
 Second_Line varchar(55),
 City varchar(40),
 State varchar(40),
 Postal_Code varchar(20),
 Country_Code varchar(2),
 address_flattened varchar(1023),
 address_formatted varchar(1023),
 phone varchar(20),
 fax varchar(20),
 address_hash varchar(1024),
 zip5 varchar(5),
 zip4 varchar(4)
);

insert into nppes_contact (address_type, npi, first_line, second_line, city, state, postal_code, country_code, phone, fax)
  select 'business',nh.npi, nh.Provider_First_Line_Business_Mailing_Address, nh.Provider_Second_Line_Business_Mailing_Address, nh.Provider_Business_Mailing_Address_City_Name,
    nh.Provider_Business_Mailing_Address_State_Name, nh.Provider_Business_Mailing_Address_Postal_Code,
    nh.Provider_Business_Mailing_Address_Country_Cod,
    nh.Provider_Business_Mailing_Address_Telephone_Number, nh.Provider_Business_Mailing_Address_Fax_Number
    from nppes_header nh
    ;

insert into nppes_contact (address_type, npi, first_line, second_line, city, state, postal_code, country_code, phone, fax)
  select 'practice', nh.NPI, nh.Provider_First_Line_Business_Practice_Location_Address, nh.Provider_Second_Line_Business_Practice_Location_Address, nh.Provider_Business_Practice_Location_Address_City_Name,
    nh.Provider_Business_Practice_Location_Address_State_Name, nh.Provider_Business_Practice_Location_Address_Postal_Code,
    nh.Provider_Business_Practice_Location_Address_Country_Cod, nh.Provider_Business_Practice_Location_Address_Fax_Number,
    nh.Provider_Business_Practice_Location_Address_Telephone_Number from nppes_header nh;


delete from nppes_contact where first_line is null and second_line is null and city is null and postal_code is null
  and country_code is null and phone is null and fax is null;

update nppes_contact set address_flattened =
  concat(case when first_line is not null then concat('|',first_line,'|') else '||' end,
         case when second_line is not null then concat('|', second_line,'|') else '||' end,
         case when city is not null then concat('|', city,'|') else '||' end,
         case when postal_code is not null then concat('|', postal_code,'|') else '||' end,
         case when country_code is not null then concat('|', country_code, '|') else '||' end);

 update nppes_contact set address_hash = password(address_flattened);

 create table temp_max_id_address (max_id integer, counter integer, address_hash varchar(1023));

 insert into temp_max_id_address (max_id, counter, address_hash)
  select max(id),count(*),address_hash from nppes_contact group by address_hash order by count(*) desc;


create table address
  (id integer primary key auto_increment,
    first_line varchar(55),
    second_line varchar(55),
    city varchar(40),
    state varchar(40),
    postal_code varchar(20),
    country_code varchar(2),
    address_flattened varchar(1023),
    address_formatted varchar(1023),
    address_hash varchar(1023),
    zip5 varchar(5),
    zip4 varchar(4),
    latitude float,
    longitude float
    );

insert address (first_line, second_line, city, state, postal_code, country_code, address_flattened, address_formatted, address_hash)
  select nc.first_line, nc.second_line, nc.city, nc.state, nc.postal_code, nc.country_code,
    nc.address_flattened, nc.address_formatted, nc.address_hash from nppes_contact nc
   join temp_max_id_address tmi on tmi.address_hash = nc.address_hash and tmi.max_id = nc.id;

alter table nppes_contact drop column first_line;
alter table nppes_contact drop column second_line;
alter table nppes_contact drop column city;
alter table nppes_contact drop column state;
alter table nppes_contact drop column postal_code;
alter table nppes_contact drop column address_formatted;
alter table nppes_contact drop column address_flattened;

update address set zip5 = left(postal_code, 5), zip4 = substring(postal_code, 6, 4);

create table npi_summary_detailed as
 select fp.*,
   concat(pt1.provider_type,
    if(pt1.classification = '','',concat(' - ', pt1.classification)),
    if(pt1.specialization = '','',concat(' - ', pt1.specialization))) as taxonomy_name,
    pt1.classification,
    pt1.specialization,
    a.address_flattened,
    a.zip5,
    a.zip4,
    a.latitude,
    a.longitude,
    a.geocode_method,
    hptp.depth as taxonomy_depth, hptp.flattened_taxonomy_string, hptp.is_advanced_practice_midwife, hptp.is_allergy_and_immunology, hptp.is_ambulance, hptp.is_anesthesiologist_assistant, hptp.is_anesthesiology, hptp.is_assistant_podiatric, hptp.is_assisted_living_facility, hptp.is_behavioral_analyst, hptp.is_chiropractor, hptp.is_christian_science_sanitorium, hptp.is_clinic_center, hptp.is_clinical_nurse_specialist, hptp.is_clinical_pharmacology, hptp.is_colon_and_rectal_surgery, hptp.is_counselor, hptp.is_dentist, hptp.is_denturist, hptp.is_dermatology, hptp.is_durable_medical_equipment__medical_supplies, hptp.is_electrodiagnostic_medicine, hptp.is_emergency_medicine, hptp.is_family_medicine, hptp.is_general_acute_care_hospital, hptp.is_general_practice, hptp.is_genetic_counselor_ms, hptp.is_hospitalist, hptp.is_internal_medicine, hptp.is_legal_medicine, hptp.is_marriage_and_family_therapist, hptp.is_massage_therapist, hptp.is_medical_genetics, hptp.is_medical_genetics_phd_medical_genetics, hptp.is_military_hospital, hptp.is_multispecialty, hptp.is_neurological_surgery, hptp.is_neuromusculoskeletal_medicine_and_omm, hptp.is_nuclear_medicine, hptp.is_nurse_anesthetist_certified_registered, hptp.is_nurse_practitioner, hptp.is_obstetrics_and_gynecology, hptp.is_ophthalmology, hptp.is_optometrist, hptp.is_orthopaedic_surgery, hptp.is_otolaryngology, hptp.is_pain_medicine, hptp.is_pathology, hptp.is_pediatrics, hptp.is_pharmacist, hptp.is_pharmacy, hptp.is_pharmacy_technician, hptp.is_physical_medicine_and_rehabilitation, hptp.is_physical_therapist, hptp.is_physician_assistant, hptp.is_plastic_surgery, hptp.is_podiatrist, hptp.is_preventive_medicine, hptp.is_psychiatric_hospital, hptp.is_psychiatric_unit, hptp.is_psychiatry_and_neurology, hptp.is_psychoanalyst, hptp.is_psychologist, hptp.is_radiology, hptp.is_registered_nurse, hptp.is_rehabilitation_hospital, hptp.is_religious_nonmedical_health_care_institution, hptp.is_single_specialty, hptp.is_social_worker, hptp.is_special_hospital, hptp.is_surgery, hptp.is_thoracic_surgery_cardiothoracic_vascular_surgery, hptp.is_transplant_surgery, hptp.is_urology, hptp.is_behavioral_health_and_social_service_providers, hptp.is_hospital, hptp.is_laboratory, hptp.is_managed_care_organization, hptp.is_nursing_care_facility, hptp.is_residential_treatment_facility, hptp.is_student, hptp.is_supplier, hptp.is_physician, hptp.is_addiction_medicine, hptp.is_bariatric_medicine, hptp.is_body_imaging, hptp.is_cardiovascular_disease, hptp.is_clinical_and_laboratory_immunology, hptp.is_clinical_biochemical_genetics, hptp.is_clinical_cardiac_electrophysiology, hptp.is_clinical_cytogenetic, hptp.is_clinical_genetics_md, hptp.is_clinical_molecular_genetics, hptp.is_critical_care_medicine, hptp.is_dermatopathology, hptp.is_diagnostic_neuroimaging, hptp.is_diagnostic_radiology, hptp.is_diagnostic_ultrasound, hptp.is_endocrinology_diabetes_and_metabolism, hptp.is_endodontics, hptp.is_gastroenterology, hptp.is_geriatric_medicine, hptp.is_hematology, hptp.is_hematology_and_oncology, hptp.is_hepatology, hptp.is_hospice_and_palliative_medicine, hptp.is_hypertension_specialist, hptp.is_infectious_disease, hptp.is_interventional_cardiology, hptp.is_interventional_pain_medicine, hptp.is_mohsmicrographic_surgery, hptp.is_magnetic_resonance_imaging_mri, hptp.is_medical_oncology, hptp.is_molecular_genetic_pathology, hptp.is_nephrology, hptp.is_neurology, hptp.is_neuroradiology, hptp.is_nuclear_radiology, hptp.is_oral_and_maxillofacial_pathology, hptp.is_oral_and_maxillofacial_radiology, hptp.is_oral_and_maxillofacial_surgery, hptp.is_orthodontics_and_dentofacial_orthopedics, hptp.is_pediatric_dentistry, hptp.is_pediatric_radiology, hptp.is_pediatric_surgery, hptp.is_periodontics, hptp.is_phd_medical_genetics, hptp.is_plastic_and_reconstructive_surgery, hptp.is_prosthodontics, hptp.is_psychiatry, hptp.is_pulmonary_disease, hptp.is_radiation_oncology, hptp.is_radiological_physics, hptp.is_rheumatology, hptp.is_sleep_medicine, hptp.is_sports_medicine, hptp.is_surgery_of_the_hand, hptp.is_surgical_critical_care, hptp.is_surgical_oncology, hptp.is_therapeutic_radiology, hptp.is_transplant_hepatology, hptp.is_trauma_surgery, hptp.is_vascular_and_interventional_radiology, hptp.is_vascular_surgery
  from
  (
    select nh1.npi as npi,nh1.Provider_Business_Practice_Location_Address_State_Name as state,
      nh1.Provider_Business_Practice_Location_Address_Postal_Code as zip, nh1.Provider_Business_Practice_Location_Address_City_Name as city,
      nh1.Is_Sole_Proprietor as sole_provider,nh1.Provider_Gender_Code as gender_code,
      replace(nh1.Provider_Credential_Text,'.','') as credential,
      case
        when nh1.Provider_Organization_Name_Legal_Business_Name is not null then nh1.Provider_Organization_Name_Legal_Business_Name
          else concat(rtrim(nh1.Provider_Last_Name_Legal_Name),', ',rtrim(nh1.Provider_First_Name),' ',
            if(nh1.provider_credential_text is null,'',replace(nh1.Provider_Credential_Text,'.','')))
      end as provider_name,pl1.sequence_id,
      pl1.Healthcare_Provider_Taxonomy_Code as taxonomy_code
     from npi.nppes_header nh1
      left outer join npi.provider_licenses pl1 on pl1.npi = nh1.NPI
      ) fp
     left outer join npi.healthcare_provider_taxonomies pt1 on pt1.taxonomy_code = fp.taxonomy_code
     left outer join npi.healthcare_provider_taxonomy_processed hptp on hptp.npi = fp.npi
     join npi.nppes_contact nc on nc.npi = fp.npi and nc.address_type = 'practice'
     join npi.address a on a.address_hash = nc.address_hash;


  create index idx_npi_summary on npi_summary_detailed (npi);

  create table npi_summary_detailed_primary_taxonomy as
    select * from
  npi_summary_detailed where sequence_id = 1
  order by state, zip5, npi
  ;

create unique index pk_nsdpt_npi on npi_summary_detailed_primary_taxonomy(npi);

CREATE VIEW npi_summary_abridged_primary_taxonomy
AS
   SELECT npi,
          state,
          zip,
          city,
          sole_provider,
          gender_code,
          credential,
          provider_name,
          taxonomy_code,
          taxonomy_name,
          classification,
          specialization,
          address_flattened,
          zip5,
          zip4,
          latitude,
          longitude,
          geocode_method,
          taxonomy_depth,
          flattened_taxonomy_string,
          is_dentist,
          is_emergency_medicine,
          is_internal_medicine,
          is_nurse_practitioner,
          is_physician_assistant,
          is_registered_nurse,
          is_pathology,
          is_hospital,
          is_behavioral_health_and_social_service_providers,
          is_laboratory,
          is_student,
          is_physician,
          is_diagnostic_radiology,
          is_ambulance,
          is_chiropractor,
          is_dermatology,
          is_family_medicine,
          is_general_acute_care_hospital,
          is_hospitalist,
          is_radiology,
          is_podiatrist,
          is_psychiatry,
          is_nuclear_radiology,
          is_hematology_and_oncology
     FROM nppes.npi_summary_detailed_primary_taxonomy nsdpt;

    """

    print(create_address_table)

    create_indexes_sql = """/* Add indices to the tables */

create unique index pk_npi_hct_proc on healthcare_provider_taxonomy_processed(npi);
create index idx_oth_prov_id_npi on other_provider_identifiers(npi);
create index idx_provider_licenses on provider_licenses(npi);
create index idx_address_addr_hash on address(address_hash);
create index idx_nppes_contact_hash on nppes_contact(address_hash);
create index idx_addr_zip4 on address(zip4);
create index idx_addr_zip5 on address(zip5);
create index idx_addr_city on address(city);
create index idx_addr_state on address(state);
create index idx_addr_latitude on address(latitude);
create index idx_addr_longitude on address(longitude);
create index idx_addr_geocdm on address(geocode_method);
"""
    print("")
    print(create_indexes_sql)


if __name__ == "__main__":
    # Hardcoded file names
    # The assumption in this script that you are using a Unix like file system

    if len(sys.argv) > 1:
        main(sys.argv[1], sys.argv[2])
    else:
        print("""Run this script to generate a MySQL load script for the NPPES database:
python create_nppes_schema_and_data_load.py '/tmp/npidata_20050523-20140309.csv' '/tmp/nucc_taxonomy_140.csv'""")

    #main("/tmp/npidata_20050523-20140309.csv", "/tmp/nucc_taxonomy_140.csv")

    #Loading the files
    #python create_nppes_schema_and_data_load.py > npi_schema.sql
    #python create_nppes_schema_and_data_load.py > npi_schema.sql
    #mysql -u root -pd
        #create database npi;
    #mysql -u root -p npi < npi_schema.sql
    #mysqldump -u root -p > npi_20130113.sql
    #bzip2 npi_20130113.sql
