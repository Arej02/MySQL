CREATE DATABASE IF NOT EXISTS Zomato;
USE Zomato;

SHOW TABLES;

SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM order_details;

 -- 1) Find all users who never ordered:
SELECT * FROM usersmovies
WHERE user_id NOT IN (SELECT DISTINCT(user_id) from orders);

-- 2) Find all the movies made by top 3 directors(in terms of total gross income):
SHOW DATABASES;
USE college;
SHOW TABLES;

SELECT * FROM movies;

SELECT * FROM movies
WHERE director IN (SELECT director FROM movies
ORDER BY gross DESC LIMIT 3);

-- 3) Find all movies of all those actors whos avg rating of
-- movies is >8.5 (take 25000 votes as cutoff)
SELECT * FROM movies
WHERE star in (SELECT star FROM movies
WHERE votes>25000
GROUP BY star
HAVING AVG(score)>8.5);