create database tt;
use tt;

CREATE TABLE sales (
    TransactionID INT,
    Store CHAR(1),
    SalesAmount DECIMAL(10,2)
);

INSERT INTO sales (TransactionID, Store, SalesAmount)
VALUES
(1, 'A', 100.00),
(2, 'A', 200.00),
(3, 'A', 150.00),
(4, 'B', 250.00),
(5, 'B', 300.00);

#sum in window function 
select TransactionID, Store, SalesAmount ,
	sum(SalesAmount) over (partition by Store  order by TransactionID desc   ) as totalamt  from sales;
    
#avg 
select TransactionID, Store, SalesAmount ,
	avg(SalesAmount) over (partition by Store order by TransactionID desc  ) as avgamt  from sales;
    
#min 
select TransactionID, Store, SalesAmount ,
	min(SalesAmount) over (partition by Store order by TransactionID desc ) as minamt  from sales;
#max 
select TransactionID, Store, SalesAmount ,
	max(SalesAmount) over (partition by Store order by TransactionID desc ) as maxamt  from sales; 

#count 
select TransactionID, Store, SalesAmount ,
	count(SalesAmount) over (partition by Store order by TransactionID desc  ) as countamt  from sales;
    
CREATE TABLE sales1 (
    TransactionID INT,
    Store CHAR(1),
    SalesAmount DECIMAL(10,2)
);

INSERT INTO sales1 (TransactionID, Store, SalesAmount)
VALUES
(1, 'A', 100.00),
(2, 'A', 200.00),
(3, 'A', 150.00),
(4, 'B', 250.00),
(5, 'B', 300.00);

#row number 
select
TransactionID, 
Store, 
SalesAmount ,
row_number() over ( partition by Store order by SalesAmount desc) as rowval 
from sales1;

#using row we can remove duplicates 

CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, Name, Department, HireDate)
VALUES
(1, 'Alice', 'HR', '2020-05-01'),
(1, 'Alice', 'HR', '2022-06-15'),
(2, 'Bob', 'IT', '2021-07-10'),
(3, 'Charlie', 'Finance', '2020-09-30'),
(3, 'Charlie', 'Finance', '2022-05-22');

select EmployeeID, Name, Department, HireDate, 
row_number() over (partition by EmployeeID order by HireDate asc ) as rowq from Employees;

with emp as (
    select EmployeeID, Name, Department, HireDate, 
row_number() over (partition by EmployeeID order by HireDate asc ) as rowq from Employees
)
select EmployeeID, Name, Department, HireDate from emp 
where rowq = 1 ;

#rank and dense rank 

CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50),
    ExamScore INT
);

INSERT INTO Students (StudentID, StudentName, ExamScore)
VALUES
(1, 'Alice', 95),
(3, 'Charlie', 95),
(2, 'Bob', 90),
(5, 'Eva', 90),
(4, 'David', 85);


#rank 
select StudentID, 
 StudentName, 
 ExamScore,
 rank () over (order by ExamScore desc) as examsc from Students ;
 
 #dense rank
 select StudentID, 
 StudentName, 
 ExamScore,
 dense_rank () over (order by ExamScore desc) as examsc from Students ;
 
 #percent rank 
 
 CREATE TABLE Students1 (
    StudentID INT,
    StudentName VARCHAR(50),
    Department VARCHAR(50),
    ExamScore INT
);

INSERT INTO Students1
    (StudentID, StudentName, Department, ExamScore)
VALUES
(1, 'Alice', 'HR', 95),
(2, 'Bob', 'IT', 72),
(3, 'Charlie', 'Finance', 95),
(4, 'David', 'IT', 60),
(5, 'Eva', 'HR', 88),
(6, 'Frank', 'Finance', 45),
(7, 'Grace', 'IT', 72),
(8, 'Hari', 'HR', 55),
(9, 'Irene', 'Finance', 81),
(10, 'Jack', 'IT', 90),
(11, 'Kavi', 'HR', 45),
(12, 'Leo', 'Finance', 67),
(13, 'Maya', 'IT', 98),
(14, 'Noah', 'HR', 81),
(15, 'Olivia', 'Finance', 60),
(16, 'Peter', 'IT', 75),
(17, 'Quinn', 'HR', 90),
(18, 'Ravi', 'Finance', 55),
(19, 'Sara', 'IT', 88),
(20, 'Tom', 'HR', 67);

#percent rank 
select StudentID, StudentName, Department, ExamScore ,
percent_rank() over ( order by ExamScore desc) as perrank  ,
rank() over ( order by ExamScore desc) as denrank  from Students1;

#ntile 
CREATE TABLE EmployeeSales (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    SalesAmount INT
);
INSERT INTO EmployeeSales (EmployeeID, EmployeeName, SalesAmount) VALUES
(1, 'Alice', 10000),
(2, 'Bob', 8500),
(3, 'Charlie', 7500),
(4, 'David', 6000),
(5, 'Eva', 11000),
(6, 'Frank', 4500),
(7, 'Grace', 3000),
(8, 'Hank', 4000),
(9, 'Ivy', 8000),
(10, 'Jack', 9500);

select EmployeeID, EmployeeName, SalesAmount ,
ntile(4) over (order by SalesAmount desc) as nvalue from EmployeeSales;

#lag 
drop table if exists EmployeeSalary;
CREATE TABLE EmployeeSalary (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10,2),
    DYear INT,
    PRIMARY KEY (EmployeeID, DYear)
);

INSERT INTO EmployeeSalary (EmployeeID, EmployeeName, Salary, DYear) VALUES
(1, 'Alice', 5000.00, 2023),
(1, 'Alice', 5500.00, 2024),
(2, 'Bob', 4500.00, 2023),
(2, 'Bob', 4800.00, 2024),
(3, 'Charlie', 4000.00, 2023),
(3, 'Charlie', 4200.00, 2024),
(4, 'David', 4600.00, 2023),
(4, 'David', 4700.00, 2024);
#lag 
select
EmployeeID, EmployeeName, Salary, Dyear,
coalesce( lag(Salary)  over  (partition by EmployeeID order by DYear ),0 )as prevyear ,
Salary - lag(Salary) over  (partition by EmployeeID order by DYear ) as prevyear
from EmployeeSalary;

#lead
CREATE TABLE ProductSales (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SaleAmount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO ProductSales (ProductID, ProductName, SaleDate, SaleAmount) VALUES
(1, 'Product A', '2025-01-01', 500.00),
(2, 'Product A', '2025-02-02', 400.00),
(3, 'Product A', '2025-03-01', 700.00),
(4, 'Product A', '2025-04-02', 500.00);

#lead 
select ProductID, 
ProductName, 
SaleDate, 
SaleAmount ,
lead (SaleAmount) over (order by SaleDate ) as SALE,
lead (SaleAmount) over (order by SaleDate ) - SaleAmount as SALEDIFF 
FROM ProductSales;

#FIRST_VALUE()
DROP TABLE IF EXISTS EmployeeSalary;
CREATE TABLE EmployeeSalary (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10,2),
    Year INT,
    PRIMARY KEY (EmployeeID, Year)
);

INSERT INTO EmployeeSalary (EmployeeID, EmployeeName, Salary, Year) VALUES
(1, 'Alice', 5000.00, 2021),
(1, 'Alice', 5500.00, 2022),
(1, 'Alice', 6000.00, 2023),
(1, 'Alice', 6500.00, 2024),
(1, 'Alice', 7000.00, 2025),
(2, 'Bob', 4500.00, 2023),
(2, 'Bob', 4800.00, 2024),
(3, 'Charlie', 4000.00, 2023),
(3, 'Charlie', 4200.00, 2024),
(4, 'David', 4600.00, 2023),
(4, 'David', 4700.00, 2024);

#FIRST VALUE 
SELECT EmployeeID, EmployeeName, Salary, Year ,
first_value(Salary) over (partition by EmployeeID order by Year) as prevs from EmployeeSalary;

#last salary 
select *,
last_value(Salary) over (partition by EmployeeID order by Year
                         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as lastsalary
from EmployeeSalary;

#nth value 
CREATE TABLE EmployeeSalaries (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    SalaryDate DATE
);
INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Department, Salary, SalaryDate) VALUES
(8, 'Hank', 'Engineering', 8500.00, '2025-01-08'),
(3, 'Charlie', 'Engineering', 8000.00, '2025-01-03'),
(5, 'Eva', 'Engineering', 7500.00, '2025-01-05'),
(2, 'Bob', 'Engineering', 7000.00, '2025-01-02'),
(6, 'Frank', 'Engineering', 6500.00, '2025-01-06'),
(4, 'David', 'HR', 6000.00, '2025-01-04'),
(7, 'Grace', 'HR', 5500.00, '2025-01-07'),
(1, 'Alice', 'HR', 5000.00, '2025-01-01');
select *,
nth_value(salary, 2) over (PARTITION BY Department ORDER BY Salary DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as nth
from EmployeeSalaries ;

SELECT EmployeeID, EmployeeName, Department, Salary,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rnk
FROM EmployeeSalaries;

with sal as (SELECT EmployeeID, EmployeeName, Department, Salary,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rnk
FROM EmployeeSalaries
)
SELECT EmployeeID, EmployeeName, Department, Salary
from  sal 
where rnk = 2;


# union and union all 
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS contractors;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    position    VARCHAR(50),
    salary      DECIMAL(10,2)
);

CREATE TABLE contractors (
    contractor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    position      VARCHAR(50),
    hourly_rate   DECIMAL(10,2)
);


INSERT INTO employees (first_name, last_name, position, salary) VALUES
('Alice', 'Johnson', 'Developer', 75000.00),
('Bob', 'Smith', 'Manager', 90000.00),
('Charlie', 'Brown', 'Analyst', 65000.00),
('David', 'Lee', 'Designer', 60000.00),
('Grace', 'Hall', 'Developer', 72000.00);

INSERT INTO contractors (first_name, last_name, position, hourly_rate) VALUES
('Eva', 'Green', 'Developer', 55.00),
('Bob', 'Smith', 'Manager', 80.00),
('Frank', 'White', 'Designer', 45.00),
('Alice', 'Johnson', 'Developer', 60.00),
('Henry', 'Clark', 'Analyst', 50.00);

#union 
select first_name, last_name, position  from employees
union 
select first_name, last_name, position from contractors;

#union all 
select first_name, last_name, position  from employees
union all 
select first_name, last_name, position from contractors;

#index function 
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL,
    city        VARCHAR(100) NOT NULL
);

create index e_email on customers(email);

INSERT INTO customers (first_name, last_name, email, city) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', 'Chennai'),
('Bob', 'Smith', 'bob.smith@example.com', 'Mumbai'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'Delhi'),
('David', 'Lee', 'david.lee@example.com', 'Bengaluru'),
('Eva', 'Green', 'eva.green@example.com', 'Chennai'),
('Frank', 'White', 'frank.white@example.com', 'Hyderabad');

select * from customers;
select * from customers where email = 'bob.smith@example.com' ;
explain
select * from customers where email = 'bob.smith@example.com' ;
explain analyze
select * from customers where email = 'bob.smith@example.com' ;
explain format = json
select * from customers where email = 'bob.smith@example.com' ;

#partition 
drop table if exists orders  ;
CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT,
    order_date    DATE NOT NULL,
    customer_name VARCHAR(50),
    amount        DECIMAL(10,2),
    PRIMARY KEY (order_id, order_date)
)

partition by range (year(order_date )) (
partition p_bef_2020 values less than (2020),
partition p_2020 values less than (2021),
partition p_2021 values less than (2022),
partition p_2022 values less than (2023),
partition p_maxvalues  values less than maxvalue
);

INSERT INTO orders (order_date, customer_name, amount)
VALUES
('2019-05-10', 'Alice',     100.00),
('2020-01-15', 'Bob',       200.50),
('2020-12-01', 'Charlie',   300.00),
('2021-07-20', 'Diana',     150.75),
('2022-03-02', 'Edward',    500.00),
('2025-06-18', 'FutureMan', 9999.99);
select * from orders ;

select order_date, customer_name, amount from orders 
where order_date = '2020-12-01';

explain format = json
select order_date, customer_name, amount from orders 
where order_date = '2020-12-01';

#list partition 
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    department  VARCHAR(50) NOT NULL,
    PRIMARY KEY (employee_id, department)
)
PARTITION BY LIST COLUMNS (department) (
    PARTITION p_sales       VALUES IN ('Sales'),
    PARTITION p_hr          VALUES IN ('HR'),
    PARTITION p_engineering VALUES IN ('Engineering', 'DevOps'),
    PARTITION p_other       VALUES IN ('Finance', 'Marketing', 'Operations')
);

INSERT INTO employees (first_name, last_name, department)
VALUES
('Alice', 'Smith', 'Sales'),
('Bob', 'Johnson', 'HR'),
('Charlie', 'Lee', 'Engineering'),
('Diana', 'Lopez', 'DevOps'),
('Eve', 'Turner', 'Marketing');

select * from employees where department = 'Sales';

explain format  = json
select * from employees where department = 'Sales';

#hash partition 
CREATE TABLE sensor_data (
    sensor_id     INT NOT NULL,
    reading_time  DATETIME NOT NULL,
    reading_value DECIMAL(10,2),
    PRIMARY KEY (sensor_id, reading_time)
)
PARTITION BY HASH(sensor_id)
PARTITIONS 2;

INSERT INTO sensor_data (sensor_id, reading_time, reading_value)
VALUES
(101, '2025-01-01 10:00:00', 23.50),
(102, '2025-01-01 10:05:00', 24.10),
(103, '2025-01-01 10:10:00', 22.75),
(104, '2025-01-01 10:15:00', 25.00),
(105, '2025-01-01 10:20:00', 20.00),
(106, '2025-01-01 10:25:00', 21.60);

select *from sensor_data where sensor_id = 101;

explain format = json 
select *from sensor_data where sensor_id = 101;

#sub partition 
drop table if exists orders;
CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT,
    order_date    DATE NOT NULL,
    customer_name VARCHAR(50),
    amount        DECIMAL(10,2),
    PRIMARY KEY (order_id, order_date)
)
PARTITION BY RANGE (YEAR(order_date))
SUBPARTITION BY HASH (MONTH(order_date))
SUBPARTITIONS 2
(
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020       VALUES LESS THAN (2021),
    PARTITION p_future     VALUES LESS THAN MAXVALUE
);

INSERT INTO orders
(order_id, order_date, customer_name, amount)
VALUES
(101, '2020-02-10', 'Ravi', 1500.00),
(102, '2020-06-15', 'Arun', 2500.00),
(103, '2020-11-20', 'Priya', 1800.00),
(104, '2021-03-12', 'Kumar', 3200.00),
(105, '2021-09-25', 'Divya', 2100.00),
(106, '2022-02-05', 'Bala', 4500.00),
(107, '2022-06-18', 'Meena', 2800.00),
(108, '2023-04-22', 'Siva', 3500.00),
(109, '2024-08-14', 'Nila', 5200.00),
(110, '2025-12-30', 'Vijay', 1900.00);
select * from orders;

select * from orders where order_date = '2021-03-12'  ; 
explain format = json
select * from orders where order_date = '2021-03-12'  ; 