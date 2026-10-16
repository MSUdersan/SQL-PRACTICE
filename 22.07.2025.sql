create database nn;
use nn;
create table dep(sno int not null , name varchar(90), salary int not null);
select * from dep;
insert into dep( sno , name , salary) values ( 1 , 'san' , 60000);
insert into dep( sno , name , salary) values ( 2 , 'kksan' , 460000);
insert into dep( sno , name , salary) values ( 3, 'samnn' , 670000);
insert into dep( sno , name , salary) values ( 4 , 'sasdcn' , 620000);
insert into dep( sno , name , salary) values ( 5 , 'sanghi' , 160000);
select * from dep;
alter table dep add address varchar(100);
select * from dep;
update dep set address = ' street1' where sno=1;
update dep set address = ' street15' where sno=2;
update dep set address = ' street14' where sno=3;
update dep set address = ' street1er' where sno=4;
update dep set address = ' street123' where sno=5;
select * from dep;
delete from dep where sno=1;
update dep set sno=1;
drop table dep;


#ctas 

create table employee(sno int not null, name varchar(100) , salary int not null);
insert into employee( sno , name , salary) values ( 1 , 'skan' , 60000);
insert into employee( sno , name , salary) values ( 2 , 'kksan' , 460000);
insert into employee( sno , name , salary) values ( 3, 'samnn' , 670000);
insert into employee( sno , name , salary) values ( 4 , 'sasdcn' , 620000);
insert into employee( sno , name , salary) values ( 5 , 'sanghi' , 160000);
select * from employee;

create table wrokers as
select
sno ,
name,
salary
from employee
where salary > 100000;
select * from employee;

##temporary table 
create temporary table temp_123(sno int not null, name varchar(25));
insert into temp_123
select
sno,
name
from employee
where salary >60000;

select * from temp_123

create database uber;
use uber;
drop table rides;
create table rides
(rides_id int not null primary key,
drivers_id int not null,
riders_id int not null,
droplocation varchar(100),
pickuplocation varchar(100),
fare int not null check (fare > 0));

select * from rides;

insert into rides (rides_id,drivers_id,riders_id ,droplocation ,pickuplocation ,fare) values 
( 101,102,201,'chennai','tirunelveli',-5200);
insert into rides (rides_id,drivers_id,riders_id ,droplocation ,pickuplocation ,fare) values 
( 101,702,001,'chennai','tirunelveli',5200);
insert into rides (rides_id,drivers_id,riders_id ,droplocation ,pickuplocation ,fare) values 
( 103,202,701,'chennai','tirunelveli',5200);
insert into rides (rides_id,drivers_id,riders_id ,droplocation ,pickuplocation ,fare) values 
( 104,602,301,'chennai','tirunelveli',5200);