/**
 * Generates a random number with a pseudo-normal distribution
**/
CREATE OR REPLACE FUNCTION normal_rand() RETURNS FLOAT AS
$$
   SELECT RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() + RANDOM() - 3
$$
LANGUAGE SQL;

/**
 * Median income by zipcode
**/

DROP TABLE IF EXISTS finance.zip_income;

CREATE TABLE finance.zip_income
(
   mdn_income INT,
   zipcode CHAR(5) PRIMARY KEY
) DISTRIBUTED BY (zipcode);

COPY finance.zip_income FROM '/PATH_TO_AWS_DEMO/aws-demo/schema/finance/account-churn/income99.csv' WITH CSV HEADER;

/**
 * Active customer accounts and recently retired accounts
**/

DROP TABLE IF EXISTS finance.accounts;

CREATE TABLE finance.accounts
(
   acct_id INT PRIMARY KEY,
   acct_type VARCHAR(16) NOT NULL,
   acct_status CHAR(1) NOT NULL,
   credit SMALLINT,
   zipcode CHAR(5)
) DISTRIBUTED BY (acct_id);

DROP TABLE IF EXISTS finance.account_statements;

/**
 * The most recent statements for all accounts
**/

CREATE TABLE finance.account_statements
(
   acct_id INT NOT NULL,
   statement_date DATE NOT NULL,
   balance INT NOT NULL
) DISTRIBUTED BY (acct_id);

/**
 * Generate account data.
 * Credit score is normally distributed from 550 to 850.
**/

INSERT INTO finance.accounts
SELECT
   row_number() over (),
   CASE
--      WHEN RANDOM() < 0.1 THEN 'Platinum'
--      WHEN RANDOM() < 0.2 THEN 'Gold'
      WHEN RANDOM() < 0.4 THEN 'Silver'
      ELSE 'Standard'
   END,
   'A',
   700 + normal_rand() * 50,
   zipcode
FROM
   finance.zip_income, generate_series(1,1)
WHERE
   mdn_income > 0 AND RANDOM() < 0.5;

/**
 * Generate account statements for the last twelve months.
 * We divide everyone into classes based on the account ID modulo 5 and 7.
 * The account ID modulo 5 governs the average account balance for the year.
 * The account ID modulo 7 governs the monthly variation from the average.
**/


INSERT INTO finance.account_statements
SELECT
   acct_id,
   current_date - 30 * generate_series(1, 12),
   (50 + 30 * (MOD(acct_id, 5) + 1)) * (1 + (MOD(acct_id, 7) + 1) * normal_rand() / 21)
FROM finance.accounts;

/**
 * Update churn based on risk factors:
 * low or high income
 * low credit class
 * Silver account
 * high average balance
 * high maximum balance
 * no effect from minimum balance
**/

CREATE OR REPLACE FUNCTION churned
(
   account_type VARCHAR, credit_class SMALLINT, income INT, avg_account_balance INT, max_account_balance INT
) RETURNS BOOLEAN AS
$$
   SELECT
      ($5 > 220 AND $1 = 'Standard' AND $3 < 15000) OR
      ($5 > 240 AND $1 = 'Silver' AND $3 < 20000) OR
      ($2 < 670 AND $3 < 15000) OR
      ($2 >= 670 AND $3 > 40000)
$$
LANGUAGE SQL;

DROP TABLE IF EXISTS finance.temp_accounts;

CREATE TABLE finance.temp_accounts
(
   acct_id INT NOT NULL,
   mdn_income INT,
   avg_balance INT NOT NULL,
   max_balance INT NOT NULL
)
DISTRIBUTED BY (acct_id);

INSERT INTO finance.temp_accounts
   (acct_id, mdn_income, avg_balance, max_balance)
SELECT
   a.acct_id, z.mdn_income, avg(s.balance), max(s.balance)
FROM
  finance.accounts a JOIN
  finance.zip_income z ON a.zipcode = z.zipcode JOIN
  finance.account_statements s ON a.acct_id = s.acct_id
GROUP BY
  a.acct_id, mdn_income;

UPDATE finance.accounts a
SET acct_status = 'C'
FROM finance.temp_accounts t
WHERE
   a.acct_id = t.acct_id AND
   churned(a.acct_type, a.credit, t.mdn_income, t.avg_balance, t.max_balance);

DROP FUNCTION normal_rand();
DROP FUNCTION churned(VARCHAR, SMALLINT, INT, INT, INT);
DROP TABLE finance.temp_accounts;
