create database ecoms;
use ecoms;

#create a table 
create table orders (
order_id int primary key, 
order_date date,
price int not null,
location varchar(50)
);
#inserts for tables 
insert into orders (order_id,order_date,price,location) values
(101,"2024-02-12",1000,"chennai"),
(102,"2024-03-10",3000,"bengaluru"),
(103,"2024-03-12",8000,"TVL"),
(104,"2024-04-10",6000,"NGL");

select * from orders;
#alter table 
alter table orders add column category varchar(30) ;
update orders set category = "MOB" WHERE order_id = 101;
update orders set category = "cart" WHERE order_id = 102;
update orders set category = "toys" WHERE order_id = 103;
update orders set category = "books" WHERE order_id = 104;

#limit 
select * from orders 
limit 2;

#where 
select * from orders where order_id = 101;

#delete 
delete from orders  where order_id = 104;

#truncate 
truncate table orders;

#drop tables 
drop table orders ;

#ctas 
create table high_rates 
select
category,
price
from orders
where price > 5000;

select * from high_rates ;

#create  temporary table 
create temporary table high_price(
order_id int,
price varchar(50),
category varchar (30)
);
insert into high_price 
select
order_id,
price,
category
from orders ;

select * from high_price
limit 2 ;

#with cte 
with high_pri as (
select
order_id,
price,
category
from orders
)
select * from high_pri
where price > 5000;

#order by and AND key 
select * from orders 
where price > 5000
and 
location = "TVL"
order by price desc;

