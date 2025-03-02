-- Unions 
-- by defualt the union is distinct use ALL function to get all values. 

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

-- A query for amount of employees over 45 and employees also paid over 60000
SELECT first_name, last_name, 'Older employee' AS Label
FROM employee_demographics
WHERE age > 45
UNION 
SELECT first_name, last_name, 'Highly paid' AS Label
FROM employee_salary
WHERE salary > 60000
;

