SHOW DATABASES;
USE college;

SHOW TABLES;
SELECT * FROM employee;

-- For each location, what is the count of each employee and avg salary of the employess in those location
SELECT Location,COUNT(*),AVG(Salary) FROM employee
GROUP BY Location;

-- For each location, what is the count of each employee and avg salary of the employess in those location,but also their first  name and last name
SELECT FirstName,LastName,Location,
COUNT(Location) OVER(PARTITION BY Location),
AVG(SALARY) OVER(PARTITION BY Location)
FROM employee;

-- Row number:
SELECT *,RANK() OVER(ORDER BY Salary) FROM employee;

-- Give the record of the employee having the second highest salary:
SELECT * FROM
(SELECT * ,RANK() OVER(ORDER BY Salary) AS priority_emp
FROM employee)  AS temp
WHERE priority_emp=2;

-- Specify the details of highest salary people in each location:
SELECT * FROM(SELECT *,ROW_NUMBER() OVER(PARTITION BY Location ORDER BY Salary) AS priority_emp
FROM employee) AS temp
WHERE priority_emp=1;

