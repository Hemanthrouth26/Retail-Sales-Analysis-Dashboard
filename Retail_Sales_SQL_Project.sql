/*
====================================================
BUSINESS PROBLEM
====================================================

A retail company wants to understand:

1. Which categories generate maximum revenue?
2. Which products generate maximum profit?
3. Which customers contribute most to sales?
4. Which regions and states perform best?
5. Which products cause losses?
6. How discounts affect profitability?

====================================================
*/
CREATE DATABASE retail_sales;
USE retail_sales;

SELECT DATABASE();
USE retail_sales;

SHOW TABLES;
SELECT COUNT(*) AS total_rows
FROM `sample - superstore`;

DESCRIBE `sample - superstore`;

/* Total Sales, Profit & Orders */
SELECT
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM `sample - superstore`;

/* Sales by Category */

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM `sample - superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;

/* Profit by Category */

SELECT
    Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM `sample - superstore`
GROUP BY Category
ORDER BY Total_Profit DESC;

/* Top 10 Customers */

SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

/* Top 10 Products */

SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

/* Sales by Region */

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM `sample - superstore`
GROUP BY Region
ORDER BY Total_Sales DESC;

/* Sales by Region */

SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM `sample - superstore`
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;

/* Loss Making Products */

SELECT
    `Product Name`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM `sample - superstore`
GROUP BY `Product Name`
HAVING Total_Profit < 0
ORDER BY Total_Profit;

/* Average Discount by Category */

SELECT
    Category,
    ROUND(AVG(Discount),2) AS Avg_Discount
FROM `sample - superstore`
GROUP BY Category;

/* Which sub-category generates the highest profit? */

SELECT
    `Sub-Category`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM `sample - superstore`
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;



SELECT
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM `sample - superstore`;


/* Profit Margin by Category */

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM `sample - superstore`
GROUP BY Category
ORDER BY Profit_Margin DESC;

/* Top 5 Cities by Sales */

SELECT
    City,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM `sample - superstore`
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

/* Top Customers by Profit */

SELECT
    `Customer Name`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM `sample - superstore`
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;

/* Segment Analysis */

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM `sample - superstore`
GROUP BY Segment
ORDER BY Total_Sales DESC;

/* Average Order Value */
SELECT
ROUND(
SUM(Sales) /
COUNT(DISTINCT `Order ID`),2
) AS Average_Order_Value
FROM `sample - superstore`;




/*
====================================================
FINAL CONCLUSION
====================================================

1. Total Revenue: $2.27 Million

2. Total Profit: $282.86 Thousand

3. Technology is the highest revenue
   and profit generating category.

4. West region drives maximum sales.

5. California contributes the highest profit.

6. Copiers are the most profitable
   sub-category.

7. Tables and Bookcases negatively
   impact profitability.

8. Furniture receives the highest
   average discount resulting in
   lower profit margins.

Recommendation:

Focus marketing efforts on Technology,
optimize discount policies for Furniture,
and review pricing strategy for loss-making
products.

====================================================
*/