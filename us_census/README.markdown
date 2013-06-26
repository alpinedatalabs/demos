# US Census (by state) Demo Description & Instructions


## Context of the Demo

__Industry:__ Financial Services, Government, Healthcare, Insurance, Media, Retail, Telecommunications, and any other industry that utilizes demographic data

__Use case:__ Predicting home ownership by demographics

__Explanation:__ The data is brought into the workflow for exploratory analysis and linear regression. Variables are created and removed from the data. Then a linear regression is conducted on the transformed data to predict home ownership.



## Using the Demo

__Major Components of the demo__

* _Data:_ State level demographic information from the US Census
* _Transformation:_ Select subset of variables and create new variables

__Key Points__

* The Bar Chart, Frequency, Histogram, Scatter Plot Matrix, and Summary Statistics operators are used to investigate the data
* The Variable operators selects a subset of 7 variables from the existing data and adds a total of 6 new variables that the following operators will run on
* The Aggreation operator performs summation of 4 variables at the sub-region level
* The Linear Regression operator models an equation that predicts home ownership (R2: 0.3737, Standard Error: 0.0433)

__Operators__

* _Data Selection and Trasnformation (Variable Operator):_ Computes the summary statistics (variable name, data type, count, number of unique values, number of null values, number of empty, number of zero, min value, 25% quartile, median, 75% quartile, max value, standard deviation, average, number of positive values, number of negative values, the 10 most common values) for all columns in the data.
* _Summary Statistics (Full):_ Computes the summary statistics (variable name, data type, count, number of unique values, number of null values, number of empty, number of zero, min value, 25% quartile, median, 75% quartile, max value, standard deviation, average, number of positive values, number of negative values, the 10 most common values) for all columns.
* _Scatter Plot Matrix:_ Visualizes the scatter plot matrix and computes correlation between 7 columns (datum_WHITE, datum_BLACK, datum_HISPANIC, datum_MALES, datum_MED_AGE, datum_AVE_HH_SZ, datum_AVE_FAM_SZ).
* _Histogram:_ Visualizes histogram for 3 columns (datum_POP2000, datum_AVE_HH_SZ, datum_WHITE) using different number of bins for each column (10 bins, 5 bins, 10 bins).
* _Bar Chart:_ Visualizes a bar chart of the sum of the value of datum_HISPANIC in each value in datum_SUB_REGION (E N Cen, E S Cen, Mid Atl, Mtn, N Eng, Pacific, S Atl, W N Cen, W S Cen).
* _Frequency:_ Computes the frequency of each value in datum_SUB_REGION (E N Cen, E S Cen, Mid Atl, Mtn, N Eng, Pacific, S Atl, W N Cen, W S Cen) and displays it as a bar chart and as a data spreadsheet view.
* _Data Selection and Transformation (Variable Operator):_ Selects subset of 7 columns (datum_SUB_REGION, datum_AREA, datum_POP2000, datum_WHITE, datum_BLACK, datum_AGE_65_UP, datum_OWNER_OCC) from the census data.Transforms 4 of the selected columns (datum_WHITE, datum_BLACK, datum_OWNER_OCC, datum_AGE65_UP) into percentages using pig expressions. Renames transformed columns (pct_white, pct_black, pct_owner_occ, pct_old).
* _Summary Statistics (Transformed):_ Computes the summary statistics (variable name, data type, count, number of unique values, number of null values, number of empty, number of zero, min value, 25% quartile, median, 75% quartile, max value, standard deviation, average, number of positive values, number of negative values, the 10 most common values) for all 11 columns from the Data Selection and Transformation operator (pct_white, pct_black, pct_owner_occ, pct_old, datum_SUB_REGION, datum_AREA, datum_POP2000, datum_WHITE, datum_BLACK, datum_AGE_65_UP, datum_OWNER_OCC).
* _Summation (Aggregation Operator):_ For each subregion represented in the datum_SUB_REGION column, computes total count of white population (SUM_datum_WHITE), total count of black population (SUM_datum_BLACK), total area of the subregion (SUM_datum_AREA), and total population of the subregion (SUM_datum_POP2000) using new columns that were created in the "Data Selection and Transformation" step above.
* _Sub-region Percentages (Variable Operator):_ Calculates the percentage of white (pct_white_sr_avg) and (pct_black_sr_avg) population in each sub-region.
* _Linear Regression:_ Linear regression with pct_owner_occ as dependent variable and pct_white, pct_black, and pct_old as regressors. Provides the linear regression equation, R-squared value, and standard error in the "Summary" results tab. Provides the coefficient value, standard error, t-statistic, and p-value of the intercept and 3 regressor variables in the "Data" results tab. Visualizes a residual plot in the "Residual Plot" results tab. Visualizes a Q-Q plot in the "Q-Q Plot" results tab.



__Demo Tips__

* Show the demo in Chrome or Firefox
* Run the demo before you show it live and use Actions\My Flow Results to display the outputs of the analytic flow

## Set-up, Tutorials & Troubleshooting

__Installation__

Please review the README file for instructions on installing the demo workflow and data.

__How to use Alpine__

Short how-to videos are available [here] (https://www.youtube.com/playlist?list=PLigMfqyd38untyANP5CxROUjo_sqkQgoC).

Product documentation is available online [here] (https://alpine.atlassian.net/wiki/display/DOC/Documentation+Home).

__Troubleshooting__

If you run into issues please review our [knowledge base] (https://alpinedatalabs.zendesk.com) for tips & tricks; you can also contact Alpine Support here.

-----

# About Alpine Data Labs

Alpine Data Labs is the leader in predictive analytics for big data. Alpine’s products uniquely combine intuitive interfaces, native analytic processing in Hadoop and in-database, and lightweight deployment to deliver solutions that harness the power of parallel computing platforms and realize the predictive value of big data analytics. Alpine enables data experts and novices alike to rapidly develop predictive analytics on Hadoop.
 