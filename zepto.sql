create database zepto;
use zepto;

drop table if exists zepto;
create table zepto (
     name varchar(255) primary key ,
     mrp int,
     discountPercent decimal(10,2),
     availableQuantity int,
     discountedSellingPrice int,
     weightInGms int,
     outOfStock varchar(10),
     quantity int
   );

select * from zepto;
select count(*) from zepto;

update zepto set mrp = 3700 where name = "Tomato Hybrid";

delete from zepto where name = "Onion";
truncate table zepto;
drop table zepto;

#CTAS CREATE TABLE AS 

create table high_mrp as 
select
name ,
mrp,
discountPercent
from zepto
where mrp > 3500;

select * from high_mrp;


#temporary table 
drop table if exists temp_high_mrp;
create temporary table  temp_high_mrp as
select
name ,
mrp,
discountPercent
from zepto 
where mrp > 6000;

select * from temp_high_mrp;


#CTE 
drop table if exists high_mrp;
with high_mrp1 as (
select
name ,
mrp,
discountPercent
from zepto
where mrp > 7000
)
select * from high_mrp1;

select * from zepto;
alter table zepto drop column location;
alter table zepto add location varchar(30) default "india";

select * from zepto
where 
mrp > 8000 and
outOfStock = "False";


drop table if exists discount;
create table discount (name varchar(100) primary key ,mrp int,discountPercent int,discountedSellingPrice int,
foreign key (name) references zepto(name) on delete cascade);
insert into discount 
select
name,
mrp,
discountPercent,
discountedSellingPrice
from zepto;

select * from zepto;
select * from discount;

delete from discount where name = "Amla";
delete from zepto where name = "Carrot";

select * from zepto 
where name = "Carrot";

select * from zepto 
where mrp > 6000 
order by mrp desc;

select * from zepto; 
alter table zepto add column is_delete boolean default False;

