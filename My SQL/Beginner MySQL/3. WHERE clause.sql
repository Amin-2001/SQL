-- Where Clause
SELECT *
FROM employee_salary 
WHERE first_name = 'ron'
; 
-- AND OR NOT -- Logical Operators
SELECT *
FROM employee_demographics
WHERE age >= 30
OR NOT  gender = 'male' 
; 
SELECT *
FROM employee_demographics
WHERE (first_name = 'Lesile' AND gender = 'male') OR age > 40
;
-- Like Statement
SELECT *
FROM employee_demographics, employee_salary
WHERE gender = 'male' 
AND occupation LIKE '%manager%' 
 ;
