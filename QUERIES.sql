USE School;

-- QUERY 1: Get all the distinct courses name
SELECT DISTINCT 
Course_Name
from Courses;

-- QUERY 2: Get family names from NW6 area (address)
SELECT 
	Surname, address
	from Family
	WHERE Address = "NW6";


-- QUERY 3: Get family surnames that starts letter G
SELECT 
	Family_ID, Surname
    from Family
    WHERE Surname 
    LIKE 'g%';
    
    
-- QUERY 4: Get families who have more than 3 kids and address is W11
SELECT 
	Family_ID, Surname, N_Kids, Address
    from Family 
    WHERE Address = "W11" 
    AND N_Kids >= 3;


-- QUERY 5: Get family addresses that are not equal to W8
SELECT 
	Surname, Address
    from Family
    WHERE Address != "W8";
    
    
-- QUERY 6: Get total kids per area (address)
SELECT DISTINCT
	Address,
    SUM(N_Kids) As "Total kids per area"
    from Family
    GROUP BY  Address;

-- QUERY 7: Get all families that have between 1 and 2 kids in order
SELECT 
	Surname, N_Kids
    from Family
    WHERE N_Kids 
    BETWEEN 1 AND 2
    ORDER BY N_kids;
    

-- QUERY 8: Get all the families who are named Megan, Lee or Aspen
SELECT 
	Family_ID, Surname
    from Family
    WHERE Surname
    IN("Megan", "Lee", "Aspen");


-- QUERY 9: Inner join families and their Bus ID
SELECT 
	Surname, Address, Bus_ID As "Bus ID"
    FROM Family 
    INNER JOIN
    Bus
    ON 
    Family.Address = Bus.Area_Code; 