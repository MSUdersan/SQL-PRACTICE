#!/usr/bin/env python
# coding: utf-8

# In[1]:


get_ipython().run_line_magic('load_ext', 'sql')


# In[2]:


get_ipython().run_line_magic('sql', 'sqlite:///practice.db')


# In[4]:


get_ipython().run_cell_magic('sql', '', 'CREATE TABLE departs (\n    dept_id   INT PRIMARY KEY,\n    dept_name VARCHAR(50) NOT NULL\n);\n \n\n\nCREATE TABLE empls(\n    emp_id     INT PRIMARY KEY,\n    name       VARCHAR(50) NOT NULL,\n    dept_id    INT NULL,          -- Elango has no department\n    manager_id INT NULL,          -- Arun has no manager\n    salary     INT NOT NULL\n);\n \n')


# In[6]:


get_ipython().run_cell_magic('sql', '', 'CREATE TABLE orders1 (\n    order_id INT PRIMARY KEY,\n    emp_id   INT NOT NULL,\n    amount   INT NOT NULL\n);\n')


# In[8]:


get_ipython().run_cell_magic('sql', '', "INSERT INTO departs (dept_id, dept_name) VALUES\n(10, 'IT'),\n(20, 'HR'),\n(30, 'Finance'),\n(40, 'Marketing'); \n\nINSERT INTO empls (emp_id, name, dept_id, manager_id, salary) VALUES\n(1, 'Arun',   10,   NULL, 90000),\n(2, 'Bala',   10,   1,    60000),\n(3, 'Chitra', 20,   1,    65000),\n(4, 'Deepa',  20,   3,    50000),\n(5, 'Elango', NULL, 3,    45000),\n(6, 'Farah',  30,   1,    55000);\n\nINSERT INTO orders1 (order_id, emp_id, amount) VALUES\n(101, 2, 500),\n(102, 2, 700),\n(103, 4, 300),\n(104, 7, 900);\n")


# In[31]:


get_ipython().run_cell_magic('sql', '', 'select * from empls;\n')


# In[10]:


get_ipython().run_cell_magic('sql', '', 'select * from departs;\n')


# In[11]:


get_ipython().run_cell_magic('sql', '', 'select * from orders1;\n')


# In[12]:


"""Section 1: INNER JOIN
1. Ovvoru employee-oda name-um avanga department name-um display pannunga.
2. IT department-la irukkura employees mattum list pannunga.
3. Salary 55000-ku mela irukkura employees-oda name, dept_name kaattunga.
4. Orders panna employees-oda name, order_id, amount kaattunga.
5. Ovvoru employee-um evlo total order amount panninaanga? (INNER JOIN + GROUP BY)
"""


# In[16]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\nd.dept_name\nfrom empls e\njoin departs d on e.dept_id = d.dept_id;\n')


# In[18]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\nd.dept_name\nfrom empls e\njoin departs d on e.dept_id = d.dept_id\nwhere d.dept_name = "IT";\n')


# In[19]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\nd.dept_name\nfrom empls e\njoin departs d on e.dept_id = d.dept_id\nwhere e.salary > 55000;\n')


# In[20]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\no.order_id, \no.amount\nfrom emp e\njoin orders1 o on e.emp_id = o.emp_id;\n')


# In[28]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\no.order_id, \nsum(o.amount) as totalamt\nfrom emp e\njoin orders1 o on e.emp_id = o.emp_id\ngroup by e.emp_id;\n')


# In[29]:


"""6. Ella employees-um, avanga department name-oda kaattunga. Department illaadha employees-um
varanum.
7. Orders onnum panna-adha employees-ah kandupidinga. (LEFT JOIN + IS NULL)
8. Ella employees-oda total order amount kaattunga. Order illaadhavangalukku 0 varanum.
(COALESCE)
9. Ovvoru employee-oda order count kaattunga, 0 count-um include aaganum."""


# In[78]:


get_ipython().run_cell_magic('sql', '', 'select\ne.emp_id,\ne.name,\nd.dept_name\nfrom empls e \nleft join departs d on e.dept_id = d.dept_id;\n')


# In[34]:


get_ipython().run_cell_magic('sql', '', 'select * from orders1;\n')


# In[37]:


get_ipython().run_cell_magic('sql', '', 'select * from empls;\n')


# In[50]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\no.emp_id\nfrom empls e\nleft join orders1 o on e.emp_id = o.emp_id\nwhere o.emp_id is null ;\n')


# In[66]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\nsum(o.amount) as sumamt,\ncoalesce(sum(o.amount), 0)as finalamt\nfrom empls e\nleft join orders1 o on e.emp_id = o.emp_id\ngroup by e.name;\n')


# In[67]:


get_ipython().run_cell_magic('sql', '', 'select * from empls;\n')


# In[79]:


get_ipython().run_cell_magic('sql', '', 'select\ncount(o.order_id) as totalorder,\ne.name,\no.emp_id\nfrom empls e\nleft join orders1 o on e.emp_id = o.emp_id\ngroup by e.emp_id;\n')


# In[81]:


"""Section 4: SELF JOIN
15. Ovvoru employee-oda name-um avanga manager name-um kaattunga.
16. Manager illaadha employee-ah "No Manager" nu kaattunga. (LEFT SELF JOIN + COALESCE)
17. Than manager-ai vida adhigam salary vaangura employees-ah kandupidinga.
18. Rendu employees same department-la irukkaanga-na, andha pairs-ah list pannunga. (a.emp_id
< b.emp_id use pannunga, duplicate pairs vara koodaadhu)
19. Ovvoru manager-ukkum evlo direct reportees irukkaanga nu kaattunga."""


# In[82]:


get_ipython().run_cell_magic('sql', '', 'select * from empls;\n')


# In[111]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name ,\nm.name as manager_name\nfrom empls e \njoin empls m on m.emp_id = e.manager_id;\n')


# In[112]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name ,\ne.manager_id,\ncoalesce((m.name) , "NO Manager" )as manager_name\nfrom empls e \nleft join empls m on m.emp_id = e.manager_id;\n')


# In[ ]:




