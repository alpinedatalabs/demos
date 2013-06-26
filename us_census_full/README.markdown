# US Census Demo Description & Instructions


## Context of the Demo

__Industry:__ Financial Services, Government, Healthcare, Insurance, Retail, Telecommunications, and any other industry that utilizes demographic data

__Use case:__ clustering the US population and determining the factors that predict marital status and income bracket

__Explanation:__ The data is brought into the workflow for exploratory analysis, clustering, and unsupervised learning. Variables are created and removed from the data. We preform k-means to cluster the US population, linear regression to predict income, and decision tree to predict marital status. For the predictive models, we conduct various measures of accuracy and precision (including training and testing) to support the predictions.


## Using the Demo

__Major Components of the demo__

* _Data:_ 1% sample of [US Census data] (http://www2.census.gov/census_2000/datasets/)
* _Transformation:_ Select subset of variables and create new variables
* _Sampling:_ Split the data into a Training Set and a Test Set
* _Model Training:_ Train decision tree on 70% random sample of data
* _Model Testing:_ Test on remaining 30% sample of data


__Key Points__

* The Variable operators selects a subset of 7 variables from the existing data and adds 9 new variables that the following operators will run on
* The Scatter Plot Matrix and Frequency operators are used to investigate the data 
* The K-Means operator clusters individuals into 7 clusters
* The Linear Regression operator models an equation that predicts income bracket (R2: 0.5803, Standard Error: 0.7092)
* The Decision Tree operator predicts marital status
* The Goodness of Fit operator shows that the Decision Tree predicts marital status with ~73% accuracy compared to ~55% with no model (based purely on frequency)

__Operators__

* _Variable Selection and Transformation (Variable Operator):_ Selects subset of 7 columns (iCitizen, iClass, iDisabl1, iMarital, dAge, iSex, iEnglish) from the full census data. Transforms selected columns into 9 columns (usborn, private_employee, disabled, married, adjusted_age, female, poor_english, only_english, naturalized) with bins using pig expressions. Renames transformed columns.
* _Random Sampling:_ Creates 2 disjoint random samples. One is a 70% random sample and the other is the remaining 30%.
* _Training/Test Sample (Sample Selector Operators)_: Selects the random samples created in the Random Sampling operator. The Training Sample is used to build the model. The Test Sample is used to test the accuracy of the model.
* _Scatter Plot Matrix:_ Visualizes the scatter plot matrix and computes correlation between 6 columns (married, female, dAge, dHours, dIncome1, dYearsch).
* _Frequency:_ Computes the frequency for 12 columns (usborn, private_employee, disabled, married, adjusted_age, female, poor_english, only_english, naturalized, dHours, dIncome1, iYearsch) and displays it as a bar chart and as a data spreadsheet view.
* _K-Means:_ Performs k-means using private employee, married, female, dAge, dHours, dIncome1, and iYearsch.
* _Linear Regression:_ Linear regression with dIncome1 as dependent variable and usborn, private_employee, disabled, married, adjusted_age, female, poor_english, only_english, naturalized, dHours, iYearsch as regressors. Provides the linear regression equation, R-squared value, and standard error in the "Summary" results tab. Provides the coefficient value, standard error, t-statistic, and p-value of the intercept and 3 regressor variables in the "Data" results tab. Visualizes a residual plot in the "Residual Plot" results tab. Visualizes a Q-Q plot in the "Q-Q Plot" results tab.
* _Decision Tree:_ Makes a decision tree with married as the dependent variable and with usborn, private_employee, disabled, adjusted_age, female, poor_english, only_english, naturalized, dHours, dIncome1, iYearsch as the variables used to predict married. Output is a visualization of a decision tree.


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
 