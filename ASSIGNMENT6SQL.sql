-- Create database
CREATE DATABASE sensus ;
use sensus ;

-- Create Country table
CREATE TABLE country (
    id INT PRIMARY KEY,
    country_name VARCHAR(100),
    population BIGINT,
    area FLOAT
);

-- Create Persons table
CREATE TABLE persons (
    id INT PRIMARY KEY,
    fname VARCHAR(100),
    lname VARCHAR(100),
    population BIGINT,
    rating DECIMAL(5, 2),
    country_id INT,
    country_name VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- Insert 10 rows into Country table
INSERT INTO country (id, country_name, population, area)
VALUES
(1, 'USA', 331002651, 9833520),
(2, 'Canada', 37742154, 9984670),
(3, 'UK', 67886011, 243610),
(4, 'Australia', 25499884, 7692024),
(5, 'India', 1380004385, 3287263),
(6, 'Germany', 83783942, 357022),
(7, 'France', 65273511, 551695),
(8, 'Italy', 60461826, 301340),
(9, 'Japan', 126476461, 377975),
(10, 'China', 1439323776, 9596961);

-- Insert 10 rows into Persons table
INSERT INTO persons (id, fname, lname, population, rating, country_id, country_name)
VALUES
(1, 'John', 'Doe', 331002651, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 37742154, 3.9, 2, 'Canada'),
(3, 'Emily', 'Davis', 67886011, 4.7, 3, 'UK'),
(4, 'Michael', 'Brown', 25499884, 3.8, 4, 'Australia'),
(5, 'Arjun', 'Patel', 1380004385, 5.0, 5, 'India'),
(6, 'Hans', 'Müller', 83783942, 4.2, 6, 'Germany'),
(7, 'Sophie', 'Dubois', 65273511, 4.1, 7, 'France'),
(8, 'Giovanni', 'Rossi', 60461826, 3.6, 8, 'Italy'),
(9, 'Taro', 'Yamamoto', 126476461, 4.8, 9, 'Japan'),
(10, 'Wei', 'Zhang', 1439323776, 4.4, 10, 'China');

#PERFORMING INNER JOIN
SELECT 
    p.id AS person_id, p.fname, p.lname, c.country_name, c.population AS country_population
FROM 
    persons p
INNER JOIN 
    country c
ON 
    p.country_id = c.id;

#PERFORMING LEFT JOIN
SELECT 
    p.id AS person_id, p.fname, p.lname, c.country_name, c.population AS country_population
FROM 
    persons p
LEFT JOIN 
    country c
ON 
    p.country_id = c.id;

#PERFORMING RIGHT JOIN
SELECT 
    p.id AS person_id, p.fname, p.lname, c.country_name, c.population AS country_population
FROM 
    persons p
RIGHT JOIN 
    country c
ON 
    p.country_id = c.id;

#List All Distinct Country Names
SELECT DISTINCT country_name FROM country
UNION
SELECT DISTINCT country_name FROM persons;

#List All Country Names Including Duplicates
SELECT country_name FROM country
UNION ALL
SELECT country_name FROM persons;

#Round Ratings to the Nearest Integer
UPDATE persons
SET rating = ROUND(rating);


