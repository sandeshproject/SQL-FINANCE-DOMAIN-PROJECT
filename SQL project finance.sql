SELECT *FROM pizza_sales
SELECT SUM(total_price) as Total_Revenue from pizza_sales

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) as Avg_order_value FROM pizza_sales 

SELECT SUM(quantity) as Total_Pizza_sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_orders from pizza_sales

SELECT CAST(SUM(quantity) AS DECIMAL (10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS AVG_PIZZA_PER_ORDER FROM pizza_sales
-------------------------------------------------------------------------------------------DAILY TRENDS
SELECT DATENAME(DW,order_date) as order_day, COUNT (DISTINCT order_id) AS TOTAL_ORDERS FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
-------------------------------------------------------------------------------------------HOURLY TRENDS
SELECT DATEPART (HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales GROUP BY DATEPART (HOUR, order_time) ORDER BY DATEPART (HOUR, order_time)

SELECT pizza_category, SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS PERCENTAGE_PER_CATEGORY
FROM pizza_sales GROUP BY pizza_category

SELECT pizza_size , SUM(total_price) AS Total_sales, CAST(SUM (total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_category,SUM(quantity) AS total_pizzas_sold
FROM pizza_sales GROUP BY pizza_category

SELECT TOP 5 pizza_name, SUM (quantity) AS total_pizzass_sold 
FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY SUM(quantity) DESC
