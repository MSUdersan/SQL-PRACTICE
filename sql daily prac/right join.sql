create database kk;
use kk;

CREATE TABLE departs (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
 
CREATE TABLE empls(
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    dept_id    INT NULL,          -- Elango has no department
    manager_id INT NULL,          -- Arun has no manager
    salary     INT NOT NULL
);
CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    emp_id   INT NOT NULL,
    amount   INT NOT NULL
);

INSERT INTO departs (dept_id, dept_name) VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance'),
(40, 'Marketing'); 

INSERT INTO empls (emp_id, name, dept_id, manager_id, salary) VALUES
(1, 'Arun',   10,   NULL, 90000),
(2, 'Bala',   10,   1,    60000),
(3, 'Chitra', 20,   1,    65000),
(4, 'Deepa',  20,   3,    50000),
(5, 'Elango', NULL, 3,    45000),
(6, 'Farah',  30,   1,    55000);

INSERT INTO orders1 (order_id, emp_id, amount) VALUES
(101, 2, 500),
(102, 2, 700),
(103, 4, 300),
(104, 7, 900);

select * from departs;
select * from empls;
select * from orders1;


##RIGHT JOIN
##10. Ella departments-um, avangaloda employees-um kaattunga. Employee illaadha department-um
##varanum.
##11. Employee onnum illaadha department-ah kandupidinga. (Marketing varanum)
##12. Ella orders-um, employee name-oda kaattunga. Employee record illaadha order-um varanum.
##13. Employees table-la match aagaadha orders-ah mattum list pannunga.
##14. Question 10-ah LEFT JOIN use panni rewrite pannunga. (Table order maathina RIGHT = LEFT
##nu purinjikkalam)

select * from departs;

select
e.name,
d.dept_name
from empls e
right  join departs d on e.dept_id = d.dept_id;

select
d.dept_name,
e.name
from empls e
right  join departs d on e.dept_id = d.dept_id
where e.name is null;


select 
o.order_id,
e.name
from empls e
right join orders1 o on e.emp_id = o.emp_id;

select 
o.order_id,
e.name
from empls e
right join orders1 o on e.emp_id = o.emp_id
where e.name is null;

select
e.name,
d.dept_name
from departs d
right  join empls e  on e.dept_id = d.dept_id;
