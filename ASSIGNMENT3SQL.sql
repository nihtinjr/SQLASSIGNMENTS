#creating databse
CREATE DATABASE OFFICE;
USE OFFICE;

#creating table
CREATE TABLE managers (
    manager_id INT auto_increment PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    age INT CHECK (age > 18 AND age <60),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

#inserting rows
INSERT INTO managers (manager_id, first_name, last_name, dob, age, gender, department, salary)
VALUES
    (1, 'Nikhil', 'Babu', '1983-05-11', 44, 'M', 'Admin', 33000),
    (2, 'Aaliya', 'Khan', '1988-07-25', 35, 'F', 'HR', 29000),
    (3, 'Arjun','Vijay', '1987-09-14', 38, 'M', 'Design', 45000),
    (4, 'Jithin', 'Ram', '1992-11-08', 33, 'F', 'Sales', 29000),
    (5, 'Michael', 'Brown', '1976-03-29', 48, 'M', 'Marketing', 21000),
    (6, 'Adhish', 'Vinod', '1986-08-17', 41, 'F', 'IT', 32000),
    (7, 'Savio', 'John', '1992-10-03', 29, 'M', 'Production', 22000),
    (8, 'Mohammed', 'Sarjun', '1981-09-28', 37, 'F', 'Finance', 34000),
    (9, 'Amal', 'Raj', '1995-08-15', 33, 'M', 'Law', 16000),
    (10, 'Jackson', 'Joseph', '1987-06-19', 41, 'F', 'Purchase', 28000);

#retreiving name and dob manager having manager_id1
SELECT first_name, last_name, dob
FROM managers
WHERE manager_id = 1;

#displaying annual income of all managers
SELECT first_name, last_name, (salary * 12) AS annual_income
FROM managers;

#displaying records of all managers except AALIYA
SELECT *
FROM managers
WHERE first_name <> 'Aaliya';

#details of managers whose department is IT and earns more than 25000
SELECT *
FROM managers
WHERE department = 'IT' AND salary > 25000;


#displaying details of all managers whose salary is between 10000 and 35000
SELECT *
FROM managers
WHERE salary BETWEEN 10000 AND 35000;
