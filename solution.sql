CREATE DATABASE StudentNormalization;
USE StudentNormalization;

-- Create Faculty table
CREATE TABLE Faculty (
    FacultyName VARCHAR(100) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Create Course table
CREATE TABLE Course (
    CourseName VARCHAR(100) PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    FOREIGN KEY (FacultyName)
        REFERENCES Faculty(FacultyName)
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    FOREIGN KEY (CourseName)
        REFERENCES Course(CourseName)
);

-- Insert sample data
INSERT INTO Faculty (FacultyName, DepartmentName)
VALUES
('Ravi', 'Computer Science'),
('Meena', 'Computer Science');

INSERT INTO Course (CourseName, FacultyName)
VALUES
('BCA', 'Ravi'),
('BSc CS', 'Meena');

INSERT INTO Student (StudentID, StudentName, CourseName)
VALUES
(101, 'Arun', 'BCA'),
(102, 'Priya', 'BSc CS'),
(103, 'Kiran', 'BCA');

-- Display normalized student information
SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName,
    f.FacultyName,
    f.DepartmentName
FROM Student s
JOIN Course c
    ON s.CourseName = c.CourseName
JOIN Faculty f
    ON c.FacultyName = f.FacultyName;

