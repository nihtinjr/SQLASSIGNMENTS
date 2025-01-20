-- CREATING DATABASE
create database TeachersDetails;
use TeachersDetails;

#1 CREATING TABLE TEACHERS

create table Teachers(
ID int auto_increment primary key,
Name varchar(50),
Subject varchar(50),
Experience int,
Salary decimal(10,2)
);

DESC  Teachers;

insert into teachers (name, subject, experience, salary)
values
('Ian Smith', 'Math', 5, 40000),
('John Paul', 'Science', 12, 45000),
('Steve Rogers', 'History', 8, 42000),
('Linto David', 'Literature', 15, 55000),
('James Gunn', 'Physics', 3, 38000),
('Sagar Alias', 'Chemistry', 10, 46000),
('Jessica James', 'Biology', 6, 40000),
('Johan Williams', 'Geography', 7, 43000);

select * from Teachers ;

#2. CREATING BEFORE TRIGGER "TO RAISE AN ERROR IF THE SALARY IS NEGATIVE"

Delimiter // 
create trigger before_trigger_teacher
before insert on Teachers
for each row
begin 
if new.Salary < 0 then
signal sqlstate '45000'
set message_text = 'Salary Cannot be Negative';
end if;
end //
delimiter ;

#3. CREATING AFTER TRIGGER TO LOG THE INSERTION TO TEACHER_LOG TABLE

create table Teacher_Log(
Teacher_ID int,
Action varchar(50),
TimeStamp timestamp default current_timestamp
);

desc Teacher_Log;

Delimiter //
create trigger After_Insert_Teacher
after insert on Teachers
for each row
begin
insert into Teacher_Log (Teacher_ID, Action, TimeStamp)
values (New.ID,'INSERT',now());
end //
delimiter ;

#4. BEFORE DELETE TRIGGER TO RAISE AN ERROR FOR REMOVING TEACHER  WITH 10 YEAR ABOVE EXPERIENCE 

Delimiter //
create trigger Before_Delete_Teacher
before delete on teachers 
for each row 
begin
if old.Experience > 10 then
signal sqlstate '45000'
set message_text = ' Cannot delete Teacher with experience greater than 10 Years';
end if;
end //
delimiter ;

#5. AFTER DELETE TRIGGER INSERT-  A ROW TO TEACHER_LOG WHEN THAT ROW IS DELETED FROM TEACHERS TABLE

delimiter //
create trigger Deleting_from_Teachers
after delete on teachers 
for each row
begin
insert into Teacher_Log ( Teacher_ID, Action, Timestamp)
values (old.ID, 'DELETED', now());
end //
delimiter ;
