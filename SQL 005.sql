-- subqueries

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN 
			    (SELECT employee_id
                        FROM parks_and_recreation.employee_salary
						WHERE dept_id = 1)
;                      
                        

SELECT first_name, salary, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY first_name, salary;


SELECT first_name, salary, 
(SELECT AVG(salary)
FROM parks_and_recreation.employee_salary)
FROM parks_and_recreation.employee_salary;


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT *
FROM
     (SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Agg_table
;


SELECT gender, AVG(`MAX(age)`)
FROM
     (SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Agg_table
GROUP BY gender
;


SELECT AVG(`MAX(age)`)
FROM
     (SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Agg_table
;


SELECT AVG(max_age)
FROM
(SELECT gender, 
AVG(age) AS avg_age, 
MAX(age) AS max_age, 
MIN(age) AS min_age, 
COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Agg_table
;


-- Windows function


SELECT  gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id
GROUP BY gender;


SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name,gender;



SELECT gender, AVG(salary) OVER()
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;


SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;


SELECT dem.first_name, dem.last_name,gender, AVG(salary) OVER(PARTITION BY gender)
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
      
SELECT dem.first_name, dem.last_name,gender, 
SUM(salary) OVER(PARTITION BY gender)
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
      
SELECT dem.first_name, dem.last_name,gender, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
SELECT dem.first_name, dem.last_name,gender, salary, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
SELECT dem.first_name, dem.last_name,gender, salary, 
ROW_NUMBER () OVER ()
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
SELECT dem.employee_id, dem.first_name, dem.last_name,gender, salary, 
ROW_NUMBER() OVER (PARTITION BY gender)
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC)
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER()  OVER (PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER (PARTITION BY gender ORDER BY salary DESC) rank_num
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
      ON dem.employee_id = sal.employee_id;
      
      
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER()  OVER (PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER (PARTITION BY gender ORDER BY salary DESC) rank_num,
DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) dense_rank_num
FROM parks_and_recreation.employee_demographics dem
JOIN parks_and_recreation.employee_salary sal
		ON dem.employee_id = sal.employee_id;