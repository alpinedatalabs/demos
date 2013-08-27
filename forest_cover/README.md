# Forest Cover Prediction 
	

## Context of the Demo

__Industry:__  Forestry

__Use case:__  Predicting ponderosa pine growth areas based on elevation, slope, aspect, distance to water and fire areas.

__Explanation:__  The purpose of this demo is to predict ponderosa pine growth areas in the Roosevelt National Forest of northern Colorado based on catrographic variables.  The demo data set comes from the information provided by the Remote Sensing and GIS Program and Jock A. Blackard at Colorado State University.

The data set (covtype.csv) contains forest cover type information and selected area features, such as elevation, slope, distance to water, etc. Each observation refers to a specific 30 x 30 meter cell. 

__Operators:__  The workflow logic is as follows:

In the Variable operator we define a variable ponderosa_pine to indicate ponderosa pine growth areas.  

The outputs of the Summary Statistics, Frequency, and Box Plot operators are provided to better illustrate the nature of the input data. K-means operator is utilized to attempt classifying the data into seven clusters.

The Random Sampling operator is used to extract training and validation data sets.

Logistic Regression and Decision Tree operators are used to predict whether or not a specific area will be covered by ponderosa pine forest.  

ROC, Confusion Matrix, Lift, and Goodness of Fit operators illustrate the accuracy of the model for Logistic Regression and Decision Tree operators.


## Using the Demo

__Key Points__  
Discussion and Interpretation of the Results:

The model achieves high predictive power for ponderosa pine forest cover, with AUC (area under curve) approximately 0.97. 

It appears from the results that ponderosa pine tends to occupy a distinct ecological niche that is well defined by several catrographical factors such as elevation range, distance to water, etc.


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
