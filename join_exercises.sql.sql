-- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;
SELECT * FROM users, roles;

-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.
SELECT * FROM users JOIN roles;
SELECT * FROM roles JOIN users;
SELECT * FROM users LEFT JOIN roles ON users.name = roles.name;
SELECT * FROM users RIGHT JOIN roles ON users.name = roles.name;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.
SELECT COUNT(*) AS 'user_role' FROM users LEFT JOIN roles ON roles.name = users.name GROUP BY users.name;

USE employees;
SHOW TABLES;
SELECT * FROM dept_manager;
-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.
SELECT * FROM departments JOIN dept_manager JOIN employees WHERE dept_manager.to_date = '9999-01-01' ORDER BY dept_name;

-- Find the name of all departments currently managed by women.
SELECT * FROM employees;
SELECT DISTINCT(CONCAT(first_name, '', last_name)) AS name FROM departments JOIN dept_manager JOIN employees 
WHERE dept_manager.to_date LIKE '9999-01-01' AND employees.gender LIKE 'F';

-- Find the current titles of employees currently working in the Customer Service department.
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM titles JOIN departments WHERE departments.dept_name LIKE 'Customer Service' AND titles.to_date LIKE '9%';

-- Find the current salary of all current managers.
SELECT * FROM salaries;
-- salary to_date '9%'
SELECT * FROM dept_manager;
-- to_date same
SELECT * FROM salaries JOIN dept_manager WHERE salaries.to_date LIKE '9%' AND dept_manager.to_date LIKE '9%';
-- 
-- Find the number of current employees in each department.

-- distinct, count
SELECT * FROM departments;
-- current
SELECT * FROM dept_emp;
SELECT * FROM dept_emp JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE dept_emp.to_date LIKE '9%';

-- Which department has the highest average salary? Hint: Use current not historic information.
SELECT * FROM salaries;
-- to_date current, AVG DESC salary
SELECT * FROM dept_emp;
SELECT * FROM salaries JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no WHERE dept_emp.to_date LIKE '9%' ORDER BY salary DESC;
-- D007

-- Who is the highest paid employee in the Marketing department?
-- D001
SELECT * FROM salaries JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no WHERE dept_emp.to_date LIKE '9%' AND dept_no LIKE 'd001' ORDER BY salary DESC;
-- 466852

-- Which current department manager has the highest salary?
SELECT * FROM salaries JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no WHERE dept_manager.to_date LIKE '9%' ORDER BY salary DESC;
-- 110039

-- Determine the average salary for each department. Use all salary information and round your results.
SELECT ROUND(AVG(salary)) FROM salaries JOIN dept_emp ON dept_emp.emp_no = salaries.emp_no GROUP BY dept_emp.dept_no;












