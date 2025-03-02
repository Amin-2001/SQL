-- Limit 

SELECT *
FROM employee_demographics
ORDER BY birth_date DESC
LIMIT 5
;

-- Aliasing

SELECT gender, AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender
HAVING Avg_age > 35
;

