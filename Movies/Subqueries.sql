USE college;
SHOW TABLES;

SELECT * FROM movies;

-- Independent subquery (Scalar Subquery)
-- Find the movie with highest profit
SELECT * FROM movies
WHERE (gross-budget)=(SELECT MAX((gross-budget)) FROM movies);

-- Find the count of above average rating movies:
SELECT COUNT(*) as count FROM movies
WHERE score>(SELECT AVG(score) FROM movies);

-- Find the highest rated movies of 2000:
SELECT * FROM movies 
WHERE year=2000 AND score=(SELECT MAX(score) FROM movies
WHERE year=2000);

-- Find the highest rated movie among all movies whose number of votes are>the dataset avg votes:
SELECT * FROM movies 
WHERE score=(SELECT MAX(score) FROM movies
WHERE votes>(SELECT AVG(votes) FROM movies));


