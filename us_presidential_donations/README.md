# Presidential Donations Demo Description & Instructions


## Context of the Demo

__Industry:__ Government, Politics 

__Use case:__ Comparing presidential donations to Barack Obama and Mitt Romney during the 2012 presidential election

__Explanation:__ The data is brought into the workflow for data transformation (add variables, filter rows, and aggregate into bins). Then, the donations of two candidates are compared using bar charts.


## Using the Demo

__Major Components of the demo__

* _Data:_ [Donation data] (http://www.fec.gov/disclosurep/pnational.do?cf=phome) for the 2012 US presidential election 
* _Transformation:_ Select a subset of variables, add new variables, and filter rows.

__Key Points__

* The Variable, Row Filter, and Aggregation operators are used to transform the data
* The Scatter Plot Matrix, Frequency, and Bar Chart operators are used to investigate the data 

__Operators__

* _LOG(contb_amt):_ Selects a subset of 5 variables (cand_id, cand_nm, contbr_st, contb_receipt_amt, contb_receipt_dt). Applies a logarithmic transformation to the contb_receipt_amt variable in order to account for skewness of the variable. By rounding these values, this can be treated as a binning process. Extracts the last name of the candidates.
* _obama or romney:_ Filters the rows so that the output data is representative of only Obama (cand_id = P80003338) and Romney (cand_id = P80003353).
* _Binning:_ Computes the number of donation instances, the largest donation, the average donation, and the sum of all donations for each donation amount bin and for both Obama and Romney.
* _Contribution Comparison (count):_ Visualizes a bar chart of the number of donation instances in each donation amount bin for both Obama and Romney.
* _Contribution Comparison (sum amt):_ Visualizes a bar chart of the total amount of donations in each donation amount bin for both Obama and Romney.

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
 