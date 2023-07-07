-- In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? Answer that in a comment in your SQL file.
USE employees;
SHOW TABLES;
SELECT * FROM titles;
SELECT DISTINCT title FROM titles;

-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
SELECT * FROM employees;
SELECT last_name FROM employees WHERE last_name LIKE 'e%e' GROUP BY last_name;

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT DISTINCT first_name, last_name FROM employees WHERE last_name LIKE 'e%e';

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- 'Chleq'
-- 'Lindqvist'
-- 'Qiwen'

-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
SELECT COUNT(DISTINCT last_name) FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) 
-- and GROUP BY to find the number of employees with those names for each gender
SELECT COUNT(*) first_name FROM employees WHERE first_name LIKE 'Irena' AND first_name LIKE 'Vidya' AND first_name LIKE 'Maya' GROUP BY gender;

-- Using your query that generates a username for all employees, generate a count of employees with each unique username.
SELECT DISTINCT(COUNT(LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3,2))))) AS username FROM employees; 

-- From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? 
-- Bonus: How many duplicate usernames are there?
SELECT COUNT(LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3,2)))) AS username FROM employees GROUP BY 








