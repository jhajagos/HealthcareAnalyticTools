/* Load the 2015 Teaming Data with new fields into a database */

use teaming;

/* Create table for the current teaming data */

drop table if exists teaming_graph_providers_2015_30;
create table teaming_graph_providers_2015_30
    (npi_from char(10),
     npi_to char(10),
     shared_transaction_count integer,
     patient_total integer,
     same_day_total integer);

/* C:\\[optional user directory]\CMS_teaming\data\physician-referrals-2012-2013-days30\Physician-Referrals-2012-2013-days30.txt */

LOAD DATA INFILE '/data/flat/physician-shared-patient-patterns-2015-days30.txt' INTO TABLE teaming_graph_providers_2015_30
      FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\0'
      LINES TERMINATED BY '\n'
       (@npi_from, @npi_to, @shared_transaction_count, @patient_total, @same_day_total)
       set
       npi_from = case @npi_from when '' then NULL else @npi_from end,
       npi_to = case @npi_to when '' then NULL else @npi_to end,
       shared_transaction_count = case @shared_transaction_count when '' then NULL else @shared_transaction_count end,
       patient_total = case @patient_total when '' then NULL else @patient_total end,
       same_day_total = case @same_day_total when '' then NULL else @same_day_total end;
       
 create index idx_dg_30_13_npi_from on teaming_graph_providers_2015_30(npi_from);
 create index idx_dg_30_13_npi_to on teaming_graph_providers_2015_30(npi_to);

        
drop table if exists teaming_graph_providers_2015_60;
create table teaming_graph_providers_2015_60
    (npi_from char(10),
     npi_to char(10),
     shared_transaction_count integer,
     patient_total integer,
     same_day_total integer);

/* C:\\[optional user directory]\CMS_teaming\data\physician-referrals-2012-2013-days30\Physician-Referrals-2012-2013-days30.txt */

LOAD DATA INFILE '/data/flat/physician-shared-patient-patterns-2015-days60.txt' INTO TABLE teaming_graph_providers_2015_60
      FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\0'
      LINES TERMINATED BY '\n'
       (@npi_from, @npi_to, @shared_transaction_count, @patient_total, @same_day_total)
       set
       npi_from = case @npi_from when '' then NULL else @npi_from end,
       npi_to = case @npi_to when '' then NULL else @npi_to end,
       shared_transaction_count = case @shared_transaction_count when '' then NULL else @shared_transaction_count end,
       patient_total = case @patient_total when '' then NULL else @patient_total end,
       same_day_total = case @same_day_total when '' then NULL else @same_day_total end;
       
 create index idx_dg_60_13_npi_from on teaming_graph_providers_2015_60(npi_from);
 create index idx_dg_60_13_npi_to on teaming_graph_providers_2015_60(npi_to);
 
drop table if exists teaming_graph_providers_2015_90;
create table teaming_graph_providers_2015_90
    (npi_from char(10),
     npi_to char(10),
     shared_transaction_count integer,
     patient_total integer,
     same_day_total integer);

/* C:\\[optional user directory]\CMS_teaming\data\physician-referrals-2012-2013-days30\Physician-Referrals-2012-2013-days30.txt */

LOAD DATA INFILE '/data/flat/physician-shared-patient-patterns-2015-days90.txt' INTO TABLE teaming_graph_providers_2015_90
      FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\0'
      LINES TERMINATED BY '\n'
       (@npi_from, @npi_to, @shared_transaction_count, @patient_total, @same_day_total)
       set
       npi_from = case @npi_from when '' then NULL else @npi_from end,
       npi_to = case @npi_to when '' then NULL else @npi_to end,
       shared_transaction_count = case @shared_transaction_count when '' then NULL else @shared_transaction_count end,
       patient_total = case @patient_total when '' then NULL else @patient_total end,
       same_day_total = case @same_day_total when '' then NULL else @same_day_total end;
       
 create index idx_dg_90_13_npi_from on teaming_graph_providers_2015_90(npi_from);
 create index idx_dg_90_13_npi_to on teaming_graph_providers_2015_90(npi_to);

drop table if exists teaming_graph_providers_2015_180;
create table teaming_graph_providers_2015_180
    (npi_from char(10),
     npi_to char(10),
     shared_transaction_count integer,
     patient_total integer,
     same_day_total integer);

/* C:\\[optional user directory]\CMS_teaming\data\physician-referrals-2012-2013-days30\Physician-Referrals-2012-2013-days30.txt */

LOAD DATA INFILE '/data/flat/physician-shared-patient-patterns-2015-days180.txt' INTO TABLE teaming_graph_providers_2015_180
      FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\0'
      LINES TERMINATED BY '\n'
       (@npi_from, @npi_to, @shared_transaction_count, @patient_total, @same_day_total)
       set
       npi_from = case @npi_from when '' then NULL else @npi_from end,
       npi_to = case @npi_to when '' then NULL else @npi_to end,
       shared_transaction_count = case @shared_transaction_count when '' then NULL else @shared_transaction_count end,
       patient_total = case @patient_total when '' then NULL else @patient_total end,
       same_day_total = case @same_day_total when '' then NULL else @same_day_total end;
       
 create index idx_dg_180_13_npi_from on teaming_graph_providers_2015_180(npi_from);
 create index idx_dg_180_13_npi_to on teaming_graph_providers_2015_180(npi_to);


