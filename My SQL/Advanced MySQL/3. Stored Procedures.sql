-- Stored Procedures
-- You can also specify database your using by adding USE(e.g database selected) before CP

CREATE PROCEDURE Lower_salaries()
SELECT *
FROM employee_salary
WHERE salary <= 40000;

CALL Lower_salaries();

DELIMITER //
CREATE PROCEDURE Lower_salaries2()
BEGIN 
SELECT *
FROM employee_salary
WHERE salary <= 40000;
SELECT *
FROM employee_salary
WHERE salary <= 55000;
END //
DELIMITER ;

CALL Lower_salaries2();

DELIMITER //
CREATE PROCEDURE Lower_salaries3(p_employee_salary INT)
BEGIN 
	SELECT first_name, salary
	FROM employee_salary
	WHERE employee_id = p_employee_salary
;
END //
DELIMITER ;

CALL Lower_salaries3(2);