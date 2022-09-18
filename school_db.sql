-- Create Database -- 
CREATE DATABASE School;

USE School;

-- Create tables -- 

CREATE TABLE Teacher (
	teacher_id INT NOT NULL,
	teacher_name VARCHAR(50),
	years_at_school INT,
	salary INT,
  PRIMARY KEY (teacher_id)
);

CREATE TABLE Courses (
	course_id CHAR(3) NOT NULL,
  course_name VARCHAR(18) NOT NULL,
  department VARCHAR(20),
  teacher_id INT NOT NULL,
  day VARCHAR(10),
  schedule TIME,
  class_length INT,
  class_GPA FLOAT,
  PRIMARY KEY (course_id),
  FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Extracurriculars (
  activity_id INT,
  act_name VARCHAR(15),
  category VARCHAR(10),
  teacher_id INT,
  day VARCHAR(10),
  PRIMARY KEY (activity_id),
  FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Family (
  family_id CHAR(3),
  surname VARCHAR(10),
  n_kids INT,
  contact_number CHAR(11),
  address VARCHAR(50),
  total_fees INT,
  PRIMARY KEY (family_id)
);

CREATE TABLE Student (
  student_id INT NOT NULL,
  name VARCHAR(50),
  family_id CHAR(3),
  year_group INT,
  GPA INT,
  DOB DATE,
  merits INT,
  suspensions INT,
  bus_id CHAR(2),
  school_meals BOOLEAN,
  PRIMARY KEY (student_id),
  FOREIGN KEY (family_id) REFERENCES Family(family_id)
);

CREATE TABLE Courses_extracurriculars_students (
	course_id CHAR(3),
  student_id INT,
  activity_id INT,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (activity_id) REFERENCES Extracurriculars(activity_id)
);


CREATE TABLE Bus (
	bus_id CHAR(2),
  area_code VARCHAR(4),
  departure TIME,
  arrival TIME,
  PRIMARY KEY (bus_id)
);

CREATE TABLE Fees (
	fee_ID CHAR(2) NOT NULL,
  category VARCHAR(10),
  bus_id CHAR(2),
  activity_id INT,
  price CHAR(5),
  PRIMARY KEY (fee_ID)
);

-- POPULATE TABLES -- 

INSERT INTO Teacher
(teacher_id, teacher_name, years_at_school, salary)
VALUES
(1, 'Sarah', 6, 3500),
(2, 'Jacob', 2, 1500),
(3, 'Roger', 9, 4000),
(4, 'Pamela', 1, 1000),
(5, 'Andrew', 3, 2000);

INSERT INTO Courses
(course_id, course_name, department, teacher_id, day, schedule, class_length, class_GPA)
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

INSERT INTO Extracurriculars 
(activity_id, act_name, category, teacher_id, day)
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

INSERT INTO Courses_extracurriculars_students
(course_id, student_id, activity_id)
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


INSERT INTO Student
(student_id, name,  year_group, GPA, DOB, merits, suspensions, bus_id, school_meals)
VALUES 
(1,"Monica Wade",  8, 9.54, "2008-12-07", 2, 0, "B1", true ), 
(2,"Simon Lopez",  8, 8.61, "2008-11-03", 1, 2, "B2", true ),
(3, "Jennifer Steward", 9, 6.52, "2007-12-05", 0, 4, "B3", false ),
(4,"Leo McCollin", 10, 8.87, "2006-02-18", 3, 2, "B2", true ),
(5,"Frea Simpson",  8, 6.76, "2008-05-02", 3, 0, "B1", false ),
(6,"Dallia Wade",  11, 9.32, "2005-07-22", 2, 2, "B1", true ),
(7,"Monica Wade",  9, 8.55, "2007-12-23", 5, 1, "B3", false ),
(8,"Collin Fown",  10, 6.98, "2006-11-09", 4, 8, "B7", false ),
(9,"Monica Wade",  10, 7.55, "2006-10-21", 0, 3, "B7", true ),
(10,"Monica Wade",  8, 8.43, "2008-02-26", 2, 1, "B5", true );


INSERT INTO Family
(family_id, surname, n_kids, contact_number, address, total_fees )
VALUES
("F01", "Gonzalez", 3, 45623421, "W5", 2000),
("F02", "Morgan", 1, 45623234, "W8", 900),
("F03", "Megan", 4, 49032019, "W8", 2911),
("F04", "Lee", 2, 45622342, "NW6", 2400),
("F05", "Aspen", 1, 4432123, "IG11", 1982),
("F06", "Blair", 3, 45689432, "W8", 2000),
("F07", "Porte", 5, 409321823, "NW6", 4500),
("F08", "Guerrero", 1, 41234920, "W5", 2334),
("F09", "Colman", 2, 49028371,"IG11", 2893),
("F10", "Vitto", 2, 423482731,"NW6", 1788),
("F11", "Gonzalez", 5, 4367939, "W11",2392),
("F12", "Tori", 1, 41923219, "W5", 2001),
("F13", "Marcus", 2, 43029192,"W11", 1788),
("F14", "Jhonson", 5, 49382912, "SE1",2392),
("F15", "Zannini", 2, 430293819, "SE1", 3029),
("F16", "Gallagher", 2, 43029182,"M60", 1587);


INSERT INTO Bus
(bus_id, area_code, departure, arrival)
VALUES
("B1", "W5", "17:00:00", "08:00:00"),
("B2", "W8", "17:00:00", "08:00:00"),
("B3", "NW6", "17:00:00", "08:00:00"),
("B4", "IG11", "17:00:00", "08:00:00"),
("B5", "W11", "17:00:00", "08:00:00"),
("B6", "SE1", "17:00:00", "08:00:00"),
("B7", "M60", "17:00:00", "08:00:00");

INSERT INTO Fees
(fee_id, category, bus_id, activity_id, price)
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