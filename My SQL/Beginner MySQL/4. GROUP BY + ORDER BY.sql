-- GROUP BY
SELECT *
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- 	ORDER BY  CAN ORDER BY COLUMN NAME OR NUMBER
-- ASC (is already default)
SELECT*
FROM employee_demographics
ORDER BY gender, age 
; 

SELECT*
FROM employee_demographics
ORDER BY 5, 4 
; 