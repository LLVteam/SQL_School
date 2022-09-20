-- Requirement 5: Example queries with subqueries to extract data from DB


-- show all courses taught by teachers 1 or 5
USE School;

SELECT * FROM Courses
WHERE Teacher_ID = 1 OR Teacher_ID = 5;


-- show number of student who take each class
SELECT 
	Course_ID, 
    Course_Name, 
	(
		SELECT count(*) AS N_students
		FROM courses_extracurriculars_students
		WHERE Courses.Course_ID = courses_extracurriculars_students.Course_ID
	)
FROM Courses;


-- show all families with more than 1 kid in alphabetical order
SELECT Family_ID, Surname, N_Kids
FROM Family
WHERE N_Kids > 1
ORDER BY Surname asc;

