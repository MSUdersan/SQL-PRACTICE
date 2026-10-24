#!/usr/bin/env python
# coding: utf-8

# In[1]:


get_ipython().run_line_magic('load_ext', 'sql')


# In[2]:


get_ipython().run_line_magic('sql', 'sqlite:///practice.db')


# In[10]:


get_ipython().run_cell_magic('sql', '', 'drop table if exists dept\n')


# In[11]:


get_ipython().run_cell_magic('sql', '', 'drop table if exists emp\n')


# In[12]:


get_ipython().run_cell_magic('sql', '', 'CREATE TABLE dept (\n    dept_id    INT PRIMARY KEY,\n    dept_name  VARCHAR(30),\n    location   VARCHAR(30)\n);\n \nCREATE TABLE emp (\n    emp_id      INT PRIMARY KEY,\n    name        VARCHAR(30),\n    salary      INT,\n    dept_id     INT,\n    manager_id  INT,\n    FOREIGN KEY (dept_id) REFERENCES dept(dept_id)\n);\n')


# In[13]:


get_ipython().run_cell_magic('sql', '', "INSERT INTO dept VALUES (10, 'HR',      'Chennai');\nINSERT INTO dept VALUES (20, 'IT',      'Chennai');\nINSERT INTO dept VALUES (30, 'Sales',   'Mumbai');\nINSERT INTO dept VALUES (40, 'Finance', 'Delhi');\nINSERT INTO dept VALUES (50, 'Admin',   'Bengaluru');   -- no employees\n \nINSERT INTO emp VALUES (101, 'Arun',    60000, 10, NULL);\nINSERT INTO emp VALUES (102, 'Bala',    45000, 10, 101);\nINSERT INTO emp VALUES (103, 'Chitra',  80000, 20, NULL);\nINSERT INTO emp VALUES (104, 'Deepak',  70000, 20, 103);\nINSERT INTO emp VALUES (105, 'Eswari',  55000, 20, 103);\nINSERT INTO emp VALUES (106, 'Farook',  50000, 30, NULL);\nINSERT INTO emp VALUES (107, 'Gokul',   40000, 30, 106);\nINSERT INTO emp VALUES (108, 'Hema',    65000, 40, NULL);\nINSERT INTO emp VALUES (109, 'Indu',    52000, 40, 108);\nINSERT INTO emp VALUES (110, 'Jeeva',   90000, 20, 103);\n")


# In[15]:


get_ipython().run_cell_magic('sql', '', 'select * from dept;\n')


# In[16]:


get_ipython().run_cell_magic('sql', '', 'select * from emp;\n')


# In[19]:


get_ipython().run_cell_magic('sql', '', 'select \nname,\nsalary\nfrom emp\nwhere salary > (\n            select avg(salary) as avgsal\n            from emp) """single row"""\n')


# In[33]:


get_ipython().run_cell_magic('sql', '', 'select\nname,\nsalary,\n(select avg(salary) from emp ) As avgsal,\nsalary - (select avg(salary) from emp) As diffsal\nfrom emp;\n')


# In[46]:


get_ipython().run_cell_magic('sql', '', '\nselect\nname,\nemp_id\nfrom emp\nwhere dept_id in (select dept_id\n                from dept\n                where location = "Chennai"\n               )\n')


# In[ ]:


"""Correlated Thangal department-oda average salary-ah vida adhigam vaangura employees."""


# In[49]:


get_ipython().run_cell_magic('sql', '', 'select * from emp\nlimit 2\n')


# In[50]:


get_ipython().run_cell_magic('sql', '', 'select * from dept\nlimit 2\n')


# In[62]:


get_ipython().run_cell_magic('sql', '', 'select\ne.name,\ne.dept_id,\nsalary\nfrom emp e\nwhere e.salary >(select\navg(m.salary) As avgsal\nfrom emp m\nwhere m.dept_id = e.dept_id\n)\n')


# In[66]:


get_ipython().run_cell_magic('sql', '', 'select * from emp\n')


# In[68]:


get_ipython().run_cell_magic('sql', '', 'select * from dept;\n')


# In[86]:


get_ipython().run_cell_magic('sql', '', 'select\nemp_id,\nname,\nsalary\nfrom emp\nwhere salary > (select\n    salary\n    from emp\n    where dept_id = 30)\n')


# In[80]:


get_ipython().run_cell_magic('sql', '', 'select\n    salary\n    from emp\n    where dept_id = 30\n')


# In[87]:


get_ipython().run_cell_magic('sql', '', 'SELECT \nd.dept_id, \nd.dept_name\nFROM departments d\nWHERE EXISTS (\n    SELECT \n    emp_id\n    FROM employees e\n    WHERE e.dept_id = d.dept_id\n);\n')


# In[88]:


get_ipython().run_cell_magic('sql', '', 'SELECT \nd.dept_id, \nd.dept_name\nFROM departments d\nWHERE NOT EXISTS (\n    SELECT \n    emp_id\n    FROM employees e\n    WHERE e.dept_id = d.dept_id\n);\n')


# In[89]:


"""Chennai departments-oda average salary-ah vida adhigam vaangura
employees.
"""


# In[102]:


get_ipython().run_cell_magic('sql', '', 'select\ne.emp_id,\ne.dept_id,\ne.name,\ne.salary\nfrom emp e\nwhere e.salary  > (select avg(e.salary) As avgsal \n                    from emp e\n                    where e.dept_id IN (\n                    select d.dept_id from dept d\n                    where location = "Chennai"\n                    )\n                \n);\n')


# In[95]:


get_ipython().run_cell_magic('sql', '', 'select\ndept_id\nfrom dept\nwhere location = "Chennai"\n')


# In[106]:


get_ipython().run_cell_magic('sql', '', 'select\navg(salary) As avgsal\nfrom emp\nwhere dept_id in ( 10 , 20)\n')


# In[107]:


get_ipython().run_cell_magic('sql', '', 'select * from emp\n')


# In[ ]:




