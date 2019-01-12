#procedures
#procedure for insert
delimiter $$
create procedure insert_proc(id int,fname varchar(50), lname varchar(50),dateOfBirth date, phNum char(10), deptId int, addId int)
begin
insert into backup_student_info
(studentId, studentFirstName,studentLastName,dateOfBirth,
phoneNumber, departmentId,addressID) values
(id, fname, lname, dateOfBirth,
phNum, deptId, addId);
end$$

drop procedure insert_proc;

call insert_proc(120987690,'Daniel','Stakhov','1989-12-09','9876123509',122,221);
select * from backup_student_info;

#procedure-2
delimiter $$
create procedure count_proc()
begin
select count(itemId) as 'Number of Items' from item;
end$$
drop procedure count_proc;
call count_proc();

#procedure-3
create procedure count_proc()
begin
select 
end$$
drop procedure count_proc;
call count_proc();
