USE School;

-- Requirement 4: Create a stored function that can be applied to a query in your DB

DELIMITER $$  
CREATE FUNCTION Teacher_Seniority(  
    Years_at_school INT  
)   
RETURNS VARCHAR(20)  
DETERMINISTIC  
BEGIN  
    DECLARE seniority VARCHAR(20);  
    IF Years_at_school <= 1 THEN  
        SET seniority = "Entry level";
	ELSEIF (Years_at_school >= 2 AND   
            Years_at_school <= 4) THEN 
        SET seniority = "Mid-senior";  
    ELSEIF Years_at_school > 5 THEN  
        SET seniority = "Senior";  
    END IF;  
    -- return the teacher seniority
    RETURN (seniority);  
END$$  
DELIMITER //  

-- see all stored functions available in the current database using the following statement:
SHOW FUNCTION STATUS WHERE db = 'School';  


-- use the stored function
SELECT 
	Teacher_Name As "Name" ,Years_at_school As "Years at school", Teacher_Seniority(Years_at_school) As "Seniority" 
FROM 
	Teachers 
ORDER BY 
	Salary;  



-- Requirement 5: Example queries with subqueries to extract data from DB


-- show all courses taught by teachers 1 or 5
USE School;

SELECT * FROM Courses
WHERE Teacher_ID = 1 OR Teacher_ID = 5;


-- show number of student who take each class, in reverse alphabetical order
SELECT 
	Course_ID, 
    Course_Name, 
	(
		SELECT count(*) 
		FROM courses_extracurriculars_students
		WHERE Courses.Course_ID = courses_extracurriculars_students.Course_ID
	) AS N_students
FROM Courses
ORDER BY Course_Name desc;


-- show all families with more than 1 kid in alphabetical order
SELECT Family_ID, Surname, N_Kids
FROM Family
WHERE N_Kids > 1
ORDER BY Surname asc;

