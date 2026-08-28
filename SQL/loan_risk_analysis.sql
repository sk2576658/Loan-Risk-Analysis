#=================CREATE DATABASE==============
CREATE DATABASE IF NOT EXISTS loan_risk_analysis;

#=================USE DATABASE=================
USE loan_risk_analysis;

#=================CREATE TABLE=================
CREATE TABLE IF NOT EXISTS loan_data (
    Loan_ID VARCHAR(50),
    Customer_ID VARCHAR(50),
    Age INT,
    Gender VARCHAR(20),
    Employment_Type VARCHAR(50),
    Employment_Years INT,
    Annual_Income DECIMAL(15,2),
    Credit_Score INT,
    Existing_Loans INT,
    Previous_Defaults INT,
    DTI_Ratio DECIMAL(10,4),
    Loan_Amount DECIMAL(15,2),
    Loan_Tenure_Months INT,
    Interest_Rate DECIMAL(10,2),
    Loan_Purpose VARCHAR(100),
    EMI DECIMAL(15,2),
    Collateral_Value DECIMAL(15,2),
    Application_Date DATE,
    Loan_Status VARCHAR(20),
    Default_Flag INT
);

SELECT COUNT(*) AS total_rows
FROM loan_data;

DESCRIBE loan_data;
#************************************************
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Loan_ID) AS unique_loans,
    COUNT(DISTINCT Customer_ID) AS unique_customers
FROM loan_data;

#===================LOAN STATUS===================
SELECT
    COUNT(*) AS total_applications,
    SUM(CASE WHEN Loan_Status = 'Approved' THEN 1 ELSE 0 END) AS approved_loans,
    SUM(CASE WHEN Loan_Status = 'Rejected' THEN 1 ELSE 0 END) AS rejected_loans
FROM loan_data;

#======================OVERALL APPROVAL RATE====================
SELECT
    COUNT(*) AS total_applications,
    SUM(CASE WHEN Loan_Status = 'Approved' THEN 1 ELSE 0 END) AS approved_loans,
    SUM(CASE WHEN Loan_Status = 'Rejected' THEN 1 ELSE 0 END) AS rejected_loans,

    ROUND(
        SUM(CASE WHEN Loan_Status = 'Approved' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS approval_rate,

    ROUND(
        SUM(CASE WHEN Loan_Status = 'Rejected' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS rejection_rate

FROM loan_data;

#======================CREDIT SCORES====================
SELECT
    Credit_Category,
    COUNT(*) AS Total_Applications,

    SUM(CASE
        WHEN Loan_Status = 'Approved' THEN 1
        ELSE 0
    END) AS Approved_Loans,

    SUM(CASE
        WHEN Loan_Status = 'Rejected' THEN 1
        ELSE 0
    END) AS Rejected_Loans

FROM (
    SELECT
        CASE
            WHEN Credit_Score < 600 THEN 'Poor'
            WHEN Credit_Score BETWEEN 600 AND 699 THEN 'Average'
            WHEN Credit_Score >= 700 THEN 'Good'
        END AS Credit_Category,
        Loan_Status
    FROM loan_data
) AS categorized_data

GROUP BY Credit_Category

ORDER BY
    CASE
        WHEN Credit_Category = 'Poor' THEN 1
        WHEN Credit_Category = 'Average' THEN 2
        WHEN Credit_Category = 'Good' THEN 3
    END;
    
    
#=================CREDIT SCORES AND LOAN STATUS==================
    
SELECT
    Credit_Category,

    COUNT(*) AS Total_Applications,

    SUM(CASE
        WHEN Loan_Status = 'Approved' THEN 1
        ELSE 0
    END) AS Approved_Loans,

    SUM(CASE
        WHEN Loan_Status = 'Rejected' THEN 1
        ELSE 0
    END) AS Rejected_Loans,

    ROUND(
        100.0 * SUM(CASE
            WHEN Loan_Status = 'Approved' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Approval_Rate,

    ROUND(
        100.0 * SUM(CASE
            WHEN Loan_Status = 'Rejected' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Rejection_Rate

FROM (
    SELECT
        CASE
            WHEN Credit_Score < 600 THEN 'Poor'
            WHEN Credit_Score BETWEEN 600 AND 699 THEN 'Average'
            WHEN Credit_Score >= 700 THEN 'Good'
        END AS Credit_Category,
        Loan_Status
    FROM loan_data
) AS categorized_data

GROUP BY Credit_Category

ORDER BY
    CASE
        WHEN Credit_Category = 'Poor' THEN 1
        WHEN Credit_Category = 'Average' THEN 2
        WHEN Credit_Category = 'Good' THEN 3
    END;
    
#=================EMP TYPE & LOAN STATUS=====================
SELECT
    Employment_Type,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN Loan_Status = 'Approved' THEN 1
            ELSE 0
        END
    ) AS approved_loans,

    SUM(
        CASE
            WHEN Loan_Status = 'Rejected' THEN 1
            ELSE 0
        END
    ) AS rejected_loans,

    ROUND(
        SUM(
            CASE
                WHEN Loan_Status = 'Approved' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS approval_rate
FROM loan_data
GROUP BY Employment_Type
ORDER BY approval_rate DESC;

#================CATEGORY, INCOME, LOAN AMT, EMI================

SELECT
    CASE
        WHEN Annual_Income < 300000 THEN 'Low Income'
        WHEN Annual_Income BETWEEN 300000 AND 600000 THEN 'Middle Income'
        WHEN Annual_Income BETWEEN 600000 AND 1000000 THEN 'High Income'
        ELSE 'Very High Income'
    END AS income_category,

    COUNT(*) AS total_applications,

    ROUND(AVG(Annual_Income), 2) AS avg_income,

    ROUND(AVG(Loan_Amount), 2) AS avg_loan_amount,

    ROUND(AVG(EMI), 2) AS avg_emi

FROM loan_data
GROUP BY income_category
ORDER BY avg_loan_amount DESC;

#===============DTI CATEGORY & LOAN STATUS===================
SELECT
    CASE
        WHEN DTI_Ratio < 0.30 THEN 'Low DTI'
        WHEN DTI_Ratio BETWEEN 0.30 AND 0.50 THEN 'Medium DTI'
        ELSE 'High DTI'
    END AS dti_category,

    COUNT(*) AS total_applications,

    SUM(CASE
        WHEN Loan_Status = 'Approved' THEN 1
        ELSE 0
    END) AS approved_loans,

    SUM(CASE
        WHEN Loan_Status = 'Rejected' THEN 1
        ELSE 0
    END) AS rejected_loans,

    ROUND(
        SUM(CASE
            WHEN Loan_Status = 'Approved' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS approval_rate

FROM loan_data
GROUP BY dti_category
ORDER BY approval_rate DESC;

#====================DEFAULT HISTORY & LOAN STATUS==============
SELECT
    CASE
        WHEN Previous_Defaults = 0 THEN 'No Previous Default'
        ELSE 'Previous Default'
    END AS default_history,

    COUNT(*) AS total_applications,

    SUM(CASE
        WHEN Loan_Status = 'Approved' THEN 1
        ELSE 0
    END) AS approved_loans,

    SUM(CASE
        WHEN Loan_Status = 'Rejected' THEN 1
        ELSE 0
    END) AS rejected_loans,

    ROUND(
        SUM(CASE
            WHEN Loan_Status = 'Approved' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS approval_rate
FROM loan_data
GROUP BY default_history
ORDER BY approval_rate DESC;

#========================MONTHLY TRENDS=======================
SELECT
    DATE_FORMAT(Application_Date, '%Y-%m') AS application_month,

    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN Loan_Status = 'Approved' THEN 1
            ELSE 0
        END
    ) AS approved_loans,

    SUM(
        CASE
            WHEN Loan_Status = 'Rejected' THEN 1
            ELSE 0
        END
    ) AS rejected_loans,

    ROUND(
        SUM(
            CASE
                WHEN Loan_Status = 'Approved' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS approval_rate
FROM loan_data
GROUP BY application_month
ORDER BY application_month;


