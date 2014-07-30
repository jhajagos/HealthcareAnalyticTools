drop table if exists `npi_part_b_billing_2012`;

CREATE TABLE `npi_part_b_billing_2012` (
  `npi` varchar(10) DEFAULT NULL,
  `nppes_provider_last_org_name` varchar(70) DEFAULT NULL,
  `nppes_provider_first_name` varchar(20) DEFAULT NULL,
  `nppes_provider_mi` varchar(1) DEFAULT NULL,
  `nppes_credentials` varchar(20) DEFAULT NULL,
  `nppes_provider_gender` varchar(1) DEFAULT NULL,
  `nppes_entity_code` varchar(1) DEFAULT NULL,
  `nppes_provider_street1` varchar(55) DEFAULT NULL,
  `nppes_provider_street2` varchar(55) DEFAULT NULL,
  `nppes_provider_city` varchar(28) DEFAULT NULL,
  `nppes_provider_zip` varchar(13) DEFAULT NULL,
  `nppes_provider_state` varchar(2) DEFAULT NULL,
  `nppes_provider_country` varchar(2) DEFAULT NULL,
  `provider_type` varchar(43) DEFAULT NULL,
  `medicare_participation_indicator` varchar(1) DEFAULT NULL,
  `place_of_service` varchar(1) DEFAULT NULL,
  `hcpcs_code` varchar(5) DEFAULT NULL,
  `hcpcs_description` varchar(28) DEFAULT NULL,
  `line_srvc_cnt` float DEFAULT NULL,
  `bene_unique_cnt` int(11) DEFAULT NULL,
  `bene_day_srvc_cnt` int(11) DEFAULT NULL,
  `average_Medicare_allowed_amt` float DEFAULT NULL,
  `stdev_Medicare_allowed_amt` float DEFAULT NULL,
  `average_submitted_chrg_amt` float DEFAULT NULL,
  `stdev_submitted_chrg_amt` float DEFAULT NULL,
  `average_Medicare_payment_amt` float DEFAULT NULL,
  `stdev_Medicare_payment_amt` float DEFAULT NULL
) engine = innodb;


LOAD DATA  INFILE '/tmp/Medicare-Physician-and-Other-Supplier-PUF-CY2012.txt' INTO TABLE `npi_part_b_billing_2012`
      FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '\0'
      LINES TERMINATED BY '\n' IGNORE 2 LINES
       (@npi, @nppes_provider_last_org_name, @nppes_provider_first_name, @nppes_provider_mi, @nppes_credentials, @nppes_provider_gender, @nppes_entity_code, @nppes_provider_street1, @nppes_provider_street2, @nppes_provider_city, @nppes_provider_zip, @nppes_provider_state, @nppes_provider_country, @provider_type, @medicare_participation_indicator, @place_of_service, @hcpcs_code, @hcpcs_description, @line_srvc_cnt, @bene_unique_cnt, @bene_day_srvc_cnt, @average_Medicare_allowed_amt, @stdev_Medicare_allowed_amt, @average_submitted_chrg_amt, @stdev_submitted_chrg_amt, @average_Medicare_payment_amt, @stdev_Medicare_payment_amt)
       set
    npi = case when @npi = '' then NULL else @npi end,
nppes_provider_last_org_name = case when @nppes_provider_last_org_name = '' then NULL else @nppes_provider_last_org_name end,
nppes_provider_first_name = case when @nppes_provider_first_name = '' then NULL else @nppes_provider_first_name end,
nppes_provider_mi = case when @nppes_provider_mi = '' then NULL else @nppes_provider_mi end,
nppes_credentials = case when @nppes_credentials = '' then NULL else @nppes_credentials end,
nppes_provider_gender = case when @nppes_provider_gender = '' then NULL else @nppes_provider_gender end,
nppes_entity_code = case when @nppes_entity_code = '' then NULL else @nppes_entity_code end,
nppes_provider_street1 = case when @nppes_provider_street1 = '' then NULL else @nppes_provider_street1 end,
nppes_provider_street2 = case when @nppes_provider_street2 = '' then NULL else @nppes_provider_street2 end,
nppes_provider_city = case when @nppes_provider_city = '' then NULL else @nppes_provider_city end,
nppes_provider_zip = case when @nppes_provider_zip = '' then NULL else @nppes_provider_zip end,
nppes_provider_state = case when @nppes_provider_state = '' then NULL else @nppes_provider_state end,
nppes_provider_country = case when @nppes_provider_country = '' then NULL else @nppes_provider_country end,
provider_type = case when @provider_type = '' then NULL else @provider_type end,
medicare_participation_indicator = case when @medicare_participation_indicator = '' then NULL else @medicare_participation_indicator end,
place_of_service = case when @place_of_service = '' then NULL else @place_of_service end,
hcpcs_code = case when @hcpcs_code = '' then NULL else @hcpcs_code end,
hcpcs_description = case when @hcpcs_description = '' then NULL else @hcpcs_description end,
line_srvc_cnt = case when @line_srvc_cnt = '' then NULL else @line_srvc_cnt end,
bene_unique_cnt = case when @bene_unique_cnt = '' then NULL else @bene_unique_cnt end,
bene_day_srvc_cnt = case when @bene_day_srvc_cnt = '' then NULL else @bene_day_srvc_cnt end,
average_Medicare_allowed_amt = case when @average_Medicare_allowed_amt = '' then NULL else @average_Medicare_allowed_amt end,
stdev_Medicare_allowed_amt = case when @stdev_Medicare_allowed_amt = '' then NULL else @stdev_Medicare_allowed_amt end,
average_submitted_chrg_amt = case when @average_submitted_chrg_amt = '' then NULL else @average_submitted_chrg_amt end,
stdev_submitted_chrg_amt = case when @stdev_submitted_chrg_amt = '' then NULL else @stdev_submitted_chrg_amt end,
average_Medicare_payment_amt = case when @average_Medicare_payment_amt = '' then NULL else @average_Medicare_payment_amt end,
stdev_Medicare_payment_amt = case when @stdev_Medicare_payment_amt = '' then NULL else @stdev_Medicare_payment_amt end;

create index idx_npbb12_npi on npi_part_b_billing_2012(npi);

create table condensed_npi_part_b_billing_2012 as 
  select npi, count(*) as distinct_hcpcs_code_count, min(bene_unique_cnt) as min_medicare_count, max(bene_unique_cnt) as max_medicare_member_count, 
    sum(bene_unique_cnt) as sum_non_unique_medicare_member_count, sum(average_Medicare_payment_amt * line_srvc_cnt) as total_payment_amount
    from npi_part_b_billing_2012 group by npi;
    
  
create index idx_cnpbb12_npi on condensed_npi_part_b_billing_2012(npi);  

drop table if exists tmp_npi_summary_detailed_primary_taxonomy_with_weights; 
create table tmp_npi_summary_detailed_primary_taxonomy_with_weights as
  select nsdpt.*, cnpbb.distinct_hcpcs_code_count, cnpbb.min_medicare_count, cnpbb.max_medicare_member_count, cnpbb.sum_non_unique_medicare_member_count, cnpbb.total_payment_amount from npi_summary_detailed_primary_taxonomy nsdpt
    left outer join condensed_npi_part_b_billing_2012 cnpbb on cnpbb.npi = nsdpt.npi;
    
    
insert into npi_summary_detailed_primary_taxonomy_with_weights
  select * FROM tmp_npi_summary_detailed_primary_taxonomy_with_weights;

create table npi_summary_detailed_primary_taxonomy_with_weights as 
  select * from tmp_npi_summary_detailed_primary_taxonomy_with_weights;
  
create index idx_nsdptww_npi on npi_summary_detailed_primary_taxonomy_with_weights(npi);  

drop view if exists NPI_Summary_Taxonomy_Indicators_With_Weights;
CREATE VIEW NPI_Summary_Taxonomy_Indicators_With_Weights
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
          is_hematology_and_oncology, distinct_hcpcs_code_count, min_medicare_count, max_medicare_member_count, total_payment_amount
     FROM npi_summary_detailed_primary_taxonomy_with_weights nsdptww;
     
