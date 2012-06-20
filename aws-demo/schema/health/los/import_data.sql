-- Table: drg_lookup

DROP TABLE IF EXISTS health.drg_lookup;

CREATE TABLE health.drg_lookup
(
  "REIMBDRG" numeric(38,0) NOT NULL,
  "MDC" character varying(10),
  "DRG_TYPE" character varying(10),
  "DRG_DESC" character varying(125),
  "RELATIVE_WEIGHTS" numeric(18,0),
  "GEOMETRIC_MEAN_LOS" numeric(4,0),
  "ARITHMETIC_MEAN_LOS" numeric(4,0),
  "SERVICE_CATEGORY" numeric(38,0),
  CONSTRAINT "REIMBDRG" PRIMARY KEY ("REIMBDRG")
)
WITH (
  OIDS=FALSE
);

-- Table: patientdata

DROP TABLE IF EXISTS health.patientdata;

CREATE TABLE health.patientdata
(
  recordid numeric(38,0) NOT NULL,
  recordcount numeric(38,0),
  "interval" numeric(38,0),
  patientsex character varying(1),
  age integer,
  patientrace character varying(2),
  patientethnicity character varying(2),
  patientdisposition character varying(100),
  lengthofstay numeric(38,0),
  admittype character varying(26),
  admitsource character varying(1),
  hospitalid character varying(3),
  regionid character varying(2),
  other_diag_code character varying(100),
  placecode character varying(25),
  reimbdrg integer,
  reimbmdc integer,
  accomcharges numeric(10,0),
  ancilcharges numeric(10,0),
  totalcharges numeric(10,0),
  servclass character varying(26),
  residenceind character varying(5),
  emergencydeptind character varying(1),
  potamb numeric(10,0),
  complicationminor numeric(38,0),
  complicationsever numeric(38,0),
  traumaminor numeric(38,0),
  traumasevere numeric(38,0),
  traumaseverity numeric(38,0),
  nosocomialinf numeric(38,0),
  severity numeric(38,0),
  costweight numeric(4,0),
  otherdxcode1_4280 character varying(26),
  flag_othdxcode_4280 numeric(38,0),
  CONSTRAINT "RECORDID" PRIMARY KEY (recordid)
)
WITH (
  OIDS=FALSE
);

COPY health.patientdata FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/health/los/patientdata.txt' WITH DELIMITER ',' CSV;

COPY health.drg_lookup FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/health/los/drg_lookup.txt' WITH DELIMITER ',' CSV;
