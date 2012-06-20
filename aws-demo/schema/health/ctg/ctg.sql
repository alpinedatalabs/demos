DROP TABLE IF EXISTS health.ctg;
CREATE TABLE health.ctg (
ID integer,
heart_rate integer,
accel_sec numeric,
movement_sec numeric,
ut_contract numeric,
light_decel numeric,
severe_decel numeric,
prolong_decel numeric,
ASTV integer,
MSTV numeric,
ALTV integer,
MLTV numeric,
Width integer,
Min integer,
Max integer,
Nmax integer,
Nzeros integer,
Mode integer,
Mean integer,
Median integer,
Variance integer,
Tendency integer,
CLASS integer,
status  varchar(10)
);

COPY health.ctg FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/health/ctg/CTG.csv' WITH DELIMITER ',' HEADER CSV;
