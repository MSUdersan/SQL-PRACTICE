create database san;
use san;

create table employee(sno int not null,name varchar(100),salary int not null,country varchar(5) default 'ind');
select * from employee

insert into employee (sno, name, salary) values (101, 'san' , 1000); 
insert into employee (sno, name, salary) values (1021, 'skan' , 21000); 
insert into employee (sno, name, salary) values (1031, 'sayn' , 13000); 
insert into employee (sno, name, salary) values (1041, 'sang' , 10100); 
insert into employee (sno, name, salary) values (1051, 'sang' , 100550); 

select * from employee;
drop table emp;

create table emp as
select
sno,
name
from employee
where salary > 15000;

select * from emp;

##temporary table 
drop table temp_123;
create temporary table temp_123
select
sno,
name,
salary
from employee
where salary>100000;
select * from temp_123

##Primary key usages 

create table ss(driver_id int not null primary key,pickuploc varchar(100), droploc varchar(100));

select * from ss;
insert into ss (driver_id,pickuploc,droploc) values (1001,'chennai','tvl');
insert into ss (driver_id,pickuploc,droploc) values (1002,'chennfi','tvr');
insert into ss (driver_id,pickuploc,droploc) values (1001,'chennai','tvf');

##unique key 
drop table nn;

create table naaz (driver_id int unique key,pickuploc varchar(100), droploc varchar(100));

insert into naaz (driver_id,pickuploc,droploc) values (null,'chennai','tvl');
insert into naaz (driver_id,pickuploc,droploc) values (1002,'chennfi','tvr');
insert into naaz (driver_id,pickuploc,droploc) values (1001,'chennai','tvf');

select * from naaz;

#check constraints;
drop table rides;
create table rides
(rides_id int not null primary key,
drivers_id int not null,
riders_id int not null,
droplocation varchar(100),
pickuplocation varchar(100),
fare int not null check ( fare > 0));

insert into rides (rides_id,drivers_id,riders_id ,droplocation ,pickuplocation ,fare) values 
( 101,102,201,'chennai','tirunelveli',5200);
insert into rides (rides_id,drivers_id,riders_id ,droplocation ,pickuplocation ,fare) values 
( 102,702,001,'chennai','tirunelveli',5200);
insert into rides (rides_id,drivers_id,riders_id ,droplocation ,pickuplocation ,fare) values 
( 103,202,701,'chennai','tirunelveli',5200);

select * from rides;


## Foreign Key
drop table rideer;
drop table drivers;

create table drivers(driver_id int primary key , ride_id int not null , licenseno varchar(18));
select * from drivers;

insert into drivers (driver_id,ride_id,licenseno) values (101 , 202 , 'sjkbbkbnk');
insert into drivers (driver_id,ride_id,licenseno) values (102 , 203 , 'sjkbbkrrbnk');
select * from drivers;

create table rider( ride_id int not null ,driver_id int, pickuploc varchar(100), droploc varchar(100),
foreign key (driver_id ) references drivers (driver_id) on delete cascade );



insert into rider(ride_id,driver_id,pickuploc,droploc) values (201,101,'chennai','tvl');
insert into rider(ride_id,driver_id,pickuploc,droploc) values (203,101,'chennai','tdvl');
insert into rider(ride_id,driver_id,pickuploc,droploc) values (203,102,'chennai','tdvl');
select * from rider;


delete from drivers where driver_id = 102;



