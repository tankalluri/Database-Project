explain select * from login;
explain select * from login where id=3456;
explain select * from studentuniversityinformation s inner join studentdorminfo l on l.studentId=s.studentId;
explain select * from studentuniversityinformation s inner join visitor v on s.studentId=v.studentId;