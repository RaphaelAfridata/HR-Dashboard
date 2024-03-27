-- ANALYSIS QUESTIONS
USE task1
-- What is the gender breakdown of employees in the company
SELECT gender, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY gender;

-- What is the race/ethnicity breakdown of employees in the company

SELECT race, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY race;

-- What is the age distribution of employees in the company

SELECT 
	min(age) as Youngest,
    max(age) as oldest
FROM hr
WHERE age >= 18 AND termdate IS NULL;
SELECT
	CASE
		WHEN age >= 18 AND age <= 23 THEN '18-23' 
        WHEN age >= 24 AND age <= 29 THEN '24-29'
        WHEN age >= 30 AND age <= 35 THEN '30-35'
        WHEN age >= 36 AND age <= 41 THEN '36-41'
        WHEN age >= 42 AND age <= 47 THEN '42-47'
        WHEN age >= 48 AND age <= 53 THEN '48-53'
        WHEN age >= 54 AND age <= 59 THEN '54-59'
        ELSE '60 +'
	END AS age_group,
    count(*) as count
    FROM hr
    WHERE age >= 18 AND termdate IS NULL
    GROUP BY age_group
    ORDER BY age_group;

-- What is the distribution of employees by location
SELECT location, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY location;

-- What is the average duration of employmenet for employees who have been terminated

SELECT 
	round(avg(datediff(termdate, hire_date))/365,0) AS work_duration
    FROM hr
    WHERE termdate <= CURDATE() AND termdate IS NOT NULL AND age >= 18;

-- How does the gender distribution vary across department and job title

SELECT*FROM hr;

SELECT department, gender, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY gender, department
ORDER BY department;

-- What is the distribution of job title across the company?

SELECT jobtitle, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY jobtitle;


-- Which department has the highest attrition rate?

SELECT department,
       total_count,
       term_count,
       total_count / term_count AS attrition_rate
FROM (
    SELECT department,
           COUNT(*) AS total_count,
           SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS term_count
    FROM hr
    WHERE age >= 18
    GROUP BY department
) AS subquery
ORDER BY attrition_rate;
    
-- What is the distribution of employees across location by state?

SELECT location_state, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY location_state
ORDER BY count DESC;

-- How has the company's employees count changed  over the year?
SELECT Year,
	hires,
    terminations,
    hires-terminations AS net_change,
   round((hires - terminations)/hires*100,2) As percentage_change
FROM( 
	SELECT 
	YEAR(hire_date) AS Year,
    COUNT(*) AS hires,
    SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
    FROM hr
    WHERE age >= 18
    GROUP BY YEAR(hire_date)) AS subquery
ORDER BY Year;

-- What is the tenure distribution for each department?

SELECT department, round(avg(datediff(termdate,hire_date)/365),0)AS avg_tenure
FROM hr
WHERE termdate IS NOT NULL AND termdate <= CURDATE() AND age >= 18
GROUP BY department
ORDER BY avg_tenure DESC;
SELECT*FROM hr;

-- What is the average age of the employees in the company
SELECT 
     round(avg (age),0) AS avg_age
     FROM hr
     WHERE termdate IS NOT NULL AND age >= 18;
