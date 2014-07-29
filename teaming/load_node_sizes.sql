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