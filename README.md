# Agriculture Data Analysis Project

An end-to-end Data Analytics project using *Excel, MySQL/SQL, and Power BI* to analyze agricultural production, area, yield, crop performance, seasonal patterns, and state-level performance.
---
## Project Overview

The objective of this project is to transform agricultural data into meaningful business insights using a complete data analytics workflow.

### Project Workflow

*Data Preparation → Excel Analysis → SQL Business Analysis → Power BI Dashboard → Business Insights*

The project demonstrates how raw data can be cleaned, analyzed, transformed, and presented through an interactive business intelligence dashboard.
---
## Tools & Technologies

- *Microsoft Excel* — Data cleaning, formatting and initial analysis
- *MySQL* — Database management and SQL analysis
- *SQL* — Business queries and analytical insights
- *Power BI* — Interactive dashboard and data visualization
- *GitHub* — Project documentation and portfolio presentation

---
## Dataset

The agriculture dataset contains information related to crops, production, cultivated area, yield, states, districts, years and seasons.

### Key Columns

- State
- District
- Crop
- Crop Year
- Season
- Area
- Production
- Production Category
- Yield

The dataset contains:

- *14 States*
- *55 Crops*
- Multiple districts
- Multiple crop years
- Multiple agricultural seasons

---

# 1. Excel Analysis

The project started with data preparation and analysis in Microsoft Excel.

### Work Performed

- Data cleaning
- Data formatting
- Data validation
- Handling data consistency
- Initial analysis
- Summary calculations
- Dashboard preparation

The cleaned dataset was subsequently prepared for SQL and Power BI analysis.

---

# 2. SQL Business Analysis

The cleaned agriculture dataset was imported into MySQL for deeper analysis.

A total of *30 Business Insight questions* were analyzed using SQL.

### Analysis Areas

- Year-wise Production Trend
- State-wise Production
- Crop-wise Production
- Season-wise Production
- Average Yield Analysis
- Top Performing States
- Top Performing Crops
- Crop Ranking
- State and Crop Performance
- State and Season Performance
- Year-over-Year Production Analysis
- Production vs Yield Analysis
- Production Consistency
- Production Risk
- Production Share Analysis

### SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- HAVING
- Aggregate Functions
- CASE
- COALESCE
- NULLIF
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- ROW_NUMBER()
- LAG()
- Standard Deviation
- Coefficient of Variation

---

# 3. Power BI Dashboard

The final Power BI dashboard contains three analytical pages.

---

## Page 1 — Agriculture Production Overview

This page provides a high-level overview of agricultural production.

### KPIs

- *Total Production:* 247,555,894,947
- *Total Area:* 2,684,941,953
- *Average Yield:* 75.39
- *Total Crops:* 55
- *Total States:* 14

### Visualizations

- Total Production by Crop Year
- Total Production by State
- Total Production by Crop
- Total Production by Season

---

## Page 2 — Agriculture Performance Analysis

This page focuses on comparative performance analysis.

### Visualizations

- Average Yield by State
- Crop Performance Analysis
- Total Production by Season
- Production by State and Season

### Interactive Filters

- Season
- Crop Year
- State
- Crop

The dashboard supports interactive filtering and cross-filtering between visuals.

---

## Page 3 — Agriculture Business Insights

This page focuses on business-oriented agricultural insights.

### Visualizations

- Top 5 Crops by Average Yield
- Area Distribution by Season
- Total Production by Production Category
- Top 5 Crops by Total Production

---

# 4. Key Business Insights

### Crop Production Concentration

The analysis shows that agricultural production is highly concentrated among certain crops, with Coconut having a very large contribution to total recorded production.

### Seasonal Production Distribution

The Whole Year category represents the dominant share of recorded production in the dataset.

### State-Level Variation

Production varies considerably across states, highlighting differences in agricultural output between regions.

### Crop Performance

Crop performance changes significantly when production, cultivated area and yield are analyzed together.

### Multi-Dimensional Analysis

Combining State, Crop, Season, Area, Production and Yield provides a more complete view than analyzing production totals alone.

---

# 5. Dashboard Interactivity

The Power BI dashboard includes interactive slicers and visual cross-filtering.

Users can:

- Filter by Season
- Filter by Crop Year
- Filter by State
- Filter by Crop
- Select individual data points
- Analyze corresponding changes in KPIs and visuals

This allows users to explore the data dynamically.

---

# 6. Skills Demonstrated

- Data Cleaning
- Data Preparation
- Microsoft Excel
- SQL Querying
- MySQL
- Exploratory Data Analysis
- Business Intelligence
- Power BI
- Data Visualization
- KPI Development
- Business Insight Generation
- Analytical Thinking
- Dashboard Design

---

# 7. Project Structure

```text
Agriculture-Data-Analysis/
│
├── Excel/
│   └── Cleaned Agriculture Dataset
│
├── SQL/
│   └── Business Insights Queries
│
├── PowerBI/
│   └── Agriculture Dashboard
│
├── Screenshots/
│   ├── Page 1 - Agriculture Production Overview
│   ├── Page 2 - Agriculture Performance Analysis
│   └── Page 3 - Agriculture Business Insights
│
└── README.md

---

# 8. Project Outcome

This project demonstrates an end-to-end Data Analytics workflow, starting from data preparation in Excel, moving through SQL-based business analysis, and finally presenting the results through an interactive Power BI dashboard.
The project combines technical skills with business-oriented analytical thinking to convert agricultural data into meaningful insights.

Author
Deepak

Data Analytics Portfolio Project
