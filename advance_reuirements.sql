USE School;

-- ADVANCED REQUIREMENT #1: Prepare an example query with group by and having to demostrate how to extract data from your DB for analysis.

-- Who are the students who have lunch at school?

SELECT
	COUNT(DISTINCT s.name) As "School meal",
	s.name As "Student name"
FROM 
	Students s
GROUP BY 
	s.name
HAVING 
	COUNT(s.school_meals) = 1;
    

-- ADVANCED REQUIREMENT #2: Create a trigger and demonstrate how it runs

-- Students with over 3 penalties are expelled

USE School;

CREATE TRIGGER update_expulsions
BEFORE UPDATE
ON Students
FOR EACH ROW
SET @penalties = @penalties+1;

UPDATE School.Students
SET status = 'Expelled' 
WHERE Student_ID=3 AND 8 AND 17;

SELECT * FROM school.students;

-- ADVANCED REQUIREMENT #3: Create a view that uses at least 3-4 base tables 
-- Prepare and demonstrate how to extract data from the DB for analysis

-- Student info displayed in a view (name, surname, year, teacher, course, personal GPA, class GPA)

CREATE VIEW Student_info AS 
	SELECT DISTINCT
		s.Name,	f.Surname, s.Year_group, t.Teacher_Name, 
		c.Course_Name, s.GPA,c.Class_GPA
	FROM students as s, family as f, teachers as t, 
		courses as c, courses_extracurriculars_students as ces
	WHERE s.student_ID = ces.Student_ID 
	AND c.course_ID = ces.course_ID 
	AND t.teacher_ID = c.teacher_ID 
	AND s.Family_ID = f.Family_ID
	ORDER BY CONCAT (s.Name, " ", f.Surname);

SELECT * FROM student_info;

-- A query to extract courses Dallia is enrolled for, her teachers and the current class

SELECT DISTINCT 
	Course_Name, Teacher_Name, Year_group as Current_class
FROM 
	student_info
WHERE 
	name = 'Dallia';

-- A query to extract a list of Mr Andrew's best performing classes in each course

SELECT DISTINCT 
	Course_Name, Year_group, Class_GPA
FROM 
	student_info
WHERE 
	Teacher_Name = 'Andrew'
ORDER BY Class_GPA DESC;
