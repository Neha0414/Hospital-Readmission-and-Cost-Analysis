Hospital Readmission and Cost Analysis
Project Overview

This project analyzes hospital patient data to identify factors responsible for patient readmissions and healthcare cost leakage. The analysis focuses on understanding patient risk levels, hospital stay patterns, emergency visits, and estimated healthcare expenses using data-driven techniques.

The project was completed using Python, PostgreSQL, and Power BI for data analysis, SQL querying, and dashboard visualization.

Objectives
Analyze patient readmission patterns
Identify high-risk patient groups
Study factors affecting healthcare costs
Estimate cost leakage caused by readmissions and extended hospital stays
Build interactive dashboards for healthcare insights
Tools & Technologies
Python (NumPy, Pandas)
PostgreSQL
Power BI
Jupyter Notebook / PyCharm
Dataset Description

The dataset contains hospital patient information including:

Patient demographics
Admission details
Emergency visit frequency
Time spent in hospital
Readmission status
Medical conditions
Estimated treatment cost
Cost Leakage Methodology

The dataset did not contain direct hospital cost leakage values, so estimated costs were used to calculate different healthcare expenses based on specific conditions and criteria.

The following cost components were calculated:

1. Readmission Cost

Patients marked as readmitted were assigned estimated readmission-related expenses.

2. Excess Length of Stay Cost

Additional costs were calculated for patients whose hospital stay exceeded a defined threshold.

3. Emergency Visit Cost

Patients with frequent emergency visits were assigned estimated emergency-related costs.

4. Total Cost Leakage

The total healthcare cost leakage was calculated by combining:

Readmission cost
Excess hospital stay cost
Emergency visit cost

This helped estimate the financial impact of inefficient healthcare utilization and high-risk patient behavior.

Project Workflow
1. Data Collection
Imported CSV dataset into Python and PostgreSQL
2. Data Cleaning
Checked missing values
Removed unnecessary columns
Handled duplicates
Standardized data formats
3. Exploratory Data Analysis (EDA)

Performed analysis on:

Readmission trends
Risk categorization
Emergency visits
Length of hospital stay
Estimated cost leakage patterns
4. SQL Analysis (PostgreSQL)

Used SQL queries for:

Risk classification
Cost calculations
Readmission percentage analysis
High-cost patient identification
Aggregation and filtering operations
5. Dashboard Creation (Power BI)

Built interactive dashboards to visualize:

Readmission rates
Patient risk levels
Emergency visit analysis
Hospital stay trends
Cost leakage distribution

Key Insights
Patients with longer hospital stays generated higher estimated costs
Frequent emergency visits increased overall healthcare expenses
High-risk patients contributed significantly to total cost leakage
Readmission cases created additional financial burden on hospitals
