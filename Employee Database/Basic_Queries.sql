USE employee;
SHOW TABLES;
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>  in upper case.
SELECT UPPER(FirstName) AS 'WORKER_NAME' FROM worker;

-- Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT(Department) AS 'Posts' FROM worker;

-- Q-3. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(FirstName,1,3) FROM worker;

-- Q-4. Write an SQL query to find the position of the alphabet (‘y’) in the first name column ‘Arya’ from Worker table.
SELECT INSTR(FirstName,'y') FROM worker
WHERE FirstName='Arya'; 

