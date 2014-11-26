/* Load the 2012-2013 Teaming Data with new fields into a database */

use teaming;

/* Create table for the current teaming data */

drop table if exists teaming_graph_providers_2012_2013;
create table teaming_graph_providers_2012_2013
    (npi_from char(10),
     npi_to char(10),
     shared_transaction_count integer,
     patient_total integer,
     same_day_total integer);

/* C:\\[optional user directory]\CMS_teaming\data\physician-referrals-2012-2013-days30\Physician-Referrals-2012-2013-days30.txt */

LOAD DATA LOCAL INFILE 'C:\\Users\\Janos\\cms_teaming\\data\\Physician-Referrals-2012-2013-DAYS30\\Physician-Referrals-2012-2013-days30.txt' INTO TABLE teaming_graph_providers_2012_2013
      FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\0'
      LINES TERMINATED BY '\n'
       (@npi_from, @npi_to, @shared_transaction_count, @patient_total, @same_day_total)
       set
       npi_from = case @npi_from when '' then NULL else @npi_from end,
       npi_to = case @npi_to when '' then NULL else @npi_to end,
       shared_transaction_count = case @shared_transaction_count when '' then NULL else @shared_transaction_count end,
       patient_total = case @patient_total when '' then NULL else @patient_total end,
       same_day_total = case @same_day_total when '' then NULL else @same_day_total end;
       
 create index idx_dg_30_13_npi_from on teaming_graph_providers_2012_2013(npi_from);
 create index idx_dg_30_13_npi_to on teaming_graph_providers_2012_2013(npi_to);
        