CREATE DATABASE School;

USE School;

CREATE TABLE Extracurriculars (
	Activity_ID CHAR(3),
    Act_Name VARCHAR(12),
    Category VARCHAR(6),
    N_Students INT,
    Staff_ID CHAR(3),
    Day VARCHAR(10)
);

INSERT INTO Extracurriculars 
 (Activity_ID, Act_Name, Category, N_Students, Staff_ID, Day)
 VALUES 
 ('011', 'Athletics', 'Sports', '5', '015', 'Thursday'),
 ('012', 'Football', 'Sports', '8', '015', 'Tuesday'),
 ('013', 'Basketball', 'Sports', '6', '015', 'Monday'),
 ('014', 'Tennis', 'Sports', '4', '015', 'Wednesday'),
 ('021', 'Singing', 'Music', '3', '011', 'Friday'),
 ('022', 'Piano', 'Music', '7', '011', 'Tuesday'),
 ('023', 'Guitar', 'Music', '5', '011', 'Thursday'),
 ('031', 'Painting', 'Arts', '8', '034', 'Wednesday'),
 ('032', 'Sculpturing', 'Arts', '3', '034', 'Friday');
