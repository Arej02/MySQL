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

-- 4) Find the most profitable movie of each year:
SELECT * FROM movies 
WHERE (year,gross-budget) IN (SELECT year,MAX(gross-budget) 
FROM movies GROUP BY year);

-- 5)Find the highest rated movies of each genre votes cutoff of
-- 25000
SELECT * FROM movies
WHERE (genre,score) IN
(SELECT genre,MAX(score) FROM movies
WHERE votes>25000
GROUP BY genre) AND votes>25000;

-- 6)Find the highest grossing movies of top 5 actor/director combo
-- in terms of total gross income 
SELECT * FROM movies
WHERE (star,gross) IN
(SELECT star,SUM(gross) FROM movies
GROUP BY star ORDER BY SUM(gross) DESC LIMIT 5);
