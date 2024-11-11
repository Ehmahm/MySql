CREATE DATABASE cLASSROOM;
USE Classroom;

CREATE TABLE Courses(
    Coursecode INT
    Programme VARCHAR
    Courseyear INT
    Courseunit VARCHAR

);

ALTER TABLE Courses;


INSERT INTO Courses ('Coursecode','Programme','Courseyear','Courseunit')
VALUES ('1001','Data Science','1','Database'),
       ('1002','Computer Science','1','Web programming')
       ('1003','');
       ()

CREATE VIEW STUDENT_1 AS
SELECT Coursename,Courseyear,Courseunit
FROM Courses
WHERE Courseyear = "1";