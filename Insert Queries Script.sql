use student_housing_management_system;


#address table
insert into address values(63, 'St Germain', 'Boston', 'MA', 02115, 120);
insert into address values(12, 'Peterborough', 'Brighton', 'MA', 02135, 121);
insert into address values(677, 'Devon', 'Malden', 'MA', 02755, 122);
insert into address values(98, 'Warren Street', 'Allston', 'MA', 02095, 123);
insert into address values(78, 'Causeway Street', 'Cambridge', 'MA', 02167, 124);
insert into address values(62, 'Clearway Street', 'Boston', 'MA', 02115, 1234);
insert into address values(2, 'Anne Street', 'Boston', 'MA', 02115, 221);

#room
alter table room drop column capacity;
insert into room values(999, 001400987, 1,'Italian Style');
insert into room values(993, 002400957, 2,'French Style');
insert into room values(996, 001403957, 3,'Arab Style');
insert into room values(990, 001400967, 4,'Italian Style');
insert into room values(991, 001440957, 5,'Persian Style');

#bed table
insert into bed values(1, 100);
insert into bed values(2, 101);
insert into bed values(3, 102);
insert into bed values(4, 103);
insert into bed values(5, 104);

desc bed;
SET FOREIGN_KEY_CHECKS=1;
#building
insert into building values(220, 30, 'Speare Hall', 120);
insert into building values(221, 10, 'Stetson Hall', 120);
insert into building values(222, 5, 'Stephen Hall', 121);
insert into building values(223, 20, 'Carnegie Hall', 124);
insert into building values(224, 70, 'Snell Hall', 123);

#department
insert into department values(345, 'College of Engineering', 122); 
insert into department values(344, 'Law College', 121);
insert into department values(343, 'College of Science', 124);
insert into department values(346, 'College of Health Sciences', 121);
insert into department values(348, 'College of Arts', 120);

#food outlet
insert into foodoutlet values(56,'Zatar',90,7,221);
insert into foodoutlet values(57,'Sweet Pizza',67,7,222);
insert into foodoutlet values(58,'Dumpling Palace',89,7,223);
insert into foodoutlet values(59,'Pho Basil',900,7,221);
insert into foodoutlet values(52,'Popoye Chicken',95,7,220);

#foodoutlet_has_item
insert into foodoutlet_has_item values(56, 12);
insert into foodoutlet_has_item values(57, 13);
insert into foodoutlet_has_item values(58, 14);
insert into foodoutlet_has_item values(59, 15);
insert into foodoutlet_has_item values(52, 16);

#foodoutlet_has_staff
insert into foodoutlet_has_staff values(56, 3456);
insert into foodoutlet_has_staff values(57, 3457);
insert into foodoutlet_has_staff values(58, 3458);
insert into foodoutlet_has_staff values(59, 3459);
insert into foodoutlet_has_staff values(52, 3450);

#item
insert into item values(12, 'Pizza');
insert into item values(13, 'Pasta');
insert into item values(14, 'Fried Rice');
insert into item values(15, 'Noodles');
insert into item values(16, 'Chaat');

#staff
insert into staff values(3456,220,'Melissa','George',890);
insert into staff values(3457,221,'Sidharth','Pati',890);
insert into staff values(3458,222,'Padma','Priya',890);
insert into staff values(3459,223,'Nikhil','Narla',891);
insert into staff values(3450,224,'Lin','Dan',892);
insert into staff values(3453,220,'Rafael','Nadal',892);

#staff type
insert into stafftype values(890,'Food Outlet Staff');
insert into stafftype values(891,'Maintenence Staff');
insert into stafftype values(892,'Security Staff');

#studentuniversityinformation
insert into studentuniversityinformation values(001400957, 'Tanmayee', 'Kalluri','1994-12-28','9087650125','Shobha','Murthy','9945283680',345,1234);
insert into studentuniversityinformation values(001400967, 'Rohini', 'Dhara','1999-11-08','9945890128','Swagatika','Dash','9945283680',346,1234);
insert into studentuniversityinformation values(001403957, 'Sanjeev', 'Dhara','1992-02-28','8106007519','Srinivas','Dhara','9945283680',345,124);
insert into studentuniversityinformation values(091400957, 'Amrutha', 'Malladi','1995-07-18','9700072011','Jawahar','Malladi','9945283680',348,121);
insert into studentuniversityinformation values(001440957, 'Yang', 'Li','2000-12-28','9492034232','Shia','Li','9440921265',343,1234);
insert into studentuniversityinformation values(002400957, 'Elijah', 'Anderson','2000-09-04','2408881592','Matt','Anderson',null,344,123);
insert into studentuniversityinformation values(001400987, 'Rahman', 'Hussain','2000-04-15','8176175634','Farhat','Ali',null,344,121);

desc studentuniversityinformation;
alter table studentuniversityinformation modify pointOfContactNumber char(10);

#utility
desc utilities;
insert into utilities values(91234,'WiFi','Monthly',23,001400987);
insert into utilities values(91235,'WiFi','Quarterly',47,002400957);
insert into utilities values(91236,'TV','Yearly',100,001403957);
insert into utilities values(91237,'Oven','Quarterly',43,001400967);
insert into utilities values(91238,'Kettle','Monthly',10,001440957);

#visitor
insert into visitor values('Tanisha','Shah',001400987,'Friend','2018-11-09','2018-11-09','12:00:00','02:00:00',220,'Y','Casual meeting'); 
insert into visitor values('Jessica','Parker',002400957,'Mother','2018-08-10','2018-08-10','03:00:00','07:00:00',221,'Y','Need to give things'); 
insert into visitor values('Rohan','Gupta',001440957,'Friend','2018-06-22','2018-06-22','12:00:00','02:00:00',222,'N','Catch up with friend');

#studentdorminfo
insert into studentdorminfo values(999,224,001400957);
insert into studentdorminfo values(993,222,002400957);
insert into studentdorminfo values(996,223,001403957);
insert into studentdorminfo values(991,220,001400967);

#payment
insert into payment values(90001,001400987,'2017-09-27',1300,'Paid',0);
insert into payment values(90002,002400957,'2018-09-27',800,'Late payment',20);
insert into payment values(90003,001403957,'2016-08-23',1200,'Late',34);
insert into payment values(90004,001400967,'2017-12-12',600,'Paid',0);
insert into payment values(90005,001440957,'2018-11-20',500,'Paid',0);

#freetransportation
insert into freetransportation values(001400987,220);
insert into freetransportation values(002400957,221);
insert into freetransportation values(001403957,222);
insert into freetransportation values(001400967,223);
insert into freetransportation values(001440957,224);

#login
insert into login values(001400987,'2018-01-01 12:00:00');
insert into login values(3456,'2018-01-01 12:00:00');

#mealplan
insert into mealplan values(111,001440957,'Sem 1');
insert into mealplan values(112,001400967,'Sem 1');
insert into mealplan values(113,001403957,'Sem 2');
insert into mealplan values(114,002400957,'Sem 4');
insert into mealplan values(115,001400987,'Sem 8');