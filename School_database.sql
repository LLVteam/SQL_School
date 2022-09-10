CREATE DATABASE School;

USE School;

CREATE TABLE Extracurriculars (
	Activity_ID CHAR(3),
    Act_Name VARCHAR(12),
    Category VARCHAR(6),
    N_Students INT,
    Staff_ID INT,
    Day VARCHAR(10)
);

INSERT INTO Extracurriculars 
(Activity_ID, Act_Name, Category, N_Students, Staff_ID, Day)
VALUES 
('011', 'Athletics', 'Sports', '5', '1', 'Thursday'),
('012', 'Football', 'Sports', '8', '1', 'Tuesday'),
('013', 'Basketball', 'Sports', '6', '5', 'Monday'),
('014', 'Tennis', 'Sports', '4', '5', 'Wednesday'),
('021', 'Singing', 'Music', '3', '1', 'Friday'),
('022', 'Piano', 'Music', '7', '4', 'Tuesday'),
('023', 'Guitar', 'Music', '5', '4', 'Thursday'),
('031', 'Painting', 'Arts', '8', '3', 'Wednesday'),
('032', 'Sculpturing', 'Arts', '3', '4', 'Friday');

CREATE TABLE Staff (
	Staff_ID INT NOT NULL,
	Course_ID INT,
	Years_at_school INT,
	Salary INT
);
 
INSERT INTO Staff
(Staff_ID, Course_ID, Years_at_school, Salary)
VALUES
(1, 101, 6, 3500),
(2, 102, 2, 1500),
(3, 103, 9, 4000),
(4, 104, 1, 1000),
(5, 105, 3, 2000);

DROP TABLE Courses ; 

CREATE TABLE Courses (
	Course_ID CHAR(3),
    Course_Name VARCHAR(18),
    Department VARCHAR(20),
    Staff_ID INT NOT NULL,
    N_Students INT,
    Day VARCHAR(10),
    Schedule TIME,
    Class_length INT,
    Year_group INT,
    Class_GPA INT
);

INSERT INTO Courses
(Course_ID, Course_Name, Department, Staff_ID, N_Students, Day, Schedule, Class_length, Year_group, Class_GPA)
VALUES
('B01', 'Biology', 'Science', 3, 7, 'Tuesday', 10, 1, 12, 8.72),
('B02', 'Biology', 'Science', 3, 5, 'Monday', 12, 2, 13, 6.35),
('C01', 'Chemistry', 'Science', 5, 4, 'Thusday', 10, 1, 12, 7.30),
('C02', 'Chemistry', 'Science', 5, 4, 'Thursday', 11, 1, 13, 5.49),
('L01', 'Spanish', 'Languages', 3, 3, 'Wednesday', 14, 2, 12, 9.22),
('L02', 'French', 'Languages', 2, 5, 'Tuesday', 9, 2, 13, 8.33),
('L03', 'German', 'Languages', 4, 2, 'Friday', 10, 1, 12, 5.43),
('M01', 'Maths', 'Science', 5, 10, 'Friday', 12, 3, 12, 7.29),
('M02', 'Further Maths', 'Science', 5, 4, 'Monday', 10, 1, 13, 6.72),
('P01', 'Physics', 'Science', 5, 3, 'Tuesday', 9, 1, 12, 7.93),
('P02', 'Physics', 'Science', 5, 5, 'Wednesday', 10, 2, 13, 8.89),
('E01', 'Economics', 'Humanities', 4, 3, 'Friday', 14, 2, 12, 6.14),
('H01', 'History', 'Humanities', 1, 3, 'Tuesday', 9, 1, 12, 7.32),
('G02', 'Geography', 'Humanities', 5, 2, 'Wednesday', 9, 1, 13, 5.35),
('S01', 'Sports', 'Sports', 1, 5, 'Thursday', 13, 1, 12, 8.04),
('S02', 'Sports', 'Sports', 1, 6, 'Thursday', 14, 1, 13, 8.36);

CREATE TABLE Students (
	Student_ID INT NOT NULL,
    Name VARCHAR(10),
    Family_ID CHAR(3),
    Year_group INT,
    GPA INT,
    DOB DATE,
    Merits INT,
    Suspensions INT,
    Bus_ID CHAR(2),
    School_meals BOOLEAN
);

CREATE TABLE Family (
	Family_ID CHAR(3),
    Surname VARCHAR(10),
    N_Kids INT,
    Contact_Number CHAR(11),
    Address VARCHAR(50),
    Total_fees INT
);

CREATE TABLE Bus (
	Bus_ID CHAR(2),
    N_Students INT,
    Area_Code CHAR(4),
    Departure TIME,
    Arrival TIME
);

CREATE TABLE Fees (
	Fee_id CHAR(3),
    Category VARCHAR(10),
    Bus_ID CHAR(2),
    Activity_ID CHAR(3),
    Price CHAR(5)
);