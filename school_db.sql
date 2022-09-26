-- Create Database -- 
CREATE DATABASE School;

USE School;

-- Create tables -- 

CREATE TABLE Teachers (
	Teacher_ID INT NOT NULL,
	Teacher_Name VARCHAR(50),
	Years_at_school INT,
	Salary INT,
    CONSTRAINT
    PRIMARY KEY (Teacher_ID)
);

CREATE TABLE Courses (
	Course_ID CHAR(3) NOT NULL,
	Course_Name VARCHAR(18) NOT NULL,
	Department VARCHAR(20),
	Teacher_ID INT NOT NULL,
	Day VARCHAR(10),
	Schedule TIME,
	Class_length INT,
	Class_GPA FLOAT,
    CONSTRAINT
	PRIMARY KEY (Course_ID),
	FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID)
);

CREATE TABLE Extracurriculars (
	Activity_ID INT NOT NULL,
	Act_name VARCHAR(15),
	Category VARCHAR(10),
	Teacher_ID INT NOT NULL,
	Day VARCHAR(10),
	CONSTRAINT
	PRIMARY KEY (Activity_ID),
	FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID)
);

CREATE TABLE Family (
	Family_ID CHAR(3) NOT NULL,
	Surname VARCHAR(10),
	N_Kids INT,
	Contact_Number CHAR(11),
	Address VARCHAR(50),
	Total_Fees INT,
	CONSTRAINT
    PRIMARY KEY (Family_ID)
);

CREATE TABLE Students (
	Student_ID INT NOT NULL,
	Name VARCHAR(50),
	Family_ID CHAR(3),
	Year_group INT,
	GPA INT,
	DOB DATE,
	penalties INT,
	status VARCHAR(10),
	Bus_ID CHAR(2),
	School_meals BOOLEAN,
	CONSTRAINT
    PRIMARY KEY (Student_ID),
	FOREIGN KEY (Family_ID) REFERENCES Family(Family_ID),
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID)
);

CREATE TABLE Courses_extracurriculars_students (
	Course_ID CHAR(3),
	Student_ID INT NOT NULL,
	Activity_ID INT,
    CONSTRAINT
	FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
	FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
	FOREIGN KEY (Activity_ID) REFERENCES Extracurriculars(Activity_ID)
);

CREATE TABLE Bus (
	Bus_ID CHAR(2) NOT NULL,
	Area_code VARCHAR(4),
	Departure TIME,
	Arrival TIME,
    CONSTRAINT
	PRIMARY KEY (Bus_ID)
);

CREATE TABLE Fees (
	Fee_ID CHAR(2) NOT NULL,
	Category VARCHAR(10),
	Bus_ID CHAR(2),
	Activity_ID INT,
	Price CHAR(5),
    CONSTRAINT
	PRIMARY KEY (Fee_ID),
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID),
    FOREIGN KEY (Activity_ID) REFERENCES Extracurriculars(Activity_ID)
);


-- POPULATE TABLES -- 

INSERT INTO Teachers
(Teacher_ID, Teacher_Name, Years_at_school, Salary)
VALUES
(1, 'Sarah', 6, 3500),
(2, 'Jacob', 2, 1500),
(3, 'Roger', 9, 4000),
(4, 'Pamela', 1, 1000),
(5, 'Andrew', 3, 2000);

INSERT INTO Courses
(Course_ID, Course_Name, Department, Teacher_ID, Day, Schedule, Class_length, Class_GPA)
VALUES
('B01', 'Biology', 'Science', 3, 'Tuesday', '10:00:00', 1, 8.72),
('B02', 'Biology', 'Science', 3, 'Monday', '12:00:00', 2, 6.35),
('C01', 'Chemistry', 'Science', 5, 'Thusday', '10:00:00', 1, 7.30),
('C02', 'Chemistry', 'Science', 5, 'Thursday', '11:00:00', 1, 5.49),
('L01', 'Spanish', 'Languages', 3, 'Wednesday', '14:00:00', 2, 9.22),
('L02', 'French', 'Languages', 2, 'Tuesday', '9:00:00', 2, 8.33),
('L03', 'German', 'Languages', 4, 'Friday', '10:00:00', 1, 5.43),
('M01', 'Maths', 'Science', 5, 'Friday', '12:00:00', 3, 7.29),
('M02', 'Further Maths', 'Science', 5, 'Monday', '10:00:00', 1, 6.72),
('P01', 'Physics', 'Science', 5, 'Tuesday', '9:00:00', 1, 7.93),
('P02', 'Physics', 'Science', 5, 'Wednesday', '10:00:00', 2, 8.89),
('E01', 'Economics', 'Humanities', 4, 'Friday', '14:00:00', 2, 6.14),
('H01', 'History', 'Humanities', 1, 'Tuesday', '9:00:00', 1, 7.32),
('G02', 'Geography', 'Humanities', 5, 'Wednesday', '9:00:00', 1, 5.35),
('S01', 'Sports', 'Sports', 1, 'Thursday', '13:00:00', 1, 8.04),
('S02', 'Sports', 'Sports', 1, 'Thursday', '14:00:00', 1, 8.36);

INSERT INTO Extracurriculars 
(Activity_ID, Act_name, Category, Teacher_ID, Day)
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

INSERT INTO Family
(Family_ID, Surname, N_Kids, Contact_number, Address, Total_Fees )
VALUES
("F01", "Gonzalez", 3, 45623421, "W5", 2000),
("F02", "Morgan", 1, 45623234, "W8", 900),
("F03", "Megan", 2, 49032019, "W8", 2911),
("F04", "Lee", 2, 45622342, "NW6", 2400),
("F05", "Aspen", 1, 4432123, "IG11", 1982),
("F06", "Blair", 3, 45689432, "W8", 2000),
("F07", "Porte", 1, 409321823, "NW6", 4500),
("F08", "Guerrero", 1, 41234920, "W5", 2334),
("F09", "Colman", 2, 49028371,"IG11", 2893),
("F10", "Vitto", 2, 423482731,"NW6", 1788),
("F11", "Gonzalez", 1, 4367939, "W11",2392),
("F12", "Tori", 1, 41923219, "W5", 2001),
("F13", "Marcus", 2, 43029192,"W11", 1788),
("F14", "Jhonson", 1, 49382912, "SE1",2392),
("F15", "Zannini", 2, 430293819, "SE1", 3029),
("F16", "Gallagher", 1, 43029182,"M60", 1587);

INSERT INTO Students
(Student_ID, Name, Family_ID, Year_group, GPA, DOB, penalties, status, Bus_ID, School_meals)
VALUES 
(1, 'Monica', 'F03', 8, 9.54, "2008-12-07", 0, 'student', "B1", TRUE), 
(2, 'Simon', 'F05', 8, 8.61, "2008-11-03", 2, 'student', null, TRUE),
(3, 'Jennifer', 'F11', 9, 6.52, "2007-12-05", 4, 'student', "B3", FALSE),
(4, 'Leo', 'F09', 10, 8.87, "2006-02-18", 2, 'student', "B2", TRUE),
(5, 'Frea', 'F13', 8, 6.76, "2008-05-02", 0, 'student', null, FALSE),
(6, 'Dallia', 'F09', 11, 9.32, "2005-07-22", 2, 'student', "B2", TRUE),
(7, 'Monica', 'F01', 9, 8.55, "2007-12-23", 1, 'student', "B3", TRUE),
(8, 'Collin', 'F02', 10, 6.98, "2006-11-09", 4, 'student', "B7", FALSE),
(9, 'Monica', 'F12', 10, 7.55, "2006-10-21", 0, 'student', "B7", TRUE),
(10, 'Monica', 'F16', 8, 8.43, "2008-02-26", 1, 'student', "B5", TRUE),
(11, 'Collin', 'F03', 10, 6.32, "2006-03-12", 0, 'student', "B1", TRUE),
(12, 'Maja', 'F13', 10, 8.49, "2008-04-02", 0, 'student', null, FALSE),
(13, 'Andrew', 'F10', 10, 7.32, "2006-02-10", 1, 'student', null, TRUE),
(14, 'Lucy', 'F01', 10, 9.45, "2006-03-07", 2, 'student', "B3", TRUE),
(15, 'Martha', 'F08', 10, 5.98, "2007-04-13", 0, 'student', "B5", TRUE),
(16, 'Peter', 'F15', 10, 6.54, "2005-12-02", 0, 'student', "B6", TRUE),
(17, 'Theo', 'F04', 10, 4.23, "2006-01-31", 4, 'student', "B4", FALSE),
(18, 'Hannah', 'F07', 10, 7.98, "2008-03-12", 1, 'student', "B1", FALSE),
(19, 'Chloe', 'F10', 10, 6.25, "2007-01-11", 0, 'student', null, TRUE),
(20, 'Tom', 'F01', 10, 7.20, "2006-08-31", 1, 'student', "B3", TRUE),
(21, 'Andrew', 'F14', 10, 6.05, "2005-09-01", 0, 'student', null, FALSE),
(22, 'Stewart', 'F04', 10, 7.83, "2006-09-28", 0, 'student', "B4", FALSE),
(23, 'Lily', 'F15', 10, 6.32, "2007-02-16", 1, 'student', "B6", TRUE),
(24, 'Hans', 'F06', 10, 8.30, "2007-08-29", 0, 'student', "B7", FALSE),
(25, 'Laura', 'F06', 10, 9.56, "2008-12-14", 0, 'student', "B7", FALSE),
(26, 'Collin', 'F06', 10, 6.27, "2005-12-05", 1, 'student', "B7", FALSE);

INSERT INTO Courses_extracurriculars_students
(Course_ID, Student_ID, Activity_ID)
VALUES
('B01', 1, 021),
('C01', 1, 012),
('L03', 1, null),
('B02', 2, null),
('E01', 2, null),
('H01', 2, null),
('L01', 3, 022),
('P01', 3, 031),
('S02', 3, null),
('H01', 4, 032),
('L01', 4, null),
('S01', 4, null),
('B01', 5, 011),
('G02', 5, 032),
('E01', 5, 014),
('B01', 6, 032),
('H01', 6, 031),
('C02', 6, 023),
('E01', 7, 012),
('G02', 7, null),
('S01', 7, null),
('E01', 8, 011),
('M02', 8, 021),
('C02', 8, null),
('L02', 9, 013),
('M02', 9, 011),
('E01', 9, null),
('M01', 10, 023),
('L02', 10, null),
('C01', 10, null);

INSERT INTO Bus
(Bus_ID, Area_code, Departure, Arrival)
VALUES
("B1", "W5", "17:00:00", "08:00:00"),
("B2", "W8", "17:00:00", "08:00:00"),
("B3", "NW6", "17:00:00", "08:00:00"),
("B4", "IG11", "17:00:00", "08:00:00"),
("B5", "W11", "17:00:00", "08:00:00"),
("B6", "SE1", "17:00:00", "08:00:00"),
("B7", "M60", "17:00:00", "08:00:00");

INSERT INTO Fees
(Fee_ID, Category, Bus_ID, Activity_ID, Price)
VALUES
(01, 'Tuitition', null, null, 1000),
(02, 'Meal', null, null, 200),
(03, 'Bus', 'B1', null, 50),
(04, 'Bus', 'B2', null, 40),
(05, 'Bus', 'B3', null, 38),
(06, 'Bus', 'B4', null, 45),
(07, 'Bus', 'B5', null, 40),
(08, 'Bus', 'B6', null, 50),
(09, 'Bus', 'B7', null, 42),
(10, 'Activity', null, 011, 20),
(11, 'Activity', null, 012, 25),
(12, 'Activity', null, 013, 20),
(13, 'Activity', null, 014, 18),
(14, 'Activity', null, 021, 25),
(15, 'Activity', null, 022, 20),
(16, 'Activity', null, 023, 20),
(17, 'Activity', null, 031, 15),
(18, 'Activity', null, 032, 25);