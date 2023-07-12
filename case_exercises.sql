-- 1. Write a query that returns all employees, their department number, 
-- their start date, their end date, and a new column 'is_current_employee' 
-- that is a 1 if the employee is still with the company and 0 if not. 
-- DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

USE employees;
SELECT emp_no, dept_no, from_date, to_date, 
IF(to_date>NOW(), 1, 0) AS is_current_employee 
FROM dept_emp;


-- 2. Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT last_name,
 	CASE
 		WHEN last_name BETWEEN 'a%' AND 'h%' THEN 'A_H'
 		WHEN last_name BETWEEN 'i%'AND 'q%' THEN 'I_Q'
 		ELSE 'R-Z'
 		END AS alpha_group
 	FROM employees;
    

-- 3. How many employees (current or previous) were born in each decade?
SELECT birth_date FROM employees;

SELECT COUNT(*) AS per_decade,
	CASE
		WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s'
        WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s'
        END AS decade_born
	FROM employees
    GROUP BY decade_born;
    
    
-- 4. What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

-- to_date > now()
-- avg salary 
-- group departments
-- join salaries and departments
SELECT * FROM departments;

SELECT AVG(salary) AS average_salary
FROM departments
JOIN dept_emp de ON de.emp_no = departments.emp_no
JOIN salaries ON departments.dept_emp = salaries.dept_emp
WHERE departments.dept_name IN(
SELECT *, 
		CASE
			WHEN dept_name LIKE 'research' AND dept_name LIKE 'development' THEN 'R&D'
			WHEN dept_name LIKE 'sales' AND dept_name LIKE 'marketing' THEN 'Sales&Marketing'
			WHEN dept_name LIKE 'production' AND dept_name LIKE 'quality management' THEN 'Prod&QM'
			WHEN dept_name LIKE 'finance' AND dept_name LIKE 'human resources' THEN 'Finance&HR'
			ELSE 'CustomerService'
			END AS dept_name
		FROM departments)
	AND de.to_date> NOW()
    GROUP BY dept_name;







