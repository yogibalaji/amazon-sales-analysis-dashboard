# Amazon Sales Analysis Dashboard

## Project Overview

This project is an interactive Amazon Product Sales Analysis Dashboard developed using Power BI to analyze sales performance, customer reviews, product categories, and key business metrics.

The dashboard provides insights into:

- Year-to-Date (YTD) Sales
- Quarter-to-Date (QTD) Sales
- Weekly and Monthly Sales Trends
- Product Category Performance
- Top Selling Products
- Product Review Analysis

The project enables businesses to make data-driven decisions by identifying high-performing products, monitoring sales trends, and understanding customer behavior patterns.

---

## Objectives

- Analyze Amazon product sales data
- Identify top-performing product categories
- Track monthly and weekly sales trends
- Evaluate customer review patterns
- Develop an interactive dashboard for business insights

---

## Tools and Technologies Used

| Tool | Purpose |
|------|----------|
| Power BI | Dashboard Development |
| Excel | Data Source |
| SQL | Data Analysis |
| DAX | KPI Calculations |
| Power Query | Data Cleaning and Transformation |

---

## Dataset Information

The dataset includes:

- Product Categories
- Sales Data
- Product Reviews
- Weekly Sales Records
- Monthly Revenue Data
- Product Performance Metrics

---

## Dashboard Features

### KPI Metrics

- YTD Sales: $2.18M
- QTD Sales: $811.09K
- Products Sold: 28K
- Total Reviews: 19.42M

### Visualizations

- Monthly Sales Trend Analysis
- Weekly Sales Distribution
- Sales by Product Category
- Top 5 Products by YTD Sales
- Top 5 Products by YTD Reviews

### Interactive Filters

- Product Category Filter
- Quarter Selection Filter

---

## Key Business Insights

- Men Shoes generated the highest overall sales revenue.
- Sales performance increased significantly between September and December.
- Products with higher customer reviews demonstrated stronger sales performance.
- Camera and Mobile Accessories categories showed strong quarterly growth.

---

## Dashboard Preview

![Dashboard Preview](images/dashboard.png)

---

## DAX Measures Used

```DAX
YTD Sales = 
TOTALYTD(
    SUM(Sales[Amount]),
    Calendar[Date]
)

QTD Sales = 
TOTALQTD(
    SUM(Sales[Amount]),
    Calendar[Date]
)

Total Reviews = 
SUM(Sales[Reviews])

Products Sold = 
SUM(Sales[Quantity])
SQL Analysis Performed
Sales Trend Analysis
Category-wise Revenue Analysis
Top Product Identification
Review and Rating Analysis
Weekly and Monthly Performance Tracking
KPI Calculations using Aggregate Functions
Window Function Analysis for Growth Trends
Future Enhancements
Integrate forecasting using Power BI AI visuals
Implement real-time data integration
Deploy dashboard using Power BI Service
Add customer segmentation analysis
Create mobile-responsive dashboard views
Repository Structure
amazon-sales-analysis-dashboard/
│
├── data/
├── dashboard/
├── sql/
├── images/
├── docs/
├── README.md
└── LICENSE
Author

Yogi Balaji
Data Analyst | Power BI Developer | SQL Enthusiast
