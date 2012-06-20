

--
-- Name: titanic; 
--
DROP TABLE IF EXISTS sandbox.titanic;

CREATE TABLE sandbox.titanic (
    pclass integer,
    survived integer,
    sex text,
    age double precision,
    sibsp integer,
    parch integer,
    ticket text,
    fare double precision,
    cabin text,
    embarked text,
    boat text,
    body integer
);

COPY sandbox.titanic FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/sandbox/titanic/titanicdemo.csv' WITH DELIMITER ',' HEADER CSV;