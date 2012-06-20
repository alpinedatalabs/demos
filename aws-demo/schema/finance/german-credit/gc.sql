--
-- Name: german_credit_rating; Type: TABLE; Schema: public; Owner: support; Tablespace: 
--
DROP TABLE IF EXISTS finance.german_credit_rating;
CREATE TABLE finance.german_credit_rating (
    status_checking text,
    duration integer,
    credit_history text,
    purpose text,
    amount integer,
    savings_account text,
    curr_emp_length text,
    installment_rate integer,
    gender_marriage text,
    guarantors text,
    curr_res_length integer,
    property text,
    age integer,
    other_inst_plans text,
    housing text,
    existing_credit integer,
    job text,
    maintenance integer,
    telephone text,
    foreign_worker text,
    good integer
);

COPY finance.german_credit_rating FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/finance/german-credit/german.data.csv' WITH DELIMITER ',' HEADER CSV;

