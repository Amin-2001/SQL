-- String Functions 

SELECT LENGTH('skyfall');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY first_name
;

-- This output is based on the query not what is inside the brackets
SELECT UPPER('name');
SELECT LOWER('NAME');
-- This query helps when names aren’t standardized (e.g. some in uppercase, some in lowercase)
SELECT first_name, UPPER(first_name)
FROM employee_salary;

SELECT first_name, LOWER(first_name)
FROM employee_salary;

-- TRIM get rids of spaces on each side LTRIM = remove space on left side RTRIM = (vice versa)
SELECT TRIM('     name  ');

SELECT first_name, 
LEFT (first_name, 4),
RIGHT (first_name, 4),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,3,2) AS birth_year
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a','b')
FROM employee_salary;

SELECT LOCATE ('2', '2500');

SELECT first_name, LOCATE('Le',first_name)
FROM employee_salary;

-- The quotation mark is for space between the names 

SELECT first_name, last_name,
CONCAT (first_name, ' ',last_name) AS full_name
FROM employee_salary;

