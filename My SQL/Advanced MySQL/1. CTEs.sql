-- CTE common table expressions

WITH high_salary_employees AS (
    SELECT first_name, last_name, salary
    FROM employee_salary
    WHERE salary > 60000
)
SELECT * FROM high_salary_employees;

-- CTE for average salary by gender

WITH average_salary_gender AS(
SELECT dem.first_name, dem.last_name, dem.gender, sal.salary,
AVG(sal.salary) OVER(PARTITiON BY dem.gender) AS avg_salary_by_gender
FROM employee_demographics dem 
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
)
SELECT * FROM average_salary_gender; 

-- CTE for employee short info

WITH employee_short_info AS (SELECT dem.first_name, dem.last_name, dem.age, sal.occupation, sal.salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
)
SELECT * FROM employee_short_info; 





