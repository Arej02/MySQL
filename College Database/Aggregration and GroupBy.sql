SHOW DATABASES;
USE college;
SHOW TABLES;

-- Count the number of students who joined the course via LinkedIn and Friend Referral:
SELECT SourceOfJoining,COUNT(*) FROM Students
GROUP BY SourceOfJoining;

-- For each course how many students have enrolled:
SELECT SelectedCourses,COUNT(*) FROM Students
GROUP BY SelectedCourses;

-- Corresponding to individual source of joining, find the maximum years of expereince any person hold:
SELECT SourceOfJoining,MAX(Expereience) FROM Students
GROUP BY SourceOfJoining;

-- Display the count of students who joined via LinkedIn
SELECT SourceOfJoining,COUNT(*) FROM Students
GROUP BY SourceOfJoining
HAVING SourceOfJoining='LinkedIn';

-- Display all the courses that do noy have "AI"
SELECT * FROM Courses
WHERE CourseName NOT LIKE "%AI%";

-- Display the records of those students who have less than 4 years of expereicne and source of joining in LinkedIn
SELECT * FROM Students
WHERE Expereience<2 AND SourceOfJoining='LinkedIn';

-- Display the records of all the students who have expereince between 1 to 3
SELECT * FROM Students
WHERE Expereience BETWEEN 1 AND 3;

-- ALTER Command
DESC Courses;
ALTER TABLE Courses MODIFY Duration DECIMAL(3,1);
ALTER TABLE Courses MODIFY Changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW();

INSERT INTO Courses(CourseName,Duration,Fees) VALUES ("Introduction to Statistics",5.5,4000);
UPDATE Courses SET Duration=12 WHERE CourseID=4;
UPDATE Courses SET Duration=6.5 WHERE CourseID=5;

SELECT * FROM Courses;