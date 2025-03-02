-- Window Functions

SELECT first_name, last_name, occupation, salary,
AVG(salary) OVER(PARTITION BY occupation) AS sum_salary 
FROM  employee_salary;

-- This query is done by order of salary by occupation 

SELECT first_name, last_name, occupation, salary,
SUM(salary) OVER(PARTITION BY occupation ORDER BY salary) AS sum_salary 
FROM  employee_salary;

SELECT dem.first_name, dem.last_name, sal.occupation, sal.salary,
SUM(sal.salary) OVER(PARTITION BY sal.occupation ORDER BY salary) AS sum_salary 
FROM  employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id; 

-- This query is done by order of salary by gender 

SELECT dem.first_name, dem.last_name, dem.gender, sal.salary,
SUM(sal.salary) OVER(PARTITION BY dem.gender ORDER BY salary) AS sum_salary 
FROM  employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id; 



-- This query includes the row and dense number 

SELECT dem.first_name, dem.last_name, dem.gender, sal.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, 
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_salary,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_salary 
FROM  employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id; 




