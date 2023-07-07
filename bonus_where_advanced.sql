-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, 
-- you'll probably be grouping by that exact column.
USE employees;
SHOW TABLES;
SELECT * FROM salaries;
SELECT AVG(salary) FROM salaries GROUP BY emp_no;

-- Using the dept_emp table, count how many current employees work in each department. 
-- The query result should show 9 rows, one for each department and the employee count.
SHOW TABLES;
SELECT * FROM dept_emp;
SELECT COUNT(DISTINCT(emp_no)) FROM dept_emp WHERE to_date < NOW() GROUP BY dept_no;

-- Determine how many different salaries each employee has had. This includes both historic and current.
SELECT * FROM salaries;
SELECT COUNT(DISTINCT(salary)) FROM salaries GROUP BY emp_no;

-- Find the maximum salary for each employee.
SELECT MAX(salary) FROM salaries GROUP BY emp_no;

-- Find the minimum salary for each employee.
SELECT MIN(salary) FROM salaries GROUP BY emp_no;

-- Find the standard deviation of salaries for each employee.
SELECT STDDEV(salary) FROM salaries;

-- Find the max salary for each employee where that max salary is greater than $150,000.
SELECT MAX(salary) FROM salaries WHERE salary > 150000;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT AVG(salary) FROM salaries WHERE salary BETWEEN 80000 AND 90000;






