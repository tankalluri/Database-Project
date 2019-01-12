#5 users created
create user 'DriverJoseph' identified by 'joseph';
create user 'RSORia' identified by 'ria';
create user 'FoodManagerSherry' identified by 'sherry';
create user 'Admin' identified by 'admin';
create user 'StaffManager' identified by 'staff';
#4 grant, revoke 
revoke all, grant option from DriverJoseph;
revoke all, grant option from RSORia;
revoke all, grant option from FoodManagerSherry;
revoke all, grant option from `Admin`;
#5 grants
grant all on student_housing_management_system.* to `Admin`;
grant select on student_housing_management_system.freetransportation to DriverJoseph;
grant select on student_housing_management_system.foodoutlet to FoodManagerSherry;
grant select on student_housing_management_system.login to RSORia;
grant update,select on student_housing_management_system.staff to StaffManager;