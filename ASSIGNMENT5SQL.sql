#creating database
CREATE DATABASE SENSUS;
USE SENSUS;

#creating table country
CREATE TABLE Country (
    id INT PRIMARY KEY,
    country_name VARCHAR(100),
    population INT,
    area FLOAT
);

#creating table persons
CREATE TABLE Persons (
    id INT PRIMARY KEY,
    fname VARCHAR(100),
    lname VARCHAR(100),
    population INT,
    rating FLOAT,
    country_id INT,
    country_name VARCHAR(100)
);

#inserting values into country
INSERT INTO Country (id, country_name, population, area)
VALUES
(1, 'India', 1393409038, 3287263),
(2, 'USA', 331449281, 9833520),
(3, 'China', 1444216107, 9596961),
(4, 'Brazil', 213993437, 8515767),
(5, 'Russia', 145912025, 17098242),
(6, 'Japan', 126476461, 377975),
(7, 'Germany', 83240525, 357022),
(8, 'UK', 68207114, 243610),
(9, 'France', 65273511, 551695),
(10, 'Australia', 25687041, 7692024);

#inserting values into country
INSERT INTO Persons (id, fname, lname, population, rating, country_id, country_name)
VALUES
(1, 'John', 'Doe', 50000, 4.5, 2, 'USA'),
(2, 'Alice', 'Smith', 60000, 4.8, 3, 'China'),
(3, 'Robert', 'Brown', 70000, 3.9, 1, 'India'),
(4, 'David', 'Jones', 80000, 4.2, 4, 'Brazil'),
(5, 'Emma', 'Wilson', 45000, 4.0, 5, 'Russia'),
(6, 'Liam', 'Taylor', 55000, 4.3, 6, 'Japan'),
(7, 'Olivia', 'Anderson', 40000, 3.7, 7, 'Germany'),
(8, 'Mason', 'Thomas', 30000, 3.6, 8, 'UK'),
(9, 'Sophia', 'Jackson', 65000, 4.9, 9, 'France'),
(10, 'Lucas', 'Martin', 35000, 3.5, 10, 'Australia');

#1 SQL query to print the first three characters of country_name from Country Table
SELECT LEFT(country_name, 3) AS first_three_chars
FROM Country;

#2 SQL query to concatenate first name and last name from from Persons table
SELECT CONCAT(fname, ' ', lname) AS full_name
FROM Persons;

#3 SQL query to count the nymber of unique country names from persons table
SELECT COUNT(DISTINCT country_name) AS unique_country_count
FROM Persons;

#4 SQL query to print the maximum population from the country tabe
SELECT MAX(population) AS max_population
FROM Country;

#5 SQL query to print the minimum population from persons table
SELECT MIN(population) AS min_population
FROM Persons;

#6 Inserting Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table
INSERT INTO persons (id, fname, lname, population, rating, country_id, country_name)
VALUES
(11, 'Leo', NULL, 11000, 4.3, 8, 'UK'),
(12, 'Mia', NULL, 13000, 4.2, 9, 'Germany');
SELECT COUNT(lname) AS lname_count FROM persons;

#7 SQL query to find the number of rows in the Persons table
SELECT COUNT(*) AS row_count
FROM Persons;

#8 SQL query to show the population of the Country table for the first 3 rows
SELECT population
FROM Country
LIMIT 3;

#9 SQL query to print 3 random rows of countries.
SELECT * FROM Country
ORDER BY RAND()
LIMIT 3;

#10 List all persons ordered by their rating in descending order
SELECT * FROM Persons
ORDER BY rating DESC;

#11 Find the total population for each country in the Persons table
SELECT country_name, SUM(population) AS total_population
FROM Persons
GROUP BY country_name;

#12 Find countries in the Persons table with a total population greater than 50,000 
SELECT country_name FROM Persons
GROUP BY country_name
HAVING SUM(population) > 50000;

#13 List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT country_name, COUNT(*) AS total_persons, AVG(rating) AS average_rating
FROM Persons
GROUP BY country_name
HAVING COUNT(*) > 2
ORDER BY average_rating ASC;
