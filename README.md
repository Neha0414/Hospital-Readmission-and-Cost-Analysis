🏥 Hospital Readmission & Cost Leakage Analysis

📊 Healthcare Data Analytics Project using Python, PostgreSQL & Power BI
</div>
📌 Project Overview

This project focuses on analyzing hospital patient data to identify factors responsible for patient readmissions and healthcare cost leakage.

The analysis helps understand:

High-risk patient groups
Readmission patterns
Emergency visit behavior
Length of hospital stay
Financial impact on hospitals

The project was completed using Python, PostgreSQL, and Power BI for data cleaning, SQL analysis, exploratory data analysis (EDA), and dashboard visualization.

🎯 Objectives

✔ Analyze hospital readmission trends
✔ Identify high-risk patients
✔ Study factors affecting healthcare expenses
✔ Analyze healthcare cost leakage using estimated costs
✔ Create interactive dashboards for insights

🛠 Tools & Technologies
Technology	Purpose
Python (NumPy, Pandas)	Data Cleaning & EDA
PostgreSQL	SQL Queries & Analysis
Power BI	Dashboard Visualization
Jupyter Notebook / PyCharm	Development Environment
📂 Dataset Information

The dataset contains hospital patient records including:

👤 Patient demographics
🏥 Admission details
🚑 Emergency visit frequency
⏳ Time spent in hospital
🔁 Readmission status
🩺 Medical conditions
💰 Estimated treatment cost
💸 Cost Leakage Methodology

The dataset did not contain direct hospital cost leakage values, so estimated costs were used to calculate healthcare expenses based on specific criteria. These calculated values were then used to analyze overall healthcare cost leakage.

📌 Cost Components Calculated
🔁 Readmission Cost

Estimated costs assigned to patients marked as readmitted.

⏳ Excess Length of Stay Cost

Additional costs calculated for patients whose hospital stay exceeded a defined threshold.

🚑 Emergency Visit Cost

Estimated emergency-related expenses assigned to patients with frequent emergency visits.

💰 Total Cost Leakage Analysis

Total healthcare cost leakage was analyzed by combining:

Readmission cost
Excess stay cost
Emergency visit cost

This helped estimate the financial impact of:

Repeated admissions
Extended hospital stays
High emergency dependency
⚙ Project Workflow

1️⃣ Data Collection
Imported CSV dataset into Python and PostgreSQL

2️⃣ Data Cleaning
Checked missing values
Removed unnecessary columns
Handled duplicates
Standardized data formats

3️⃣ Exploratory Data Analysis (EDA)

Performed analysis on:

Readmission trends
Risk categorization
Hospital stay duration
Emergency visits
Cost leakage patterns

4️⃣ SQL Analysis (PostgreSQL)

Used SQL queries for:

Risk classification
Cost calculations
Readmission percentage analysis
High-cost patient identification
Aggregation and filtering operations

5️⃣ Dashboard Creation (Power BI)

Created interactive dashboards to visualize:

📊 Readmission analysis
⚠ Patient risk levels
💰 Cost leakage insights
🚑 Emergency visit trends
🏥 Hospital stay analysis
📈 Key Insights

✅ Patients with longer hospital stays generated higher estimated costs

✅ Frequent emergency visits increased healthcare expenses

✅ High-risk patients contributed significantly to total cost leakage

✅ Readmission cases created additional financial burden on hospitals

🚀 Future Improvements
Predictive model for patient readmission
Advanced healthcare cost prediction
Real-time dashboard integration
Automated patient risk scoring system

👩‍💻 Author
Neha
