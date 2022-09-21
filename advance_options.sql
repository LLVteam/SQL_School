USE School;

-- 1. Prepare an example query with group by and having to demostrate how to extract data from your DB for analysis.

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
    

-- 2. Create a trigger and demonstrate how it runs

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
