USE School;

-- Prepare an example query with group by and having to demostrate how to extract data from your DB for analysis.

-- Who are the students who have lunch at school?

SELECT
	COUNT(DISTINCT s.name) As "School meal",
	s.name As "Student name"
FROM 
	Student s
GROUP BY 
	s.name
HAVING 
	COUNT(s.school_meals) = 1;