-- Temporary Tables

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES ('Alex', 'Frebeg', 'Lord of the Rings: The Two Towers');

SELECT *
FROM temp_table;


SELECT *
FROM parks_and_recreation.employee_salary;


CREATE TEMPORARY TABLE parks_and_recreation.employee_salary_over_50k
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salaey >= 50000;


SELECT *
FROM  parks_and_recreation.employee_salary_over_50k
