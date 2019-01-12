#functions
#function 1 
select @cost:=cost from utilities;
SET GLOBAL log_bin_trust_function_creators = 1;

delimiter $$
create function revised_plan_prices_new(cost int)
returns int
begin
declare revised_cost int;
set revised_cost=pow(cost,1.3);
return revised_cost;
end $$

drop function revised_plan_prices_new;

select distinct utilityType, revised_plan_prices_new(cost) from utilities;

#function 2
delimiter $$
create function new_food_prices(old_cost int)
returns int
begin
declare revised_cost int;
set revised_cost=old_cost+5;
return revised_cost;
end $$

drop function new_food_prices;

select f.outletId, f.outletName, f.menuId,i.itemName, new_food_prices(cost) as 'New Prices', cost as 'Old Prices'
from foodoutlet f, foodoutlet_has_item fi, item i 
where fi.item_itemId=i.itemId and fi.foodOutlets_outletId=f.outletId;



select * from item
select * from foodoutlet;
update foodoutlet set cost=12 where outletId=59;# had to update since I entered all values as 7 earlier