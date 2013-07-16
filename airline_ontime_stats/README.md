# Flight Delay Prediction 
	

## Context of the Demo

__Industry:__  Airlines, Transportation, Logistics

__Use case:__  Predicting flight arrival delays based on seasonality, flight schedule, weather data, and geography.

__Explanation:__  The purpose of this demo is to predict arrival delays of US domestic airline flights.  The demo data sets come from public information provided by the US Department of Transportation, Bureau of Transportation Statistics (http://www.transtats.bts.gov) and by the Utah State University Climate Center (http://climate.usurf.usu.edu/mapGUI/mapGUI.php ).

The first data set (flightsData.csv) contains scheduled arrival and departure times of all US domestic public passenger flights arriving to Chicago O'Hare airport for the year 2008, as well as the actual arrival and departure times, flight information (carrier, origin airport, destination airport, etc.), arrival delay, and delays cause attribution. Time formatting in columns I : L is the following: 1715 stands for 17:15, 715 stands for 07:15, and 15 stands for 00:15.

__Operators:__  The workflow logic is as follows:

Join operator joins flight information with weather information. It matches scheduled departure time (1-hour granularity) for each flight going to Chicago with the actual weather conditions at Chicago airport at the scheduled departure time (also 1-hour granularity).   

In the Variable operator we define a variable srsArrDelay to indicate whether or not the flight arrival was delayed by more than 15 minutes.  The reason 15 minutes value was chosen is because the US Department of Transportation defines a delayed flight as a flight that arrives at least 15 minutes late. The goal of the workflow is to predict whether or not a flight will be delayed by at least 15 minutes, and to predict the absolute value of the delay. 

The Row Filter operator is used to discard empty rows and rows with important data missing.

The outputs of the Arrival Delay Histogram, Summary Statistics, Scatter Plot Matrix, Frequency, and Aggregation operators are provided to better illustrate the nature of the input data.

The Random Sampling operator is used to extract training and validation data sets.

Logistic Regression, Decision Tree, and Naïve Bayes operators are used to predict whether or not a flight will be delayed by more than 15 minutes. srsArrDelay is selected as a Dependent Column in these operators.  

The Linear Regression operator was used to predict the expected absolute value of the arrival delay. 

Goodness of Fit, ROC and Lift operators illustrate the accuracy of the model for Logistic Regression, Decision Tree and Naive Bayes operators.


## Using the Demo

__Key Points__  
Discussion and Interpretation of the Results:

The model illustrates that the most important factors in determining the arrival delays are the weather conditions at the airport of arrival, month, and hour of the departure. That makes good sense for the following reasons:

- Poor weather conditions obviously negatively affect airlines operations. Furthermore, airlines routinely check the conditions at the airport of arrival before a plane takes off to make sure that it can safely land.

- Departure hour matters because flight logistics depend on many factors, including the availability of a plane and crew, which often have to arrive in time from another location in order to be available for the current flight. For early morning flights the plane and crew are more likely to be in place by the time of departure because they usually arrive to the flight origin location at least the night before. Afternoon flights, however, frequently rely on connecting flights to bring the crew or plane or both in time for departure. If a connecting flight is late, that would cause the delays to escalate downwards through the logistical flights chain like an avalanche, because either a crew or a plane would not be available in time for scheduled departure.

- Departure month likely matters for several reasons: A. Bad weather during the winter months. B. Higher vacation and holiday traffic in certain months puts an additional strain on the system.

The model accuracy can be further improved by getting additional data on other potentialy relevant factors that affect flight logistics, including weather conditions in the airport of departure, number of passengers on each flight, etc., and adding those factors to the model as independent variables.


__Demo Tips__

Run the demo in Chrome or Firefox web browsers.

Ensure to run the demo before you show it live and use Actions\My Flow Results to display the outputs of the analytic flow.

This demo is designed to work on Hadoop. To run it on PostgreSQL you'd have to slightly adjust the model, as some operator configuration variables work differently on relational databases. These adjustments, however, should be trivial.

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
