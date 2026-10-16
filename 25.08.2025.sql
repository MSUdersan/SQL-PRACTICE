create database uuu;
use uuu;

create table shop ( shop_name varchar(25),shop_id int primary key,product_name varchar(100),price int not null);
select * from shop;

insert into shop (shop_name,shop_id,product_name,price) values
('kfc',101,'bucket chicken',499),
('souled store',102,'shoes',2699),
('snitch',103,'shirt',1999),
('titan',104,'watch',5999);
select * from shop;

alter table shop add column location varchar (30);
update shop set location = 'chennai' where shop_id = '101';
update shop set location = 'coimbatore' where shop_id = '102';
update shop set location = 'madurai' where shop_id = '103';
update shop set location = 'tirunelveli' where shop_id = '104';

select 
shop_name,shop_id,product_name,price
from shop
order by price desc;

create table mall as
select 
shop_id,
product_name
from shop
where price > 500;

select * from mall;

create table driver ( 
driver_name varchar(30),
driver_id int primary key,
lisence_no varchar(30),
fare int not null);

insert into driver(driver_name,driver_id,lisence_no,fare) values
('saro',101,'sxdf101',500),
('kartick',102,'xzhg102',1000),
('naaz',103,'ytre789',1200),
('vicky',104,'mnbv456',800);

select * from driver;

drop table rider;
create table rider (
driver_id int,
rider_name varchar(25),
ride_id int not null,
pickup_loc varchar(30),
drop_loc varchar(25),
foreign key (driver_id)  references driver(driver_id) on delete cascade);

insert into rider(driver_id,rider_name,ride_id,pickup_loc,drop_loc) values
(101,'san',201,'velachery','tambaram'),
(102,'rana',202,'potheri','anna nagar'),
(103,'ram',203,'ecr','guindy'),
(104,'seeta',204,'guduvanchery','mount road');

select * from rider;

delete from rider where driver_id = 103;
delete from driver where driver_id = 104;

alter table driver add column is_placed boolean default false;
update driver set is_placed = true where driver_id = 102;
select * from driver;


create table cust ( id int not null,
logindevice  varchar(25),
custname varchar(30),
ipadd varchar(50),
product varchar(30),
amount decimal (10,2),
is_placed boolean,
is_viewed boolean,
transactionstatus varchar(10));

select * from cust;

insert into cust (id,logindevice,custname,ipadd,product,amount,is_placed,is_viewed,transactionstatus) values
(1, 'Mobile', 'Ravi', '192.168.1.1', 'Laptop', 50000.00, TRUE, FALSE, 'Completed'),
(2, 'Desktop', 'Priya', '192.168.1.2', 'Smartphone', 20000.00, TRUE, TRUE, 'Completed'),
(3, 'Tablet', 'Arjun', '192.168.1.3', 'Headphones', 1500.00, FALSE, TRUE, 'Failed'),
(4, 'Mobile', 'Meena', '192.168.1.4', 'Shoes', 2500.00, TRUE, FALSE, 'Completed'),
(5, 'Desktop', 'Karthik', '192.168.1.5', 'Watch', 5000.00, TRUE, TRUE, 'Completed'),
(6, 'Mobile', 'Sowmya', '192.168.1.6', 'Tablet', 15000.00, TRUE, TRUE, 'Completed'),
(7, 'Tablet', 'Ramesh', '192.168.1.7', 'Smartphone', 25000.00, FALSE, TRUE, 'Failed'),
(8, 'Desktop', 'Divya', '192.168.1.8', 'Laptop', 60000.00, TRUE, FALSE, 'Completed'),
(9, 'Mobile', 'Arun', '192.168.1.9', 'Smartwatch', 12000.00, TRUE, TRUE, 'Completed'),
(10, 'Tablet', 'Deepa', '192.168.1.10', 'Laptop', 55000.00, FALSE, FALSE, 'Pending');

select * from cust;

select count(*) from cust;
select count(*) from cust where transactionstatus = 'completed';
select count(*) from cust where transactionstatus in ('completed','pending');
select count(*) from cust where transactionstatus not in ('completed','pending');
select count(*) from cust where transactionstatus = 'completed';

select min(amount) from cust;
select min(amount) from cust where product = 'laptop' ;

select max(amount) from cust;
select avg(amount) from cust ;

select* from cust;
##group by and having 
select 
logindevice, 
sum(amount) as total_amt
from cust
group by logindevice
Having 
sum(amount) > 80000;

select 
custname,
amount,
case 
  when amount > 4000 then 'high spender'
  when amount between 2000 and 4000 then 'medium spender'
  when amount >= 2000 then 'low spender'
  else 'no data'
  end spender
  from cust

CREATE TABLE customers (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(100),
    amount DECIMAL(10,2)
);
INSERT INTO customers (id, customer_name, email, phone_number, address, amount) VALUES
(1, 'Ravi', 'ravi@example.com', '9876543210', 'Chennai', 5000.00),
(2, 'Priya', NULL, '9876543211', 'Bangalore', NULL),
(3, 'Arjun', 'arjun@example.com', NULL, 'Hyderabad', 1500.00),
(4, 'Meena', NULL, NULL, 'Mumbai', 2500.00),
(5, 'Karthik', 'karthik@example.com', '9876543212', NULL, 3000.00);
select * from customers;

select 
customer_name,
 case 
 when phone_number is null then email
 else phone_number
end contact
from customers ;


select 
customer_name,
case 
when phone_number is null and email is null then '999'
when phone_number is null then email
else phone_number
end contact
from customers ;

select * from customers;
select count(*) from customers where phone_number is null;
select count(*) from customers where phone_number is not null;

select 
id,
email,
phone_number
from customers
where 
email is null
or phone_number is null;


select * from customers;

select 
amount,
customer_name,
coalesce(amount,0.00) as final_amt
from customers;

CREATE TABLE custs (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    phone_number VARCHAR(20)
);

INSERT INTO custs (id, customer_name, email, city, phone_number) VALUES
(1, 'Ravi Kumar', 'ravi.kumar@example.com', 'Chennai', '43210'),
(2, 'Priya Sharma', 'priya.sharma@example.com', 'Bangalore', '43211'),
(3, 'Arjun Mehta', 'arjun.mehta@example.com', 'Hyderabad', '43212'),
(4, 'Meena Gupta', 'meena.gupta@example.com', 'Mumbai', NULL),
(5, 'Karthik Raj', 'karthik.raj@example.com', 'Chennai', '43213');

select * from custs;

select 
length(customer_name) as leg_name,
upper(city) as upper,
lower(customer_name) as lower,
lpad(customer_name,15,'*'),
rpad(customer_name,15,'*'),
concat(customer_name,'::',city) as concat,
substring(customer_name,1,5) as sub_str,
instr(customer_name,'a')as str,
reverse(customer_name) as rev,
format(9878788768767,2) as format,
replace(customer_name,' ', '_') as rep,
rpad(upper(concat(customer_name,'::',city)),20,'*') as con
from custs;