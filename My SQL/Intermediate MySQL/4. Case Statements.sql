-- Case Statements 

SELECT first_name,
last_name,
age,
CASE
    WHEN age >= 50 THEN 'Mature'
    WHEN age between 30 and 49 THEN 'Older'
    WHEN age <= 29 THEN 'young'
END AS Life_stage
FROM employee_demographics
;

-- Pay Increase & Bonus
-- < 50000 = 3%. 50000 > = 5%  Finance (only) 2%

SELECT first_name, last_name, salary,
CASE 
	WHEN salary <= 50000  THEN salary *1.03
	WHEN salary > 50000  THEN salary *1.03
END AS Salary_with_bonus
FROM employee_salary
