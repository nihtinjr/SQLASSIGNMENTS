-- Creating database
create database population;
use population;

-- Create Country table
CREATE TABLE country (
    ID INT PRIMARY KEY,
    country_name VARCHAR(100),
    population INT,
    area INT
);

-- Create Persons table
CREATE TABLE persons (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    population INT,
    rating FLOAT,
    country_id INT,
    country_name VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- Insert 10 rows into Country table
INSERT INTO country (id, country_name, population, area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 68000000, 243610),
(4, 'India', 1391000000, 3287263),
(5, 'Australia', 25000000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Brazil', 212600000, 8515767),
(9, 'Russia', 146000000, 17098246),
(10, 'China', 1402000000, 9596961);

-- Insert 10 rows into Persons table
INSERT INTO persons (id, fname, lname, population, rating, country_id, country_name) VALUES
(1, 'John', 'Doe', 20000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 15000, 4.2, 2, 'Canada'),
(3, 'Alice', 'Johnson', 30000, 4.7, 3, 'UK'),
(4, 'Bob', 'Brown', 40000, 3.8, NULL, NULL),
(5, 'Charlie', 'White', 50000, 4.9, 4, 'India'),
(6, 'Dave', 'Green', 60000, 2.9, 5, 'Australia'),
(7, 'Eve', 'Black', 70000, 3.2, 6, 'Germany'), 
(8, 'Frank', 'Blue', 80000, 4.6, 7, 'France'), 
(9, 'Grace', 'Yellow', 90000, 3.4, 8, 'Brazil'), 
(10, 'Hank', 'Purple', 100000, 4.8, 9, 'Russia');

-- LISTING DISTICT COUNTRY NAMES FROM THE PERSONS TABLE
SELECT DISTINCT country_name FROM persons;

-- SELECTING FIRST NAME AND LAST NAME WITH ALIASES
SELECT fname AS first_name, lname AS last_name FROM persons;

-- PERSONS WITH RATING GREATER THAN 4.0
SELECT * FROM persons WHERE rating > 4.0;

-- COUNTRIES WITH POPULATION GREATER THE 10 LAKH
SELECT * FROM country WHERE population > 1000000;

-- PERSONS FROM USA WITH RATING GREATER THAN 4.5
SELECT * FROM persons WHERE country_name = 'USA' OR rating > 4.5;

-- PERSONS WITH COUNTRY NAME NULL
SELECT * FROM persons WHERE country_name IS NULL;

-- PERSONS FROM USA, UK, CANADA
SELECT * FROM persons WHERE country_name IN ('USA', 'Canada', 'UK');

-- PERSONS WITH COUNTRY NAMES NOT IN INDIA AND AUSTRALIA
SELECT * FROM persons WHERE country_name NOT IN ('India', 'Australia');

-- COUNTRIES WITH POPULATION BETWEEN 5 LAKHS AND 20 LAKHS
SELECT * FROM country WHERE population BETWEEN 500000 AND 2000000;

-- COUNTRIES WITH NAMES NOT STARTING WITH LETTER C
SELECT * FROM country WHERE country_name NOT LIKE 'C%';
