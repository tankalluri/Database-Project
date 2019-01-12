#7 indexes
create index city_search_in_address on address(city);
create index building_search on building(buildingName);
create index department_search on department(departmentName);
create index foodoutlet_search on foodoutlet(outletName,cost);
create index item_search on item(itemName);
create index staff_search on staff(staffFirstName);
create index visitor_search on visitor(visitorFirstName);

drop index city_search on address;