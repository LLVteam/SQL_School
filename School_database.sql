CREATE DATABASE School;

USE School;

CREATE TABLE Teachers (
	Teacher_ID INT NOT NULL,
	Name VARCHAR(50),
	Years_at_school INT,
	Salary INT
);

INSERT INTO Teachers
(Teacher_ID, Name, Years_at_school, Salary)
VALUES
(1, 'Sarah', 6, 3500),
(2, 'Jacob', 2, 1500),
(3, 'Roger', 9, 4000),
(4, 'Pamela', 1, 1000),
(5, 'Andrew', 3, 2000);

CREATE TABLE Courses (
	Course_ID CHAR(3) NOT NULL,
    Course_Name VARCHAR(18) NOT NULL,
    Department VARCHAR(20),
    Teacher_ID INT NOT NULL,
    Day VARCHAR(10),
    Schedule TIME,
    Class_length INT,
    Class_GPA INT
);

INSERT INTO Courses
(Course_ID, Course_Name, Department, Teacher_ID, Day, Schedule, Class_length, Class_GPA)
VALUES
('B01', 'Biology', 'Science', 3, 'Tuesday', 10, 1, 8.72),
('B02', 'Biology', 'Science', 3, 'Monday', 12, 2, 6.35),
('C01', 'Chemistry', 'Science', 5, 'Thusday', 10, 1, 7.30),
('C02', 'Chemistry', 'Science', 5, 'Thursday', 11, 1, 5.49),
('L01', 'Spanish', 'Languages', 3, 'Wednesday', 14, 2, 9.22),
('L02', 'French', 'Languages', 2, 'Tuesday', 9, 2, 8.33),
('L03', 'German', 'Languages', 4, 'Friday', 10, 1, 5.43),
('M01', 'Maths', 'Science', 5, 'Friday', 12, 3, 7.29),
('M02', 'Further Maths', 'Science', 5, 'Monday', 10, 1, 6.72),
('P01', 'Physics', 'Science', 5, 'Tuesday', 9, 1, 7.93),
('P02', 'Physics', 'Science', 5, 'Wednesday', 10, 2, 8.89),
('E01', 'Economics', 'Humanities', 4, 'Friday', 14, 2, 6.14),
('H01', 'History', 'Humanities', 1, 'Tuesday', 9, 1, 7.32),
('G02', 'Geography', 'Humanities', 5, 'Wednesday', 9, 1, 5.35),
('S01', 'Sports', 'Sports', 1, 'Thursday', 13, 1, 8.04),
('S02', 'Sports', 'Sports', 1, 'Thursday', 14, 1, 8.36);

CREATE TABLE Extracurriculars (
	Activity_ID INT,
    Act_Name VARCHAR(15),
    Category VARCHAR(10),
    Teacher_ID INT,
    Day VARCHAR(10)
);

INSERT INTO Extracurriculars 
(Activity_ID, Act_Name, Category, Teacher_ID, Day)
VALUES 
(011, 'Athletics', 'Sports', 1, 'Thursday'),
(012, 'Football', 'Sports', 1, 'Tuesday'),
(013, 'Basketball', 'Sports', 5, 'Monday'),
(014, 'Tennis', 'Sports', 5, 'Wednesday'),
(021, 'Singing', 'Music', 1, 'Friday'),
(022, 'Piano', 'Music', 4, 'Tuesday'),
(023, 'Guitar', 'Music', 4, 'Thursday'),
(031, 'Painting', 'Arts', 3, 'Wednesday'),
(032, 'Sculpturing', 'Arts', 4, 'Friday');

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