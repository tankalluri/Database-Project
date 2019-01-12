#transactions
start transaction;
lock table mealplan write;
update mealplan set term='Sem 8' where planId=111;
insert into mealplan values(116, 001403957,'Sem 5');
delete from mealplan where planId=116;
unlock table;
commit;

start transaction;
update studentuniversityinformation set studentFirstName='Rohita' where studentId=001400967;
update studentuniversityinformation set studentFirstName='Dana' where studentId=001400967;
update studentuniversityinformation set studentFirstName='Genivieve' where studentId=001400967;
update studentuniversityinformation set studentFirstName='Kate' where studentId=001400967;
commit;

rollback;

select * from studentuniversityinformation;