# Presidential Election Demo Description & Instructions


## Context of the Demo

__Industry:__ Government, Politics 

__Use case:__ Predicting voter turnout and election results by county

__Explanation:__ The data is brought into the workflow for exploratory analysis and supervised learning. Variables are created and removed from the data. Various plots and bar charts are created to investigate the data. We preform a linear regression to predict voter turnout and a decision tree if the majority of a county's votes are either Republican or Democrat. For the predictive models, we conduct various measures of accuracy and error (including training and testing) to support the predictions. 


## Using the Demo

__Major Components of the demo__

* _Data:_ County-level data of the [1992 US presidential election] (http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets)
* _Transformation:_ Add new variables and filter rows
* _Sampling:_ Split the data into a Training Set and a Test Set
* _Model Training:_ Train decision tree on 75% random sample of data
* _Model Testing:_ Test on remaining 25% sample of data

__Key Points__

* The Variable operators add 5 new variables including categorical variables that indicate how each county voted and bin variables
* The Scatter Plot Matrix, Frequency, and Bar Chart operators are used to investigate the data 
* The Linear Regression operator models an equation that predicts voter turnout (R2: 0.4548, Standard Error: 6.3572)
* The Decision Tree operator predicts election results at the county level
* The Goodness of Fit operator shows that the Decision Tree predicts election results with ~64% accuracy compared to ~50% with no model (based purely on frequency)

__Operators__

* _Scatter Plot Matrix:_ Visualizes the scatter plot matrix and computes correlation between 7 columns (age75, crime, college, income, white, black, and turnout).
* _Linear Regression of Voter Turnout:_ Linear regression with turnout as dependent variable and popdensity, age75, crime, college, income, farm, white, and black as regressors. Provides the linear regression equation, R-squared value, and standard error in the "Summary" results tab. Provides the coefficient value, standard error, t-statistic, and p-value of the intercept and 8 regressor variables in the "Data" results tab. Visualizes a residual plot in the "Residual Plot" results tab. Visualizes a Q-Q plot in the "Q-Q Plot" results tab.
* _Variables:_ Creates 4 new variables (outcome, count, income_bin, college_bin) using pig expressions. The outcome variable is a categorical variable that indicates the party that received the majority vote of each county. The income_bin and college_bin variables are bin variables. The count variable is used as a counter.
* _Election Results by Income:_ Visualizes a bar chart using the variables created in the previous Variables operator. The output is the number of counties that voted Democrat, Republican, and Perot in the 20K, 30K, 40K, 50K, 60K, and 70K income bins.
* _Election Results by College:_ Visualizes a bar chart using the variables created in the previous Variables operator. The output is the number of counties that voted Democrat, Republican, and Perot in the 10%, 20%, 30%, 40%, 50%, and 60% college bins.
* _Remove Perot:_ Selects subset of counties (rows) from the full data where Perot was not the majority vote.
* _Histogram:_ Using the data from the previous Remove Perot operator, visualizes histogram for 3 columns (college, income, and turnout) using 10 bins for each histogram. 
* _DR Flag:_ Using the data from the previous Remove Perot operator, creates a new variable (outcome) using a pig expression. The outcome variable is a categorical variable that indicates the party that received the majority vote of each county. The remaining 5 operators will use the data created from this operator.
* _Frequency:_ Computes the frequency for the outcome variable and displays it as a bar chart and as a data spreadsheet view. This frequency is used to determine the accuracy of predicting the outcome variable using no model.
* _Random Sampling:_ Creates 2 disjoint random samples. One is a 75% random sample and the other is the remaining 25%.
* _Training/Test Sample:_ Selects the random samples created in the Random Sampling operator. The Training Sample is used to build the model. The Test Sample is used to test the accuracy of the model.
* _Decision Tree Republican vs Democrat:_ Makes a decision tree with outcome as the dependent variable and with state, popdensity, pop, popchange, age6574, age75, crime, college, income, farm, white, black and turnout as the variables used to predict married. The output is a visualization of a decision tree.
* _Goodness of Fit:_ Compares the result of the decision tree with the test sample. The decision tree predicts with ~64% accuracy, which is ~10% more accurate than no model.

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
 