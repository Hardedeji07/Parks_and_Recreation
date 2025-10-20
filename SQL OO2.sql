-- Joins

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT *
FROM  parks_and_recreation.employee_demographics
INNER JOIN parks_and_recreation.employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;


SELECT *
FROM  parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


SELECT dem.employee_id, age, occupation
FROM  parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- outer join

SELECT *
FROM  parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- outer join

SELECT *
FROM  parks_and_recreation.employee_demographics AS dem
RIGHT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- Self join

SELECT *
FROM parks_and_recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
    ON emp1.employee_id = emp2.employee_id
;

SELECT *
FROM parks_and_recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id
;

SELECT emp1.employee_id AS santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS santa,
emp2.first_name AS first_name_santa,
emp2.last_name AS last_name_santa
FROM parks_and_recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
    ON emp1.employee_id = emp2.employee_id
;

SELECT emp1.employee_id AS santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS santa,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM parks_and_recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
    ON emp1.employee_id = emp2.employee_id
;


-- joining multiple tables together


SELECT *
FROM  parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    INNER JOIN parks_and_recreation.parks_departments pd
     ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_and_recreation.parks_departments;