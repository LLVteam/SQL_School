CREATE DATABASE School;

USE School;

CREATE TABLE Extracurriculars (
	Activity_ID CHAR(3),
    Act_Name VARCHAR(12),
    Category VARCHAR(6),
    N_Students INT,
    Staff_ID CHAR(3),
    Day VARCHAR(10)
);

INSERT INTO Extracurriculars 
 (Activity_ID, Act_Name, Category, N_Students, Staff_ID, Day)
 VALUES 
 ('011', 'Athletics', 'Sports', '5', '015', 'Thursday'),
 ('012', 'Football', 'Sports', '8', '015', 'Tuesday'),
 ('013', 'Basketball', 'Sports', '6', '015', 'Monday'),
 ('014', 'Tennis', 'Sports', '4', '015', 'Wednesday'),
 ('021', 'Singing', 'Music', '3', '011', 'Friday'),
 ('022', 'Piano', 'Music', '7', '011', 'Tuesday'),
 ('023', 'Guitar', 'Music', '5', '011', 'Thursday'),
 ('031', 'Painting', 'Arts', '8', '034', 'Wednesday'),
 ('032', 'Sculpturing', 'Arts', '3', '034', 'Friday');

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
 
CREATE TABLE Courses (
	Course_ID INT,
    Course_Name VARCHAR(12),
    Department VARCHAR(20),
    Staff_ID INT NOT NULL,
    N_Students INT,
    Day VARCHAR(10),
    Schedule TIME,
    Class_length INT,
    Year_group INT,
    Class_GPA INT
);

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