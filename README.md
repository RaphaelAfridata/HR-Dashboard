# HR-Dashboard

![lastest screenshot](https://github.com/RaphaelAfridata/HR-Dashboard/assets/163150520/39b7bc83-25db-467e-a9a8-a94fae6c0b85)


## Data Used 
#### Data- HR Data of over 22000 rows from 2000 to 2020
#### Data cleaning and Analysis - MySQL Workbench
#### Data Visualization - PowerBI

## Questions
- What is the gender breakdown of employees in the company?
- What is the race/ethnicity breakdown of employees in the company?
- What is the age distribution of employees in the company?
- How many employees work at headquaters versus remote location?
- What is the average length of employment for employees who have been terminated?
- How does the gender distribution vary across departments and job titles?
- What is the distribution of job titles across the company?
- which department has the highest attrition rate?
- What is the distributio of employees across locations by state?
- How has the company's employee count changed over time based on hire and term dates?
- The average age of employees
  
## Summary of Findings
- There are more male employees
- White race is the most dominant while natove hawalian and American indian are the least dominant
- The youngest employee is 20 years old and the oldest is 57 years old
- A large number of the employees work at the headquarters versus remotely.
- The average length of employment for terminated employees is around 8 years.
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- A large number of the employees come from the state of Ohio
- The net change in employees has increased over the years.
- The average tenure for each department is about 8 years with auditing having the lowest attrition rate and marketing having the highest attrition rate.

## Limitations
- Some records had negative ages and these were excluded during querying (967 records). Ages used were 18 years and above.
- Some terminated dates were for the future and were not included in the analysis(1599 records). The only terminated dates used were those less than or equal to the current date.
- Find it difficult to change the terminated date data type because of the empty cell
