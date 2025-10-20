SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name,
birth_date,
age,
(age + 10) * 10 + 10
FROM employee_demographics;
# PEMDAS

SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;


-- WHERE CLAUSE
SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie'
;


SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'female'
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'female'
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

-- AND OR NOT -- Logical Operators
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

-- AND OR NOT -- Logical Operators
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

-- AND OR NOT -- Logical Operators
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

-- AND OR NOT -- logical operators
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name = 'Leslie' AND age = '44'
;

-- AND OR NOT -- logical operators
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;


-- LIKE Statement
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name = 'jerry'
;


-- LIKE Statement
-- % and _
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'jer%'
;


-- LIKE Statement
-- % and _
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a%'
;


-- LIKE Statement
-- % and _
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___%'
;

-- LIKE Statement
-- % and _
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%'
;


-- GROUP By
SELECT *
FROM parks_and_recreation.employee_demographics
;

SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP By gender
;


SELECT gender, AVG(age), Max(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP By gender
;

SELECT occupation
FROM parks_and_recreation.employee_salary
GROUP By occupation
;

SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP By occupation, salary
;

-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by first_name
;

-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by first_name ASC
;


-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by first_name DESC
;

-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by gender
;

-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by gender, age
;

-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by gender, age DESC
;

-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by age, gender
;

-- ORDER By
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER by 5, 4
;

-- Having vs Where

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP By gender
HAVING AVG(age) > 40
;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation
;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;

-- Limit & Aliasing
SELECT *
FROM parks_and_recreation.employee_demographics
LIMIT 3
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 3
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;


-- Aliasing
SELECT gender, AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP By gender
HAVING avg_age > 40
   ;