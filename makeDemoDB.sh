#!bin/sh

direc=$(pwd)

find aws-demo/schema  -name "*.sql" -exec sed -i -e "s%/PATH_TO_AWS_DEMO%$(pwd)%g" {} \;

echo 'drop database if exists aws' | psql -d template1
createdb aws

echo 'create schema finance' | psql -d aws
echo 'create schema sandbox' | psql -d aws
echo 'create schema health' | psql -d aws

psql -d aws -f "$direc"/aws-demo/schema/finance/account-churn/churn-data.sql
psql -d aws -f "$direc"/aws-demo/schema/finance/bankloan-default/bankloan_default.sql
psql -d aws -f "$direc"/aws-demo/schema/finance/credit-delinquency/create-tables.sql
psql -d aws -f "$direc"/aws-demo/schema/finance/german-credit/gc.sql

psql -d aws -f "$direc"/aws-demo/schema/health/ctg/ctg.sql
psql -d aws -f "$direc"/aws-demo/schema/health/los/import_data.sql

psql -d aws -f "$direc"/aws-demo/schema/sandbox/election92/election92.sql
psql -d aws -f "$direc"/aws-demo/schema/sandbox/titanic/titanic.sql