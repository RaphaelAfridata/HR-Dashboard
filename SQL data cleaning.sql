CREATE DATABASE task1;
USE task1;
SELECT count(*) FROM hr;
SELECT *FROM hr;
ALTER TABLE hr
CHANGE COLUMN ï»¿id ID varchar(55) NULL;
SELECT*FROM hr;
DESCRIBE hr;


ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
SELECT birthdate FROM hr;

UPDATE hr
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
ELSE null
END;
SELECT birthdate FROM hr;
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
SELECT *FROM hr;

UPDATE hr
SET hire_date = CASE
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
ELSE null
END;
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate =DATE(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !='';
SELECT termdate FROM hr;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;
UPDATE hr
SET termdate = NULL
WHERE termdate = '0000-00-00';
ALTER TABLE hr
MODIFY COLUMN termdate DATE;


-- Update rows with invalid dates to NULL
UPDATE hr
SET termdate = NULL
WHERE termdate = '0000-00-00';

-- Modify the column to allow NULL values
ALTER TABLE hr
MODIFY COLUMN termdate DATE NULL;
DESCRIBE hr;



UPDATE hr
SET termdate = ''
WHERE termdate = '0000-00-00';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT termdate FROM hr;

UPDATE hr
SET termdate = NULL
WHERE termdate = '000-00-00';
DESCRIBE hr;
SELECT * FROM hr;

ALTER TABLE hr
ADD COLUMN age int;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate, CURDATE());

SELECT birthdate, age FROM hr;
SELECT
	min(age) AS youngest,
    max(age) As oldest
FROM hr;

SELECT count(*) AS count
FROM hr
WHERE age < 18;


