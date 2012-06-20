
DROP TABLE IF EXISTS finance.credit;
CREATE TABLE finance.credit (
    id integer,
    "90dayslate" integer,
    revolve_util double precision,
    debt_ratio double precision,
    credit_lines integer,
    income double precision,
    "30dayslate" integer,
    delinquent integer
);

DROP TABLE IF EXISTS finance.demographics;
CREATE TABLE finance.demographics (
    id integer,
    name text,
    age integer,
    num_dep integer,
    edu integer
);

COPY finance.credit FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/finance/credit-delinquency/credit.csv' WITH DELIMITER ',' HEADER CSV;
COPY finance.demographics FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/finance/credit-delinquency/demographics.csv' WITH DELIMITER ',' HEADER CSV;

