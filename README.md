#                                           Loan Risk & Approval Analysis

## About the Project

This project is based on loan application data. I analyzed the data to understand
which factors are related to loan approval and rejection.

I used SQL for business analysis, Python for data cleaning and exploration, and
Power BI to create an interactive dashboard.

## Business Problem

The main objective was to understand:

- Overall loan approval and rejection rate
- Impact of credit score on approval
- Approval rate across employment types
- Relationship between DTI ratio and approval
- Effect of previous defaults
- Loan amount across different income groups
- Monthly loan application trends

## Tools Used
- MySQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Power BI
- Google Colab

## Dataset

The project contains two datasets:

- `credit_risk_loan_default_data.csv` – original dataset
- `loan_risk_cleaned.csv` – cleaned dataset used for analysis

The dataset contains information related to customer income, credit score,
loan amount, EMI, DTI ratio, employment type, previous defaults, application
date and loan status.

## Analysis

### SQL

I used SQL to calculate application counts, approval rates, rejection rates,
credit score categories, employment-wise approval rates, income categories,
DTI categories, previous default impact and monthly application trends.

### Python

Python was used for data checking, cleaning, categorization and exploratory
analysis. The analysis was performed in Google Colab.

### Power BI
The Power BI dashboard shows:

- Total Applications
- Approved Loans
- Rejected Loans
- Approval Rate
- Credit Score vs Approval Rate
- DTI Category vs Approval Rate
- Average Loan Amount by Income Category
- Monthly Application Trend
- Previous Default vs Approval Rate

## Key Findings

- Total applications analyzed: around 50K
- Overall approval rate: 61.77%
- Approved loans: around 31K
- Rejected loans: around 19K
- Applicants with better credit scores had higher approval rates.
- Lower DTI applicants showed better approval rates.
- Applicants with previous defaults had a lower approval rate.
- Income category showed differences in average loan amount and EMI.

## Recommendations

Based on the analysis, credit score, DTI ratio and previous default history
should be considered while evaluating loan applications.

The bank can also monitor monthly application trends and use income and
repayment-related factors while deciding suitable loan amounts.

## Project Structure

Loan-Risk-Analysis/
├── Data/
├── SQL/
├── Python/
├── PowerBI/
├── Documentation/
└── README.md

## Conclusion

This project helped me understand how loan application data can be analyzed
using SQL, Python and Power BI. The analysis provides a view of the major
factors associated with loan approval and rejection.

## Dashboard Preview

![Loan Risk & Approval Dashboard](Dashboard%20image.png)
