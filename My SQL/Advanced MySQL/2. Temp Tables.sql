-- Temporary tables

CREATE TEMPORARY TABLE Premier_league_21_22
(First_name varchar(50),
last_name varchar(50),
Goals_scored_21_22 varchar(100)
);

SELECT *
FROM Premier_league_21_22;

INSERT INTO Premier_league_21_22
VALUES ('Mohamed', 'Salah', '23'),
('Son', 'Heung-min', '23'),
('Cristiano', 'Ronaldo', '18'),
('Harry', 'Kane', '17');

SELECT *
FROM Premier_league_21_22;

SELECT * 
FROM employee_demographics;

CREATE TEMPORARY TABLE Over_50s
SELECT *
FROM employee_demographics
WHERE age >= 50;

SELECT *
FROM Over_50s;