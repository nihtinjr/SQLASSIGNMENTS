-- Create database
CREATE DATABASE sensus ;
use sensus ;

-- Create the Country table
CREATE TABLE Country (
    id INT PRIMARY KEY,
    country_name VARCHAR(100),
    population BIGINT,
    area FLOAT
);

-- Create the Persons table
CREATE TABLE Persons (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    population INT,
    rating DECIMAL(5, 2),
    country_id INT,
    country_name VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES Country(id)
);

-- Insert 10 rows into the Country table
INSERT INTO Country (id, country_name, population, area) VALUES
(1, 'India', 1400000000, 3287263),
(2, 'United States', 331000000, 9833517),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515767),
(5, 'Australia', 25600000, 7692024),
(6, 'Canada', 38000000, 9984670),
(7, 'Russia', 146000000, 17098242),
(8, 'Germany', 83000000, 357386),
(9, 'France', 67000000, 551695),
(10, 'Japan', 125000000, 377975);

-- Insert 10 rows into the Persons table
INSERT INTO Persons (id, fname, lname, population, rating, country_id, country_name) VALUES
(1, 'John', 'Doe', 5000, 4.5, 1, 'India'),
(2, 'Jane', 'Smith', 3000, 4.8, 2, 'United States'),
(3, 'Wang', 'Li', 4000, 4.7, 3, 'China'),
(4, 'Carlos', 'Silva', 3500, 4.6, 4, 'Brazil'),
(5, 'Emily', 'Brown', 2800, 4.9, 5, 'Australia'),
(6, 'Alex', 'Jones', 3200, 4.3, 6, 'Canada'),
(7, 'Ivan', 'Petrov', 3100, 4.4, 7, 'Russia'),
(8, 'Hans', 'Meier', 2900, 4.2, 8, 'Germany'),
(9, 'Claude', 'Dubois', 2700, 4.1, 9, 'France'),
(10, 'Taro', 'Yamamoto', 2600, 4.0, 10, 'Japan');

-- Add a New Column for DOB
ALTER TABLE Persons
ADD COLUMN dob DATE;


-- User-Defined Function to Calculate Age
DELIMITER //
CREATE FUNCTION CalculateAge (dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END //

DELIMITER ;

-- Fetch the Age of All Persons Using the Function
SELECT id, fname, lname, CalculateAge(dob) AS age
FROM Persons;

-- Find the Length of Each Country Name
SELECT country_name, CHAR_LENGTH(country_name) AS name_length
FROM Country;

-- Extract the First Three Characters of Each Country's Name
SELECT country_name, LEFT(country_name, 3) AS first_three_chars
FROM Country;

-- Convert All Country Names to Uppercase and Lowercase
SELECT 
    country_name, 
    UPPER(country_name) AS uppercase_name, 
    LOWER(country_name) AS lowercase_name
FROM Country;
