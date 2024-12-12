-- DDL COMMANDS
#1. Creating Database
create database School;

use School;

-- CREATING TABLES
#1. Students Table

create table Students(
RollNumber int auto_increment primary key,
Name varchar(50),
Marks int,
Grade char(1) check (Grade in ('A','B','C','D','E'))
)

-- SELECT COMMAND TO DISPLAY THE TABLE
select RollNumber,Name,Marks,Grade from students;

-- ALTER COMMAND TO ADD A COLUMN
alter table Students add contact varchar(15);

-- DROP COMMAND TO REMOVE GRADE COLUMN
alter table Students drop grade;

-- RENAME COMAND TO RENAME THE TABLE TO CLASS TEN
rename table Students to CLASSTEN;

-- TRUNCATING COMMAND TO DELETE ALL ROWS FROM TABLE
truncate table CLASSTEN;

-- DROP COMMAND TO DELETE THE TABLE
drop table CLASSTEN;

desc classten;








