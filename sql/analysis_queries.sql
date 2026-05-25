-- ============================================
-- AMAZON SALES ANALYSIS PROJECT - SQL QUERIES
-- ============================================

-- DATABASE CREATION
CREATE DATABASE AmazonSalesAnalysis;

USE AmazonSalesAnalysis;

-- ============================================
-- TABLE CREATION
-- ============================================

CREATE TABLE amazon_sales (
    product_id INT,
    product_name VARCHAR(255),
    category VARCHAR(100),
    sales_amount DECIMAL(10,2),
    quantity_sold INT,
    review_count INT,
    rating DECIMAL(3,2),
    order_date DATE,
    quarter VARCHAR(10),
    month_name VARCHAR(20),
    week_number INT
);

-- ============================================
-- 1. TOTAL YTD SALES
-- ============================================

SELECT 
    SUM(sales_amount) AS YTD_Sales
FROM amazon_sales;

-- ============================================
-- 2. TOTAL QTD SALES
-- ============================================

SELECT 
    quarter,
    SUM(sales_amount) AS QTD_Sales
FROM amazon_sales
GROUP BY quarter
ORDER BY quarter;

-- ============================================
-- 3. TOTAL PRODUCTS SOLD
-- ============================================

SELECT 
    SUM(quantity_sold) AS Total_Products_Sold
FROM amazon_sales;

-- ============================================
-- 4. TOTAL REVIEWS
-- ============================================

SELECT 
    SUM(review_count) AS Total_Reviews
FROM amazon_sales;

-- ============================================
-- 5. SALES BY MONTH
-- ============================================

SELECT 
    month_name,
    SUM(sales_amount) AS Monthly_Sales
FROM amazon_sales
GROUP BY month_name
ORDER BY 
FIELD(month_name,
'January','February','March','April',
'May','June','July','August',
'September','October','November','December');

-- ============================================
-- 6. SALES BY WEEK
-- ============================================

SELECT 
    week_number,
    SUM(sales_amount) AS Weekly_Sales
FROM amazon_sales
GROUP BY week_number
ORDER BY week_number;

-- ============================================
-- 7. SALES BY PRODUCT CATEGORY
-- ============================================

SELECT 
    category,
    SUM(sales_amount) AS Total_Sales,
    SUM(quantity_sold) AS Products_Sold,
    SUM(review_count) AS Total_Reviews
FROM amazon_sales
GROUP BY category
ORDER BY Total_Sales DESC;

-- ============================================
-- 8. TOP 5 PRODUCTS BY SALES
-- ============================================

SELECT 
    product_name,
    SUM(sales_amount) AS Total_Sales
FROM amazon_sales
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 5;

-- ============================================
-- 9. TOP 5 PRODUCTS BY REVIEWS
-- ============================================

SELECT 
    product_name,
    SUM(review_count) AS Total_Reviews
FROM amazon_sales
GROUP BY product_name
ORDER BY Total_Reviews DESC
LIMIT 5;

-- ============================================
-- 10. AVERAGE PRODUCT RATING
-- ============================================

SELECT 
    ROUND(AVG(rating),2) AS Avg_Rating
FROM amazon_sales;

-- ============================================
-- 11. BEST SELLING CATEGORY
-- ============================================

SELECT 
    category,
    SUM(sales_amount) AS Total_Sales
FROM amazon_sales
GROUP BY category
ORDER BY Total_Sales DESC
LIMIT 1;

-- ============================================
-- 12. MONTH WITH HIGHEST SALES
-- ============================================

SELECT 
    month_name,
    SUM(sales_amount) AS Highest_Sales
FROM amazon_sales
GROUP BY month_name
ORDER BY Highest_Sales DESC
LIMIT 1;

-- ============================================
-- 13. PRODUCTS WITH LOW RATINGS
-- ============================================

SELECT 
    product_name,
    rating
FROM amazon_sales
WHERE rating < 3
ORDER BY rating ASC;

-- ============================================
-- 14. CATEGORY-WISE AVERAGE RATINGS
-- ============================================

SELECT 
    category,
    ROUND(AVG(rating),2) AS Avg_Category_Rating
FROM amazon_sales
GROUP BY category
ORDER BY Avg_Category_Rating DESC;

-- ============================================
-- 15. SALES CONTRIBUTION PERCENTAGE
-- ============================================

SELECT 
    category,
    ROUND(SUM(sales_amount) * 100 /
    (SELECT SUM(sales_amount) FROM amazon_sales),2)
    AS Sales_Percentage
FROM amazon_sales
GROUP BY category
ORDER BY Sales_Percentage DESC;

-- ============================================
-- 16. RUNNING TOTAL SALES ANALYSIS
-- ============================================

SELECT 
    order_date,
    sales_amount,
    SUM(sales_amount) OVER (
        ORDER BY order_date
    ) AS Running_Total_Sales
FROM amazon_sales;

-- ============================================
-- 17. TOP PERFORMING QUARTER
-- ============================================

SELECT 
    quarter,
    SUM(sales_amount) AS Quarter_Sales
FROM amazon_sales
GROUP BY quarter
ORDER BY Quarter_Sales DESC;

-- ============================================
-- 18. WEEKLY SALES GROWTH
-- ============================================

SELECT 
    week_number,
    SUM(sales_amount) AS Weekly_Sales,
    
    LAG(SUM(sales_amount)) OVER (
        ORDER BY week_number
    ) AS Previous_Week_Sales,

    ROUND(
        (
            SUM(sales_amount) -
            LAG(SUM(sales_amount)) OVER (
                ORDER BY week_number
            )
        ) * 100 /
        LAG(SUM(sales_amount)) OVER (
            ORDER BY week_number
        ),
    2) AS Growth_Percentage

FROM amazon_sales
GROUP BY week_number;

-- ============================================
-- 19. HIGH REVIEW PRODUCTS
-- ============================================

SELECT 
    product_name,
    review_count
FROM amazon_sales
WHERE review_count > 100000
ORDER BY review_count DESC;

-- ============================================
-- 20. FINAL BUSINESS INSIGHTS QUERY
-- ============================================

SELECT 
    category,
    COUNT(product_id) AS Total_Products,
    SUM(sales_amount) AS Revenue,
    AVG(rating) AS Avg_Rating,
    SUM(review_count) AS Reviews
FROM amazon_sales
GROUP BY category
ORDER BY Revenue DESC;
