-- Trigger and Event

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;


DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON parks_and_recreation.employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO  parks_and_recreation.employee_demographics (employee_id, first_name, last_name)
    VALUE (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, 
salary, dept_id)
VALUE(13, 'Jean Ralphio', 'Seperstein', 'Exntertainment 720 CEO',1000000, NULL);


-- EVENTS

SELECT *
FROM parks_and_recreation.employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	SELECT *
	FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;


DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%'