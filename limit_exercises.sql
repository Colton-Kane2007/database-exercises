USE employees;

SELECT DISTINCT title FROM titles;
-- sen eng, staff, eng, sen staff, as eng, tech lead, manager

SELECT * FROM employees;

-- Find all previous or current employees hired in the 90s and born on Christmas.
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
-- Write a comment in your code that lists the five names of the employees returned.
SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25' ORDER BY hire_date LIMIT 5;
-- alselm, utz, bouch, baoc, petter


