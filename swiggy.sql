create database swiggy;
use swiggy ;

create table swiggy (
ID int primary key,
Area varchar(100) not null,
City varchar(50) not null,
Restaurant varchar (100) not null,
Price int not null,
Avgratings int,
Totalratings int,
Foodtype varchar(200) not null,
Address varchar(200) not null,
Deliverytime time);

select * from swiggy
limit 10;

select count(*) from swiggy;
select 
ID,
Foodtype,
FROM swiggy
where ID = 466488;

select * from swiggy;
Select * from swiggy
where
ID is null or
Foodtype is null or
Area is null or
City is null or
Restaurant is null or
Price is null or
Avgratings is null or
Totalratings is null or
Address is null or
Deliverytime is null ;

Select * from swiggy;

select
sum(Price) as HighRate, 
Restaurant
from swiggy
group by Restaurant
having sum(Price)  > 1500 
order by HighRate desc ;

Select * from swiggy;
select count(*) from swiggy where Totalratings = 500 and Avgratings = 4;
select sum(Price) from swiggy;
select sum(Price) from swiggy where City in ( "Bangalore","Pune")  ;
select sum(Price) from swiggy where City not in ( "Bangalore","Pune")  ;
select avg(Price) from swiggy where City = "Bangalore";
select min(Price) from swiggy where Price between 10 and 500;
select min(Price) from swiggy;
select max(Price) from swiggy where Avgratings = 4;
select min(Price) from swiggy where Avgratings = 5;
select count(*) from swiggy where Avgratings = 5 and Price > 1000;
select * from swiggy;

select 
Restaurant,
Price,
Foodtype
from swiggy 
where Price = 0;

update swiggy set Price ="200" where Restaurant = "Maruti Dhosa Hub";
update swiggy set Price ="200" where Restaurant = "Ladli Fast Food";
update swiggy set Price ="200" where Restaurant = "Comfy Restaurant";
update swiggy set Price ="200" where Restaurant = "Monginis";

select * from swiggy 
limit 2;
select 
Avgratings,
min(price) as Totalminamt
from swiggy
group by Avgratings;

create table  min_price as
select
Avgratings,
min(price) as Totalminamt
from swiggy
group by Avgratings;

select * from min_price
order by Totalminamt desc
limit 3;



