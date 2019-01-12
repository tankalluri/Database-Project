#views
#view-1
create view v_menuForOutlets as 
select f.outletName,i.itemName, f.cost 
from foodoutlet f, foodoutlet_has_item fi, item i 
where f.outletId=fi.foodOutlets_outletId
and i.itemId=fi.item_itemId;
drop view v_menuForOutlets;
select * from v_menuForOutlets;

#view-2
create view v_student_dorm_info_room as 
select s.studentId,s.studentFirstName,s.studentLastName,s.phoneNumber,r.roomNumber,r.type, b.buildingName
from studentUniversityInformation s, studentDormInfo d, room r, building b where r.roomNumber=d.roomNumber and
r.studentId=d.studentID and s.studentId=d.studentId and d.buildingNumber = b.buildingNumber;
drop view v_student_dorm_info_room;
select * from v_student_dorm_info_room;

#view-3


create view v_visitorMeeting as 
select concat(v.visitorFirstName,' ',v.visitorLastName,' - ',v.visitorRelationship,' ,visited ', 
s.studentFirstName,' ',s.studentLastName,' bearing the ID ',s.studentId, ' to ',v.purposeOfVisit) as VisitorMeeting
from visitor v inner join studentUniversityInformation s 
on v.studentId=s.studentId;
drop view v_visitorMeeting;
select * from v_visitorMeeting;
