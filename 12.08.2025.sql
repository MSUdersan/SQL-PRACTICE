
DROP TABLE IF EXISTS rides;
DROP TABLE IF EXISTS drivers;


CREATE TABLE drivers (
    driverid INT PRIMARY KEY,
    driver_name VARCHAR(50),
    lisence_no BIGINT
);

INSERT INTO drivers (driverid, driver_name, lisence_no) VALUES
 (101, 'kara', 456789),
 (102, 'sura', 775624),
 (103, 'rete', 789455),
 (104, 'fera', 258741);


CREATE TABLE rides (
    riderid INT NOT NULL,
    driverid INT NOT NULL,
    droplocation VARCHAR(30),
    pickuplocation VARCHAR(30),
    FOREIGN KEY (driverid) REFERENCES drivers(driverid) ON DELETE CASCADE
);

INSERT INTO rides (riderid, driverid, droplocation, pickuplocation) VALUES
 (201, 102, 'chennai', 'cbte'),
 (203, 101, 'tvl', 'erode'),
 (202, 103, 'namakal', 'tenkasi'),
 (204, 104, 'tuty', 'kerala');

SELECT * FROM drivers;
SELECT * FROM rides;

delete from drivers where driverid = 101;

alter table rides add column is_delete boolean default false;
update rides set is_delete = true  where driverid = 103;

##AGGREGATION 

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

SELECT COUNT(*) FROM cust
select count(*) from cust where transactionstatus = 'completed';
select count(*) from cust where transactionstatus = 'completed';
select count(*) from cust where transactionstatus = 'failed';
select count(*) from cust where transactionstatus = 'completed' and product = 'laptop';
select count(*) from cust where transactionstatus in ('completed','pending');
select count(*) from cust where transactionstatus not in ('completed','pending');

select sum(amount) from cust;
select sum(amount) from cust where transactionstatus = 'completed';
select min(amount) from cust ;
select min(amount) as minamt from cust ;
select min(amount) as minamt from cust where transactionstatus = 'completed' ;


select max(amount) as maxamt from cust where transactionstatus = 'completed' ;
select avg(amount) as avgamt from cust where transactionstatus = 'completed' ;

select min(amount) as minamt from cust where transactionstatus = 'pending' ;

select avg(amount) as avgamt from cust where transactionstatus = 'failed' ;


##groupby and having 

select logindevice,
sum(amount) as totalrev
from cust
group by logindevice
having 
sum(amount) > 80000;

##case condition

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

select * from customers

select
customer_name,
amount,
case
when amount > 4000 then 'high spender'
when amount > 2000 then 'medium spender'
when amount < 2000 then 'low spender '
else 'no data'
end as spender
from customers;

select 
customer_name,
email,
phone_number,
case 
when email is null and  phone_number is null then '999'
when phone_number is null then email
else phone_number
end as number 
from customers;

select * from customers

##null handling 
select count(*) from customers where phone_number is null;
select count(*) from customers where phone_number is not null;
select count(*) from customers where email is null;
select count(*) from customers where phone_number is not null;

select 
id,
customer_name,
email,
phone_number,
address
from customers
where
email is null
or phone_number is null
or address is null;

select 
id,
amount ,
coalesce (amount,'0.00')
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

select * from custs

select 
length(customer_name) as lngname,
upper(city) as upper,
lower(customer_name) as lower,
concat (customer_name , '::',city) as conname,
substring(customer_name,1,5) as sub,
lpad(customer_name,15,'*') as pad,
rpad(customer_name,15,'*') as pad,
reverse(customer_name) as rev,
instr(customer_name,'a') as str,
replace(customer_name,' ','-') as rep,
format(6841316813121, 2 ) as format,
lpad(upper(concat (customer_name , '::',city)),20,'*') as conname
from custs;

