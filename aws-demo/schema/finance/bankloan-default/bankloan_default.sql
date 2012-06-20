--------------------------------------------------------

--  DDL for Table BANKLOAN_DEFAULT

--------------------------------------------------------
DROP TABLE IF EXISTS finance."BANKLOAN_DEFAULT";
  CREATE TABLE finance."BANKLOAN_DEFAULT" 
   (	
    "AGE_IN_YEARS" numeric, 
	"LEVEL_OF_EDUCATION" text, 
	"YEARS_WITH_CURRENT_EMPLOYER" integer, 
	"YEARS_AT_CURRENT_ADDRESS" integer, 
	"HOUSEHOLD_INCOME_IN_THOUSANDS" numeric, 
	"DEBT_TO_INCOME_RATIO" numeric, 
	"CREDIT_CARD_DEBT_IN_THOUSANDS" numeric, 
	"OTHER_DEBT_IN_THOUSANDS" numeric, 
	"PREVIOUSLY_DEFAULTED" varchar(5)
   );

COPY finance."BANKLOAN_DEFAULT" FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/finance/bankloan-default/nullbankloan_default.csv' WITH DELIMITER ',' HEADER CSV;
