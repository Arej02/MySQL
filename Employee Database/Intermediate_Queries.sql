USE employee;
SHOW TABLES;
SELECT * FROM Worker;
-- Q-1. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM worker 
WHERE Department='Admin'; 
-- Q-2. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM worker
WHERE FirstName LIKE '%a%';
-- Q-3. Write an SQL query to print details of the Workers whose SALARY lies between 7000 and 9000.
SELECT * FROM worker
WHERE Salary BETWEEN 6000 AND 7000;
-- Q-4. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT Department,COUNT(*) AS 'NumberOfAdmins' FROM worker
WHERE Department="Admin";
-- Q-5. Write an SQL query to show all departments along with the number of people in there.
SELECT Department,COUNT(*) AS 'Count' FROM worker
GROUP BY Department;