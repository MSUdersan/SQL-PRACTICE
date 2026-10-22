create database yyy;
use yyy;

create table shop(shopid int not null,shopname varchar(25),revenue int not  null);
select * from shop;

insert into shop(shopid,shopname,revenue) values
(101,'ss store',25000),
(102,'ff store',30000),
(103,'ee store',40000),
(104,'rr store',55000);
select * from shop;

alter table shop add  address varchar(25); 
select * from shop;


update shop set address = 'chennai' where shopid=101;
update shop set address = 'tvl' where shopid=102;
update shop set address = 'cbe' where shopid=103;
update shop set address = 'karur' where shopid=104;
select * from shop;


##ctas 
drop table high;
create table high as
select 
shopid,
revenue
from shop 
where revenue > 10000
and address = 'tvl';
select * from high;

##temporary table 
create temporary table temphigh(shopid int,revenue int);
insert into temphigh (
select 
shopid,
revenue
from shop);

select * from temphigh;


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

##count 

select count(*) from cust;  
select count(*) from cust where transactionstatus = 'failed';
select count(*) from cust where transactionstatus = 'completed';   
select count(*) from cust where transactionstatus = 'failed' and product ='laptop';
select count(*) from cust where transactionstatus in ( 'failed','pending');
select count(*) from cust where transactionstatus not in ( 'failed','pending');

##sum
select sum(amount) from cust 
select sum(amount) from cust where transactionstatus ='completed';  
select sum(amount) as total_revenue from cust  where transactionstatus ='completed';  

select min(amount) from cust
select max(amount) as maxamt from cust
select avg(amount) as avg from cust

select logindevice,
sum(amount) as totalrevenue
from cust
group by logindevice
having 
sum(amount) > 80000;

##case condition

CREATE TABLE Customers (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(100),
    amount DECIMAL(10,2)
);
INSERT INTO Customers (id, customer_name, email, phone_number, address, amount) VALUES
(1, 'Ravi', 'ravi@example.com', '9876543210', 'Chennai', 5000.00),
(2, 'Priya', NULL, '9876543211', 'Bangalore', NULL),
(3, 'Arjun', 'arjun@example.com', NULL, 'Hyderabad', 1500.00),
(4, 'Meena', NULL, NULL, 'Mumbai', 2500.00),
(5, 'Karthik', 'karthik@example.com', '9876543212', NULL, 3000.00);

 
select 
customer_name,
amount,
case
when amount > 4000 then 'high spender'
when amount between 2000 and 4000 then 'medium spender'
when amount <= 2000 then 'low spender'
else ' no data'
end as spending
from Customers ;

select 
customer_name,
case 
when email is null and phone_number is null then '9999'
when phone_number is null then email 
else phone_number
end as contact
from Customers;

##null handling
select * from Customers
select count(*) from Customers where phone_number is null;
select count(*) from Customers where phone_number is not null;

select
id,customer_name,email,phone_number,address
from Customers
where 
email is null 
or phone_number is null
or address is null;

select
id,amount,
coalesce (amount,'0.00')
from Customers;

##string handling
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

select 
length (customer_name) as name_length,
upper(city) as uppercity,
lower(customer_name) as custname,
concat(customer_name,'::',city) as cont,
substring(customer_name ,1,5) as name,
trim(' chennai ') as trimmed 
from custs;