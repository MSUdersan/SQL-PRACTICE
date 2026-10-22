create database dds;
use dds;

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

select * from ecust;

select count(*) from ecust;

select * from ecust
where
customer_id  is null or           
    age      is null or                 
    gender        is null or            
    subscription_type   is null or      
    watch_hours        is null or       
    last_login_days    is null or       
    region             is null or      
    device              is null or      
    monthly_fee          is null or     
    churned               is null or    
    payment_method         is null or   
    number_of_profiles     is null or   
    avg_watch_time_per_day  is null or   
    favorite_genre         is null ;
    
select * from ecust;
select length(customer_id) as lenid from ecust;
select substring(customer_id ,1,8) as custid from ecust;

select sum(monthly_fee) as fee from ecust where region = 'Europe' and payment_method = 'PayPal';
select avg(watch_hours) as avghrs from ecust where region in ('North America','Europe')  ;
select avg(watch_hours) as avghrs from ecust where region = 'North America';
select min(monthly_fee) as minfee from ecust where device = 'Laptop';
select max(watch_hours) as maxhr from ecust where subscription_type = 'Standard';
select max(watch_hours) as maxhr from ecust where subscription_type = 'Premium';
select max(watch_hours) as maxhr from ecust where subscription_type in ('Standard','Premium');

select * from ecust;
select
subscription_type,
sum(monthly_fee) as fees 
from ecust 
group by subscription_type
 having
   sum(monthly_fee) > 10
   order by sum(monthly_fee) asc;
   
select * from ecust;

create temporary table custtemp as
select 
substring(customer_id ,1,8) as custid ,
upper(payment_method) as uppay,
upper(favorite_genre) as upfav
from ecust;
select * from custtemp;

alter table custtemp add paystatus varchar(20) default "sucessfull";
update custtemp set paystatus = "failed" where custid = '00139d09';
select * from ecust;

with spen_data as (
select
customer_id,
monthly_fee,
case
 when monthly_fee > 17 then "high rate"
 when monthly_fee between 10 and 17 then "medium rate"
 when monthly_fee < 10 then "low rate"
 else "no data"
 end as spending
 from ecust)
 select * from spen_data
 where spending is not  null ;
 
 select * from custtemp;
 update custtemp set paystatus = null where custid = '0017c041';
select * from custtemp where paystatus is null;

select
upfav,
paystatus,
case
 when paystatus is null then upfav
 else paystatus
 end as sp
 from custtemp;
 select * from custtemp;
alter table custtemp add amt int ;

select 
uppay,
upfav,
coalesce(amt,0.00) as amt
from custtemp;

select * from ecust;

select 
monthly_fee,
region,
device,
dense_rank( ) over (partition by region order by monthly_fee desc) as rankse from ecust;

select * from ecust;

select count(customer_id) as custids from ecust;
select count(churned) as churn from ecust where churned = 0;
select count(churned) as churn from ecust where churned = 1;
select avg(monthly_fee) as avgfees from ecust;
select count(subscription_type) as prem from ecust where subscription_type = 'Premium';
select count(subscription_type) as std from ecust where subscription_type = 'Standard';
select count(subscription_type) as bas from ecust where subscription_type = 'Basic';
select
region,
sum(watch_hours) as totalhrs 
from ecust
group by region;
select max(monthly_fee) as maxamt from ecust;
select min(monthly_fee) as minamt from ecust;
select * from ecust; 

select 
customer_id,
last_login_days
from ecust
where last_login_days > 20;
select * from ecust;

select
device,
count(customer_id)  as custs
from ecust
group by device;

#Churn by subscription //Find the number of churned customers for each subscription type
select
subscription_type,
count(customer_id) as custids
from ecust
where churned = 1
group by subscription_type;
select * from ecust;
#Q11. Subscription revenue // Calculate the total monthly fees collected for each subscription 
#type. This is estimated subscription revenue based on the dataset, not verified actual revenue.
select
subscription_type,
sum(monthly_fee) as fees 
from ecust
group by subscription_type;
select * from ecust;
#Find which payment methods have the highest number of churned customers.

select 
payment_method,
sum(churned) as chr
from ecust
group by payment_method
having
 sum(churned) > 0;
 select * from ecust;
#Genre analysis // Find the most popular favorite genre based on customer count
select
favorite_genre,
count(customer_id) as cst
from ecust
group by favorite_genre 
order by count(customer_id) desc
limit 1;
select * from ecust;
##Inactive customers//Find customers who have not logged in for more than 15 days and have churned.
select 
customer_id,
last_login_days
from ecust
where last_login_days > 15 ;

##Customer profile analysis//Calculate the average number of profiles for each subscription type.
select 
subscription_type,
avg(number_of_profiles) as cotcust
from ecust
group by subscription_type;


SELECT
    payment_method,
    SUM(churned) AS churn_count
FROM ecust
GROUP BY payment_method
ORDER BY churn_count DESC
LIMIT 1;