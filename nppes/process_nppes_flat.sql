/*

PostGreSQL proecessing script

Create table "NPPES_flat"


*/

--create table "NPPES_flat" as select * from npidata_pfile_20050523_20180513;

create unique index pk_npi_nppes_flat on "NPPES_flat"("NPI");

drop table if exists "NPPES_provider_licenses";
create table "NPPES_provider_licenses" (
    "NPI" char(10),
    sequence_id integer,
    "Healthcare_Provider_Taxonomy_Code" VARCHAR(10),
    "Provider_License_Number" VARCHAR(20),
    "Provider_License_Number_State_Code" VARCHAR(2),
    "Healthcare_Provider_Primary_Taxonomy_Switch" VARCHAR(1));

/* The NUCC taxonomy codes associated with a provider license are inserted into the tmp_provider_licenses table so that provider specialties can be easily queried. The following inserts can be executed as a group. */
INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 1,  "Healthcare_Provider_Taxonomy_Code_1", "Provider_License_Number_1", "Provider_License_Number_State_Code_1","Healthcare_Provider_Primary_Taxonomy_Switch_1" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_1" is not NULL or "Provider_License_Number_1" is not NULL or "Provider_License_Number_State_Code_1" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_1" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 2,  "Healthcare_Provider_Taxonomy_Code_2", "Provider_License_Number_2", "Provider_License_Number_State_Code_2","Healthcare_Provider_Primary_Taxonomy_Switch_2" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_2" is not NULL or "Provider_License_Number_2" is not NULL or "Provider_License_Number_State_Code_2" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_2" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 3,  "Healthcare_Provider_Taxonomy_Code_3", "Provider_License_Number_3", "Provider_License_Number_State_Code_3","Healthcare_Provider_Primary_Taxonomy_Switch_3" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_3" is not NULL or "Provider_License_Number_3" is not NULL or "Provider_License_Number_State_Code_3" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_3" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 4,  "Healthcare_Provider_Taxonomy_Code_4", "Provider_License_Number_4", "Provider_License_Number_State_Code_4","Healthcare_Provider_Primary_Taxonomy_Switch_4" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_4" is not NULL or "Provider_License_Number_4" is not NULL or "Provider_License_Number_State_Code_4" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_4" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 5,  "Healthcare_Provider_Taxonomy_Code_5", "Provider_License_Number_5", "Provider_License_Number_State_Code_5","Healthcare_Provider_Primary_Taxonomy_Switch_5" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_5" is not NULL or "Provider_License_Number_5" is not NULL or "Provider_License_Number_State_Code_5" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_5" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 6,  "Healthcare_Provider_Taxonomy_Code_6", "Provider_License_Number_6", "Provider_License_Number_State_Code_6","Healthcare_Provider_Primary_Taxonomy_Switch_6" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_6" is not NULL or "Provider_License_Number_6" is not NULL or "Provider_License_Number_State_Code_6" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_6" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 7,  "Healthcare_Provider_Taxonomy_Code_7", "Provider_License_Number_7", "Provider_License_Number_State_Code_7","Healthcare_Provider_Primary_Taxonomy_Switch_7" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_7" is not NULL or "Provider_License_Number_7" is not NULL or "Provider_License_Number_State_Code_7" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_7" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 8,  "Healthcare_Provider_Taxonomy_Code_8", "Provider_License_Number_8", "Provider_License_Number_State_Code_8","Healthcare_Provider_Primary_Taxonomy_Switch_8" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_8" is not NULL or "Provider_License_Number_8" is not NULL or "Provider_License_Number_State_Code_8" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_8" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 9,  "Healthcare_Provider_Taxonomy_Code_9", "Provider_License_Number_9", "Provider_License_Number_State_Code_9","Healthcare_Provider_Primary_Taxonomy_Switch_9" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_9" is not NULL or "Provider_License_Number_9" is not NULL or "Provider_License_Number_State_Code_9" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_9" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 10,  "Healthcare_Provider_Taxonomy_Code_10", "Provider_License_Number_10", "Provider_License_Number_State_Code_10","Healthcare_Provider_Primary_Taxonomy_Switch_10" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_10" is not NULL or "Provider_License_Number_10" is not NULL or "Provider_License_Number_State_Code_10" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_10" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 11,  "Healthcare_Provider_Taxonomy_Code_11", "Provider_License_Number_11", "Provider_License_Number_State_Code_11","Healthcare_Provider_Primary_Taxonomy_Switch_11" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_11" is not NULL or "Provider_License_Number_11" is not NULL or "Provider_License_Number_State_Code_11" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_11" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 12,  "Healthcare_Provider_Taxonomy_Code_12", "Provider_License_Number_12", "Provider_License_Number_State_Code_12","Healthcare_Provider_Primary_Taxonomy_Switch_12" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_12" is not NULL or "Provider_License_Number_12" is not NULL or "Provider_License_Number_State_Code_12" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_12" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 13,  "Healthcare_Provider_Taxonomy_Code_13", "Provider_License_Number_13", "Provider_License_Number_State_Code_13","Healthcare_Provider_Primary_Taxonomy_Switch_13" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_13" is not NULL or "Provider_License_Number_13" is not NULL or "Provider_License_Number_State_Code_13" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_13" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 14,  "Healthcare_Provider_Taxonomy_Code_14", "Provider_License_Number_14", "Provider_License_Number_State_Code_14","Healthcare_Provider_Primary_Taxonomy_Switch_14" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_14" is not NULL or "Provider_License_Number_14" is not NULL or "Provider_License_Number_State_Code_14" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_14" is not NULL;

INSERT into "NPPES_provider_licenses" ("NPI",sequence_id,"Healthcare_Provider_Taxonomy_Code","Provider_License_Number","Provider_License_Number_State_Code","Healthcare_Provider_Primary_Taxonomy_Switch")
    select npf."NPI", 15,  "Healthcare_Provider_Taxonomy_Code_15", "Provider_License_Number_15", "Provider_License_Number_State_Code_15","Healthcare_Provider_Primary_Taxonomy_Switch_15" from "NPPES_flat" npf
where "Healthcare_Provider_Taxonomy_Code_15" is not NULL or "Provider_License_Number_15" is not NULL or "Provider_License_Number_State_Code_15" is not NULL or "Healthcare_Provider_Primary_Taxonomy_Switch_15" is not NULL;



drop table if exists "NPPES_header";
   create table "NPPES_header" as 
   select
    "NPI",
    "Entity_Type_Code",
    "Replacement_NPI",
    "Employer_Identification_Number_EIN",
    "Provider_Organization_Name_Legal_Business_Name",
    "Provider_Last_Name_Legal_Name",
    "Provider_First_Name",
    "Provider_Middle_Name",
    "Provider_Name_Prefix_Text",
    "Provider_Name_Suffix_Text",
    "Provider_Credential_Text",
    "Provider_Other_Organization_Name",
    "Provider_Other_Organization_Name_Type_Code",
    "Provider_Other_Last_Name",
    "Provider_Other_First_Name",
    "Provider_Other_Middle_Name",
    "Provider_Other_Name_Prefix_Text"
    "Provider_Other_Name_Suffix_Text",
    "Provider_Other_Credential_Text",
    "Provider_Other_Last_Name_Type_Code",
    "Provider_First_Line_Business_Mailing_Address",
    "Provider_Second_Line_Business_Mailing_Address",
    "Provider_Business_Mailing_Address_City_Name",
    "Provider_Business_Mailing_Address_State_Name",
    "Provider_Business_Mailing_Address_Postal_Code",
    "Provider_Business_Mailing_Address_Country_Code_If_outside_U_PER",
    "Provider_Business_Mailing_Address_Telephone_Number",
    "Provider_Business_Mailing_Address_Fax_Number",
    "Provider_First_Line_Business_Practice_Location_Address",
    "Provider_Second_Line_Business_Practice_Location_Address",
    "Provider_Business_Practice_Location_Address_City_Name",
    "Provider_Business_Practice_Location_Address_State_Name",
    "Provider_Business_Practice_Location_Address_Postal_Code",
    "Provider_Business_Practice_Location_Address_Country_Code_If_outside_U_PER",
    "Provider_Business_Practice_Location_Address_Telephone_Number",
    "Provider_Business_Practice_Location_Address_Fax_Number",
    "Provider_Enumeration_Date",
    "Last_Update_Date",
    "NPI_Deactivation_Reason_Code",
    "NPI_Deactivation_Date",
    "NPI_Reactivation_Date",
    "Provider_Gender_Code",
    "Authorized_Official_Last_Name",
    "Authorized_Official_First_Name",
    "Authorized_Official_Middle_Name",
    "Authorized_Official_Title_or_Position",
    "Authorized_Official_Telephone_Number",
    "Is_Sole_Proprietor",
    "Is_Organization_Subpart",
    "Parent_Organization_LBN",
    "Parent_Organization_TIN",
    "Authorized_Official_Name_Prefix_Text",
    "Authorized_Official_Name_Suffix_Text",
    "Authorized_Official_Credential_Text"
 from "NPPES_flat";
 
 
 
 /* Holds identifiers for providers, for example, a state Medicaid identifier. */
drop table if exists "NPPES_other_provider_identifiers";
create table "NPPES_other_provider_identifiers" (
  "NPI" char(10),
  sequence_id integer,
  "Other_Provider_Identifier" VARCHAR(20),
  "Other_Provider_Identifier_Type_Code" VARCHAR(2),
  "Other_Provider_Identifier_Issuer" VARCHAR(80),
  "Other_Provider_Identifier_State" VARCHAR(2));



/*
!#/usr/bin/python

template = '''insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", %(sequence_id)s, "Other_Provider_Identifier_%(sequence_id)s","Other_Provider_Identifier_Type_Code_%(sequence_id)s","Other_Provider_Identifier_Issuer_%(sequence_id)s","Other_Provider_Identifier_State_%(sequence_id)s" from "NPPES_flat" npf
    where "Other_Provider_Identifier_%(sequence_id)s" is not NULL or "Other_Provider_Identifier_Type_Code_%(sequence_id)s" is not NULL or "Other_Provider_Identifier_Issuer_%(sequence_id)s" is not NULL or "Other_Provider_Identifier_State_%(sequence_id)s" is not NULL;'''
    
sql_string = ""
for i in range(1,51):
    sql_string += template % {"sequence_id": i}
    sql_string += "\n"
print(sql_string)
with open("C:/users/jhajagos/desktop/other_ident.sql","w") as f:
    f.write(sql_string)    
    
*/


insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 1, "Other_Provider_Identifier_1","Other_Provider_Identifier_Type_Code_1","Other_Provider_Identifier_Issuer_1","Other_Provider_Identifier_State_1" from "NPPES_flat" npf
    where "Other_Provider_Identifier_1" is not NULL or "Other_Provider_Identifier_Type_Code_1" is not NULL or "Other_Provider_Identifier_Issuer_1" is not NULL or "Other_Provider_Identifier_State_1" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 2, "Other_Provider_Identifier_2","Other_Provider_Identifier_Type_Code_2","Other_Provider_Identifier_Issuer_2","Other_Provider_Identifier_State_2" from "NPPES_flat" npf
    where "Other_Provider_Identifier_2" is not NULL or "Other_Provider_Identifier_Type_Code_2" is not NULL or "Other_Provider_Identifier_Issuer_2" is not NULL or "Other_Provider_Identifier_State_2" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 3, "Other_Provider_Identifier_3","Other_Provider_Identifier_Type_Code_3","Other_Provider_Identifier_Issuer_3","Other_Provider_Identifier_State_3" from "NPPES_flat" npf
    where "Other_Provider_Identifier_3" is not NULL or "Other_Provider_Identifier_Type_Code_3" is not NULL or "Other_Provider_Identifier_Issuer_3" is not NULL or "Other_Provider_Identifier_State_3" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 4, "Other_Provider_Identifier_4","Other_Provider_Identifier_Type_Code_4","Other_Provider_Identifier_Issuer_4","Other_Provider_Identifier_State_4" from "NPPES_flat" npf
    where "Other_Provider_Identifier_4" is not NULL or "Other_Provider_Identifier_Type_Code_4" is not NULL or "Other_Provider_Identifier_Issuer_4" is not NULL or "Other_Provider_Identifier_State_4" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 5, "Other_Provider_Identifier_5","Other_Provider_Identifier_Type_Code_5","Other_Provider_Identifier_Issuer_5","Other_Provider_Identifier_State_5" from "NPPES_flat" npf
    where "Other_Provider_Identifier_5" is not NULL or "Other_Provider_Identifier_Type_Code_5" is not NULL or "Other_Provider_Identifier_Issuer_5" is not NULL or "Other_Provider_Identifier_State_5" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 6, "Other_Provider_Identifier_6","Other_Provider_Identifier_Type_Code_6","Other_Provider_Identifier_Issuer_6","Other_Provider_Identifier_State_6" from "NPPES_flat" npf
    where "Other_Provider_Identifier_6" is not NULL or "Other_Provider_Identifier_Type_Code_6" is not NULL or "Other_Provider_Identifier_Issuer_6" is not NULL or "Other_Provider_Identifier_State_6" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 7, "Other_Provider_Identifier_7","Other_Provider_Identifier_Type_Code_7","Other_Provider_Identifier_Issuer_7","Other_Provider_Identifier_State_7" from "NPPES_flat" npf
    where "Other_Provider_Identifier_7" is not NULL or "Other_Provider_Identifier_Type_Code_7" is not NULL or "Other_Provider_Identifier_Issuer_7" is not NULL or "Other_Provider_Identifier_State_7" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 8, "Other_Provider_Identifier_8","Other_Provider_Identifier_Type_Code_8","Other_Provider_Identifier_Issuer_8","Other_Provider_Identifier_State_8" from "NPPES_flat" npf
    where "Other_Provider_Identifier_8" is not NULL or "Other_Provider_Identifier_Type_Code_8" is not NULL or "Other_Provider_Identifier_Issuer_8" is not NULL or "Other_Provider_Identifier_State_8" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 9, "Other_Provider_Identifier_9","Other_Provider_Identifier_Type_Code_9","Other_Provider_Identifier_Issuer_9","Other_Provider_Identifier_State_9" from "NPPES_flat" npf
    where "Other_Provider_Identifier_9" is not NULL or "Other_Provider_Identifier_Type_Code_9" is not NULL or "Other_Provider_Identifier_Issuer_9" is not NULL or "Other_Provider_Identifier_State_9" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 10, "Other_Provider_Identifier_10","Other_Provider_Identifier_Type_Code_10","Other_Provider_Identifier_Issuer_10","Other_Provider_Identifier_State_10" from "NPPES_flat" npf
    where "Other_Provider_Identifier_10" is not NULL or "Other_Provider_Identifier_Type_Code_10" is not NULL or "Other_Provider_Identifier_Issuer_10" is not NULL or "Other_Provider_Identifier_State_10" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 11, "Other_Provider_Identifier_11","Other_Provider_Identifier_Type_Code_11","Other_Provider_Identifier_Issuer_11","Other_Provider_Identifier_State_11" from "NPPES_flat" npf
    where "Other_Provider_Identifier_11" is not NULL or "Other_Provider_Identifier_Type_Code_11" is not NULL or "Other_Provider_Identifier_Issuer_11" is not NULL or "Other_Provider_Identifier_State_11" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 12, "Other_Provider_Identifier_12","Other_Provider_Identifier_Type_Code_12","Other_Provider_Identifier_Issuer_12","Other_Provider_Identifier_State_12" from "NPPES_flat" npf
    where "Other_Provider_Identifier_12" is not NULL or "Other_Provider_Identifier_Type_Code_12" is not NULL or "Other_Provider_Identifier_Issuer_12" is not NULL or "Other_Provider_Identifier_State_12" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 13, "Other_Provider_Identifier_13","Other_Provider_Identifier_Type_Code_13","Other_Provider_Identifier_Issuer_13","Other_Provider_Identifier_State_13" from "NPPES_flat" npf
    where "Other_Provider_Identifier_13" is not NULL or "Other_Provider_Identifier_Type_Code_13" is not NULL or "Other_Provider_Identifier_Issuer_13" is not NULL or "Other_Provider_Identifier_State_13" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 14, "Other_Provider_Identifier_14","Other_Provider_Identifier_Type_Code_14","Other_Provider_Identifier_Issuer_14","Other_Provider_Identifier_State_14" from "NPPES_flat" npf
    where "Other_Provider_Identifier_14" is not NULL or "Other_Provider_Identifier_Type_Code_14" is not NULL or "Other_Provider_Identifier_Issuer_14" is not NULL or "Other_Provider_Identifier_State_14" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 15, "Other_Provider_Identifier_15","Other_Provider_Identifier_Type_Code_15","Other_Provider_Identifier_Issuer_15","Other_Provider_Identifier_State_15" from "NPPES_flat" npf
    where "Other_Provider_Identifier_15" is not NULL or "Other_Provider_Identifier_Type_Code_15" is not NULL or "Other_Provider_Identifier_Issuer_15" is not NULL or "Other_Provider_Identifier_State_15" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 16, "Other_Provider_Identifier_16","Other_Provider_Identifier_Type_Code_16","Other_Provider_Identifier_Issuer_16","Other_Provider_Identifier_State_16" from "NPPES_flat" npf
    where "Other_Provider_Identifier_16" is not NULL or "Other_Provider_Identifier_Type_Code_16" is not NULL or "Other_Provider_Identifier_Issuer_16" is not NULL or "Other_Provider_Identifier_State_16" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 17, "Other_Provider_Identifier_17","Other_Provider_Identifier_Type_Code_17","Other_Provider_Identifier_Issuer_17","Other_Provider_Identifier_State_17" from "NPPES_flat" npf
    where "Other_Provider_Identifier_17" is not NULL or "Other_Provider_Identifier_Type_Code_17" is not NULL or "Other_Provider_Identifier_Issuer_17" is not NULL or "Other_Provider_Identifier_State_17" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 18, "Other_Provider_Identifier_18","Other_Provider_Identifier_Type_Code_18","Other_Provider_Identifier_Issuer_18","Other_Provider_Identifier_State_18" from "NPPES_flat" npf
    where "Other_Provider_Identifier_18" is not NULL or "Other_Provider_Identifier_Type_Code_18" is not NULL or "Other_Provider_Identifier_Issuer_18" is not NULL or "Other_Provider_Identifier_State_18" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 19, "Other_Provider_Identifier_19","Other_Provider_Identifier_Type_Code_19","Other_Provider_Identifier_Issuer_19","Other_Provider_Identifier_State_19" from "NPPES_flat" npf
    where "Other_Provider_Identifier_19" is not NULL or "Other_Provider_Identifier_Type_Code_19" is not NULL or "Other_Provider_Identifier_Issuer_19" is not NULL or "Other_Provider_Identifier_State_19" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 20, "Other_Provider_Identifier_20","Other_Provider_Identifier_Type_Code_20","Other_Provider_Identifier_Issuer_20","Other_Provider_Identifier_State_20" from "NPPES_flat" npf
    where "Other_Provider_Identifier_20" is not NULL or "Other_Provider_Identifier_Type_Code_20" is not NULL or "Other_Provider_Identifier_Issuer_20" is not NULL or "Other_Provider_Identifier_State_20" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 21, "Other_Provider_Identifier_21","Other_Provider_Identifier_Type_Code_21","Other_Provider_Identifier_Issuer_21","Other_Provider_Identifier_State_21" from "NPPES_flat" npf
    where "Other_Provider_Identifier_21" is not NULL or "Other_Provider_Identifier_Type_Code_21" is not NULL or "Other_Provider_Identifier_Issuer_21" is not NULL or "Other_Provider_Identifier_State_21" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 22, "Other_Provider_Identifier_22","Other_Provider_Identifier_Type_Code_22","Other_Provider_Identifier_Issuer_22","Other_Provider_Identifier_State_22" from "NPPES_flat" npf
    where "Other_Provider_Identifier_22" is not NULL or "Other_Provider_Identifier_Type_Code_22" is not NULL or "Other_Provider_Identifier_Issuer_22" is not NULL or "Other_Provider_Identifier_State_22" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 23, "Other_Provider_Identifier_23","Other_Provider_Identifier_Type_Code_23","Other_Provider_Identifier_Issuer_23","Other_Provider_Identifier_State_23" from "NPPES_flat" npf
    where "Other_Provider_Identifier_23" is not NULL or "Other_Provider_Identifier_Type_Code_23" is not NULL or "Other_Provider_Identifier_Issuer_23" is not NULL or "Other_Provider_Identifier_State_23" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 24, "Other_Provider_Identifier_24","Other_Provider_Identifier_Type_Code_24","Other_Provider_Identifier_Issuer_24","Other_Provider_Identifier_State_24" from "NPPES_flat" npf
    where "Other_Provider_Identifier_24" is not NULL or "Other_Provider_Identifier_Type_Code_24" is not NULL or "Other_Provider_Identifier_Issuer_24" is not NULL or "Other_Provider_Identifier_State_24" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 25, "Other_Provider_Identifier_25","Other_Provider_Identifier_Type_Code_25","Other_Provider_Identifier_Issuer_25","Other_Provider_Identifier_State_25" from "NPPES_flat" npf
    where "Other_Provider_Identifier_25" is not NULL or "Other_Provider_Identifier_Type_Code_25" is not NULL or "Other_Provider_Identifier_Issuer_25" is not NULL or "Other_Provider_Identifier_State_25" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 26, "Other_Provider_Identifier_26","Other_Provider_Identifier_Type_Code_26","Other_Provider_Identifier_Issuer_26","Other_Provider_Identifier_State_26" from "NPPES_flat" npf
    where "Other_Provider_Identifier_26" is not NULL or "Other_Provider_Identifier_Type_Code_26" is not NULL or "Other_Provider_Identifier_Issuer_26" is not NULL or "Other_Provider_Identifier_State_26" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 27, "Other_Provider_Identifier_27","Other_Provider_Identifier_Type_Code_27","Other_Provider_Identifier_Issuer_27","Other_Provider_Identifier_State_27" from "NPPES_flat" npf
    where "Other_Provider_Identifier_27" is not NULL or "Other_Provider_Identifier_Type_Code_27" is not NULL or "Other_Provider_Identifier_Issuer_27" is not NULL or "Other_Provider_Identifier_State_27" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 28, "Other_Provider_Identifier_28","Other_Provider_Identifier_Type_Code_28","Other_Provider_Identifier_Issuer_28","Other_Provider_Identifier_State_28" from "NPPES_flat" npf
    where "Other_Provider_Identifier_28" is not NULL or "Other_Provider_Identifier_Type_Code_28" is not NULL or "Other_Provider_Identifier_Issuer_28" is not NULL or "Other_Provider_Identifier_State_28" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 29, "Other_Provider_Identifier_29","Other_Provider_Identifier_Type_Code_29","Other_Provider_Identifier_Issuer_29","Other_Provider_Identifier_State_29" from "NPPES_flat" npf
    where "Other_Provider_Identifier_29" is not NULL or "Other_Provider_Identifier_Type_Code_29" is not NULL or "Other_Provider_Identifier_Issuer_29" is not NULL or "Other_Provider_Identifier_State_29" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 30, "Other_Provider_Identifier_30","Other_Provider_Identifier_Type_Code_30","Other_Provider_Identifier_Issuer_30","Other_Provider_Identifier_State_30" from "NPPES_flat" npf
    where "Other_Provider_Identifier_30" is not NULL or "Other_Provider_Identifier_Type_Code_30" is not NULL or "Other_Provider_Identifier_Issuer_30" is not NULL or "Other_Provider_Identifier_State_30" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 31, "Other_Provider_Identifier_31","Other_Provider_Identifier_Type_Code_31","Other_Provider_Identifier_Issuer_31","Other_Provider_Identifier_State_31" from "NPPES_flat" npf
    where "Other_Provider_Identifier_31" is not NULL or "Other_Provider_Identifier_Type_Code_31" is not NULL or "Other_Provider_Identifier_Issuer_31" is not NULL or "Other_Provider_Identifier_State_31" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 32, "Other_Provider_Identifier_32","Other_Provider_Identifier_Type_Code_32","Other_Provider_Identifier_Issuer_32","Other_Provider_Identifier_State_32" from "NPPES_flat" npf
    where "Other_Provider_Identifier_32" is not NULL or "Other_Provider_Identifier_Type_Code_32" is not NULL or "Other_Provider_Identifier_Issuer_32" is not NULL or "Other_Provider_Identifier_State_32" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 33, "Other_Provider_Identifier_33","Other_Provider_Identifier_Type_Code_33","Other_Provider_Identifier_Issuer_33","Other_Provider_Identifier_State_33" from "NPPES_flat" npf
    where "Other_Provider_Identifier_33" is not NULL or "Other_Provider_Identifier_Type_Code_33" is not NULL or "Other_Provider_Identifier_Issuer_33" is not NULL or "Other_Provider_Identifier_State_33" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 34, "Other_Provider_Identifier_34","Other_Provider_Identifier_Type_Code_34","Other_Provider_Identifier_Issuer_34","Other_Provider_Identifier_State_34" from "NPPES_flat" npf
    where "Other_Provider_Identifier_34" is not NULL or "Other_Provider_Identifier_Type_Code_34" is not NULL or "Other_Provider_Identifier_Issuer_34" is not NULL or "Other_Provider_Identifier_State_34" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 35, "Other_Provider_Identifier_35","Other_Provider_Identifier_Type_Code_35","Other_Provider_Identifier_Issuer_35","Other_Provider_Identifier_State_35" from "NPPES_flat" npf
    where "Other_Provider_Identifier_35" is not NULL or "Other_Provider_Identifier_Type_Code_35" is not NULL or "Other_Provider_Identifier_Issuer_35" is not NULL or "Other_Provider_Identifier_State_35" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 36, "Other_Provider_Identifier_36","Other_Provider_Identifier_Type_Code_36","Other_Provider_Identifier_Issuer_36","Other_Provider_Identifier_State_36" from "NPPES_flat" npf
    where "Other_Provider_Identifier_36" is not NULL or "Other_Provider_Identifier_Type_Code_36" is not NULL or "Other_Provider_Identifier_Issuer_36" is not NULL or "Other_Provider_Identifier_State_36" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 37, "Other_Provider_Identifier_37","Other_Provider_Identifier_Type_Code_37","Other_Provider_Identifier_Issuer_37","Other_Provider_Identifier_State_37" from "NPPES_flat" npf
    where "Other_Provider_Identifier_37" is not NULL or "Other_Provider_Identifier_Type_Code_37" is not NULL or "Other_Provider_Identifier_Issuer_37" is not NULL or "Other_Provider_Identifier_State_37" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 38, "Other_Provider_Identifier_38","Other_Provider_Identifier_Type_Code_38","Other_Provider_Identifier_Issuer_38","Other_Provider_Identifier_State_38" from "NPPES_flat" npf
    where "Other_Provider_Identifier_38" is not NULL or "Other_Provider_Identifier_Type_Code_38" is not NULL or "Other_Provider_Identifier_Issuer_38" is not NULL or "Other_Provider_Identifier_State_38" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 39, "Other_Provider_Identifier_39","Other_Provider_Identifier_Type_Code_39","Other_Provider_Identifier_Issuer_39","Other_Provider_Identifier_State_39" from "NPPES_flat" npf
    where "Other_Provider_Identifier_39" is not NULL or "Other_Provider_Identifier_Type_Code_39" is not NULL or "Other_Provider_Identifier_Issuer_39" is not NULL or "Other_Provider_Identifier_State_39" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 40, "Other_Provider_Identifier_40","Other_Provider_Identifier_Type_Code_40","Other_Provider_Identifier_Issuer_40","Other_Provider_Identifier_State_40" from "NPPES_flat" npf
    where "Other_Provider_Identifier_40" is not NULL or "Other_Provider_Identifier_Type_Code_40" is not NULL or "Other_Provider_Identifier_Issuer_40" is not NULL or "Other_Provider_Identifier_State_40" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 41, "Other_Provider_Identifier_41","Other_Provider_Identifier_Type_Code_41","Other_Provider_Identifier_Issuer_41","Other_Provider_Identifier_State_41" from "NPPES_flat" npf
    where "Other_Provider_Identifier_41" is not NULL or "Other_Provider_Identifier_Type_Code_41" is not NULL or "Other_Provider_Identifier_Issuer_41" is not NULL or "Other_Provider_Identifier_State_41" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 42, "Other_Provider_Identifier_42","Other_Provider_Identifier_Type_Code_42","Other_Provider_Identifier_Issuer_42","Other_Provider_Identifier_State_42" from "NPPES_flat" npf
    where "Other_Provider_Identifier_42" is not NULL or "Other_Provider_Identifier_Type_Code_42" is not NULL or "Other_Provider_Identifier_Issuer_42" is not NULL or "Other_Provider_Identifier_State_42" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 43, "Other_Provider_Identifier_43","Other_Provider_Identifier_Type_Code_43","Other_Provider_Identifier_Issuer_43","Other_Provider_Identifier_State_43" from "NPPES_flat" npf
    where "Other_Provider_Identifier_43" is not NULL or "Other_Provider_Identifier_Type_Code_43" is not NULL or "Other_Provider_Identifier_Issuer_43" is not NULL or "Other_Provider_Identifier_State_43" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 44, "Other_Provider_Identifier_44","Other_Provider_Identifier_Type_Code_44","Other_Provider_Identifier_Issuer_44","Other_Provider_Identifier_State_44" from "NPPES_flat" npf
    where "Other_Provider_Identifier_44" is not NULL or "Other_Provider_Identifier_Type_Code_44" is not NULL or "Other_Provider_Identifier_Issuer_44" is not NULL or "Other_Provider_Identifier_State_44" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 45, "Other_Provider_Identifier_45","Other_Provider_Identifier_Type_Code_45","Other_Provider_Identifier_Issuer_45","Other_Provider_Identifier_State_45" from "NPPES_flat" npf
    where "Other_Provider_Identifier_45" is not NULL or "Other_Provider_Identifier_Type_Code_45" is not NULL or "Other_Provider_Identifier_Issuer_45" is not NULL or "Other_Provider_Identifier_State_45" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 46, "Other_Provider_Identifier_46","Other_Provider_Identifier_Type_Code_46","Other_Provider_Identifier_Issuer_46","Other_Provider_Identifier_State_46" from "NPPES_flat" npf
    where "Other_Provider_Identifier_46" is not NULL or "Other_Provider_Identifier_Type_Code_46" is not NULL or "Other_Provider_Identifier_Issuer_46" is not NULL or "Other_Provider_Identifier_State_46" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 47, "Other_Provider_Identifier_47","Other_Provider_Identifier_Type_Code_47","Other_Provider_Identifier_Issuer_47","Other_Provider_Identifier_State_47" from "NPPES_flat" npf
    where "Other_Provider_Identifier_47" is not NULL or "Other_Provider_Identifier_Type_Code_47" is not NULL or "Other_Provider_Identifier_Issuer_47" is not NULL or "Other_Provider_Identifier_State_47" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 48, "Other_Provider_Identifier_48","Other_Provider_Identifier_Type_Code_48","Other_Provider_Identifier_Issuer_48","Other_Provider_Identifier_State_48" from "NPPES_flat" npf
    where "Other_Provider_Identifier_48" is not NULL or "Other_Provider_Identifier_Type_Code_48" is not NULL or "Other_Provider_Identifier_Issuer_48" is not NULL or "Other_Provider_Identifier_State_48" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 49, "Other_Provider_Identifier_49","Other_Provider_Identifier_Type_Code_49","Other_Provider_Identifier_Issuer_49","Other_Provider_Identifier_State_49" from "NPPES_flat" npf
    where "Other_Provider_Identifier_49" is not NULL or "Other_Provider_Identifier_Type_Code_49" is not NULL or "Other_Provider_Identifier_Issuer_49" is not NULL or "Other_Provider_Identifier_State_49" is not NULL;

insert into  "NPPES_other_provider_identifiers" ("NPI",sequence_id,"Other_Provider_Identifier","Other_Provider_Identifier_Type_Code","Other_Provider_Identifier_Issuer","Other_Provider_Identifier_State")
  select npf."NPI", 50, "Other_Provider_Identifier_50","Other_Provider_Identifier_Type_Code_50","Other_Provider_Identifier_Issuer_50","Other_Provider_Identifier_State_50" from "NPPES_flat" npf
    where "Other_Provider_Identifier_50" is not NULL or "Other_Provider_Identifier_Type_Code_50" is not NULL or "Other_Provider_Identifier_Issuer_50" is not NULL or "Other_Provider_Identifier_State_50" is not NULL;


/* Address */

/* This holds the contact information for the provider */
drop table if exists "NPPES_contact";
create table "NPPES_contact" (
  id SERIAL,
  address_type varchar(15),
  "NPI" char(10),
  first_line varchar(55),
  second_line varchar(55),
  city varchar(40),
  state varchar(40),
  postal_code varchar(20),
  country_code varchar(2),
  address_flattened varchar(1023),
  address_formatted varchar(1023),
  phone varchar(20),
  fax varchar(20),
  address_hash varchar(64),
  zip5 varchar(5),
  zip4 varchar(4)
  );
  
  
/* Insert the business addresses into the contact table */
insert into "NPPES_contact" (address_type, "NPI", first_line, second_line, city, state,  postal_code, country_code, phone, fax)
  select 'business',nh."NPI", nh."Provider_First_Line_Business_Mailing_Address", nh."Provider_Second_Line_Business_Mailing_Address", nh."Provider_Business_Mailing_Address_City_Name",
      nh."Provider_Business_Mailing_Address_State_Name", nh."Provider_Business_Mailing_Address_Postal_Code",
      nh."Provider_Business_Mailing_Address_Country_Code_If_outside_U_PER",
      nh."Provider_Business_Mailing_Address_Telephone_Number", nh."Provider_Business_Mailing_Address_Fax_Number"
    from "NPPES_header" nh
;

/* Insert the practice address into the contact table */
insert into "NPPES_contact" (address_type, "NPI", first_line, second_line, city, state,  postal_code, country_code, phone, fax)
  select 'practice', nh."NPI", nh."Provider_First_Line_Business_Practice_Location_Address", nh."Provider_Second_Line_Business_Practice_Location_Address", nh."Provider_Business_Practice_Location_Address_City_Name",
      nh."Provider_Business_Practice_Location_Address_State_Name", nh."Provider_Business_Practice_Location_Address_Postal_Code",
      nh."Provider_Business_Practice_Location_Address_Country_Code_If_outside_U_PER", nh."Provider_Business_Practice_Location_Address_Fax_Number",
      nh."Provider_Business_Practice_Location_Address_Telephone_Number"
    from "NPPES_header" nh;

/* Remove blank contacts */
delete from "NPPES_contact" where first_line is null and second_line is null and city is null and postal_code is null
  and country_code is null and phone is null and fax is null;

/* Populate a flattened address field which will be used for hashing */
update "NPPES_contact" set address_flattened =
  concat(case when first_line is not null then concat('|',first_line,'|') else '||' end,
  case when second_line is not null then concat('|', second_line,'|') else '||' end,
  case when city is not null then concat('|', city,'|') else '||' end,
  case when postal_code is not null then concat('|', postal_code,'|') else '||' end,
  case when country_code is not null then concat('|', country_code, '|') else '||' end);
  
update "NPPES_contact" set address_hash = md5(address_flattened);
update "NPPES_contact" set zip5 = left(postal_code, 5), zip4 = substring(postal_code, 6, 4);


/*

Working out formatted address 

select
  concat(trim(first_line), ', ', 
      case when second_line is not null then concat(trim(second_line), ', ') else '' end,
      trim(city), ', ' , trim(state), ' ', trim(zip5), case when char_length(zip4) > 0 then concat('-', zip4) 
      else '' end) as formatted_address from "NPPES_contact" limit 1000; */

update "NPPES_contact" set address_formatted
  = concat(trim(first_line), ', ', 
      case when second_line is not null then concat(trim(second_line), ', ') else '' end,
      trim(city), ', ' , trim(state), ' ', trim(zip5), case when char_length(zip4) > 0 then concat('-', zip4) 
      else '' end);
    
create unique index pk_nppes_contact_id on "NPPES_contact"(id);    
create index idx_nppes_contact_npi on "NPPES_contact"("NPI");
create index idx_nppes_contact_address_type on "NPPES_contact"("address_type");
create index idx_nppes_contact_hash on "NPPES_contact"(address_hash);
     
 

/* Temp table for addresses */
drop table if exists tmp_nppes_max_id_address;
create table tmp_nppes_max_id_address (max_id integer, counter integer, address_hash varchar(64));

insert into tmp_nppes_max_id_address (max_id, counter, address_hash)
      select max(id),count(*),address_hash from "NPPES_contact" group by address_hash order by count(*) desc;

create index idx_tmi_hash on tmp_nppes_max_id_address(address_hash);


/* Holds the normalized addresses */
drop table if exists "NPPES_address";
create table "NPPES_address"
(id serial,
  first_line varchar(55),
  second_line varchar(55),
  city varchar(40),
  state varchar(40),
  postal_code varchar(20),
  country_code varchar(2),
  address_flattened varchar(1023),
  address_formatted varchar(1023),
  address_hash varchar(64),
  zip5 varchar(5),
  zip4 varchar(4),
  latitude float,
  longitude float,
  geom geography,
  geocode_method varchar(64)
);


/* Populate the address table */
insert into "NPPES_address" (first_line, second_line, city, state, postal_code, country_code, address_flattened, address_formatted, address_hash, zip5, zip4)
  select nc.first_line, nc.second_line, nc.city, nc.state, nc.postal_code, nc.country_code,
  nc.address_flattened, nc.address_formatted, nc.address_hash, zip5, zip4 from "NPPES_contact" nc
  join tmp_nppes_max_id_address tmi on tmi.address_hash = nc.address_hash and tmi.max_id = nc.id;
  
create index idx_nppes_address_addr_hash on "NPPES_address"(address_hash);

create index idx_addr_zip4 on "NPPES_address"(zip4);
create index idx_addr_zip5 on "NPPES_address"(zip5);
create index idx_addr_city on "NPPES_address"(city);
create index idx_addr_state on "NPPES_address"(state);
create index idx_addr_latitude on "NPPES_address"(latitude);
create index idx_addr_longitude on "NPPES_address"(longitude);
create index idx_addr_geocdm on "NPPES_address"(geocode_method);

drop table if exists "NPPES_provider_address_geocoded";
CREATE TABLE "NPPES_provider_address_geocoded"
(
   address_hash          VARCHAR(64),
   geocoder_type         VARCHAR(255),
   rating                int4,
   address_formatted     VARCHAR(1023),
   matched_address       VARCHAR (255),
   zip5                  VARCHAR (5),
   matched_zip5          VARCHAR (255),
   latitude              float8,
   longitude             float8,
   geom                  geometry,
   is_best_estimate      int4,
   geocoding_timestamp   timestamptz
);

create index idx_np_pr_ad_ge_address_hash on "NPPES_provider_address_geocoded"(address_hash);
create index idx_np_pr_ad_ge_geom on "NPPES_provider_address_geocoded" using GIST (geom);

/* Run Geocoding Software */

CLUSTER "NPPES_provider_address_geocoded" USING idx_np_pr_ad_ge_geom;
ANALYZE "NPPES_provider_address_geocoded";

/* Taxonomy Processing */
 
drop table if exists "NPPES_provider_flattened_nucc_taxonomy";
create table "NPPES_provider_flattened_nucc_taxonomy" 
  ("NPI" char(10),
   flattened_nucc_taxonomy_string varchar(1023),
   code_count integer,
   min_sequence_id integer,
   max_sequence_id integer
   );
 
insert into "NPPES_provider_flattened_nucc_taxonomy"
  ("NPI", flattened_nucc_taxonomy_string, code_count, min_sequence_id, max_sequence_id)
    select t."NPI", string_agg(distinct t."Healthcare_Provider_Taxonomy_Code", '|'), count(distinct t."Healthcare_Provider_Taxonomy_Code"), 
      min(sequence_id), max(sequence_id)
    from ( 
      select "NPI", "Healthcare_Provider_Taxonomy_Code", sequence_id FROM "NPPES_provider_licenses" order by "NPI", sequence_id
    ) t group by t."NPI";
 
create unique index pk_nppes_prov_flac_nucc on "NPPES_provider_flattened_nucc_taxonomy"("NPI");
 
 
drop table if exists "NPPES_primary_nucc_taxonomy"; 
create table "NPPES_primary_nucc_taxonomy"
  (
  id serial ,
  "NPI" char(10),
   primary_nucc_taxonomy_code char(10));

create unique index pk_nppes_prim_nucc on "NPPES_primary_nucc_taxonomy"("NPI"); 

drop table if exists tmp_nppes_provider_primary_nucc;
create table tmp_nppes_provider_primary_nucc as
  select "NPI", min(sequence_id) as sequence_id from "NPPES_provider_licenses" npl 
    where "Healthcare_Provider_Primary_Taxonomy_Switch" = 'Y' group by "NPI"; 
/* 4348071 rows affected */

create index t_n_p_n_npi on tmp_nppes_provider_primary_nucc("NPI");
 
insert into "NPPES_primary_nucc_taxonomy" ("NPI", primary_nucc_taxonomy_code)
  select npl."NPI", "Healthcare_Provider_Taxonomy_Code" from "NPPES_provider_licenses" npl
    join  tmp_nppes_provider_primary_nucc tnppn on npl."NPI" = tnppn."NPI" and npl.sequence_id = tnppn.sequence_id
    where "Healthcare_Provider_Primary_Taxonomy_Switch" = 'Y';

/* 128,349 */

insert into "NPPES_primary_nucc_taxonomy" ("NPI", primary_nucc_taxonomy_code)
  select tt."NPI", npl."Healthcare_Provider_Taxonomy_Code" from
    (select * from 
      (select nh."NPI", case when tnppn."NPI" is NULL then 0 else 1 end as "imported_NPI" 
        from  "NPPES_header" nh left outer join tmp_nppes_provider_primary_nucc tnppn 
          on nh."NPI" = tnppn."NPI") t where t."imported_NPI" = 0) tt
       join  "NPPES_provider_licenses" npl on npl."NPI" = tt."NPI" and npl.sequence_id = 1;
 
select count(distinct "NPI") from "NPPES_provider_licenses";
/* 4402364 */
select count(*) from "NPPES_primary_nucc_taxonomy";
/* 4402364 */

select count(*) from "NPPES_header";
/* 4476420 */

insert into "NPPES_primary_nucc_taxonomy" ("NPI")
  select "NPI" from (
    select nh."NPI", case when npnt."NPI" is null then 0 else 1 end as has_nucc_taxonomy 
      from "NPPES_header" nh left outer join "NPPES_primary_nucc_taxonomy" npnt on nh."NPI" = npnt."NPI") t where has_nucc_taxonomy = 0;

select count(*) from "NPPES_primary_nucc_taxonomy";

select count(*) from "NPPES_provider_flattened_nucc_taxonomy";
/* 4402364 */

insert into "NPPES_provider_flattened_nucc_taxonomy" ("NPI")
  select "NPI" from (
    select nh."NPI", case when npnt."NPI" is null then 0 else 1 end as has_nucc_taxonomy 
      from "NPPES_header" nh left outer join "NPPES_provider_flattened_nucc_taxonomy" npnt on nh."NPI" = npnt."NPI") t where has_nucc_taxonomy = 0; 
 
select count(*) from "NPPES_provider_flattened_nucc_taxonomy"; 
/* 4476420 */

drop table if exists nucc_taxonomy_enhanced;
create table nucc_taxonomy_enhanced as
  select *,
    case 
      when short_type = 'Eye & Vision' and partial_name = 'Technician/Technologist' then concat(short_type, ' - ', partial_name) 
      when short_type = 'Physician' then concat(partial_name, ' (physician)' ) 
      when short_type = 'Student' then 'Student'
      else partial_name
    end as name
  from (
    select *,
      concat(trim("Classification"), case when "Specialization" is null then '' else concat(': ', "Specialization") end) as partial_name
    from (
      select *,
        case 
          when "Type" = 'Allopathic & Osteopathic Physicians' then 'Physician'
          when "Type" = 'Ambulatory Health Care Facilities' then 'Ambulatory'
          when "Type" = 'Behavioral Health & Social Service Providers' then 'BH & SS'
          when "Type" = 'Chiropractic Providers' then 'Chiropractic'
          when "Type" = 'Dental Providers' then 'Dental'
          when "Type" = 'Dietary & Nutritional Service Providers' then 'Dietary & Nutritional '
          when "Type" = 'Emergency Medical Service Providers' then 'EMS'
          when "Type" = 'Eye and Vision Services Providers' then 'Eye & Vision'
          when "Type" = 'Group' then 'Group'
          when "Type" = 'Hospital Units' then 'Hospital Units'
          when "Type" = 'Hospitals' then 'Hospitals'
          when "Type" = 'Laboratories' then 'Laboratories'
          when "Type" = 'Managed Care Organizations' then 'MCO'
          when "Type" = 'Nursing & Custodial Care Facilities' then 'Nursing Facilities'
          when "Type" = 'Nursing Service Providers' then 'Nursing'
          when "Type" = 'Nursing Service Related Providers' then 'Nursing Related'
          when "Type" = 'Other Service Providers' then 'Other'
          when "Type" = 'Pharmacy Service Providers' then 'Pharmacy'
          when "Type" = 'Physician Assistants & Advanced Practice Nursing Providers' then 'Physician'
          when "Type" = 'Podiatric Medicine & Surgery Service Providers' then 'Podiatric'
          when "Type" = 'Residential Treatment Facilities' then 'Residential'
          when "Type" = 'Respiratory, Developmental, Rehabilitative and Restorative Service Providers' then 'Respiratory'
          when "Type" = 'Respite Care Facility' then 'Respite Care'
          when "Type" = 'Speech, Language and Hearing Service Providers' then 'Speech'
          when "Type" = 'Student, Health Care' then 'Student'
          when "Type" = 'Suppliers' then 'Suppliers'
          when "Type" = 'Technologists, Technicians & Other Technical Service Providers' then 'Technologists'
          when "Type" = 'Transportation Services' then 'Transportation'
        end as Short_Type
      from nucc_taxonomy) t) tt;

/*  */

drop table if exists  "NPPES_provider_nucc_taxonomy";
create table "NPPES_provider_nucc_taxonomy" as
  select npf."NPI", npf.flattened_nucc_taxonomy_string, npf.code_count,
    npnt.primary_nucc_taxonomy_code, nte.name as primary_nucc_taxonomy_name
  from "NPPES_provider_flattened_nucc_taxonomy" npf
    join "NPPES_primary_nucc_taxonomy" npnt on npf."NPI" = npnt."NPI"
    left outer join nucc_taxonomy_enhanced nte on nte."Code" = npnt.primary_nucc_taxonomy_code;

create unique index pk_n_p_n_t_npi on "NPPES_provider_nucc_taxonomy"("NPI"); 

alter table "NPPES_provider_nucc_taxonomy" add is_ambulance boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_anesthesiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_chiropractor boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_clinic_center boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_clinical_nurse_specialist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_clinical_pharmacology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_counselor boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_dentist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_dermatology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_durable_medical_equipment_medical_supplies boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_emergency_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_family_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_general_acute_care_hospital boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_general_practice boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_genetic_counselor_ms boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_hospitalist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_internal_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_marriage_and_family_therapist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_military_hospital boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_multispecialty boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_neurological_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_nuclear_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_nurse_anesthetist_certified_registered boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_nurse_practitioner boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_obstetrics_and_gynecology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_ophthalmology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_optometrist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_orthopaedic_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_otolaryngology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pain_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pathology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pediatrics boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pharmacist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pharmacy boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_physical_medicine_and_rehabilitation boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_physical_therapist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_physician_assistant boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_plastic_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_podiatrist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_preventive_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_psychiatric_hospital boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_psychiatric_unit boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_psychiatry_and_neurology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_psychoanalyst boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_psychologist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_radiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_registered_nurse boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_rehabilitation_hospital boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_single_specialty boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_social_worker boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_special_hospital boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_thoracic_surgery_cardiothoracic_vascular_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_transplant_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_urology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_behavioral_health_and_social_service_providers boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_hospital boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_laboratory boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_managed_care_organization boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_nursing_care_facility boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_residential_treatment_facility boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_student boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_supplier boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_physician boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_body_imaging boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_cardiovascular_disease boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_clinical_cardiac_electrophysiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_critical_care_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_diagnostic_radiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_diagnostic_ultrasound boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_endocrinology_diabetes_and_metabolism boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_endodontics boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_gastroenterology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_geriatric_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_hematology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_hematology_and_oncology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_hepatology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_hospice_and_palliative_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_hypertension_specialist boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_infectious_disease boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_interventional_cardiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_interventional_pain_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_mohsmicrographic_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_magnetic_resonance_imaging_mri boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_medical_oncology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_molecular_genetic_pathology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_nephrology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_neurology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_neuroradiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_nuclear_radiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_oral_and_maxillofacial_pathology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_oral_and_maxillofacial_radiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_oral_and_maxillofacial_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_orthodontics_and_dentofacial_orthopedics boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pediatric_dentistry boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pediatric_radiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pediatric_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_periodontics boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_plastic_and_reconstructive_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_prosthodontics boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_psychiatry boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_pulmonary_disease boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_radiation_oncology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_rheumatology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_sleep_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_sports_medicine boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_surgery_of_the_hand boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_surgical_critical_care boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_surgical_oncology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_therapeutic_radiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_transplant_hepatology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_trauma_surgery boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_vascular_and_interventional_radiology boolean;
alter table "NPPES_provider_nucc_taxonomy" add is_vascular_surgery boolean;

update "NPPES_provider_nucc_taxonomy" set is_advanced_practice_midwife = case when flattened_nucc_taxonomy_string like '%367A00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_allergy_and_immunology = case when flattened_nucc_taxonomy_string like '%207K00000X%' or flattened_nucc_taxonomy_string like '%207KA0200X%' or flattened_nucc_taxonomy_string like '%207KI0005X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_ambulance = case when flattened_nucc_taxonomy_string like '%3416A0800X%' or flattened_nucc_taxonomy_string like '%3416L0300X%' or flattened_nucc_taxonomy_string like '%3416S0300X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_anesthesiologist_assistant = case when flattened_nucc_taxonomy_string like '%367H00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_anesthesiology = case when flattened_nucc_taxonomy_string like '%207L00000X%' or flattened_nucc_taxonomy_string like '%207LA0401X%' or flattened_nucc_taxonomy_string like '%207LC0200X%' or flattened_nucc_taxonomy_string like '%207LH0002X%' or flattened_nucc_taxonomy_string like '%207LP2900X%' or flattened_nucc_taxonomy_string like '%207LP3000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_assistant_podiatric = case when flattened_nucc_taxonomy_string like '%211D00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_assisted_living_facility = case when flattened_nucc_taxonomy_string like '%310400000X%' or flattened_nucc_taxonomy_string like '%3104A0625X%' or flattened_nucc_taxonomy_string like '%3104A0630X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_behavioral_analyst = case when flattened_nucc_taxonomy_string like '%103K00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_chiropractor = case when flattened_nucc_taxonomy_string like '%111N00000X%' or flattened_nucc_taxonomy_string like '%111NI0013X%' or flattened_nucc_taxonomy_string like '%111NI0900X%' or flattened_nucc_taxonomy_string like '%111NN0400X%' or flattened_nucc_taxonomy_string like '%111NN1001X%' or flattened_nucc_taxonomy_string like '%111NP0017X%' or flattened_nucc_taxonomy_string like '%111NR0200X%' or flattened_nucc_taxonomy_string like '%111NR0400X%' or flattened_nucc_taxonomy_string like '%111NS0005X%' or flattened_nucc_taxonomy_string like '%111NT0100X%' or flattened_nucc_taxonomy_string like '%111NX0100X%' or flattened_nucc_taxonomy_string like '%111NX0800X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_christian_science_sanitorium = case when flattened_nucc_taxonomy_string like '%287300000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinic_center = case when flattened_nucc_taxonomy_string like '%261Q00000X%' or flattened_nucc_taxonomy_string like '%261QA0005X%' or flattened_nucc_taxonomy_string like '%261QA0006X%' or flattened_nucc_taxonomy_string like '%261QA0600X%' or flattened_nucc_taxonomy_string like '%261QA0900X%' or flattened_nucc_taxonomy_string like '%261QA1903X%' or flattened_nucc_taxonomy_string like '%261QA3000X%' or flattened_nucc_taxonomy_string like '%261QB0400X%' or flattened_nucc_taxonomy_string like '%261QC0050X%' or flattened_nucc_taxonomy_string like '%261QC1500X%' or flattened_nucc_taxonomy_string like '%261QC1800X%' or flattened_nucc_taxonomy_string like '%261QD0000X%' or flattened_nucc_taxonomy_string like '%261QD1600X%' or flattened_nucc_taxonomy_string like '%261QE0002X%' or flattened_nucc_taxonomy_string like '%261QE0700X%' or flattened_nucc_taxonomy_string like '%261QE0800X%' or flattened_nucc_taxonomy_string like '%261QF0050X%' or flattened_nucc_taxonomy_string like '%261QF0400X%' or flattened_nucc_taxonomy_string like '%261QG0250X%' or flattened_nucc_taxonomy_string like '%261QH0100X%' or flattened_nucc_taxonomy_string like '%261QH0700X%' or flattened_nucc_taxonomy_string like '%261QI0500X%' or flattened_nucc_taxonomy_string like '%261QL0400X%' or flattened_nucc_taxonomy_string like '%261QM0801X%' or flattened_nucc_taxonomy_string like '%261QM0850X%' or flattened_nucc_taxonomy_string like '%261QM0855X%' or flattened_nucc_taxonomy_string like '%261QM1000X%' or flattened_nucc_taxonomy_string like '%261QM1100X%' or flattened_nucc_taxonomy_string like '%261QM1101X%' or flattened_nucc_taxonomy_string like '%261QM1102X%' or flattened_nucc_taxonomy_string like '%261QM1103X%' or flattened_nucc_taxonomy_string like '%261QM1200X%' or flattened_nucc_taxonomy_string like '%261QM1300X%' or flattened_nucc_taxonomy_string like '%261QM2500X%' or flattened_nucc_taxonomy_string like '%261QM2800X%' or flattened_nucc_taxonomy_string like '%261QM3000X%' or flattened_nucc_taxonomy_string like '%261QP0904X%' or flattened_nucc_taxonomy_string like '%261QP0905X%' or flattened_nucc_taxonomy_string like '%261QP1100X%' or flattened_nucc_taxonomy_string like '%261QP2000X%' or flattened_nucc_taxonomy_string like '%261QP2300X%' or flattened_nucc_taxonomy_string like '%261QP2400X%' or flattened_nucc_taxonomy_string like '%261QP3300X%' or flattened_nucc_taxonomy_string like '%261QR0200X%' or flattened_nucc_taxonomy_string like '%261QR0206X%' or flattened_nucc_taxonomy_string like '%261QR0207X%' or flattened_nucc_taxonomy_string like '%261QR0208X%' or flattened_nucc_taxonomy_string like '%261QR0400X%' or flattened_nucc_taxonomy_string like '%261QR0401X%' or flattened_nucc_taxonomy_string like '%261QR0404X%' or flattened_nucc_taxonomy_string like '%261QR0405X%' or flattened_nucc_taxonomy_string like '%261QR0800X%' or flattened_nucc_taxonomy_string like '%261QR1100X%' or flattened_nucc_taxonomy_string like '%261QR1300X%' or flattened_nucc_taxonomy_string like '%261QS0112X%' or flattened_nucc_taxonomy_string like '%261QS0132X%' or flattened_nucc_taxonomy_string like '%261QS1000X%' or flattened_nucc_taxonomy_string like '%261QS1200X%' or flattened_nucc_taxonomy_string like '%261QU0200X%' or flattened_nucc_taxonomy_string like '%261QV0200X%' or flattened_nucc_taxonomy_string like '%261QX0100X%' or flattened_nucc_taxonomy_string like '%261QX0200X%' or flattened_nucc_taxonomy_string like '%261QX0203X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_nurse_specialist = case when flattened_nucc_taxonomy_string like '%364S00000X%' or flattened_nucc_taxonomy_string like '%364SA2100X%' or flattened_nucc_taxonomy_string like '%364SA2200X%' or flattened_nucc_taxonomy_string like '%364SC0200X%' or flattened_nucc_taxonomy_string like '%364SC1501X%' or flattened_nucc_taxonomy_string like '%364SC2300X%' or flattened_nucc_taxonomy_string like '%364SE0003X%' or flattened_nucc_taxonomy_string like '%364SE1400X%' or flattened_nucc_taxonomy_string like '%364SF0001X%' or flattened_nucc_taxonomy_string like '%364SG0600X%' or flattened_nucc_taxonomy_string like '%364SH0200X%' or flattened_nucc_taxonomy_string like '%364SH1100X%' or flattened_nucc_taxonomy_string like '%364SI0800X%' or flattened_nucc_taxonomy_string like '%364SL0600X%' or flattened_nucc_taxonomy_string like '%364SM0705X%' or flattened_nucc_taxonomy_string like '%364SN0000X%' or flattened_nucc_taxonomy_string like '%364SN0800X%' or flattened_nucc_taxonomy_string like '%364SP0200X%' or flattened_nucc_taxonomy_string like '%364SP0807X%' or flattened_nucc_taxonomy_string like '%364SP0808X%' or flattened_nucc_taxonomy_string like '%364SP0809X%' or flattened_nucc_taxonomy_string like '%364SP0810X%' or flattened_nucc_taxonomy_string like '%364SP0811X%' or flattened_nucc_taxonomy_string like '%364SP0812X%' or flattened_nucc_taxonomy_string like '%364SP0813X%' or flattened_nucc_taxonomy_string like '%364SP1700X%' or flattened_nucc_taxonomy_string like '%364SP2800X%' or flattened_nucc_taxonomy_string like '%364SR0400X%' or flattened_nucc_taxonomy_string like '%364SS0200X%' or flattened_nucc_taxonomy_string like '%364ST0500X%' or flattened_nucc_taxonomy_string like '%364SW0102X%' or flattened_nucc_taxonomy_string like '%364SX0106X%' or flattened_nucc_taxonomy_string like '%364SX0200X%' or flattened_nucc_taxonomy_string like '%364SX0204X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_pharmacology = case when flattened_nucc_taxonomy_string like '%208U00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_colon_and_rectal_surgery = case when flattened_nucc_taxonomy_string like '%208C00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_counselor = case when flattened_nucc_taxonomy_string like '%101Y00000X%' or flattened_nucc_taxonomy_string like '%101YA0400X%' or flattened_nucc_taxonomy_string like '%101YM0800X%' or flattened_nucc_taxonomy_string like '%101YP1600X%' or flattened_nucc_taxonomy_string like '%101YP2500X%' or flattened_nucc_taxonomy_string like '%101YS0200X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_dentist = case when flattened_nucc_taxonomy_string like '%122300000X%' or flattened_nucc_taxonomy_string like '%1223D0001X%' or flattened_nucc_taxonomy_string like '%1223E0200X%' or flattened_nucc_taxonomy_string like '%1223G0001X%' or flattened_nucc_taxonomy_string like '%1223P0106X%' or flattened_nucc_taxonomy_string like '%1223P0221X%' or flattened_nucc_taxonomy_string like '%1223P0300X%' or flattened_nucc_taxonomy_string like '%1223P0700X%' or flattened_nucc_taxonomy_string like '%1223S0112X%' or flattened_nucc_taxonomy_string like '%1223X0008X%' or flattened_nucc_taxonomy_string like '%1223X0400X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_denturist = case when flattened_nucc_taxonomy_string like '%122400000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_dermatology = case when flattened_nucc_taxonomy_string like '%207N00000X%' or flattened_nucc_taxonomy_string like '%207ND0101X%' or flattened_nucc_taxonomy_string like '%207ND0900X%' or flattened_nucc_taxonomy_string like '%207NI0002X%' or flattened_nucc_taxonomy_string like '%207NP0225X%' or flattened_nucc_taxonomy_string like '%207NS0135X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_durable_medical_equipment_medical_supplies = case when flattened_nucc_taxonomy_string like '%332B00000X%' or flattened_nucc_taxonomy_string like '%332BC3200X%' or flattened_nucc_taxonomy_string like '%332BD1200X%' or flattened_nucc_taxonomy_string like '%332BN1400X%' or flattened_nucc_taxonomy_string like '%332BP3500X%' or flattened_nucc_taxonomy_string like '%332BX2000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_electrodiagnostic_medicine = case when flattened_nucc_taxonomy_string like '%204R00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_emergency_medicine = case when flattened_nucc_taxonomy_string like '%207P00000X%' or flattened_nucc_taxonomy_string like '%207PE0004X%' or flattened_nucc_taxonomy_string like '%207PE0005X%' or flattened_nucc_taxonomy_string like '%207PH0002X%' or flattened_nucc_taxonomy_string like '%207PP0204X%' or flattened_nucc_taxonomy_string like '%207PS0010X%' or flattened_nucc_taxonomy_string like '%207PT0002X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_family_medicine = case when flattened_nucc_taxonomy_string like '%207Q00000X%' or flattened_nucc_taxonomy_string like '%207QA0000X%' or flattened_nucc_taxonomy_string like '%207QA0401X%' or flattened_nucc_taxonomy_string like '%207QA0505X%' or flattened_nucc_taxonomy_string like '%207QB0002X%' or flattened_nucc_taxonomy_string like '%207QG0300X%' or flattened_nucc_taxonomy_string like '%207QH0002X%' or flattened_nucc_taxonomy_string like '%207QS0010X%' or flattened_nucc_taxonomy_string like '%207QS1201X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_general_acute_care_hospital = case when flattened_nucc_taxonomy_string like '%282N00000X%' or flattened_nucc_taxonomy_string like '%282NC0060X%' or flattened_nucc_taxonomy_string like '%282NC2000X%' or flattened_nucc_taxonomy_string like '%282NR1301X%' or flattened_nucc_taxonomy_string like '%282NW0100X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_general_practice = case when flattened_nucc_taxonomy_string like '%208D00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_genetic_counselor_ms = case when flattened_nucc_taxonomy_string like '%170300000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_hospitalist = case when flattened_nucc_taxonomy_string like '%208M00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_internal_medicine = case when flattened_nucc_taxonomy_string like '%207R00000X%' or flattened_nucc_taxonomy_string like '%207RA0000X%' or flattened_nucc_taxonomy_string like '%207RA0201X%' or flattened_nucc_taxonomy_string like '%207RA0401X%' or flattened_nucc_taxonomy_string like '%207RB0002X%' or flattened_nucc_taxonomy_string like '%207RC0000X%' or flattened_nucc_taxonomy_string like '%207RC0001X%' or flattened_nucc_taxonomy_string like '%207RC0200X%' or flattened_nucc_taxonomy_string like '%207RE0101X%' or flattened_nucc_taxonomy_string like '%207RG0100X%' or flattened_nucc_taxonomy_string like '%207RG0300X%' or flattened_nucc_taxonomy_string like '%207RH0000X%' or flattened_nucc_taxonomy_string like '%207RH0002X%' or flattened_nucc_taxonomy_string like '%207RH0003X%' or flattened_nucc_taxonomy_string like '%207RH0005X%' or flattened_nucc_taxonomy_string like '%207RI0001X%' or flattened_nucc_taxonomy_string like '%207RI0008X%' or flattened_nucc_taxonomy_string like '%207RI0011X%' or flattened_nucc_taxonomy_string like '%207RI0200X%' or flattened_nucc_taxonomy_string like '%207RM1200X%' or flattened_nucc_taxonomy_string like '%207RN0300X%' or flattened_nucc_taxonomy_string like '%207RP1001X%' or flattened_nucc_taxonomy_string like '%207RR0500X%' or flattened_nucc_taxonomy_string like '%207RS0010X%' or flattened_nucc_taxonomy_string like '%207RS0012X%' or flattened_nucc_taxonomy_string like '%207RT0003X%' or flattened_nucc_taxonomy_string like '%207RX0202X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_legal_medicine = case when flattened_nucc_taxonomy_string like '%209800000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_marriage_and_family_therapist = case when flattened_nucc_taxonomy_string like '%106H00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_massage_therapist = case when flattened_nucc_taxonomy_string like '%225700000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_medical_genetics = case when flattened_nucc_taxonomy_string like '%207SC0300X%' or flattened_nucc_taxonomy_string like '%207SG0201X%' or flattened_nucc_taxonomy_string like '%207SG0202X%' or flattened_nucc_taxonomy_string like '%207SG0203X%' or flattened_nucc_taxonomy_string like '%207SG0205X%' or flattened_nucc_taxonomy_string like '%207SM0001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_medical_genetics_phd_medical_genetics = case when flattened_nucc_taxonomy_string like '%170100000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_military_hospital = case when flattened_nucc_taxonomy_string like '%286500000X%' or flattened_nucc_taxonomy_string like '%2865C1500X%' or flattened_nucc_taxonomy_string like '%2865M2000X%' or flattened_nucc_taxonomy_string like '%2865X1600X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_multispecialty = case when flattened_nucc_taxonomy_string like '%193200000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_neurological_surgery = case when flattened_nucc_taxonomy_string like '%207T00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_neuromusculoskeletal_medicine_and_omm = case when flattened_nucc_taxonomy_string like '%204D00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_nuclear_medicine = case when flattened_nucc_taxonomy_string like '%207U00000X%' or flattened_nucc_taxonomy_string like '%207UN0901X%' or flattened_nucc_taxonomy_string like '%207UN0902X%' or flattened_nucc_taxonomy_string like '%207UN0903X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_nurse_anesthetist_certified_registered = case when flattened_nucc_taxonomy_string like '%367500000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_nurse_practitioner = case when flattened_nucc_taxonomy_string like '%363L00000X%' or flattened_nucc_taxonomy_string like '%363LA2100X%' or flattened_nucc_taxonomy_string like '%363LA2200X%' or flattened_nucc_taxonomy_string like '%363LC0200X%' or flattened_nucc_taxonomy_string like '%363LC1500X%' or flattened_nucc_taxonomy_string like '%363LF0000X%' or flattened_nucc_taxonomy_string like '%363LG0600X%' or flattened_nucc_taxonomy_string like '%363LN0000X%' or flattened_nucc_taxonomy_string like '%363LN0005X%' or flattened_nucc_taxonomy_string like '%363LP0200X%' or flattened_nucc_taxonomy_string like '%363LP0222X%' or flattened_nucc_taxonomy_string like '%363LP0808X%' or flattened_nucc_taxonomy_string like '%363LP1700X%' or flattened_nucc_taxonomy_string like '%363LP2300X%' or flattened_nucc_taxonomy_string like '%363LS0200X%' or flattened_nucc_taxonomy_string like '%363LW0102X%' or flattened_nucc_taxonomy_string like '%363LX0001X%' or flattened_nucc_taxonomy_string like '%363LX0106X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_obstetrics_and_gynecology = case when flattened_nucc_taxonomy_string like '%207V00000X%' or flattened_nucc_taxonomy_string like '%207VB0002X%' or flattened_nucc_taxonomy_string like '%207VC0200X%' or flattened_nucc_taxonomy_string like '%207VE0102X%' or flattened_nucc_taxonomy_string like '%207VF0040X%' or flattened_nucc_taxonomy_string like '%207VG0400X%' or flattened_nucc_taxonomy_string like '%207VH0002X%' or flattened_nucc_taxonomy_string like '%207VM0101X%' or flattened_nucc_taxonomy_string like '%207VX0000X%' or flattened_nucc_taxonomy_string like '%207VX0201X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_ophthalmology = case when flattened_nucc_taxonomy_string like '%207W00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_optometrist = case when flattened_nucc_taxonomy_string like '%152W00000X%' or flattened_nucc_taxonomy_string like '%152WC0802X%' or flattened_nucc_taxonomy_string like '%152WL0500X%' or flattened_nucc_taxonomy_string like '%152WP0200X%' or flattened_nucc_taxonomy_string like '%152WS0006X%' or flattened_nucc_taxonomy_string like '%152WV0400X%' or flattened_nucc_taxonomy_string like '%152WX0102X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_orthopaedic_surgery = case when flattened_nucc_taxonomy_string like '%207X00000X%' or flattened_nucc_taxonomy_string like '%207XP3100X%' or flattened_nucc_taxonomy_string like '%207XS0106X%' or flattened_nucc_taxonomy_string like '%207XS0114X%' or flattened_nucc_taxonomy_string like '%207XS0117X%' or flattened_nucc_taxonomy_string like '%207XX0004X%' or flattened_nucc_taxonomy_string like '%207XX0005X%' or flattened_nucc_taxonomy_string like '%207XX0801X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_otolaryngology = case when flattened_nucc_taxonomy_string like '%207Y00000X%' or flattened_nucc_taxonomy_string like '%207YP0228X%' or flattened_nucc_taxonomy_string like '%207YS0012X%' or flattened_nucc_taxonomy_string like '%207YS0123X%' or flattened_nucc_taxonomy_string like '%207YX0007X%' or flattened_nucc_taxonomy_string like '%207YX0602X%' or flattened_nucc_taxonomy_string like '%207YX0901X%' or flattened_nucc_taxonomy_string like '%207YX0905X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pain_medicine = case when flattened_nucc_taxonomy_string like '%208VP0000X%' or flattened_nucc_taxonomy_string like '%208VP0014X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pathology = case when flattened_nucc_taxonomy_string like '%207ZB0001X%' or flattened_nucc_taxonomy_string like '%207ZC0006X%' or flattened_nucc_taxonomy_string like '%207ZC0500X%' or flattened_nucc_taxonomy_string like '%207ZD0900X%' or flattened_nucc_taxonomy_string like '%207ZF0201X%' or flattened_nucc_taxonomy_string like '%207ZH0000X%' or flattened_nucc_taxonomy_string like '%207ZI0100X%' or flattened_nucc_taxonomy_string like '%207ZM0300X%' or flattened_nucc_taxonomy_string like '%207ZN0500X%' or flattened_nucc_taxonomy_string like '%207ZP0007X%' or flattened_nucc_taxonomy_string like '%207ZP0101X%' or flattened_nucc_taxonomy_string like '%207ZP0102X%' or flattened_nucc_taxonomy_string like '%207ZP0104X%' or flattened_nucc_taxonomy_string like '%207ZP0105X%' or flattened_nucc_taxonomy_string like '%207ZP0213X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pediatrics = case when flattened_nucc_taxonomy_string like '%208000000X%' or flattened_nucc_taxonomy_string like '%2080A0000X%' or flattened_nucc_taxonomy_string like '%2080C0008X%' or flattened_nucc_taxonomy_string like '%2080H0002X%' or flattened_nucc_taxonomy_string like '%2080I0007X%' or flattened_nucc_taxonomy_string like '%2080N0001X%' or flattened_nucc_taxonomy_string like '%2080P0006X%' or flattened_nucc_taxonomy_string like '%2080P0008X%' or flattened_nucc_taxonomy_string like '%2080P0201X%' or flattened_nucc_taxonomy_string like '%2080P0202X%' or flattened_nucc_taxonomy_string like '%2080P0203X%' or flattened_nucc_taxonomy_string like '%2080P0204X%' or flattened_nucc_taxonomy_string like '%2080P0205X%' or flattened_nucc_taxonomy_string like '%2080P0206X%' or flattened_nucc_taxonomy_string like '%2080P0207X%' or flattened_nucc_taxonomy_string like '%2080P0208X%' or flattened_nucc_taxonomy_string like '%2080P0210X%' or flattened_nucc_taxonomy_string like '%2080P0214X%' or flattened_nucc_taxonomy_string like '%2080P0216X%' or flattened_nucc_taxonomy_string like '%2080S0010X%' or flattened_nucc_taxonomy_string like '%2080S0012X%' or flattened_nucc_taxonomy_string like '%2080T0002X%' or flattened_nucc_taxonomy_string like '%2080T0004X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pharmacist = case when flattened_nucc_taxonomy_string like '%183500000X%' or flattened_nucc_taxonomy_string like '%1835G0000X%' or flattened_nucc_taxonomy_string like '%1835G0303X%' or flattened_nucc_taxonomy_string like '%1835N0905X%' or flattened_nucc_taxonomy_string like '%1835N1003X%' or flattened_nucc_taxonomy_string like '%1835P0018X%' or flattened_nucc_taxonomy_string like '%1835P1200X%' or flattened_nucc_taxonomy_string like '%1835P1300X%' or flattened_nucc_taxonomy_string like '%1835X0200X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pharmacy = case when flattened_nucc_taxonomy_string like '%333600000X%' or flattened_nucc_taxonomy_string like '%3336C0002X%' or flattened_nucc_taxonomy_string like '%3336C0003X%' or flattened_nucc_taxonomy_string like '%3336C0004X%' or flattened_nucc_taxonomy_string like '%3336H0001X%' or flattened_nucc_taxonomy_string like '%3336I0012X%' or flattened_nucc_taxonomy_string like '%3336L0003X%' or flattened_nucc_taxonomy_string like '%3336M0002X%' or flattened_nucc_taxonomy_string like '%3336M0003X%' or flattened_nucc_taxonomy_string like '%3336N0007X%' or flattened_nucc_taxonomy_string like '%3336S0011X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pharmacy_technician = case when flattened_nucc_taxonomy_string like '%183700000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_physical_medicine_and_rehabilitation = case when flattened_nucc_taxonomy_string like '%208100000X%' or flattened_nucc_taxonomy_string like '%2081H0002X%' or flattened_nucc_taxonomy_string like '%2081N0008X%' or flattened_nucc_taxonomy_string like '%2081P0004X%' or flattened_nucc_taxonomy_string like '%2081P0010X%' or flattened_nucc_taxonomy_string like '%2081P2900X%' or flattened_nucc_taxonomy_string like '%2081S0010X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_physical_therapist = case when flattened_nucc_taxonomy_string like '%2251C2600X%' or flattened_nucc_taxonomy_string like '%2251E1200X%' or flattened_nucc_taxonomy_string like '%2251E1300X%' or flattened_nucc_taxonomy_string like '%2251G0304X%' or flattened_nucc_taxonomy_string like '%2251H1200X%' or flattened_nucc_taxonomy_string like '%2251H1300X%' or flattened_nucc_taxonomy_string like '%2251N0400X%' or flattened_nucc_taxonomy_string like '%2251P0200X%' or flattened_nucc_taxonomy_string like '%2251S0007X%' or flattened_nucc_taxonomy_string like '%2251X0800X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_physician_assistant = case when flattened_nucc_taxonomy_string like '%363A00000X%' or flattened_nucc_taxonomy_string like '%363AM0700X%' or flattened_nucc_taxonomy_string like '%363AS0400X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_plastic_surgery = case when flattened_nucc_taxonomy_string like '%208200000X%' or flattened_nucc_taxonomy_string like '%2082S0099X%' or flattened_nucc_taxonomy_string like '%2082S0105X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_podiatrist = case when flattened_nucc_taxonomy_string like '%213E00000X%' or flattened_nucc_taxonomy_string like '%213EG0000X%' or flattened_nucc_taxonomy_string like '%213EP0504X%' or flattened_nucc_taxonomy_string like '%213EP1101X%' or flattened_nucc_taxonomy_string like '%213ER0200X%' or flattened_nucc_taxonomy_string like '%213ES0000X%' or flattened_nucc_taxonomy_string like '%213ES0103X%' or flattened_nucc_taxonomy_string like '%213ES0131X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_preventive_medicine = case when flattened_nucc_taxonomy_string like '%2083A0100X%' or flattened_nucc_taxonomy_string like '%2083P0011X%' or flattened_nucc_taxonomy_string like '%2083P0500X%' or flattened_nucc_taxonomy_string like '%2083P0901X%' or flattened_nucc_taxonomy_string like '%2083S0010X%' or flattened_nucc_taxonomy_string like '%2083T0002X%' or flattened_nucc_taxonomy_string like '%2083X0100X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_psychiatric_hospital = case when flattened_nucc_taxonomy_string like '%283Q00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_psychiatric_unit = case when flattened_nucc_taxonomy_string like '%273R00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_psychiatry_and_neurology = case when flattened_nucc_taxonomy_string like '%2084A0401X%' or flattened_nucc_taxonomy_string like '%2084B0002X%' or flattened_nucc_taxonomy_string like '%2084B0040X%' or flattened_nucc_taxonomy_string like '%2084D0003X%' or flattened_nucc_taxonomy_string like '%2084F0202X%' or flattened_nucc_taxonomy_string like '%2084H0002X%' or flattened_nucc_taxonomy_string like '%2084N0008X%' or flattened_nucc_taxonomy_string like '%2084N0400X%' or flattened_nucc_taxonomy_string like '%2084N0402X%' or flattened_nucc_taxonomy_string like '%2084N0600X%' or flattened_nucc_taxonomy_string like '%2084P0005X%' or flattened_nucc_taxonomy_string like '%2084P0015X%' or flattened_nucc_taxonomy_string like '%2084P0800X%' or flattened_nucc_taxonomy_string like '%2084P0802X%' or flattened_nucc_taxonomy_string like '%2084P0804X%' or flattened_nucc_taxonomy_string like '%2084P0805X%' or flattened_nucc_taxonomy_string like '%2084P2900X%' or flattened_nucc_taxonomy_string like '%2084S0010X%' or flattened_nucc_taxonomy_string like '%2084S0012X%' or flattened_nucc_taxonomy_string like '%2084V0102X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_psychoanalyst = case when flattened_nucc_taxonomy_string like '%102L00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_psychologist = case when flattened_nucc_taxonomy_string like '%103T00000X%' or flattened_nucc_taxonomy_string like '%103TA0400X%' or flattened_nucc_taxonomy_string like '%103TA0700X%' or flattened_nucc_taxonomy_string like '%103TB0200X%' or flattened_nucc_taxonomy_string like '%103TC0700X%' or flattened_nucc_taxonomy_string like '%103TC1900X%' or flattened_nucc_taxonomy_string like '%103TC2200X%' or flattened_nucc_taxonomy_string like '%103TE1000X%' or flattened_nucc_taxonomy_string like '%103TE1100X%' or flattened_nucc_taxonomy_string like '%103TF0000X%' or flattened_nucc_taxonomy_string like '%103TF0200X%' or flattened_nucc_taxonomy_string like '%103TH0004X%' or flattened_nucc_taxonomy_string like '%103TH0100X%' or flattened_nucc_taxonomy_string like '%103TM1700X%' or flattened_nucc_taxonomy_string like '%103TM1800X%' or flattened_nucc_taxonomy_string like '%103TP0016X%' or flattened_nucc_taxonomy_string like '%103TP0814X%' or flattened_nucc_taxonomy_string like '%103TP2700X%' or flattened_nucc_taxonomy_string like '%103TP2701X%' or flattened_nucc_taxonomy_string like '%103TR0400X%' or flattened_nucc_taxonomy_string like '%103TS0200X%' or flattened_nucc_taxonomy_string like '%103TW0100X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_radiology = case when flattened_nucc_taxonomy_string like '%2085B0100X%' or flattened_nucc_taxonomy_string like '%2085D0003X%' or flattened_nucc_taxonomy_string like '%2085H0002X%' or flattened_nucc_taxonomy_string like '%2085N0700X%' or flattened_nucc_taxonomy_string like '%2085N0904X%' or flattened_nucc_taxonomy_string like '%2085P0229X%' or flattened_nucc_taxonomy_string like '%2085R0001X%' or flattened_nucc_taxonomy_string like '%2085R0202X%' or flattened_nucc_taxonomy_string like '%2085R0203X%' or flattened_nucc_taxonomy_string like '%2085R0204X%' or flattened_nucc_taxonomy_string like '%2085R0205X%' or flattened_nucc_taxonomy_string like '%2085U0001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_registered_nurse = case when flattened_nucc_taxonomy_string like '%163W00000X%' or flattened_nucc_taxonomy_string like '%163WA0400X%' or flattened_nucc_taxonomy_string like '%163WA2000X%' or flattened_nucc_taxonomy_string like '%163WC0200X%' or flattened_nucc_taxonomy_string like '%163WC0400X%' or flattened_nucc_taxonomy_string like '%163WC1400X%' or flattened_nucc_taxonomy_string like '%163WC1500X%' or flattened_nucc_taxonomy_string like '%163WC1600X%' or flattened_nucc_taxonomy_string like '%163WC2100X%' or flattened_nucc_taxonomy_string like '%163WC3500X%' or flattened_nucc_taxonomy_string like '%163WD0400X%' or flattened_nucc_taxonomy_string like '%163WD1100X%' or flattened_nucc_taxonomy_string like '%163WE0003X%' or flattened_nucc_taxonomy_string like '%163WE0900X%' or flattened_nucc_taxonomy_string like '%163WF0300X%' or flattened_nucc_taxonomy_string like '%163WG0000X%' or flattened_nucc_taxonomy_string like '%163WG0100X%' or flattened_nucc_taxonomy_string like '%163WG0600X%' or flattened_nucc_taxonomy_string like '%163WH0200X%' or flattened_nucc_taxonomy_string like '%163WH0500X%' or flattened_nucc_taxonomy_string like '%163WH1000X%' or flattened_nucc_taxonomy_string like '%163WI0500X%' or flattened_nucc_taxonomy_string like '%163WI0600X%' or flattened_nucc_taxonomy_string like '%163WL0100X%' or flattened_nucc_taxonomy_string like '%163WM0102X%' or flattened_nucc_taxonomy_string like '%163WM0705X%' or flattened_nucc_taxonomy_string like '%163WM1400X%' or flattened_nucc_taxonomy_string like '%163WN0002X%' or flattened_nucc_taxonomy_string like '%163WN0003X%' or flattened_nucc_taxonomy_string like '%163WN0300X%' or flattened_nucc_taxonomy_string like '%163WN0800X%' or flattened_nucc_taxonomy_string like '%163WN1003X%' or flattened_nucc_taxonomy_string like '%163WP0000X%' or flattened_nucc_taxonomy_string like '%163WP0200X%' or flattened_nucc_taxonomy_string like '%163WP0218X%' or flattened_nucc_taxonomy_string like '%163WP0807X%' or flattened_nucc_taxonomy_string like '%163WP0808X%' or flattened_nucc_taxonomy_string like '%163WP0809X%' or flattened_nucc_taxonomy_string like '%163WP1700X%' or flattened_nucc_taxonomy_string like '%163WP2201X%' or flattened_nucc_taxonomy_string like '%163WR0006X%' or flattened_nucc_taxonomy_string like '%163WR0400X%' or flattened_nucc_taxonomy_string like '%163WR1000X%' or flattened_nucc_taxonomy_string like '%163WS0121X%' or flattened_nucc_taxonomy_string like '%163WS0200X%' or flattened_nucc_taxonomy_string like '%163WU0100X%' or flattened_nucc_taxonomy_string like '%163WW0000X%' or flattened_nucc_taxonomy_string like '%163WW0101X%' or flattened_nucc_taxonomy_string like '%163WX0002X%' or flattened_nucc_taxonomy_string like '%163WX0003X%' or flattened_nucc_taxonomy_string like '%163WX0106X%' or flattened_nucc_taxonomy_string like '%163WX0200X%' or flattened_nucc_taxonomy_string like '%163WX0601X%' or flattened_nucc_taxonomy_string like '%163WX0800X%' or flattened_nucc_taxonomy_string like '%163WX1100X%' or flattened_nucc_taxonomy_string like '%163WX1500X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_rehabilitation_hospital = case when flattened_nucc_taxonomy_string like '%283X00000X%' or flattened_nucc_taxonomy_string like '%283XC2000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_religious_nonmedical_health_care_institution = case when flattened_nucc_taxonomy_string like '%282J00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_single_specialty = case when flattened_nucc_taxonomy_string like '%193400000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_social_worker = case when flattened_nucc_taxonomy_string like '%104100000X%' or flattened_nucc_taxonomy_string like '%1041C0700X%' or flattened_nucc_taxonomy_string like '%1041S0200X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_special_hospital = case when flattened_nucc_taxonomy_string like '%284300000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_surgery = case when flattened_nucc_taxonomy_string like '%208600000X%' or flattened_nucc_taxonomy_string like '%2086H0002X%' or flattened_nucc_taxonomy_string like '%2086S0102X%' or flattened_nucc_taxonomy_string like '%2086S0105X%' or flattened_nucc_taxonomy_string like '%2086S0120X%' or flattened_nucc_taxonomy_string like '%2086S0122X%' or flattened_nucc_taxonomy_string like '%2086S0127X%' or flattened_nucc_taxonomy_string like '%2086S0129X%' or flattened_nucc_taxonomy_string like '%2086X0206X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_thoracic_surgery_cardiothoracic_vascular_surgery = case when flattened_nucc_taxonomy_string like '%208G00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_transplant_surgery = case when flattened_nucc_taxonomy_string like '%204F00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_urology = case when flattened_nucc_taxonomy_string like '%208800000X%' or flattened_nucc_taxonomy_string like '%2088F0040X%' or flattened_nucc_taxonomy_string like '%2088P0231X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_behavioral_health_and_social_service_providers = case when flattened_nucc_taxonomy_string like '%101Y00000X%' or flattened_nucc_taxonomy_string like '%101YA0400X%' or flattened_nucc_taxonomy_string like '%101YM0800X%' or flattened_nucc_taxonomy_string like '%101YP1600X%' or flattened_nucc_taxonomy_string like '%101YP2500X%' or flattened_nucc_taxonomy_string like '%101YS0200X%' or flattened_nucc_taxonomy_string like '%102L00000X%' or flattened_nucc_taxonomy_string like '%102X00000X%' or flattened_nucc_taxonomy_string like '%103G00000X%' or flattened_nucc_taxonomy_string like '%103GC0700X%' or flattened_nucc_taxonomy_string like '%103K00000X%' or flattened_nucc_taxonomy_string like '%103T00000X%' or flattened_nucc_taxonomy_string like '%103TA0400X%' or flattened_nucc_taxonomy_string like '%103TA0700X%' or flattened_nucc_taxonomy_string like '%103TB0200X%' or flattened_nucc_taxonomy_string like '%103TC0700X%' or flattened_nucc_taxonomy_string like '%103TC1900X%' or flattened_nucc_taxonomy_string like '%103TC2200X%' or flattened_nucc_taxonomy_string like '%103TE1000X%' or flattened_nucc_taxonomy_string like '%103TE1100X%' or flattened_nucc_taxonomy_string like '%103TF0000X%' or flattened_nucc_taxonomy_string like '%103TF0200X%' or flattened_nucc_taxonomy_string like '%103TH0004X%' or flattened_nucc_taxonomy_string like '%103TH0100X%' or flattened_nucc_taxonomy_string like '%103TM1700X%' or flattened_nucc_taxonomy_string like '%103TM1800X%' or flattened_nucc_taxonomy_string like '%103TP0016X%' or flattened_nucc_taxonomy_string like '%103TP0814X%' or flattened_nucc_taxonomy_string like '%103TP2700X%' or flattened_nucc_taxonomy_string like '%103TP2701X%' or flattened_nucc_taxonomy_string like '%103TR0400X%' or flattened_nucc_taxonomy_string like '%103TS0200X%' or flattened_nucc_taxonomy_string like '%103TW0100X%' or flattened_nucc_taxonomy_string like '%104100000X%' or flattened_nucc_taxonomy_string like '%1041C0700X%' or flattened_nucc_taxonomy_string like '%1041S0200X%' or flattened_nucc_taxonomy_string like '%106H00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_hospital = case when flattened_nucc_taxonomy_string like '%273100000X%' or flattened_nucc_taxonomy_string like '%273R00000X%' or flattened_nucc_taxonomy_string like '%273Y00000X%' or flattened_nucc_taxonomy_string like '%275N00000X%' or flattened_nucc_taxonomy_string like '%276400000X%' or flattened_nucc_taxonomy_string like '%281P00000X%' or flattened_nucc_taxonomy_string like '%281PC2000X%' or flattened_nucc_taxonomy_string like '%282E00000X%' or flattened_nucc_taxonomy_string like '%282J00000X%' or flattened_nucc_taxonomy_string like '%282N00000X%' or flattened_nucc_taxonomy_string like '%282NC0060X%' or flattened_nucc_taxonomy_string like '%282NC2000X%' or flattened_nucc_taxonomy_string like '%282NR1301X%' or flattened_nucc_taxonomy_string like '%282NW0100X%' or flattened_nucc_taxonomy_string like '%283Q00000X%' or flattened_nucc_taxonomy_string like '%283X00000X%' or flattened_nucc_taxonomy_string like '%283XC2000X%' or flattened_nucc_taxonomy_string like '%284300000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_laboratory = case when flattened_nucc_taxonomy_string like '%291900000X%' or flattened_nucc_taxonomy_string like '%291U00000X%' or flattened_nucc_taxonomy_string like '%292200000X%' or flattened_nucc_taxonomy_string like '%293D00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_managed_care_organization = case when flattened_nucc_taxonomy_string like '%302F00000X%' or flattened_nucc_taxonomy_string like '%302R00000X%' or flattened_nucc_taxonomy_string like '%305R00000X%' or flattened_nucc_taxonomy_string like '%305S00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_nursing_care_facility = case when flattened_nucc_taxonomy_string like '%310400000X%' or flattened_nucc_taxonomy_string like '%3104A0625X%' or flattened_nucc_taxonomy_string like '%3104A0630X%' or flattened_nucc_taxonomy_string like '%310500000X%' or flattened_nucc_taxonomy_string like '%311500000X%' or flattened_nucc_taxonomy_string like '%311Z00000X%' or flattened_nucc_taxonomy_string like '%311ZA0620X%' or flattened_nucc_taxonomy_string like '%313M00000X%' or flattened_nucc_taxonomy_string like '%314000000X%' or flattened_nucc_taxonomy_string like '%3140N1450X%' or flattened_nucc_taxonomy_string like '%315D00000X%' or flattened_nucc_taxonomy_string like '%315P00000X%' or flattened_nucc_taxonomy_string like '%317400000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_residential_treatment_facility = case when flattened_nucc_taxonomy_string like '%320600000X%' or flattened_nucc_taxonomy_string like '%320700000X%' or flattened_nucc_taxonomy_string like '%320800000X%' or flattened_nucc_taxonomy_string like '%320900000X%' or flattened_nucc_taxonomy_string like '%322D00000X%' or flattened_nucc_taxonomy_string like '%323P00000X%' or flattened_nucc_taxonomy_string like '%324500000X%' or flattened_nucc_taxonomy_string like '%3245S0500X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_student = case when flattened_nucc_taxonomy_string like '%390200000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_supplier = case when flattened_nucc_taxonomy_string like '%331L00000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_physician = case when flattened_nucc_taxonomy_string like '%202C00000X%' or flattened_nucc_taxonomy_string like '%202K00000X%' or flattened_nucc_taxonomy_string like '%204C00000X%' or flattened_nucc_taxonomy_string like '%204D00000X%' or flattened_nucc_taxonomy_string like '%204E00000X%' or flattened_nucc_taxonomy_string like '%204F00000X%' or flattened_nucc_taxonomy_string like '%204R00000X%' or flattened_nucc_taxonomy_string like '%207K00000X%' or flattened_nucc_taxonomy_string like '%207KA0200X%' or flattened_nucc_taxonomy_string like '%207KI0005X%' or flattened_nucc_taxonomy_string like '%207L00000X%' or flattened_nucc_taxonomy_string like '%207LA0401X%' or flattened_nucc_taxonomy_string like '%207LC0200X%' or flattened_nucc_taxonomy_string like '%207LH0002X%' or flattened_nucc_taxonomy_string like '%207LP2900X%' or flattened_nucc_taxonomy_string like '%207LP3000X%' or flattened_nucc_taxonomy_string like '%207N00000X%' or flattened_nucc_taxonomy_string like '%207ND0101X%' or flattened_nucc_taxonomy_string like '%207ND0900X%' or flattened_nucc_taxonomy_string like '%207NI0002X%' or flattened_nucc_taxonomy_string like '%207NP0225X%' or flattened_nucc_taxonomy_string like '%207NS0135X%' or flattened_nucc_taxonomy_string like '%207P00000X%' or flattened_nucc_taxonomy_string like '%207PE0004X%' or flattened_nucc_taxonomy_string like '%207PE0005X%' or flattened_nucc_taxonomy_string like '%207PH0002X%' or flattened_nucc_taxonomy_string like '%207PP0204X%' or flattened_nucc_taxonomy_string like '%207PS0010X%' or flattened_nucc_taxonomy_string like '%207PT0002X%' or flattened_nucc_taxonomy_string like '%207Q00000X%' or flattened_nucc_taxonomy_string like '%207QA0000X%' or flattened_nucc_taxonomy_string like '%207QA0401X%' or flattened_nucc_taxonomy_string like '%207QA0505X%' or flattened_nucc_taxonomy_string like '%207QB0002X%' or flattened_nucc_taxonomy_string like '%207QG0300X%' or flattened_nucc_taxonomy_string like '%207QH0002X%' or flattened_nucc_taxonomy_string like '%207QS0010X%' or flattened_nucc_taxonomy_string like '%207QS1201X%' or flattened_nucc_taxonomy_string like '%207R00000X%' or flattened_nucc_taxonomy_string like '%207RA0000X%' or flattened_nucc_taxonomy_string like '%207RA0201X%' or flattened_nucc_taxonomy_string like '%207RA0401X%' or flattened_nucc_taxonomy_string like '%207RB0002X%' or flattened_nucc_taxonomy_string like '%207RC0000X%' or flattened_nucc_taxonomy_string like '%207RC0001X%' or flattened_nucc_taxonomy_string like '%207RC0200X%' or flattened_nucc_taxonomy_string like '%207RE0101X%' or flattened_nucc_taxonomy_string like '%207RG0100X%' or flattened_nucc_taxonomy_string like '%207RG0300X%' or flattened_nucc_taxonomy_string like '%207RH0000X%' or flattened_nucc_taxonomy_string like '%207RH0002X%' or flattened_nucc_taxonomy_string like '%207RH0003X%' or flattened_nucc_taxonomy_string like '%207RH0005X%' or flattened_nucc_taxonomy_string like '%207RI0001X%' or flattened_nucc_taxonomy_string like '%207RI0008X%' or flattened_nucc_taxonomy_string like '%207RI0011X%' or flattened_nucc_taxonomy_string like '%207RI0200X%' or flattened_nucc_taxonomy_string like '%207RM1200X%' or flattened_nucc_taxonomy_string like '%207RN0300X%' or flattened_nucc_taxonomy_string like '%207RP1001X%' or flattened_nucc_taxonomy_string like '%207RR0500X%' or flattened_nucc_taxonomy_string like '%207RS0010X%' or flattened_nucc_taxonomy_string like '%207RS0012X%' or flattened_nucc_taxonomy_string like '%207RT0003X%' or flattened_nucc_taxonomy_string like '%207RX0202X%' or flattened_nucc_taxonomy_string like '%207SC0300X%' or flattened_nucc_taxonomy_string like '%207SG0201X%' or flattened_nucc_taxonomy_string like '%207SG0202X%' or flattened_nucc_taxonomy_string like '%207SG0203X%' or flattened_nucc_taxonomy_string like '%207SG0205X%' or flattened_nucc_taxonomy_string like '%207SM0001X%' or flattened_nucc_taxonomy_string like '%207T00000X%' or flattened_nucc_taxonomy_string like '%207U00000X%' or flattened_nucc_taxonomy_string like '%207UN0901X%' or flattened_nucc_taxonomy_string like '%207UN0902X%' or flattened_nucc_taxonomy_string like '%207UN0903X%' or flattened_nucc_taxonomy_string like '%207V00000X%' or flattened_nucc_taxonomy_string like '%207VB0002X%' or flattened_nucc_taxonomy_string like '%207VC0200X%' or flattened_nucc_taxonomy_string like '%207VE0102X%' or flattened_nucc_taxonomy_string like '%207VF0040X%' or flattened_nucc_taxonomy_string like '%207VG0400X%' or flattened_nucc_taxonomy_string like '%207VH0002X%' or flattened_nucc_taxonomy_string like '%207VM0101X%' or flattened_nucc_taxonomy_string like '%207VX0000X%' or flattened_nucc_taxonomy_string like '%207VX0201X%' or flattened_nucc_taxonomy_string like '%207W00000X%' or flattened_nucc_taxonomy_string like '%207X00000X%' or flattened_nucc_taxonomy_string like '%207XP3100X%' or flattened_nucc_taxonomy_string like '%207XS0106X%' or flattened_nucc_taxonomy_string like '%207XS0114X%' or flattened_nucc_taxonomy_string like '%207XS0117X%' or flattened_nucc_taxonomy_string like '%207XX0004X%' or flattened_nucc_taxonomy_string like '%207XX0005X%' or flattened_nucc_taxonomy_string like '%207XX0801X%' or flattened_nucc_taxonomy_string like '%207Y00000X%' or flattened_nucc_taxonomy_string like '%207YP0228X%' or flattened_nucc_taxonomy_string like '%207YS0012X%' or flattened_nucc_taxonomy_string like '%207YS0123X%' or flattened_nucc_taxonomy_string like '%207YX0007X%' or flattened_nucc_taxonomy_string like '%207YX0602X%' or flattened_nucc_taxonomy_string like '%207YX0901X%' or flattened_nucc_taxonomy_string like '%207YX0905X%' or flattened_nucc_taxonomy_string like '%207ZB0001X%' or flattened_nucc_taxonomy_string like '%207ZC0006X%' or flattened_nucc_taxonomy_string like '%207ZC0500X%' or flattened_nucc_taxonomy_string like '%207ZD0900X%' or flattened_nucc_taxonomy_string like '%207ZF0201X%' or flattened_nucc_taxonomy_string like '%207ZH0000X%' or flattened_nucc_taxonomy_string like '%207ZI0100X%' or flattened_nucc_taxonomy_string like '%207ZM0300X%' or flattened_nucc_taxonomy_string like '%207ZN0500X%' or flattened_nucc_taxonomy_string like '%207ZP0007X%' or flattened_nucc_taxonomy_string like '%207ZP0101X%' or flattened_nucc_taxonomy_string like '%207ZP0102X%' or flattened_nucc_taxonomy_string like '%207ZP0104X%' or flattened_nucc_taxonomy_string like '%207ZP0105X%' or flattened_nucc_taxonomy_string like '%207ZP0213X%' or flattened_nucc_taxonomy_string like '%208000000X%' or flattened_nucc_taxonomy_string like '%2080A0000X%' or flattened_nucc_taxonomy_string like '%2080C0008X%' or flattened_nucc_taxonomy_string like '%2080H0002X%' or flattened_nucc_taxonomy_string like '%2080I0007X%' or flattened_nucc_taxonomy_string like '%2080N0001X%' or flattened_nucc_taxonomy_string like '%2080P0006X%' or flattened_nucc_taxonomy_string like '%2080P0008X%' or flattened_nucc_taxonomy_string like '%2080P0201X%' or flattened_nucc_taxonomy_string like '%2080P0202X%' or flattened_nucc_taxonomy_string like '%2080P0203X%' or flattened_nucc_taxonomy_string like '%2080P0204X%' or flattened_nucc_taxonomy_string like '%2080P0205X%' or flattened_nucc_taxonomy_string like '%2080P0206X%' or flattened_nucc_taxonomy_string like '%2080P0207X%' or flattened_nucc_taxonomy_string like '%2080P0208X%' or flattened_nucc_taxonomy_string like '%2080P0210X%' or flattened_nucc_taxonomy_string like '%2080P0214X%' or flattened_nucc_taxonomy_string like '%2080P0216X%' or flattened_nucc_taxonomy_string like '%2080S0010X%' or flattened_nucc_taxonomy_string like '%2080S0012X%' or flattened_nucc_taxonomy_string like '%2080T0002X%' or flattened_nucc_taxonomy_string like '%2080T0004X%' or flattened_nucc_taxonomy_string like '%208100000X%' or flattened_nucc_taxonomy_string like '%2081H0002X%' or flattened_nucc_taxonomy_string like '%2081N0008X%' or flattened_nucc_taxonomy_string like '%2081P0004X%' or flattened_nucc_taxonomy_string like '%2081P0010X%' or flattened_nucc_taxonomy_string like '%2081P2900X%' or flattened_nucc_taxonomy_string like '%2081S0010X%' or flattened_nucc_taxonomy_string like '%208200000X%' or flattened_nucc_taxonomy_string like '%2082S0099X%' or flattened_nucc_taxonomy_string like '%2082S0105X%' or flattened_nucc_taxonomy_string like '%2083A0100X%' or flattened_nucc_taxonomy_string like '%2083P0011X%' or flattened_nucc_taxonomy_string like '%2083P0500X%' or flattened_nucc_taxonomy_string like '%2083P0901X%' or flattened_nucc_taxonomy_string like '%2083S0010X%' or flattened_nucc_taxonomy_string like '%2083T0002X%' or flattened_nucc_taxonomy_string like '%2083X0100X%' or flattened_nucc_taxonomy_string like '%2084A0401X%' or flattened_nucc_taxonomy_string like '%2084B0002X%' or flattened_nucc_taxonomy_string like '%2084B0040X%' or flattened_nucc_taxonomy_string like '%2084D0003X%' or flattened_nucc_taxonomy_string like '%2084F0202X%' or flattened_nucc_taxonomy_string like '%2084H0002X%' or flattened_nucc_taxonomy_string like '%2084N0008X%' or flattened_nucc_taxonomy_string like '%2084N0400X%' or flattened_nucc_taxonomy_string like '%2084N0402X%' or flattened_nucc_taxonomy_string like '%2084N0600X%' or flattened_nucc_taxonomy_string like '%2084P0005X%' or flattened_nucc_taxonomy_string like '%2084P0015X%' or flattened_nucc_taxonomy_string like '%2084P0800X%' or flattened_nucc_taxonomy_string like '%2084P0802X%' or flattened_nucc_taxonomy_string like '%2084P0804X%' or flattened_nucc_taxonomy_string like '%2084P0805X%' or flattened_nucc_taxonomy_string like '%2084P2900X%' or flattened_nucc_taxonomy_string like '%2084S0010X%' or flattened_nucc_taxonomy_string like '%2084S0012X%' or flattened_nucc_taxonomy_string like '%2084V0102X%' or flattened_nucc_taxonomy_string like '%2085B0100X%' or flattened_nucc_taxonomy_string like '%2085D0003X%' or flattened_nucc_taxonomy_string like '%2085H0002X%' or flattened_nucc_taxonomy_string like '%2085N0700X%' or flattened_nucc_taxonomy_string like '%2085N0904X%' or flattened_nucc_taxonomy_string like '%2085P0229X%' or flattened_nucc_taxonomy_string like '%2085R0001X%' or flattened_nucc_taxonomy_string like '%2085R0202X%' or flattened_nucc_taxonomy_string like '%2085R0203X%' or flattened_nucc_taxonomy_string like '%2085R0204X%' or flattened_nucc_taxonomy_string like '%2085R0205X%' or flattened_nucc_taxonomy_string like '%2085U0001X%' or flattened_nucc_taxonomy_string like '%208600000X%' or flattened_nucc_taxonomy_string like '%2086H0002X%' or flattened_nucc_taxonomy_string like '%2086S0102X%' or flattened_nucc_taxonomy_string like '%2086S0105X%' or flattened_nucc_taxonomy_string like '%2086S0120X%' or flattened_nucc_taxonomy_string like '%2086S0122X%' or flattened_nucc_taxonomy_string like '%2086S0127X%' or flattened_nucc_taxonomy_string like '%2086S0129X%' or flattened_nucc_taxonomy_string like '%2086X0206X%' or flattened_nucc_taxonomy_string like '%208800000X%' or flattened_nucc_taxonomy_string like '%2088F0040X%' or flattened_nucc_taxonomy_string like '%2088P0231X%' or flattened_nucc_taxonomy_string like '%208C00000X%' or flattened_nucc_taxonomy_string like '%208D00000X%' or flattened_nucc_taxonomy_string like '%208G00000X%' or flattened_nucc_taxonomy_string like '%208M00000X%' or flattened_nucc_taxonomy_string like '%208U00000X%' or flattened_nucc_taxonomy_string like '%208VP0000X%' or flattened_nucc_taxonomy_string like '%208VP0014X%' or flattened_nucc_taxonomy_string like '%209800000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_addiction_medicine = case when flattened_nucc_taxonomy_string like '%207RA0401X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_bariatric_medicine = case when flattened_nucc_taxonomy_string like '%207RB0002X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_body_imaging = case when flattened_nucc_taxonomy_string like '%2085B0100X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_cardiovascular_disease = case when flattened_nucc_taxonomy_string like '%207RC0000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_and_laboratory_immunology = case when flattened_nucc_taxonomy_string like '%207RI0001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_biochemical_genetics = case when flattened_nucc_taxonomy_string like '%207SG0202X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_cardiac_electrophysiology = case when flattened_nucc_taxonomy_string like '%207RC0001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_cytogenetic = case when flattened_nucc_taxonomy_string like '%207SC0300X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_genetics_md = case when flattened_nucc_taxonomy_string like '%207SG0201X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_clinical_molecular_genetics = case when flattened_nucc_taxonomy_string like '%207SG0203X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_critical_care_medicine = case when flattened_nucc_taxonomy_string like '%207RC0200X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_dermatopathology = case when flattened_nucc_taxonomy_string like '%207ND0900X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_diagnostic_neuroimaging = case when flattened_nucc_taxonomy_string like '%2085D0003X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_diagnostic_radiology = case when flattened_nucc_taxonomy_string like '%2085R0202X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_diagnostic_ultrasound = case when flattened_nucc_taxonomy_string like '%2085U0001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_endocrinology_diabetes_and_metabolism = case when flattened_nucc_taxonomy_string like '%207RE0101X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_endodontics = case when flattened_nucc_taxonomy_string like '%1223E0200X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_gastroenterology = case when flattened_nucc_taxonomy_string like '%207RG0100X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_geriatric_medicine = case when flattened_nucc_taxonomy_string like '%207RG0300X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_hematology = case when flattened_nucc_taxonomy_string like '%207RH0000X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_hematology_and_oncology = case when flattened_nucc_taxonomy_string like '%207RH0003X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_hepatology = case when flattened_nucc_taxonomy_string like '%207RI0008X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_hospice_and_palliative_medicine = case when flattened_nucc_taxonomy_string like '%207RH0002X%' or flattened_nucc_taxonomy_string like '%2085H0002X%' or flattened_nucc_taxonomy_string like '%2086H0002X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_hypertension_specialist = case when flattened_nucc_taxonomy_string like '%207RH0005X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_infectious_disease = case when flattened_nucc_taxonomy_string like '%207RI0200X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_interventional_cardiology = case when flattened_nucc_taxonomy_string like '%207RI0011X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_interventional_pain_medicine = case when flattened_nucc_taxonomy_string like '%208VP0014X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_mohsmicrographic_surgery = case when flattened_nucc_taxonomy_string like '%207ND0101X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_magnetic_resonance_imaging_mri = case when flattened_nucc_taxonomy_string like '%207RM1200X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_medical_oncology = case when flattened_nucc_taxonomy_string like '%207RX0202X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_molecular_genetic_pathology = case when flattened_nucc_taxonomy_string like '%207SM0001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_nephrology = case when flattened_nucc_taxonomy_string like '%207RN0300X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_neurology = case when flattened_nucc_taxonomy_string like '%2084N0400X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_neuroradiology = case when flattened_nucc_taxonomy_string like '%2085N0700X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_nuclear_radiology = case when flattened_nucc_taxonomy_string like '%2085N0904X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_oral_and_maxillofacial_pathology = case when flattened_nucc_taxonomy_string like '%1223P0106X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_oral_and_maxillofacial_radiology = case when flattened_nucc_taxonomy_string like '%1223X0008X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_oral_and_maxillofacial_surgery = case when flattened_nucc_taxonomy_string like '%1223S0112X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_orthodontics_and_dentofacial_orthopedics = case when flattened_nucc_taxonomy_string like '%1223X0400X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pediatric_dentistry = case when flattened_nucc_taxonomy_string like '%1223P0221X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pediatric_radiology = case when flattened_nucc_taxonomy_string like '%2085P0229X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pediatric_surgery = case when flattened_nucc_taxonomy_string like '%2086S0120X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_periodontics = case when flattened_nucc_taxonomy_string like '%1223P0300X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_phd_medical_genetics = case when flattened_nucc_taxonomy_string like '%207SG0205X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_plastic_and_reconstructive_surgery = case when flattened_nucc_taxonomy_string like '%2086S0122X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_prosthodontics = case when flattened_nucc_taxonomy_string like '%1223P0700X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_psychiatry = case when flattened_nucc_taxonomy_string like '%2084P0800X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_pulmonary_disease = case when flattened_nucc_taxonomy_string like '%207RP1001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_radiation_oncology = case when flattened_nucc_taxonomy_string like '%2085R0001X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_radiological_physics = case when flattened_nucc_taxonomy_string like '%2085R0205X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_rheumatology = case when flattened_nucc_taxonomy_string like '%207RR0500X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_sleep_medicine = case when flattened_nucc_taxonomy_string like '%207RS0012X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_sports_medicine = case when flattened_nucc_taxonomy_string like '%207RS0010X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_surgery_of_the_hand = case when flattened_nucc_taxonomy_string like '%2086S0105X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_surgical_critical_care = case when flattened_nucc_taxonomy_string like '%2086S0102X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_surgical_oncology = case when flattened_nucc_taxonomy_string like '%2086X0206X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_therapeutic_radiology = case when flattened_nucc_taxonomy_string like '%2085R0203X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_transplant_hepatology = case when flattened_nucc_taxonomy_string like '%207RT0003X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_trauma_surgery = case when flattened_nucc_taxonomy_string like '%2086S0127X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_vascular_and_interventional_radiology = case when flattened_nucc_taxonomy_string like '%2085R0204X%' then TRUE else FALSE end;
update "NPPES_provider_nucc_taxonomy" set is_vascular_surgery = case when flattened_nucc_taxonomy_string like '%2086S0129X%' then TRUE else FALSE end;
 
select * from "NPPES_provider_nucc_taxonomy" where is_ambulance = 1;
 
 /* Summary views */

drop table if exists "t1_NPPES_summary_detailed";
create table "t1_NPPES_summary_detailed" as
  select nh1."NPI", nh1."Provider_Business_Practice_Location_Address_State_Name" as state,
    left(nh1."Provider_Business_Practice_Location_Address_Postal_Code", 5) as zip, 
    nh1."Provider_Business_Practice_Location_Address_City_Name" as city,
    nh1."Is_Sole_Proprietor" as sole_provider,
    nh1."Provider_Gender_Code" as gender_code,
    replace(nh1."Provider_Credential_Text",'.','') as credential,
    case
      when nh1."Provider_Organization_Name_Legal_Business_Name" is not null then nh1."Provider_Organization_Name_Legal_Business_Name"
      when nh1."Provider_Last_Name_Legal_Name" is null then null
      else concat(rtrim(nh1."Provider_Last_Name_Legal_Name"),', ',rtrim(nh1."Provider_First_Name"),' ',
     case when nh1."Provider_Credential_Text" is null then '' else replace(nh1."Provider_Credential_Text",'.','') end)
     end as provider_name
   from "NPPES_header" nh1;
   
 create unique index pk_nppes_summary_detailed on "t1_NPPES_summary_detailed"("NPI");
 
