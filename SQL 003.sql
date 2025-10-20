-- Union

SELECT age, gender
FROM  parks_and_recreation.employee_demographics
UNION
SELECT first_name, last_name
FROM  parks_and_recreation.employee_salary
; 

SELECT first_name, last_name
FROM  parks_and_recreation.employee_demographics
UNION
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary
;


SELECT first_name, last_name
FROM  parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary
;


SELECT first_name, last_name, 'old'
FROM  parks_and_recreation.employee_demographics
WHERE age > 50;



SELECT first_name, last_name, 'old' AS Label
FROM  parks_and_recreation.employee_demographics
WHERE age > 50;

SELECT first_name, last_name, 'old' AS Label
FROM  parks_and_recreation.employee_demographics
WHERE age > 50
UNION
SELECT first_name, last_name,  'Highly paid Employee' AS Label
FROM  parks_and_recreation.employee_salary
WHERE salary > 70000
;

SELECT first_name, last_name, 'old Man' AS Label
FROM  parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'old Lady' AS Label
FROM  parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name,  'Highly paid Employee' AS Label
FROM  parks_and_recreation.employee_salary
WHERE salary > 70000
;

SELECT first_name, last_name, 'old Man' AS Label
FROM  parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'old Lady' AS Label
FROM  parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name,  'Highly paid Employee' AS Label
FROM  parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER By first_name, last_name
;

-- STRING functions
SELECT length('skyfall');

SELECT *
FROM  parks_and_recreation.employee_demographics;

SELECT first_name, LENGTH(first_name)
FROM  parks_and_recreation.employee_demographics;

SELECT first_name, LENGTH(first_name)
FROM  parks_and_recreation.employee_demographics
ORDER By 2;

SELECT UPPER('sky');
SELECT LOWER('sky');

SELECT first_name, UPPER(first_name)
FROM  parks_and_recreation.employee_demographics;

SELECT TRIM('              sky        ');

SELECT LTRIM('              sky        ');

SELECT RTRIM('              sky        ');

SELECT first_name, LEFT(first_name, 4)
FROM parks_and_recreation.employee_demographics;

SELECT first_name,
 LEFT(first_name, 4),
 RIGHT(first_name, 4)
FROM parks_and_recreation.employee_demographics;

SELECT first_name,
 LEFT(first_name, 4),
 RIGHT(first_name, 4),
 SUBSTRING(first_name,3,2),
 birth_date
FROM parks_and_recreation.employee_demographics;


SELECT first_name,
 LEFT(first_name, 4),
 RIGHT(first_name, 4),
 SUBSTRING(first_name,3,2),
 birth_date,
SUBSTRING(birth_date,6,2)
FROM parks_and_recreation.employee_demographics;

SELECT first_name,
 LEFT(first_name, 4),
 RIGHT(first_name, 4),
 SUBSTRING(first_name,3,2),
 birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM parks_and_recreation.employee_demographics;


SELECT first_name, REPLACE(first_name, 'a','z')
FROM parks_and_recreation.employee_demographics;

SELECT LOCATE('e','Olamide');

SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name,last_name)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name)
FROM parks_and_recreation.employee_demographics;


SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM parks_and_recreation.employee_demographics;