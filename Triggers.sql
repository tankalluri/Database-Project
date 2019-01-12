#triggers
#trigger 1- delete trigger, audit trigger
delimiter $$
create trigger backup_student_details 
after
delete
on studentuniversityinformation
for each row
begin
insert into backup_student_info
(studentId, studentFirstName,studentLastName,dateOfBirth,
phoneNumber, departmentId,addressID) values
(old.studentId, old.studentFirstName, old.studentLastName,old.dateOfBirth,
old.phoneNumber, old.departmentId, old.addressID);
end
$$
commit;
select * from studentuniversityinformation;
select * from backup_student_info;

drop trigger backup_student_details;

delete from studentuniversityinformation where studentId= 001400957;
rollback;

create table backup_student_info(studentId int, studentFirstName varchar(50), studentLastName varchar(50),
dateOfBirth date, phoneNumber char(10), departmentId int(11), addressID int(11));
desc studentuniversityinformation;


#trigger-2- if a new person joins the dorm we unsert new record in message table
delimiter $$
create trigger update_subsequent_tables 
after
insert
on studentDormInfo
for each row
begin
insert into message values(new.studentId, 'Joined');
end
$$

drop trigger update_subsequent_tables;

select * from studentDormInfo;
select * from room;
select * from studentUniversityInformation;

insert into studentDormInfo values(990, 221, 91400957);
select * from message;