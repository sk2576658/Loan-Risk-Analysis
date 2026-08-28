                                             Loan Risk & Approval Analysis

📌 Project Overview

Loan Risk & Approval Analysis is a data analytics project focused on analyzing loan applications, approval patterns, and key credit risk factors.

The project uses Python, SQL, and Power BI to transform raw loan application data into meaningful business insights and an interactive dashboard.


🎯 Business Problem

A lending company receives a large number of loan applications and needs to understand the factors that influence loan approval and rejection.

The objective is to analyze customer and loan characteristics such as credit score, DTI ratio, income, employment type, loan amount, and previous default history to identify approval patterns and risk segments.


🎯 Project Objectives

  Analyze total loan applications, approvals, and rejections.
  Calculate overall approval and rejection rates.
  Analyze approval rates across credit score categories.
  Analyze approval patterns by employment type.
  Understand the relationship between income and loan amount.
  Analyze DTI categories and their relationship with loan approval.
  Compare approval rates based on previous default history.
  Analyze monthly loan application trends.
  Build an interactive Power BI dashboard for business reporting.

📊 Dataset Overview

   Domain: Banking / Lending / Credit Risk
   Records: 50,000 loan applications
   Period: 2023–2025
   Target/Outcome: Loan Approved / Rejected

Key Variables

  Customer ID
  Age
  Gender
  Employment Type
  Employment Years
  Annual Income
  Credit Score
  Existing Loans
  Previous Defaults
  DTI Ratio
  Loan Amount
  Loan Tenure
  Interest Rate
  Loan Purpose
  EMI
  Collateral Value
  Application Date
  Loan Status
  Default Flag


🧹 Data Cleaning & Preparation

The dataset was prepared using Python and Pandas.

Key preparation steps included:

  Data type validation
  Data consistency checks
  Handling and reviewing relevant data fields
  Creating income categories
  Creating DTI categories
  Preparing application dates for monthly trend analysis
  Preparing the cleaned dataset for SQL and Power BI analysis

The cleaned dataset is stored as: "loan_risk_cleaned.csv"


🐍 Python Analysis

Python and Pandas were used for:

  Dataset exploration
  Data cleaning and preparation
  Feature/category creation
  Exploratory data analysis
  Identifying patterns and trends
  Deriving final business insights

The complete notebook is available in the "Python" folder.

🗄️ SQL Analysis

MySQL was used to perform structured analysis on the loan application data.

Key SQL analyses include:

  Dataset overview
  Loan status distribution
  Overall approval and rejection rate
  Credit score category analysis
  Credit score vs loan status
  Employment type vs loan status
  Income category analysis
  Average loan amount and EMI by income category
  DTI category vs loan status
  Previous default history vs loan status
  Monthly loan application trends

The SQL script is available in the "SQL" folder.


📈 Power BI Dashboard

An interactive Power BI dashboard was created to provide a consolidated view of loan application performance and risk patterns.

Dashboard Components

KPI Cards

  Total Applications
  Approved Loans
  Rejected Loans
  Approval Rate

Slicers

  Application Year
  Employment Type
  Loan Status

Visualizations

  Loan Approval vs Rejection
  Credit Score Category vs Approval Rate
  DTI Category vs Approval Rate
  Average Loan Amount by Income Category
  Monthly Loan Applications Trend
  Previous Default vs Approval Rate


💡 Key Business Insights

  The overall loan approval rate is approximately 61.77%.
  Customers with lower DTI generally show higher approval rates than customers with higher DTI.
  Customers with no previous default history** have a higher approval rate than customers with previous defaults.
  Customers with better credit scores show comparatively higher approval rates.
  Employment type shows relatively similar approval rates across the major employment categories.
  Average loan amount varies across income categories.
  Monthly application volume fluctuates over time, making trend monitoring useful for lending operations.


💼Business Recommendations

  Give additional attention to applicants with high DTI ratios.
  Consider previous default history as an important risk indicator.
  Evaluate credit score, DTI, income, and default history together rather than relying on a single factor.
  Monitor monthly application and approval trends regularly.
  Develop targeted risk assessment strategies for lower-approval customer segments.
  Use the Power BI dashboard for regular monitoring and data-driven lending decisions.


🛠️Tools & Technologies

Python
Pandas
MySQL
Power BI
DAX
Google Colab

📁Project Structure

Loan-Risk-Analysis/
│
├── Data/
│   ├── credit_risk_loan_default_data.csv
│   └── loan_risk_cleaned.csv
│
├── SQL/
│   └── loan_risk_analysis.sql
│
├── Python/
│   └── loan_risk_analysis.ipynb
│
├── Power BI/
│   └── Loan_Risk_Analysis_Dashboard.pbix
│
├── Documentation/
│   ├── Loan_Risk_Analysis_Documentation.docx
│   └── Loan_Risk_Analysis_Documentation.pdf
│
└── README.md


📂 Project Deliverables

| File/Folder   | Purpose                                |
| ------------- | -------------------------------------- |
| Data          | Original and cleaned datasets          |
| SQL           | MySQL analysis queries                 |
| Python        | Data preparation and analysis notebook |
| Power BI      | Interactive Power BI dashboard         |
| Documentation | Complete project documentation         |
| README.md     | Project overview and documentation     |


✅Conclusion

This project demonstrates how Python, SQL, and Power BI can be used together to analyze loan applications and identify important credit risk and approval patterns.

The analysis provides actionable insights into factors such as credit score, DTI ratio, income, employment type, and previous default history, while the Power BI dashboard enables interactive monitoring and business reporting.
