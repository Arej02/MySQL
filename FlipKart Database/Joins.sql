CREATE DATABASE IF NOT EXISTS Flipkart;
USE Flipkart;
SHOW TABLES;

SELECT * FROM category;
SELECT * FROM order_details;
SELECT * FROM orders;
SELECT * FROM users;

-- a) Filtering Columns:
-- 1) Find the order_id, name and city by joing users and orders:
SELECT t1.name,t1.city,t2.order_id FROM users t1
JOIN orders t2 
ON t1.user_id=t2.user_id;

-- 2) Find the order_id,product category by joining order_details and category:
SELECT t1.order_id,t2.vertical FROM order_details t1
JOIN category t2
ON t1.category_id =t2.category_id;

-- b) Filtering Rows:
-- 1) Find all the orders placed in Pune:
SELECT * FROM users t1
JOIN orders t2
ON t1.user_id=t2.user_id
WHERE t1.city='Pune';

-- 2) Find all the orders under Chairs category:
SELECT * FROM category t1
JOIN order_details t2
ON t1.category_id=t2.category_id
WHERE t1.vertical='Chairs';

-- Other Practise Question:

-- 1)Find the customer who has placed maximum numbers of orders:
SELECT t1.name,COUNT(*) FROM users t1
JOIN orders t2
ON t1.user_id=t2.user_id
GROUP BY t1.name
ORDER BY COUNT(*) DESC LIMIT 1;

-- 2) Which is the most profitable state:
SELECT state,SUM(PROFIT) as 'profit' FROM users t1
JOIN orders t2
ON t1.user_id=t2.user_id
JOIN order_details t3
ON t2.order_id=t3.order_id
GROUP BY t1.state
ORDER BY SUM(PROFIT) DESC LIMIT 1;

-- 3)Find all the categories with profit higher than 3000:
SELECT vertical,SUM(profit) FROM category t1
JOIN order_details t2
ON t1.category_id=t2.category_id
GROUP BY vertical HAVING SUM(profit)>3000;




