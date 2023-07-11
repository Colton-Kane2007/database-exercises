USE employees;

-- Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT * FROM employees;
-- current employees
SELECT emp_no, CONCAT(first_name, ' ', last_name) name, hire_date 
FROM employees
WHERE hire_date = (SELECT hire_date FROM employees WHERE emp_no = '101010');


-- Find all the titles ever held by all current employees with the first name Aamod.
-- titles, current employees, first name
SELECT title, t.emp_no 
FROM titles t 
JOIN dept_emp de ON t.emp_no = de.emp_no 
WHERE t.emp_no IN
(SELECT emp_no FROM employees WHERE employees.first_name LIKE 'Aamod') 
AND de.to_date LIKE '9%';

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- dept_emp to_date not like '9%'
-- employees, count
SELECT COUNT(employees.emp_no) 
FROM employees 
WHERE employees.emp_no IN 
(SELECT dept_emp.emp_no FROM dept_emp WHERE to_date NOT LIKE '9%');

-- Find all the current department managers that are female. List their names in a comment in your code.
-- dept_manager to_date like '9%'
-- employees gender f, first and last name
SELECT CONCAT(first_name, ' ', last_name) name, e.emp_no  
FROM employees e 
WHERE e.emp_no 
IN (SELECT dm.emp_no FROM dept_manager dm WHERE dm.to_date LIKE '9%') AND e.gender LIKE 'F';
-- 'Isamu Legleitner','110114'
-- 'Karsten Sigstam','110228'
-- 'Leon DasSarma','110567'
-- 'Hilary Kambil','111534'


-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.
-- count, avg in subquery
-- salaries, to_date like '9%', emp_no
SELECT COUNT(emp_no) FROM salaries WHERE salary > (SELECT AVG(salary) FROM salaries) AND to_date LIKE '9%';
-- 154543


-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?
-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. 
-- Add a comment above the query showing the number of rows returned.
-- You will use this number (or the query that produced it) in other, larger queries.

-- STDDEV

-- max salary
SELECT MAX(salary) FROM salaries; 
-- STDDEV
SELECT FORMAT(STD(salary),1) FROM salaries;
-- count
SELECT COUNT(salary) FROM salaries WHERE salary BETWEEN  
(SELECT MAX(salary)-FORMAT(STD(salary),1) FROM salaries) 
AND (SELECT MAX(salary) FROM salaries) AND to_date LIKE '9%';
-- 1
 

SELECT COUNT(salary) FROM salaries;
-- What percentage of all salaries is this?
-- 1/2844047 * 100
-- .000035161162948

-- bonus
-- Find all the department names that currently have female managers.
SELECT DISTINCT(dept_name) FROM departments d 
JOIN dept_emp de ON d.dept_no = de.dept_no 
JOIN employees e ON de.emp_no = e.emp_no
WHERE e.gender = 'F';
-- 'Sales'
-- 'Development'
-- 'Research'
-- 'Quality Management'
-- 'Production'
-- 'Customer Service'
-- 'Marketing'
-- 'Finance'
-- 'Human Resources'


-- Find the first and last name of the employee with the highest salary.
SELECT CONCAT(first_name, ' ', last_name) name FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE 
(SELECT MAX(salary) FROM salaries) LIMIT 1;
-- Georgi Facello

-- Find the department name that the employee with the highest salary works in.
SELECT dept_name FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE employees.first_name =
(SELECT first_name FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE 
(SELECT MAX(salary) FROM salaries) LIMIT 1) AND dept_emp.to_date LIKE '9%' LIMIT 1;
-- Development

-- Who is the highest paid employee within each department.




