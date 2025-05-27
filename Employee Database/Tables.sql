SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS employee;
USE employee;

CREATE TABLE Worker(
	WorkerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Salary INT NOT NULL,
    DateOfJoining timestamp NOT NULL,
    Department varchar(50) NOT NULL
);

INSERT INTO Worker(FirstName,LastName,Salary,DateOfJoining,Department) 
VALUES('Arya','Khadka',6000,'2025-06-01 09:00:00','IT');
INSERT INTO Worker(FirstName,LastName,Salary,DateOfJoining,Department) 
VALUES('Kausalya','Khadka',8000,'2024-06-01 02:00:00','HR');
INSERT INTO Worker(FirstName,LastName,Salary,DateOfJoining,Department) 
VALUES('Rajendra','Khadka',7000,'2024-09-04 05:00:00','Admin');
INSERT INTO Worker(FirstName,LastName,Salary,DateOfJoining,Department) 
VALUES('Tanya','Khadka',7000,'2025-06-04 02:00:00','Accountant');
INSERT INTO Worker(FirstName,LastName,Salary,DateOfJoining,Department) 
VALUES('Govinda','Tharu',7000,'2025-10-04 02:00:00','IT');
INSERT INTO Worker(FirstName,LastName,Salary,DateOfJoining,Department) 
VALUES('Gaurav','Rawal',4000,'2025-1-04 02:00:00','Admin');

UPDATE worker SET Salary=5000 WHERE FirstName='Govinda';


SELECT * FROM Worker;

CREATE TABLE Bonus(
	Worker_Ref_ID INT,
    BonusAmount INT,
    BonusDate TIMESTAMP,
    FOREIGN KEY(Worker_Ref_ID) REFERENCES Worker(WorkerID) ON DELETE CASCADE
);

INSERT INTO Bonus 
	(Worker_Ref_ID,BonusAmount, BonusDate) VALUES
		(1, 5000, '16-02-20'),
		(2, 3000, '16-06-11'),
		(3, 4000, '16-02-20'),
		(4, 4500, '16-02-20'),
		(5, 3500, '16-06-11'),
        (1, 4500, '16-02-20');
        
SELECT * FROM Bonus;

CREATE TABLE Title (
	Worker_Ref_ID INT,
	WorkerTitle VARCHAR(25),
	AffectedFrom TIMESTAMP,
	FOREIGN KEY (Worker_Ref_ID) REFERENCES Worker(WorkerID)
	ON DELETE CASCADE
);

INSERT INTO Title 
(Worker_Ref_ID, WorkerTitle, AffectedFrom) VALUES
 (1, 'Manager', '2016-02-20 00:00:00'),
 (2, 'Executive', '2016-06-11 00:00:00'),
 (5, 'Manager', '2016-06-11 00:00:00'),
 (4, 'Asst. Manager', '2016-06-11 00:00:00'),
 (3, 'Lead', '2016-06-11 00:00:00');
        