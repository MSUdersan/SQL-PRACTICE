create database nn;
use nn;
create table ss(sno int primary key, name varchar(100));
select * from ss;
insert into ss (sno , name ) values ( 101, 'sara');
insert into ss (sno , name ) values ( 102, 'sata');
insert into ss (sno , name ) values ( 103, 'mdsara');
insert into ss (sno , name ) values ( 104, 'sawra');
select * from ss

update ss set name ='nsara' where sno=101;
select * from ss;

delete from ss where sno=101;
select * from ss;

truncate table ss;
select * from ss;

drop table ss;
select * from ss;

#CTAS
create table empoyee(sno int not null,name varchar(100),address varchar(100),salary int not null);
select * from empoyee;
insert into empoyee(sno,name,address,salary) values ( 1 , 'viji' ,'no101 ', 5000);
insert into empoyee(sno,name,address,salary) values ( 2 , 'san'  ,'no102 ', 75000);
insert into empoyee(sno,name,address,salary) values ( 3 , 'sara ','no103 ', 15000);
insert into empoyee(sno,name,address,salary) values ( 4 , 'naaz ','no104' , 55000);
insert into empoyee(sno,name,address,salary) values ( 5 , 'zart ','no105 ', 25000);

select * from empoyee;

create table high_employee as
select
sno,
name,
address,
salary
from empoyee
where salary > 6000;
select * from high_employee;

#creating temporary table
create table temp_empoyee(sno int not null,name varchar(100));
insert into temp_empoyee
select 
sno,
name
from empoyee
where salary > 15000;

select * from temp_empoyee