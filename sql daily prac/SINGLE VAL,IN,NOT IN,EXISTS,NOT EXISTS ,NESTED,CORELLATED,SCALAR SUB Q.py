#!/usr/bin/env python
# coding: utf-8

# In[3]:


get_ipython().run_line_magic('load_ext', 'sql')


# In[4]:


get_ipython().run_line_magic('sql', 'sqlite:///practice.db')


# In[28]:


get_ipython().run_cell_magic('sql', '', 'DROP TABLE IF EXISTS order_items;\nDROP TABLE IF EXISTS orders;\nDROP TABLE IF EXISTS products;\nDROP TABLE IF EXISTS cust;\nDROP TABLE IF EXISTS emps;\nDROP TABLE IF EXISTS dept;\nCREATE TABLE dept(\n    dept_id    INT PRIMARY KEY,\n    dept_name  VARCHAR(50) NOT NULL,\n    location   VARCHAR(50)\n);\n\nCREATE TABLE emps (\n    emp_id      INT PRIMARY KEY,\n    name        VARCHAR(50) NOT NULL,\n    salary      DECIMAL(10,2),\n    dept_id     INT,\n    manager_id  INT NULL,\n    hire_date   DATE,\n    FOREIGN KEY (dept_id)    REFERENCES departments(dept_id),\n    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)\n);\n\nCREATE TABLE cust (\n    customer_id  INT PRIMARY KEY,\n    name         VARCHAR(50) NOT NULL,\n    city         VARCHAR(50)\n);\n\nCREATE TABLE orders (\n    order_id     INT PRIMARY KEY,\n    customer_id  INT,\n    amount       DECIMAL(10,2),\n    order_date   DATE,\n    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)\n);\n\nCREATE TABLE products (\n    product_id  INT PRIMARY KEY,\n    name        VARCHAR(50) NOT NULL,\n    price       DECIMAL(10,2),\n    category    VARCHAR(50)\n);\n\nCREATE TABLE order_items (\n    order_id    INT,\n    product_id  INT,\n    quantity    INT,\n    PRIMARY KEY (order_id, product_id),\n    FOREIGN KEY (order_id)   REFERENCES orders(order_id),\n    FOREIGN KEY (product_id) REFERENCES products(product_id)\n);\n')


# In[29]:


get_ipython().run_cell_magic('sql', '', "INSERT INTO dept (dept_id, dept_name, location) VALUES\n(10, 'Sales',     'Chennai'),\n(20, 'IT',        'Chennai'),\n(30, 'HR',        'Mumbai'),\n(40, 'Finance',   'Delhi'),\n(50, 'Marketing', 'Mumbai');\n\n\nINSERT INTO emps (emp_id, name, salary, dept_id, manager_id, hire_date) VALUES\n(1,  'Arun',     90000, 20, NULL, '2018-03-15'),\n(2,  'Bala',     75000, 10, 1,    '2019-06-01'),\n(3,  'Charan',   60000, 10, 2,    '2020-01-10'),\n(4,  'Divya',    55000, 10, 2,    '2021-07-20'),\n(5,  'Esha',     80000, 20, 1,    '2019-11-05'),\n(6,  'Farhan',   65000, 20, 5,    '2020-09-14'),\n(7,  'Gayathri', 45000, 20, 5,    '2022-02-28'),\n(8,  'Hari',     50000, 30, 1,    '2021-03-03'),\n(9,  'Indu',     40000, 30, 8,    '2023-05-17'),\n(10, 'Jeeva',    70000, 40, 1,    '2020-12-01'),\n(11, 'Karthik',  52000, 40, 10,   '2024-01-09'),\n(12, 'Lakshmi',  38000, 10, 3,    '2026-02-11'),\n(13, 'Meena',    58000, 30, NULL, '2022-08-08');\n\n\nINSERT INTO cust (customer_id, name, city) VALUES\n(1, 'Ravi',   'Chennai'),\n(2, 'Sneha',  'Mumbai'),\n(3, 'Anil',   'Delhi'),\n(4, 'Priya',  'Chennai'),\n(5, 'Kiran',  'Bengaluru'),\n(6, 'Meera',  'Mumbai'),\n(7, 'Suresh', 'Delhi'),\n(8, 'Tara',   'Chennai');\n\n\nINSERT INTO products (product_id, name, price, category) VALUES\n(1,  'Laptop',       55000, 'Electronics'),\n(2,  'Smartphone',   30000, 'Electronics'),\n(3,  'Headphones',    3000, 'Electronics'),\n(4,  'Office Chair',  8000, 'Furniture'),\n(5,  'Study Table',  12000, 'Furniture'),\n(6,  'Sofa',         25000, 'Furniture'),\n(7,  'Notebook',       100, 'Stationery'),\n(8,  'Pen Set',        250, 'Stationery'),\n(9,  'Backpack',      1500, 'Accessories'),\n(10, 'Desk Lamp',      900, 'Furniture');\n\n\nINSERT INTO orders (order_id, customer_id, amount, order_date) VALUES\n(101, 1, 58000, '2025-01-15'),\n(102, 1,  3000, '2025-06-20'),\n(103, 2, 33000, '2025-03-10'),\n(104, 3, 12000, '2025-08-05'),\n(105, 4,  8000, '2026-01-12'),\n(106, 4, 25000, '2026-03-18'),\n(107, 2, 55000, '2026-02-02'),\n(108, 5,  1500, '2025-11-11'),\n(109, 3, 30000, '2026-05-25'),\n(110, 6,   100, '2025-09-09'),\n(111, 1, 12000, '2026-04-04'),\n(112, 2,  3000, '2026-06-30');\n\nINSERT INTO order_items (order_id, product_id, quantity) VALUES\n(101, 1, 1),\n(101, 3, 1),\n(102, 3, 1),\n(103, 2, 1),\n(103, 3, 1),\n(104, 5, 1),\n(105, 4, 1),\n(106, 6, 1),\n(107, 1, 1),\n(108, 9, 1),\n(109, 2, 1),\n(110, 7, 1),\n(111, 5, 1),\n(112, 3, 1);\n")


# In[6]:


get_ipython().run_cell_magic('sql', '', 'select * from dept;\n')


# In[7]:


get_ipython().run_cell_magic('sql', '', 'select * from emp;\n')


# 

# In[8]:


get_ipython().run_cell_magic('sql', '', 'select * from cust;\n')


# In[9]:


get_ipython().run_cell_magic('sql', '', 'select * from orders;\n')


# In[10]:


get_ipython().run_cell_magic('sql', '', 'select * from products;\n')


# In[11]:


get_ipython().run_cell_magic('sql', '', 'select * from order_items;\n')


# In[13]:


""" 1. Single value subquery

1. Highest salary vaangura employee-oda name-ah find pannunga.
2. Average salary-ah vida adhigama sambalam vaangura employees-ai list pannunga.
3. Ella products-oda average price-ah vida kammiya irukkura products-ai kaattunga.
4. Latest hire_date irukkura employee-ai kandupidinga.
5. Max amount-oda order panna customer-oda name-ah kaattunga. """


# In[16]:


get_ipython().run_cell_magic('sql', '', 'SELECT name, salary\nFROM emp\nWHERE salary = (\n    SELECT MAX(salary)\n    FROM emp\n);\n')


# In[18]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\nsalary\nfrom emp\nwhere salary > (select avg(salary) as avgsal\n                from emp);\n')


# In[21]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\nprice\nfrom products\nwhere price < (select avg(price) as avgprice\n                from products);\n')


# In[31]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\nhire_date\nfrom emp\nwhere hire_date = (select max(hire_date) as maxhig\n                    from emp);\n')


# In[36]:


get_ipython().run_cell_magic('sql', '', 'select customer_id,\nmax(amount) \nfrom orders\n')


# In[41]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\ncustomer_id\nfrom cust\nwhere customer_id = (select customer_id\n                     from orders\n                     order by amount desc\n                     limit 1);\n')


# In[48]:


"""2. IN
1. Chennai-la irukkura departments-la velai seiyura employees-ai list pannunga.
2. Oru vaati-yaavadhu order panna customers-oda names-ai kaattunga.
3. "Electronics" category products-ai order panna order_ids-ai kandupidinga.
4. Yaarukkavadhu manager-ah irukkura employees-ai list pannunga.
5. Mumbai or Delhi customers panna orders-ai kaattunga."""


# In[50]:


get_ipython().run_cell_magic('sql', '', 'select * from emp\nlimit 2;\n')


# In[51]:


get_ipython().run_cell_magic('sql', '', 'select\nname ,\ndept_id\nfrom emp\nwhere dept_id in (select dept_id\n                    from dept\n                    where location = "Chennai");\n')


# In[52]:


get_ipython().run_cell_magic('sql', '', 'select * from dept where location = "Chennai"\n')


# In[59]:


get_ipython().run_cell_magic('sql', '', 'select\ncustomer_id,\nname\nfrom cust\nwhere customer_id in (select customer_id \n                            from orders);\n')


# In[64]:


get_ipython().run_cell_magic('sql', '', 'select\norder_id,\nproduct_id\nfrom order_items\nwhere product_id in (select product_id\n                    from products\n                    where category = "Electronics");\n')


# In[66]:


get_ipython().run_cell_magic('sql', '', 'select * from emp;\n')


# In[70]:


get_ipython().run_cell_magic('sql', '', 'select \nname,\nemp_id\nfrom emp\nwhere emp_id in (select manager_id\n                        from emp);S\n')


# In[69]:


get_ipython().run_cell_magic('sql', '', 'select manager_id\nfrom emp;\n')


# In[75]:


get_ipython().run_cell_magic('sql', '', 'select\norder_id,\ncustomer_id\nfrom orders\nwhere customer_id in (select customer_id \n                      from cust\n                      where city in ("Chennai","Mumbai")\n                      );\n')


# In[76]:


"""3. NOT IN
1. Ethuvume order pannaadha customers-ai list pannunga.
2. Employees illaadha departments-ai kandupidinga.
3. Ethuvum order-la varaadha products-ai kaattunga.
4. Manager-ah illaadha employees-ai list pannunga.
5. 2026-la order pannaadha customers-ai kandupidinga"""


# In[81]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\ncustomer_id \nfrom cust\nwhere customer_id not in (select customer_id\nfrom orders);\n')


# In[86]:


get_ipython().run_cell_magic('sql', '', 'select\ndept_id,\ndept_name\nfrom dept\nwhere dept_id not in (select dept_id\n                            from emp);\n')


# In[95]:


get_ipython().run_cell_magic('sql', '', 'select\nproduct_id,\nname\nfrom products\nwhere product_id not in (select product_id \n                            from order_items);\n')


# In[96]:


get_ipython().run_cell_magic('sql', '', 'select * from emp;\n')


# In[103]:


get_ipython().run_cell_magic('sql', '', 'select\nemp_id,\nname\nfrom emp\nwhere emp_id not in (select manager_id from emp \n                     where manager_id is not null);\n')


# In[104]:


get_ipython().run_cell_magic('sql', '', 'select\nmanager_id\nfrom emp;\n')


# In[105]:


get_ipython().run_cell_magic('sql', '', 'select * from orders\nlimit 2;\n')


# In[106]:


get_ipython().run_cell_magic('sql', '', 'select * from cust\nlimit 2;\n')


# In[108]:


get_ipython().run_cell_magic('sql', '', 'select\ncustomer_id,\nname \nfrom cust\nwhere customer_id not in (select customer_id\n                            from orders);\n')


# In[109]:


"""4. EXISTS
1. Kurainjadhu oru order-aavadhu irukkura customers-ai kaattunga.
2. Kurainjadhu oru employee irukkura departments-ai list pannunga.
3. 10,000-ku mela amount-la order irukkura customers-ai kandupidinga.
4. Order-la sell aagiyirukkura products-ai kaattunga.
5. Kurainjadhu oru subordinate irukkura managers-ai list pannunga."""


# In[135]:


get_ipython().run_cell_magic('sql', '', 'select\nc.customer_id,\nc.name\nfrom cust c\nwhere exists (select 1 \n             from orders o\n             where c.customer_id = o.customer_id);\n')


# In[118]:


get_ipython().run_cell_magic('sql', '', 'select * from emp\nlimit 2;\n')


# In[119]:


get_ipython().run_cell_magic('sql', '', 'select * from dept\nlimit 2;\n')


# In[120]:


get_ipython().run_cell_magic('sql', '', 'select\nd.dept_id,\nd.dept_name\nfrom dept d\nwhere exists (select 1 from emp e\n             where e.dept_id = d.dept_id)\n')


# In[121]:


get_ipython().run_cell_magic('sql', '', 'select * from cust\nlimit 2;\n')


# In[123]:


get_ipython().run_cell_magic('sql', '', 'select\nc.customer_id,\nc.name \nfrom cust c\nwhere exists (select 1 from orders o\n             where amount > 10000 and c.customer_id = o.customer_id)\n')


# In[131]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\np.category,\np.product_id\nfrom products p \nwhere exists (select 1 from order_items o\n             where o.product_id = p.product_id)\n')


# In[136]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\ne.emp_id\nfrom emp e\nwhere exists (select 1 \n             from emp m\n             where m.manager_id = e.emp_id);\n')


# In[137]:


get_ipython().run_line_magic('config', 'SqlMagic.displaylimit = None')


# In[139]:


"""5. NOT EXISTS
1. Order illaadha customers-ai kaattunga.
2. Employee illaadha departments-ai list pannunga.
3. Ethuvum sell aagaadha products-ai kandupidinga.
4. Subordinate illaadha employees-ai kaattunga.


# In[146]:


get_ipython().run_cell_magic('sql', '', 'select\nc.name,\nc.customer_id\nfrom cust c\nwhere NOT exists (select 1 from orders o \n                 where o.customer_id = c.customer_id );\n')


# In[149]:


get_ipython().run_cell_magic('sql', '', 'select\nd.dept_id,\nd.dept_name\nfrom dept d\nwhere Not exists (select 1\n                 from emp e\n                 where e.dept_id = d.dept_id);\n')


# In[153]:


get_ipython().run_cell_magic('sql', '', 'select\np.product_id,\np.name \nfrom products p\nwhere Not exists (select 1 from order_items o \n                 where o.product_id = p.product_id);\n')


# In[155]:


get_ipython().run_cell_magic('sql', '', 'select\ne.emp_id,\ne.name\nfrom emp e \nwhere Not exists (select 1 from emp m\n                 where m.manager_id = e.emp_id);\n')


# In[1]:


"""6. Correlated subquery
1. Avanga department-oda average salary-ah vida adhigama vaangura employees-ai kaattunga.
2. Ovvoru department-layum highest salary vaangura employee-ai kandupidinga.
3. Avanga customer-oda average order amount-ah vida adhigamaana orders-ai list pannunga.
4. Avanga category-oda average price-ah vida vilai adhigamaana products-ai kaattunga.
5. Ovvoru customer-oda latest order-ai kandupidinga.
"""


# In[13]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\ne.salary\nfrom emp e\nwhere e.salary > (select avg(m.salary) as avgsal from emp m\n               where e.dept_id = m.dept_id)\n')


# In[12]:


get_ipython().run_cell_magic('sql', '', 'select\ne.dept_id,\ne.name,\ne.salary\nfrom emp e\nwhere e.salary = (select max(m.salary) as avgsal from emp m\n               where e.dept_id = m.dept_id)\n')


# In[8]:


get_ipython().run_cell_magic('sql', '', 'select * from orders;\n')


# In[10]:


get_ipython().run_cell_magic('sql', '', 'select * from cust\nlimit 2\n')


# In[16]:


get_ipython().run_cell_magic('sql', '', 'select\no.customer_id,\no.amount\nfrom orders o \nwhere o.amount > (select avg(m.amount) as avgamt from orders m\n                  where o.customer_id = m.customer_id);\n')


# In[18]:


get_ipython().run_cell_magic('sql', '', 'select * from products;\n')


# In[20]:


get_ipython().run_cell_magic('sql', '', 'select\np.name,\np.price,\np.category\nfrom products p\nwhere p.price > (select avg(m.price) from products m\n                where p.category = m.category);\n')


# In[22]:


get_ipython().run_cell_magic('sql', '', 'select\no.customer_id,\no.order_date\nfrom orders o \nwhere o.order_date = (select max(order_date) from orders m \n                     where o.customer_id = m.customer_id);\n\n')


# In[23]:


"""7. Nested subquery
1. Highest average salary irukkura department-la irukkura employees-ai kaattunga.
2. Adhigamaa order panna customer-oda city-la irukkura ellaa customers-ai list pannunga.
3. Second highest salary-ah subquery use panni kandupidinga.
4. Best-selling product-ai vaangina customers-ai kaattunga.
5. Adhigamaa employees irukkura department-oda location-ai kandupidinga"""


# In[34]:


get_ipython().run_cell_magic('sql', '', 'select * from emp\n')


# In[26]:


get_ipython().run_cell_magic('sql', '', 'select * from dept\n')


# In[47]:


get_ipython().run_cell_magic('sql', '', 'SELECT \ne.name, \ne.salary, \ne.dept_id FROM emp e\nWHERE (SELECT AVG(m.salary) FROM emp m WHERE m.dept_id = e.dept_id)\n')


# In[49]:


get_ipython().run_cell_magic('sql', '', 'SELECT e.name, e.dept_id,\n       (SELECT AVG(m.salary) FROM emp m WHERE m.dept_id = e.dept_id) AS dept_avg\nFROM emp e;\n\n    \n')


# In[51]:


"""Adhigamaa order panna customer-oda city-la irukkura ellaa customers-ai list pannunga."""


# In[52]:


get_ipython().run_cell_magic('sql', '', 'select * from orders;\n')


# In[53]:


get_ipython().run_cell_magic('sql', '', 'select * from cust;\n')


# In[62]:


get_ipython().run_cell_magic('sql', '', 'select\nc1.customer_id,\nc1.name\nfrom cust c1\nwhere c1.city = (select \nc.city\nfrom cust c\nwhere c.customer_id = (\nselect customer_id from orders\norder by amount desc\nlimit 1)\n);\n')


# In[70]:


get_ipython().run_cell_magic('sql', '', 'select * from emp;\n')


# In[71]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\ne.salary\nfrom emp e\nwhere e.salary < (\nselect \nmax(salary) from emp\n)\norder by e.salary desc\nlimit 1;\n')


# In[69]:


get_ipython().run_line_magic('config', 'SqlMagic.displaylimit = None')


# In[72]:


"""4. Best-selling product-ai vaangina customers-ai kaattunga."""


# In[73]:


get_ipython().run_cell_magic('sql', '', 'select * from products;\n')


# In[74]:


get_ipython().run_cell_magic('sql', '', 'select * from order_items;\n')


# In[75]:


get_ipython().run_cell_magic('sql', '', 'select * from cust;\n')


# In[100]:


get_ipython().run_cell_magic('sql', '', 'select\nc.customer_id,\nc.name\nfrom cust c\nwhere c.customer_id in(\nselect\no.customer_id\nfrom orders o\nwhere o.order_id in (\nselect\noi.order_id \nfrom order_items oi\nwhere oi.product_id = (\nselect\np.product_id\nfrom products p\nwhere p.product_id = (\nselect\nproduct_id\nfrom order_items \ngroup by product_id \norder by sum(quantity) desc\nlimit 1)\n)\n)\n)    ;\n')


# In[104]:


"""8. ANY / ALL
1. Department 10-la irukkura ellaa employees-ah vida adhigama sambalam vaangura employees-ai
kaattunga (ALL).
2. Department 20-la yaaraavadhu oruthar-ah vida adhigama sambalam vaangura employees-ai list
pannunga (ANY).
3. "Furniture" category-la ellaa products-ah vida vilai adhigamaana products-ai kandupidinga.
4. Ethaavadhu oru Chennai customer-oda order-ah vida periya order-ai kaattunga.
5. Ellaa departments-oda average salary-ah vida kammiya sambalam vaangura employees-ai list
pannunga."""


# In[105]:


get_ipython().run_cell_magic('sql', '', 'select * from emp;\n')


# In[111]:


get_ipython().run_cell_magic('sql', '', 'select * from products;\n')


# In[ ]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\ndept_id,\nsalary\nfrom emp \nwhere salary > all  \n(select salary from emp where dept_id = 10 );\n')


# In[ ]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\ndept_id,\nsalary\nfrom emp \nwhere salary > any  \n(select salary from emp where dept_id = 20 );\n')


# In[ ]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\nprice\nfrom products\nwhere price > all (select price from product where category = "furniture");\n')


# In[112]:


"""9. Scalar subquery
1. Ovvoru employee-oda sambalathoda sernthu company average salary-yum kaattunga.
2. Ovvoru order-oda sernthu total orders count-ah kaattunga.
3. Ovvoru product-oda price-oda max price-oda difference-ah kaattunga.
4. Ovvoru department-oda employee count-ah SELECT clause-la subquery vechu kaattunga.
5. Ovvoru customer-oda total order amount-ah scalar subquery-la kaattunga."""


# In[116]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\nsalary,(select avg(salary)from emp) as avgsal\nfrom emp;\n')


# In[120]:


get_ipython().run_cell_magic('sql', '', 'select * from orders;\n')


# In[122]:


get_ipython().run_cell_magic('sql', '', 'select\norder_id,\n(select count(*) from orders) as totalcount\nfrom orders;\n')


# In[126]:


get_ipython().run_cell_magic('sql', '', 'select\nname ,\nprice,\nprice - (select Max(price) from products) diffmaxpri \nfrom products;\n')


# In[127]:


get_ipython().run_cell_magic('sql', '', 'select * from emp;\n')


# In[129]:


get_ipython().run_cell_magic('sql', '', 'select\ne.emp_id,\ne.name ,\n(select count(*) from emp \nwhere e.dept_id = dept_id) as cot\nfrom emp e;\n')


# In[130]:


get_ipython().run_cell_magic('sql', '', 'select * from cust;\n')


# In[131]:


get_ipython().run_cell_magic('sql', '', 'select * from orders;\n')


# In[133]:


get_ipython().run_cell_magic('sql', '', 'select\nc.customer_id,\n(select sum(amount) from orders where c.customer_id = customer_id) as custcot\nfrom cust c;\n')


# In[ ]:




