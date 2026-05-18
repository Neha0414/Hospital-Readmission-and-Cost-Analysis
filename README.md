Hospital Readmission and Cost Leakage Analysis
Project Overview
This project focuses on analyzing hospital patient data to identify factors responsible for patient readmissions and healthcare cost leakage. The analysis helps in understanding patient risk patterns, hospital stay trends, emergency visit behavior, and their financial impact on hospitals.
The project was completed using Python, PostgreSQL, and Power BI for data cleaning, exploratory data analysis (EDA), SQL analysis, and dashboard visualization.
________________________________________
Objectives
•	Analyze hospital readmission patterns 
•	Identify high-risk patient groups 
•	Study factors affecting healthcare expenses 
•	Analyze healthcare cost leakage using estimated costs 
•	Build interactive dashboards for healthcare insights 
________________________________________
Tools & Technologies
•	Python 
o	NumPy 
o	Pandas 
•	PostgreSQL 
•	Power BI 
•	Jupyter Notebook / PyCharm 
________________________________________
Dataset Information
The dataset contains hospital patient records including:
•	Patient demographics 
•	Admission details 
•	Emergency visit frequency 
•	Time spent in hospital 
•	Readmission status 
•	Medical conditions 
•	Estimated treatment cost 
________________________________________
Cost Leakage Methodology
The dataset did not contain direct hospital cost leakage values, so estimated costs were used to calculate healthcare expenses based on specific criteria. These calculated values were then used to analyze overall healthcare cost leakage.
Cost Components Calculated
•	Readmission Cost
Estimated costs assigned to readmitted patients 
•	Excess Length of Stay Cost
Additional costs calculated for patients with longer hospital stays 
•	Emergency Visit Cost
Estimated emergency-related expenses for patients with frequent emergency visits 
•	Total Cost Leakage
Combined analysis of: 
o	Readmission cost 
o	Excess stay cost 
o	Emergency visit cost 
This analysis helped estimate the financial impact of repeated admissions, extended hospital stays, and high emergency dependency.
________________________________________
Project Workflow
1. Data Collection
•	Imported CSV dataset into Python and PostgreSQL 
2. Data Cleaning
•	Checked missing values 
•	Removed unnecessary columns 
•	Handled duplicates 
•	Standardized data formats 
3. Exploratory Data Analysis (EDA)
Analysis performed on:
•	Readmission trends 
•	Risk categorization 
•	Hospital stay duration 
•	Emergency visits 
•	Estimated cost leakage patterns 
4. SQL Analysis (PostgreSQL)
Used SQL queries for:
•	Risk classification 
•	Cost calculations 
•	Readmission percentage analysis 
•	High-cost patient identification 
•	Aggregation and filtering operations 
5. Dashboard Creation (Power BI)
Created interactive dashboards for:
•	Readmission analysis 
•	Patient risk levels 
•	Cost leakage insights 
•	Emergency visit trends 
•	Hospital stay analysis 
________________________________________
Key Insights
•	Patients with longer hospital stays generated higher estimated costs 
•	Frequent emergency visits increased healthcare expenses 
•	High-risk patients contributed significantly to total cost leakage 
•	Readmission cases created additional financial burden on hospitals 
________________________________________

Future Improvements
•	Predictive model for patient readmission 
•	Advanced healthcare cost prediction 
•	Real-time dashboard integration 
•	Automated patient risk scoring system

