# Unscheduled Plane Landings Attribution 
	

## Context of the Demo

__Industry:__  Airlines, Transportation, Logistics

__Use case:__  Identifying the causes of unscheduled plane landings. 

__Explanation:__  The purpose of this demo is to examine the main causes of unscheduled plane landings. The demo data set comes from public information provided by the FAA (http://av-info.faa.gov/dd_sublevel.asp?Folder=\SDRS), and the model is discussed here in details: http://themainstreamseer.blogspot.com/2013/01/data-mining-and-airline-safety.html.

The data set contains the information from the Service Difficulty Reporting System, which is utilized in the aviation industry to record incidents of service or equiment breakdowns. Each row in the table contains detailed information about the nature of each breakdown incident.

Although most recorded breakdown incidents do not force unplanned landings, a small portion of the incidents either causes or is associated with unscheduled plane landings. The purpose of this demo is to examine those connections.

__Operators:__  The workflow logic is as follows:

NULL value replacement operators are utilized to replace the missing values with codes that the model can recognize.

In the Variable operator we create a variable to code for unscheduled landings and give several other variables more meaningful names. Specifically, 'region_code' indicates the region where an incident has occured, 'region_responsible' identifies the region responsible for the aircraft involved in the incident, and 'stage' identifies a specific stage of aircraft operations (i.e. cruising, takeoff, landing, etc.).

Aggregation, Row Filter, and Join operators are utilized to filter the aircraft manufacturers for which the data set contains at least 100 data points per manufacturer. This is done to ensure that the subsequent statistical analysis operators have enough data per manufacturer to analyze. 

The outputs of the Frequency and Summary Statistics operators are provided to better illustrate the nature of the input data.

Variable Selection operator identifies and prioritizes variables of interest to a prediction task. An arbitrary threshhold of 0.1 was set for R2 criteria. 

The Random Sampling operator is used to extract training and validation data sets.

Logistic Regression and Naive Bayes operators are used to identify the factors responsible for, or most frequently associated with, unscheduled plane landings. 

ROC, Confusion Matrix, Goodness of Fit, and Lift operators illustrate the accuracy of the model for Logistic Regression and Naive Bayes operators.


## Using the Demo

__Key Points__  
Discussion and Interpretation of the Results:

The model illustrates that stage of a flight most strongly affects the chances of an unscheduled landing. In the Variable Selection operator stage was the only variable that passed the R2=0.1 threshhold. 

One should be careful, however, not to overstate the importance of that finding, particularly since the list of possible flight stages also includes such stages as "inspection/maintenance", "unknown", and "not reported".

Geographic region where an incident has occured, region responsible for the aircraft, and aircraft manufacturer were also found to affect the chances of an unscheduled landing.

The model has achieved very high predictive power: AUC (area under curve) was approximately 0.97 for Naive Bayes and 0.987 for Logistic Regression; model accuracy was approximately 0.97 for Logistic Regression and 0.96 for Naive Bayes.


__Demo Tips__

Run the demo in Chrome or Firefox web browsers.

Make sure to run the demo before you show it live and use Actions -> My Flow Results to display the outputs of the analytic flow.

This demo is designed to work on Hadoop. To run it on PostgreSQL you will need to slightly adjust the model, as some operator configuration variables work differently on relational databases. These adjustments, however, should be trivial.

## Set-up, Tutorials & Troubleshooting

__Installation__

Please review the README file for instructions on installing the demo workflow and data.

__How to use Alpine__

Short how-to videos are available [here] (https://www.youtube.com/playlist?list=PLigMfqyd38untyANP5CxROUjo_sqkQgoC).

Product documentation is available online [here] (https://alpine.atlassian.net/wiki/display/DOC/Documentation+Home).

__Troubleshooting__

If you run into issues, please review our [knowledge base] (https://alpinedatalabs.zendesk.com) for tips & tricks; you can also contact Alpine Support at (650) 918-6212.

-----

# About Alpine Data Labs

Alpine Data Labs is the leader in data science for Hadoop and big data. The company’s products uniquely combine intuitive interfaces, native analytic processing in Hadoop, high performance in-database analytics, and the efficiencies of cloud computing to define the new paradigm in advanced analytics: accessible, easy to use and built for big data. Alpine’s customers include A.T. Kearney, Havas Media and Zions Bancorporation. Alpine’s solutions enable data experts and novices alike to work across organizational barriers and collaboratively realize the predictive power of big data analytics. For more information visit [alpinedatalabs.com] (http://www.alpinedatalabs.com/).
