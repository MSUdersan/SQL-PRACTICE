create database san;
use san;

create table shop(sno int primary key ,name varchar(100), salary int not null , address varchar(100) default 'ind' );
select * from shop;

insert into shop (sno,name,salary) values ( 101 , 'naaz' , 10000 );
insert into shop (sno,name,salary) values ( 102 , 'nadaz' , 105000 );
insert into shop (sno,name,salary) values ( 103 , 'nagaz' , 140000 );
insert into shop (sno,name,salary) values ( 104 , 'naaqz' , 210000 );
insert into shop (sno,name,salary) values ( 105 , 'naadsz' , 108000 );

select * from shop;

update shop set name='mnaaz' where sno=101;
select * from shop;

alter table shop add years varchar(100);
select * from shop;

update shop set years=2 where sno=101;
update shop set years=1 where sno=102;
update shop set years=5 where sno=103;
update shop set years=7 where sno=104;
update shop set years=9 where sno=105;

select * from shop;

#CTAS
create table emmp as
select
sno,
name
from shop
where salary > 100000;

select * from emmp;

#temporary table 
create temporary table tempp_12
select 
sno,
years
from shop 
where years > 2;

select * from tempp_12;

select * from shop where years > 3 and salary >100000 ;

select * from shop order by years;

create database ola;
use ola;

drop table driver;
create table driver(driver_id int primary key , ride_id int not null , lisence int unique key);
select * from driver;

insert into driver(driver_id,ride_id,lisence) values (101,201,'45655151'); 
insert into driver(driver_id,ride_id,lisence) values (102,202,'45675151');
insert into driver(driver_id,ride_id,lisence) values (103,203,'45635151');

drop table rider;
create table rider(driver_id int not null , rides int not null , droploc varchar(45) , pickup varchar(50),
foreign key (driver_id) references driver (driver_id) on delete cascade);
select * from rider;

insert into rider(driver_id,rides,droploc,pickup) values (101,3,'sss','fff');
insert into rider(driver_id,rides,droploc,pickup) values (102,10,'esss','kfff');
insert into rider(driver_id,rides,droploc,pickup) values (103,35,'srss','ffpf');
insert into rider(driver_id,rides,droploc,pickup) values (101,73,'ssms','offf');


delete from rider where driver_id = 101;
select * from rider order by rides ;
select * from rider where rides > 0;

delete from driver where driver_id = 101;

alter table rider add column is_delete boolean default false;

select * from rider;
update rider set is_delete=true where driver_id= 102;
