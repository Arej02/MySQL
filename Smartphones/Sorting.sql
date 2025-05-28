SHOW DATABASES;
USE practise;
SHOW TABLES;

SELECT * FROM smartphones;

-- 1) Find the top 5 samsung phones with biggest screen:
SELECT * FROM smartphones
WHERE brand_name='samsung'
ORDER BY screen_size DESC LIMIT 5;

-- 2) Find the phone with the second largest battery:
SELECT model,battery_capacity FROM smartphones
ORDER BY battery_capacity DESC LIMIT 1,1; -- Starting from 2nd row take 1

-- 3) Find the name and rating of the worst rated apple phone:
SELECT model,rating FROM smartphones 
WHERE brand_name='apple'
ORDER BY rating LIMIT 1;

-- 4) Sort Phones alphabetically and then on the basic of rating in desc order:
SELECT model,rating FROM smartphones 
ORDER BY model ASC,rating DESC;