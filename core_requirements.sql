USE School;

-- Requirement 4: Create a stored function that can be applied to a query in your DB

DELIMITER $$  
CREATE FUNCTION Teacher_Seniority(  
    years_at_school INT  
)   
RETURNS VARCHAR(20)  
DETERMINISTIC  
BEGIN  
    DECLARE seniority VARCHAR(20);  
    IF years_at_school <= 1 THEN  
        SET seniority = "Entry level";
	ELSEIF (years_at_school >= 2 AND   
            years_at_school <= 4) THEN 
        SET seniority = "Mid-senior";  
    ELSEIF years_at_school > 5 THEN  
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
	teacher_name As "Name" ,years_at_school As "Years at school", Teacher_Seniority(years_at_school) As "Seniority" 
FROM 
	Teacher 
ORDER BY 
	salary;  


  