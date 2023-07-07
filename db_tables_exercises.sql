SHOW databases;

USE albums_db;

SELECT DATABASE();

SHOW TABLES;

USE employees;

SELECT DATABASE();

SHOW TABLES;
-- Which table(s) do you think contain a numeric type column?
-- salaries is probably numeric 
DESCRIBE dept_emp;
-- Which table(s) do you think contain a string type column? 
-- titles possibly has string values

-- Which table(s) do you think contain a date type column?
-- salaries possibly has date values

-- What is the relationship between the 
-- employees and the departments tables?
-- employees work in departments

SHOW CREATE TABLE dept_manager;