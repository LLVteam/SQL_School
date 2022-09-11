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

CREATE TABLE Courses_Extracurriculars_Students (
	Course_ID CHAR(3),
    Student_ID INT NOT NULL,
    Activity_ID INT
);

INSERT INTO Courses_Extracurriculars_Students
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
('C01', 10, null),
('L01', 11, 014),
('M01', 11, 031),
('L03', 11, null),
('B02', 12, 013),
('C02', 12, 012),
('L02', 12, null),
('B02', 13, 021),
('P02', 13, 031),
('H01', 13, null),
('S02', 14, null),
('C01', 14, null),
('L03', 14, null),
('G02', 15, 021),
('S02', 15, 022),
('C02', 15, null),
('S01', 16, 031),
('C01', 16, null),
('M01', 16, null),
('L02', 17, 013),
('G02', 17, 022),
('C02', 17, null),
('S02', 18, 011),
('L01', 18, null),
('G02', 18, null),
('M02', 19, 023),
('L01', 19, null),
('P02', 19, null),
('L03', 20, 012),
('P01', 20, 014),
('S01', 20, 021);

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

INSERT INTO Family
(Family_ID, Surname, N_Kids, Contact_Number, Address, Total_fees )
VALUES
("F01", "Gonzalez", 3, 45623421, "W5", 2000),
("F02", "Morgan", 1, 45623234, "W8", 900),
("F04", "Lee", 2, 45622342, "NW6", 2400),
("F05", "Aspen", 1, 4432123, "IG11", 1982),
("F06", "Blair", 3, 45689432, "W8", 2000),
("F07", "Porte", 5, 409321823, "NW6", 4500),
("F08", "Guerrero", 1, 41234920, "W5", 2334),
("F09", "Colman", 2, 49028371,"IG11", 2893 ),
("F09", "Megan", 4, 49032019, "W8", 2911),
("F10", "Vitto", 2, 423482731,"NW6", 1788 ),
("F11", "Gonzalez", 5, 4367939, "W11",2392),
("F12", "Tori", 1, 41923219, "W5", 2001),
("F13", "Marcus", 2, 43029192,"W11", 1788 ),
("F14", "Jhonson", 5, 49382912, "SE1",2392),
("F15", "Zannini", 2, 430293819, "SE1", 3029),
("F16", "Gallagher", 2, 43029182,"M60", 1587 )

-- W5 W8 NW6 IG11 W11 SE1 M60

-- To delete the N_students column from bus table
-- ALTER TABLE Bus
-- DROP COLUMN N_Students;

CREATE TABLE Bus (
	Bus_ID CHAR(2),
--    N_Students INT,
    Area_Code CHAR(4),
    Departure TIME,
    Arrival TIME
);


INSERT INTO Bus
(Bus_ID, Area_Code,Departure, Arrival)
VALUES
("B1", "W5", "17:00:00", "08:00:00"),
("B2", "W8", "17:00:00", "08:00:00"),
("B3", "NW6", "17:00:00", "08:00:00"),
("B4", "IG11", "17:00:00", "08:00:00"),
("B5", "W11", "17:00:00", "08:00:00"),
("B6", "SE1", "17:00:00", "08:00:00"),
("B7", "M60", "17:00:00", "08:00:00")


CREATE TABLE Fees (
	Fee_id CHAR(3),
    Category VARCHAR(10),
    Bus_ID CHAR(2),
    Activity_ID CHAR(3),
    Price CHAR(5)
);