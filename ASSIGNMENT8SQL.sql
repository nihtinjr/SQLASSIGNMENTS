-- Create database
CREATE DATABASE sensus ;
use sensus ;

-- Creating the Country and Persons Tables 
CREATE TABLE country (
    id INT PRIMARY KEY,
    country_name VARCHAR(100),
    population INT,
    area DECIMAL(15, 2)
);

CREATE TABLE persons (
    id INT PRIMARY KEY,
    fname VARCHAR(100),
    lname VARCHAR(100),
    population INT,
    rating DECIMAL(3, 2),
    country_id INT,
    country_name VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- Insert 10 Rows into Country
INSERT INTO country (id, country_name, population, area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'India', 1390000000, 3287263),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515767),
(5, 'Australia', 26000000, 7692024),
(6, 'Russia', 146000000, 17098246),
(7, 'Canada', 38000000, 9984670),
(8, 'UK', 68000000, 243610),
(9, 'Germany', 83000000, 357022),
(10, 'France', 67000000, 551695);

-- Insert 10 Rows into Persons
INSERT INTO persons (id, fname, lname, population, rating, country_id, country_name) VALUES
(1, 'John', 'Doe', 5000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 3000, 3.7, 1, 'USA'),
(3, 'Raj', 'Kumar', 7000, 4.0, 2, 'India'),
(4, 'Liu', 'Wei', 10000, 4.8, 3, 'China'),
(5, 'Carlos', 'Silva', 2000, 3.5, 4, 'Brazil'),
(6, 'James', 'Brown', 1500, 2.8, 5, 'Australia'),
(7, 'Anna', 'Taylor', 1200, 3.1, 6, 'Russia'),
(8, 'Emily', 'Clark', 1700, 4.2, 7, 'Canada'),
(9, 'Sophia', 'White', 800, 2.5, 8, 'UK'),
(10, 'Max', 'Miller', 600, 4.0, 9, 'Germany');

-- Queries for Country and Persons Tables
-- 1. Number of Persons in Each Country
SELECT country_name, COUNT(*) AS person_count
FROM persons
GROUP BY country_name;

-- 2. Number of Persons Sorted from High to Low
SELECT country_name, COUNT(*) AS person_count
FROM persons
GROUP BY country_name
ORDER BY person_count DESC;

-- 3. Average Rating per Country (Greater than 3.0)
SELECT country_name, AVG(rating) AS avg_rating
FROM persons
GROUP BY country_name
HAVING AVG(rating) > 3.0;

-- 4. Countries with Same Rating as USA (Using Subqueries)
SELECT country_name
FROM persons
WHERE country_name <> 'USA' AND rating IN (
    SELECT rating
    FROM persons
    WHERE country_name = 'USA'
);
-- 5. Countries with Population Greater Than Average
SELECT country_name
FROM country
WHERE population > (
    SELECT AVG(population) FROM country
);

-- Database and Customer Table

-- 1. Create Product Database and Customer Table:
CREATE DATABASE product;

USE product;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
    phone_no VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country VARCHAR(100)
);

--  Queries for Customer Table and Views

-- 1. Create customer_info View
CREATE VIEW customer_info AS
SELECT CONCAT(first_name, ' ', last_name) AS full_name, email
FROM customer;
SELECT * FROM customer_info;

-- 2. Create US_Customers View:
CREATE VIEW us_customers AS
SELECT *
FROM customer
WHERE country = 'US';

-- 3. Create Customer_details View
CREATE VIEW customer_details AS
SELECT CONCAT(first_name, ' ', last_name) AS full_name, email, phone_no, state
FROM customer;

-- 4.Update Phone Numbers for California Customers
UPDATE customer
SET phone_no = '9999999999'
WHERE state = 'California';
SELECT * FROM customer_details WHERE state = 'California';

-- 5. Count Customers per State (States with > 5 Customers)
SELECT state, COUNT(*) AS customer_count
FROM customer
GROUP BY state
HAVING COUNT(*) > 5;

-- 6. Count Customers per State (Using Customer_details View)
SELECT state, COUNT(*) AS customer_count
FROM customer_details
GROUP BY state;

-- Retrieve All Columns from Customer_details View (Sorted by State)
SELECT *
FROM customer_details
ORDER BY state ASC;