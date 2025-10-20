-- case statement


SELECT *
FROM parks_and_recreation.employee_demographics;


SELECT first_name,
last_name,
CASE
     WHEN age <= 30 THEN 'Young'
 END    
FROM parks_and_recreation.employee_demographics;


SELECT first_name,
last_name,
CASE
     WHEN age <= 30 THEN 'Young'
     WHEN age BETWEEN 31 and 50 THEN 'old'
 END    
FROM parks_and_recreation.employee_demographics;


SELECT first_name,
last_name,
CASE
     WHEN age <= 30 THEN 'Young'
     WHEN age BETWEEN 31 and 50 THEN 'old'
     WHEN age >= 50 THEN 'on Deaths note'
 END    
FROM parks_and_recreation.employee_demographics;


SELECT first_name,
last_name,
CASE
     WHEN age <= 30 THEN 'Young'
     WHEN age BETWEEN 31 and 50 THEN 'old'
     WHEN age >= 50 THEN 'on Deaths note'
 END  AS Age_Bracket 
FROM parks_and_recreation.employee_demographics;


-- Pay increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
Select first_name, last_name, salary,
CASE 
      WHEN salary < 50000 THEN salary + (salary * 0.05)
END      
FROM parks_and_recreation.employee_salary;


-- Pay increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
Select first_name, last_name, salary,
CASE 
      WHEN salary < 50000 THEN salary + (salary * 0.05)
END  AS New_salary
FROM parks_and_recreation.employee_salary;


-- Pay increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
Select first_name, last_name, salary,
CASE 
      WHEN salary < 50000 THEN salary * 1.05
END  AS New_salary
FROM parks_and_recreation.employee_salary;


-- Pay increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
Select first_name, last_name, salary,
CASE 
      WHEN salary < 50000 THEN salary * 1.05
      WHEN salary > 50000 THEN salary * 1.07
END  AS New_salary
FROM parks_and_recreation.employee_salary;

-- Pay increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
Select first_name, last_name, salary,
CASE 
      WHEN salary < 50000 THEN salary * 1.05
      WHEN salary > 50000 THEN salary * 1.07
END  AS New_salary,
CASE
     WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM parks_and_recreation.employee_salary;


SELECT *
FROM parks_and_recreation.employee_salary;
SELECT *
FROM parks_and_recreation.parks_departments;