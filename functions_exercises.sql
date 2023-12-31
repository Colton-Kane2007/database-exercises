-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name.
USE employees;
SHOW TABLES;
SELECT * FROM employees;	
SELECT last_name FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e';
SELECT CONCAT(first_name , last_name) AS full_name FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e';

-- Convert the names produced in your last query to all uppercase.
SELECT * FROM employees;	
SELECT UPPER(CONCAT(first_name , last_name)) AS full_name FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e';


-- Use a function to determine how many results were returned from your previous query.
SELECT COUNT(CONCAT(first_name , last_name)) AS full_name FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e';
-- 899

-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to 
-- find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT DATEDIFF(hire_date, NOW()) FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

-- Find the smallest and largest current salary from the salaries table.
SELECT * FROM salaries;
SELECT MIN(salary) FROM salaries;
SELECT MAX(salary) FROM salaries;

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees first name, 
-- the first 4 characters of the employees last name, an underscore, the month the employee was born, 
-- and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
SELECT * FROM employees;
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3,2))) AS username FROM employees;



 





