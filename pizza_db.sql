select * from pizza_sales;

Q1.What is the total revenue?


SELECT SUM(quantity*unit_price) AS Total_revenue
FROM pizza_sales;


Q2.Average Order Value?

SELECT (SUM(quantity*unit_price)/COUNT(DISTINCT order_id)) AS Average_order_value
FROM pizza_sales;

Q3.Total Pizza Sold

SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales;

Q4.Total Order Placed?

SELECT COUNT(DISTINCT order_id) AS Order_placed
FROM pizza_sales;

Q5.Average Pizza Per Order?

SELECT (SUM(quantity)/COUNT(DISTINCT order_id) ) AS Average_pizza_perorder
FROM pizza_sales;

Q6.Extract the order for the day?

SELECT DATENAME(w,order_date) AS Order_day,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(w,order_date)
ORDER BY COUNT(DISTINCT order_id) DESC

Q7.Hourly Trend ?

SELECT DATEPART(hh,order_time) AS Order_hours,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATEPART(hh,order_time)
ORDER BY DATEPART(hh,order_time);

Q8.Percentage of sales by pizza category

SELECT pizza_category,ROUND(SUM(total_price),2) AS pizza_sales,ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS category_percentage_sales
FROM pizza_sales
GROUP BY pizza_category;



Q9.Percentage of sales by pizza size?

SELECT pizza_size,ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS size_percentage_sales
FROM pizza_sales
GROUP BY pizza_size;

Q9.Pizzas sold by category

SELECT pizza_category,SUM(quantity) AS total_sales_percategory
FROM pizza_sales
GROUP BY pizza_category;


Q10.Top 5 best sellers pizza


SELECT TOP 5 pizza_name,SUM(quantity) AS pizza_sold_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;


Q11.TOP 5 Pizza from bottom

SELECT TOP 5 pizza_name,SUM(quantity) AS pizza_sold_name
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity);
