create database ecom;
use ecom;

drop table if exists ecust;

CREATE TABLE ecust (
    customer_id            VARCHAR(36) PRIMARY KEY,
    age                    INT,
    gender                 VARCHAR(20),
    subscription_type      VARCHAR(20),
    watch_hours            DECIMAL(6,2),
    last_login_days        INT,
    region                 VARCHAR(50),
    device                 VARCHAR(30),
    monthly_fee            DECIMAL(5,2),
    churned                TINYINT,
    payment_method         VARCHAR(30),
    number_of_profiles     INT,
    avg_watch_time_per_day DECIMAL(6,2),
    favorite_genre         VARCHAR(30)
);

select * from  ecust;

select * from ecust
where
    customer_id is null or
    age         is null or           
    gender      is null or           
    subscription_type   is null or   
    watch_hours      is null or     
    last_login_days   is null or     
    region           is null or      
    device           is null or      
    monthly_fee      is null or      
    churned           is null or    
    payment_method    is null or     
    number_of_profiles  is null or   
    avg_watch_time_per_day is null or
    favorite_genre is null ;


select * from ecust
limit 5;
select count(*) from ecust;
select count(*) from ecust where subscription_type ='Premium';
select count(*) from ecust where subscription_type in ('Premium','Standard');
select count(*) from ecust where subscription_type not in ('Premium','Standard');
select count(*) from ecust where subscription_type ='Premium' and region = 'North America' ;
select sum(monthly_fee) from ecust;
select sum(monthly_fee) as fee from ecust where subscription_type ='Premium' ;
select sum(monthly_fee) as fee from ecust where subscription_type in ('Premium',"Basic") and region ='Europe';
select min(age) as AGEWISE FROM ecust where number_of_profiles > 2;
select max(age) as AGEWISE FROM ecust where number_of_profiles > 2 and subscription_type ='Premium';
select avg(age) as avgage from ecust;

select * from ecust
limit 5;

select 
region,
sum(monthly_fee) as Fees
from ecust
group by region
order by Fees  desc ;

select count(*) from ecust where monthly_fee > 15 and region = 'North America';

drop table  if exists fees;
create table fees as
select
region,
monthly_fee
from ecust
where monthly_fee > 15  ;

select sum(monthly_fee) from fees ;
select * from fees;

select 
region,
sum(monthly_fee) as Fees
from fees
group by region
order by Fees desc;

select * from ecust
limit 5;

create temporary table favgen as 
select 
favorite_genre,
gender,
age
from ecust;

select distinct 
favorite_genre
from favgen;

select * from favgen ;
select * from ecust where age > 18 and favorite_genre = 'Horror';
select count(*) from favgen where age > 18 and favorite_genre = 'Horror' ;
select count(*) from favgen where gender = "Male" and age >= 40 and favorite_genre = 'Horror';

select * from ecust
limit 5; 

create temporary table temp_device 
select
device,
gender,
age
from ecust ;
select * from temp_device;
alter table temp_device drop column loc;
alter table temp_device add loc varchar(20) default "ind";

update temp_device set loc = null  where device ="Mobile";

select 
device ,
avg(age)  as Avgage 
from temp_device
group by device;

select * 
from temp_device where loc is null;

select 
device,
loc ,coalesce( loc ,"usa") as loc1
from temp_device;








