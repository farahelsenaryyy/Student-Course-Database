CREATE TABLE Student (
 Student_ID NUMBER PRIMARY KEY,
 First_Name VARCHAR2(50),
 Last_Name VARCHAR2(50),
 Email VARCHAR2(100),
 Phone_Number VARCHAR2(15),
 Major VARCHAR2(50)
);
CREATE TABLE Course (
 Course_ID NUMBER PRIMARY KEY,
 Course_Name VARCHAR2(100),
 Course_Code VARCHAR2(10),
 Credits NUMBER,
 Department VARCHAR2(50)
);
CREATE TABLE Instructor (
 Instructor_ID NUMBER PRIMARY KEY,
 First_Name VARCHAR2(50),
 Last_Name VARCHAR2(50),
 Email VARCHAR2(100),
 Department VARCHAR2(50)
);
CREATE TABLE Enrollment (
 Enrollment_ID NUMBER PRIMARY KEY,
 Student_ID NUMBER,
 Course_ID NUMBER,
 Semester VARCHAR2(20),
 Grade CHAR(2),
 CONSTRAINT FK_Student FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
 CONSTRAINT FK_Course FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);
INSERT INTO Student VALUES (1, 'Farah', 'Elsenary', 'farah.elsenary@example.com',
'022334455', 'Computer Science');
INSERT INTO Student VALUES (2, 'Farida', 'Magdy', 'farida.magdy@example.com',
'098787654', 'Engineering');
INSERT INTO Student VALUES (3, 'Yassin', 'Elkattan', 'yassin.elkattan@example.com',
'11223344', 'Business Administration');
INSERT INTO Student VALUES (4, 'Jana', 'Sultan', 'jana.sultan@example.com',
'22334466', 'Physics');
INSERT INTO Student VALUES (5, 'Mays', 'Mohamed', 'mays.mohamed@example.com',
'33445677', 'Mathematics');
INSERT INTO Student VALUES (6, 'Khalid', 'Hamouda', 'khalid.hamouda@example.com',
'44557788', 'Computer Science');
INSERT INTO Student VALUES (7, 'Ali', 'Mekawy', 'ali.mekawy@example.com',
'55667899', 'Engineering');
INSERT INTO Student VALUES (8, 'Salma', 'Atef', 'salma.atef@example.com',
'66778900', 'Physics');
INSERT INTO Student VALUES (9, 'Nour', 'Farouk', 'nour.farouk@example.com',
'77880011', 'Mathematics');
INSERT INTO Student VALUES (10, 'Dalia', 'Mohamed', 'dalia.mohamed@example.com',
'88991122', 'Computer Science');
INSERT INTO Course VALUES (1, 'Database Systems', 'DB101', 4, 'Computer Science');
INSERT INTO Course VALUES (2, 'Data Structures', 'CS102', 3, 'Computer Science');
INSERT INTO Course VALUES (3, 'Engineering Mathematics', 'EM201', 3,
'Engineering');
INSERT INTO Course VALUES (4, 'Thermodynamics', 'EN301', 3, 'Engineering');
INSERT INTO Course VALUES (5, 'Business Analytics', 'BA401', 3, 'Business
Administration');
INSERT INTO Course VALUES (6, 'Quantum Mechanics', 'PH501', 4, 'Physics');
INSERT INTO Course VALUES (7, 'Linear Algebra', 'MA601', 3, 'Mathematics');
INSERT INTO Course VALUES (8, 'Artificial Intelligence', 'CS702', 4, 'Computer
Science');
INSERT INTO Course VALUES (9, 'Statistics', 'MA703', 3, 'Mathematics');
INSERT INTO Course VALUES (10, 'Fluid Dynamics', 'EN804', 4, 'Engineering');
INSERT INTO Instructor VALUES (1, 'Abeer', 'Farouk', 'abeer.farouk@example.com',
'Computer Science');
INSERT INTO Instructor VALUES (2, 'Bassam', 'Wasfi', 'bassam.wasfi@example.com',
'Engineering');
INSERT INTO Instructor VALUES (3, 'Motasem', 'Elshourbagy',
'motasem.elshourbagy@example.com', 'Physics');
INSERT INTO Instructor VALUES (4, 'Ibrahim', 'Youssef',
'ibrahim.youssef@example.com', 'Mathematics');
INSERT INTO Instructor VALUES (5, 'Nour', 'Zawawi', 'nour.zawawi@example.com',
'Business Administration');
INSERT INTO Instructor VALUES (6, 'Basil', 'Darwish', 'basil.darwish@example.com',
'Engineering');
INSERT INTO Instructor VALUES (7, 'Mai', 'Refaat', 'mai.refaat@example.com',
'Computer Science');
INSERT INTO Instructor VALUES (8, 'Hend', 'Mahmoud', 'hend.mahmoud@example.com',
'Physics');
INSERT INTO Instructor VALUES (9, 'Rasha', 'Nabil', 'rasha.nabil@example.com',
'Mathematics');
INSERT INTO Instructor VALUES (10, 'Mohamed', 'Salama',
'mohamed.salama@example.com', 'Engineering');
INSERT INTO Enrollment VALUES (1, 1, 1, 'Fall 2024', 'A');
INSERT INTO Enrollment VALUES (2, 1, 2, 'Fall 2024', 'B');
INSERT INTO Enrollment VALUES (3, 2, 3, 'Fall 2024', 'B');
INSERT INTO Enrollment VALUES (4, 2, 4, 'Fall 2024', 'C');
INSERT INTO Enrollment VALUES (5, 3, 5, 'Fall 2024', 'A');
INSERT INTO Enrollment VALUES (6, 4, 6, 'Fall 2024', 'A');
INSERT INTO Enrollment VALUES (7, 5, 7, 'Fall 2024', 'B');
INSERT INTO Enrollment VALUES (8, 6, 8, 'Fall 2024', 'A');
INSERT INTO Enrollment VALUES (9, 7, 9, 'Fall 2024', 'C');
INSERT INTO Enrollment VALUES (10, 8, 10, 'Fall 2024', 'B');
SELECT First_Name, Last_Name, Major FROM Student;
SELECT Course_Name FROM Course WHERE Department = 'Computer Science';
SELECT * FROM Enrollment WHERE Semester = 'Fall 2024';
SELECT Major, COUNT(*) AS Student_Count FROM Student GROUP BY Major;
SELECT Course_Name
FROM Course
JOIN Instructor ON Course.Department = Instructor.Department
WHERE Instructor.First_Name = 'Rasha' AND Instructor.Last_Name = 'Nabil';
SELECT S.First_Name, S.Last_Name
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
WHERE E.Course_ID = 1;
SELECT AVG(CASE Grade WHEN 'A' THEN 4 WHEN 'B' THEN 3 ELSE 0 END) AS Avg_Grade
FROM Enrollment
WHERE Course_ID = 1;
SELECT C.Course_Name, COUNT(E.Enrollment_ID) AS Enrollment_Count
FROM Course C
LEFT JOIN Enrollment E ON C.Course_ID = E.Course_ID
GROUP BY C.Course_Name;
SELECT S.First_Name, S.Last_Name, SUM(C.Credits) AS Total_Credits
FROM Student S
JOIN Enrollment E ON S.Student_ID = E.Student_ID
JOIN Course C ON E.Course_ID = C.Course_ID
WHERE S.Student_ID = 1
GROUP BY S.First_Name, S.Last_Name;
SELECT First_Name, Last_Name FROM Instructor WHERE Department = 'Engineering';
