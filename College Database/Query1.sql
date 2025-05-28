CREATE DATABASE IF NOT EXISTS College;

SHOW databases;
USE College;

CREATE TABLE Courses(
	CourseID INT AUTO_INCREMENT,
    CourseName VARCHAR(50) NOT NULL,
    Duration INT NOT NULL,
    Fees INT NOT NULL,
    PRIMARY KEY(CourseID)
);

INSERT INTO Courses (CourseName, Duration, Fees) VALUES
('Web Development', 12, 1200),
('Data Science with Python', 10, 1500),
('Cloud Computing Fundamentals', 8, 1000),
('Machine Learning & AI', 14, 1800),
('Cybersecurity Basics', 6, 900);

SELECT * FROM Courses;

SHOW TABLES;

CREATE TABLE Students(
	StudentID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    EmailID VARCHAR(50),
    EnrolledDate TIMESTAMP NOT NULL,
    SelectedCourses INT NOT NULL,
    Expereience INT NOT NULL,
    Company VARCHAR(50),
    SourceOfJoining VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    BatchStartDate TIMESTAMP NOT NULL,
    PRIMARY KEY(StudentID),
    UNIQUE KEY(EmailID),
    FOREIGN KEY(SelectedCourses) REFERENCES Courses(CourseID)
);

INSERT INTO Students (
    FirstName, LastName, PhoneNumber, EmailID, EnrolledDate, SelectedCourses,
    Expereience, Company, SourceOfJoining, Location, BatchStartDate
) VALUES (
    'Alice', 'Johnson', '1234567890', 'alice.johnson@example.com', CURRENT_TIMESTAMP,
    1, 2, 'TechCorp', 'Online Advertisement', 'New York', '2025-06-01 09:00:00'
);

INSERT INTO Students (
    FirstName, LastName, PhoneNumber, EmailID, EnrolledDate, SelectedCourses,
    Expereience, Company, SourceOfJoining, Location, BatchStartDate
) VALUES (
    'Bob', 'Smith', '0987654321', 'bob.smith@example.com', CURRENT_TIMESTAMP,
    2, 0, NULL, 'Friend Referral', 'San Francisco', '2025-06-10 10:00:00'
);

INSERT INTO Students (
    FirstName, LastName, PhoneNumber, EmailID, EnrolledDate, SelectedCourses,
    Expereience, Company, SourceOfJoining, Location, BatchStartDate
) VALUES (
    'Clara', 'Lee', '5551234567', 'clara.lee@example.com', CURRENT_TIMESTAMP,
    2, 5, 'GlobalSoft', 'LinkedIn', 'Chicago', '2025-06-15 11:00:00'
);

SELECT * FROM Students;


CREATE TABLE employee(
	EmpID		int AUTO_INCREMENT,
	FirstName	varchar(50) NOT NULL,
    LastName	varchar(50) NOT NULL,
    Age			INT NOT NULL,
    Salary		INT NOT NULL,
    Location	varchar(50) NOT NULL,
    PRIMARY KEY(EmpID)
);

INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Priya", "Bhatia", 26, 100000, "Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Sumedha", "Midha", 32, 50000, "Gurugram");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Rashmi", "Tanwar", 30, 20000, "Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Shivam", "Mishra", 28, 10000, "Noida");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Ajay", "Bhatia", 25, 5000, "Mumbai");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Ankit", "Sangwan", 34, 70000, "Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Alia", "Bhatt", 29, 50000, "Gurugram");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Jitendra", "Mishra", 31, 50000, "Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Sanya", "Bhatt", 29, 70000, "Gurugram");

SELECT * FROM employee;


-- Data Analysis:
-- 1. The record of the employee with highest salary:
SELECT * FROM employee
ORDER BY Salary DESC 
LIMIT 1;

-- 2. The record of the employee with highest salary and age>30:
SELECT * FROM employee
WHERE age>30
ORDER BY Salary DESC 
LIMIT 1;

-- 3. Number of enrollemnets in the website college:
SELECT COUNT(*) as num_of_enrollments FROM Students;

-- 4. Display the number of enrollments for courseid=2:
SELECT COUNT(*) as num_of_enrollements_data_science
FROM Students
WHERE SelectedCourses=2;

-- 5. Number of people enrolled in May month:
SELECT COUNT(*) FROM Students
WHERE EnrolledDate LIKE '%-05-%';

-- 6.Update Bobs experience as 2 and company to "Google":
UPDATE Students SET Expereience=2,Company='Google'
WHERE StudentID=4;
