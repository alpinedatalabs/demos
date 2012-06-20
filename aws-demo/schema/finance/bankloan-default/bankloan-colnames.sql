--------------------------------------------------------

--  DDL for Table BANKLOAN_DEFAULT

--------------------------------------------------------
DROP TABLE IF EXISTS finance."BANKLOAN_DEFAULT2";
  CREATE TABLE finance."BANKLOAN_DEFAULT2" 
   (	
    "age" numeric, 
	"edu_level" text, 
	"cur_employ_length" integer, 
	"cur_residence_length" integer, 
	"income_ths" numeric, 
	"debt_inc_ratio" numeric, 
	"cc_debt" numeric, 
	"other_debt" numeric, 
	"defaulted" varchar(5)
   );

COPY finance."BANKLOAN_DEFAULT2" FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/finance/bankloan-default/nullbankloan_default.csv' WITH DELIMITER ',' HEADER CSV;
