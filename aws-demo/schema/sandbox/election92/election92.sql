DROP TABLE IF EXISTS sandbox.election92;

CREATE TABLE sandbox.election92
(
   county VARCHAR(64) NOT NULL,
   state CHAR(2) NOT NULL,
   msa INT,
   pmsa INT,
   popdensity INT NOT NULL,
   pop INT NOT NULL,
   popchange FLOAT NOT NULL,
   age6574 FLOAT NOT NULL,
   age75 FLOAT NOT NULL,
   crime INT NOT NULL,
   college FLOAT NOT NULL,
   income INT NOT NULL,
   farm FLOAT NOT NULL,
   democrat FLOAT,
   republican FLOAT,
   perot FLOAT,
   white FLOAT NOT NULL,
   black FLOAT NOT NULL,
   turnout FLOAT NOT NULL
);

COPY sandbox.election92 FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/sandbox/election92/election92.csv' WITH CSV HEADER;