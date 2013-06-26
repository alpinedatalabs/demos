# <NAME of Demo> 
	Predicting Flight Delays 


## Context of the Demo

__Industry:__  Airlines, Transportation, Logistics

__Use case:__  Predicting flight arrival delays based on seasonality, flight schedule, geography, and departure delay 

__Explanation:__  The purpose of this demo is to predict arrival delays of US domestic airline flights.  The demo data set comes from public information provided by the US Department of Transportation, Bureau of Transportation Statistics (http://www.transtats.bts.gov).

The data set contains scheduled arrival and departure times of all US domestic public passenger flights for the year 2008. The data set also includes actual arrival and departure times, flight information (carrier, origin airport, destination airport, etc.), arrival and departure delays, and delays cause attribution (columns Y : AC in the spreadsheet). Time formatting in columns E : H is specified as HHMM (i.e., 1715 stands for 17:15). The total number of US domestic flights for the year 2008 listed in the data set were approximately 7 mln.

__Operators:__  The work-flow logic works in the following way:

In the Variable operator we defined a variable srsArrDelay to indicate whether or not the flight arrival was delayed by more than 15 minutes.  The reason 15 minutes was chosen is because the US Department of Transportation defines a delayed flight as a flight that arrives at least 15 minutes late. In the same variable operator we also defined binary variables to code for a scheduled hour of departure and the applicable month. The goal of the work-flow is to predict whether or not a flight will be delayed by at least 15 minutes, and to predict the absolute value of the delay. 

The Join operator is utilized to join airport and flight information.

The Row Filter operator is utilized to discard empty rows and rows with important data missing.

The Random Sampling operator is utilized to draw a training set and a validation set (20% each).

Logistic Regression, Decision Tree, and Naïve Bayes operators are utilized to predict whether or not a flight will be delayed by more than 15 minutes. srsArrDelay is selected as a Dependent Column in those operators.  

For Logistic Regression and Decision Tree operators we have chosen the Month and DepDelay (Departure Delay) as the independent variables.  Note that using DepDelay as an independent variable is like taking an easy shortcut. If a flight departure was delayed obviously it is likely that the flight arrival will also be delayed. 

For the Naïve Bayes operator we have not utilized DepDelay knowledge (an “honest and unassuming” model, so to speak). Instead, we have utilized almost all other available knowledge about the original flight schedule, such as the month and hour of departure, origin and destination airports, carrier, etc. This approach can predict arrival delays weeks or months ahead of time, without relying on DepDelay knowledge.

The Linear Regression operator was utilized to predict the expected absolute value of the arrival delay. 

The outputs of the Arrival Delay Histogram, Summary Statistics, Scatter Plot Matrix, Pivot and Frequency operators are provided to better illustrate the nature of the input data.

Goodness of Fit, ROC and Lift operators illustrate the accuracy of the model for Logistic Regression, Decision Tree and Naive Bayes operators.


## Using the Demo

__Key Points__  
Discussion and Interpretation of the Results:

ROC graph shows high prediction accuracy for the prediction operators that include DepDelay data. The Logistic Regression produced AUC (area under curve) value of approximately 0.91.  The Decision Tree produced AUC value of approximately 0.84. Higher  AUC value indicates stronger predictive power: AUC of 0.5 represents a random guess, and AUC of 1.0 represents a perfect prediction.  

Linear regression also shows strong results with R square being approximately 0.87 (meaning that it explains 87% of the delay variance), and low standard error (approximately 14 min).  However, as explained above, those results utilize an easy shortcut because they assume the knowledge of the departure delay.  

For the Naïve Bayes operator we did not assume departure delay knowledge. As a result, the Naïve Bayes operator prediction was less accurate, providing AUC value of approximately 0.65. The result is better than a random guess, but worse than the operators that assumed the knowledge of the departure delay.

To get additional insights on the models accuracy, please check the output of the Goodness of Fit operator, and particularly Accuracy, Specificity and Sensitivity values.


__Demo Tips__

Run the demo in Chrome or Firefox web browsers.

Ensure to run the demo before you show it live and use Actions\My Flow Results to display the outputs of the analytic flow.

It typically takes about 40 minutes for the model to complete the calculations on a very small Hadoop cluster, and considerably less time if you have a medium-size or a large cluster.

This demo is designed to work on Hadoop. To run it on Postgress you'd have to slightly adjust the model, as some operator configuration variables work a bit differently on Postgress. Those adjustments, however, would be trivial.

## Set-up, Tutorials & Troubleshooting

__Installation__

Please review the README file for instructions on installing the demo workflow and data.

__How to use Alpine__

Short how-to videos are available [here] (https://www.youtube.com/playlist?list=PLigMfqyd38untyANP5CxROUjo_sqkQgoC).

Product documentation is available online [here] (https://alpine.atlassian.net/wiki/display/DOC/Documentation+Home).

__Troubleshooting__

If you run into issues please review our [knowledge base] (https://alpinedatalabs.zendesk.com) for tips & tricks; you can also contact Alpine Support at (650) 918-6212.

-----

# About Alpine Data Labs

Alpine Data Labs is the leader in predictive analytics for big data. Alpine’s products uniquely combine intuitive interfaces, native analytic processing in Hadoop and in-database, and lightweight deployment to deliver solutions that harness the power of parallel computing platforms and realize the predictive value of big data analytics. Alpine enables data experts and novices alike to rapidly develop predictive analytics on Hadoop.
 