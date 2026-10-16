create database sss;
use sss;

create table shop (product_id int not null , productname varchar (100), amount int not null)
select * from shop;

insert shop ( product_id ,productname , amount) values ( 111 , 'benx' , 20000);
insert shop ( product_id ,productname , amount) values ( 112 , 'benjbx' , 240000);
insert shop ( product_id ,productname , amount) values ( 113 , 'hjbenx' , 270000);
insert shop ( product_id ,productname , amount) values ( 114 , 'jdbenx' , 520000);
select * from shop;

alter table shop add device varchar (15);
update shop set device = 'mobile' where product_id = 111;
update shop set device = 'mobile' where product_id = 112;
update shop set device = 'mobile' where product_id = 113;
update shop set device = 'mobile' where product_id = 114;
select * from shop;

update shop set device = 'laptop' where product_id = 112;

delete from shop where product_id = '112';
drop table shop;


create table employee(emp_id int primary key , emp_name varchar(25), salary int not null, address varchar(100));

insert employee(emp_id,emp_name,salary,address) values (111,'sara',250000,'chennai');
insert employee(emp_id,emp_name,salary,address) values (112,'dsara',2250000,'tvl');
insert employee(emp_id,emp_name,salary,address) values (113,'sgara',2550000,'kanjipuram');
insert employee(emp_id,emp_name,salary,address) values (114,'hsara',2502000,'cbe');
insert employee(emp_id,emp_name,salary,address) values (115,'jsara',2500400,'erode');

select * from employee;

#CTAS
drop table highpaid;
create table highpaid as 
select 
emp_id,
emp_name,
salary
from employee
where salary > 260000;

select * from highpaid;

##temporay table
drop table tempemp; 
create table tempemp(emp_id int primary key ,salary int not null);
insert into tempemp
select 
emp_id,
salary
from employee
where salary > 260000; 

select * from tempemp;

select * from employee order by salary desc;

select * from employee where salary > 260000 order by emp_id desc;

create database taxi;
use taxi;


create table driver ( driverid int primary key , rideid int not null ,lisence int unique key);

insert into driver ( driverid,rideid,lisence) values (111,211,45126546);
insert into driver ( driverid,rideid,lisence) values (112,212,435126546);
insert into driver ( driverid,rideid,lisence) values (113,213,451426546);
select * from driver;

drop table riders;
create table riders(rideid int ,driverid int not null ,droploc varchar(30),pickuploc varchar(100),
foreign key (driverid) references driver (driverid) on delete cascade );

insert into riders(rideid,driverid,droploc,pickuploc) values (311,111,'chennai','cbe');
insert into riders(rideid,driverid,droploc,pickuploc) values (312,112,'jchennai','ocbe');
insert into riders(rideid,driverid,droploc,pickuploc) values (313,113,'cfhennai','ckbe');
insert into riders(rideid,driverid,droploc,pickuploc) values (314,111,'wchennai','mcbe');

select * from riders;

alter table riders add column is_delete boolean default false;

update riders set is_delete = true where driverid = 111;
select * from riders;

delete from riders where rideid = 311;

delete from driver where driverid = 113;

