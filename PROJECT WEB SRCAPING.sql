
USE project1;
SELECT * FROM table_1;
SELECT * FROM table_2;
SELECT * FROM table_3;

-- JOBS AT DISTINCT LOCATION
SELECT COUNT(DISTINCT state) FROM table_1;
SELECT DISTINCT STATE FROM table_1;

--JOB POSTED BY LOCATION
--IT IS NOT THE NO OF JOBS POSTED (AS VACANCIES NOT MENTIONED)
SELECT state, COUNT(COMPANY_ID) AS NUM_JOBS
FROM table_1
GROUP BY state
HAVING STATE != 'NOT_SPECIFY' 
ORDER BY COUNT(COMPANY_ID) DESC;

SELECT STATE, COUNT(COMPANY_ID) AS NUM_JOBS
FROM table_1
WHERE STATE LIKE '%MAHARASHTRA%'
GROUP BY STATE;

--level not specify
select count(level) 
from table_3 
where level = 'not_specify'

--Generate some insight with respect to number of jobs distribution across various industry. 
--For instance, what is the total number of jobs in Software Industry as compared to Marketing

SELECT b.industry ,COUNT(a.JOB_ID) AS NUM_JOBS
FROM table_1 AS a
LEFT JOIN table_2 AS b
ON a.company_id = b.company_id
GROUP BY b.industry;

--Generate insights into number of opening with respect to the current employee count
--Number of opening in a company with more than 1000 employees in comparison to number of openings in a company with 100 employees

select * from table_1;
select * from table_2;
select * from table_3;

SELECT COUNT(a.JOB_ID) AS EMPLOYEE_LESS_101
FROM table_1 AS a
LEFT JOIN table_2 AS b
ON a.company_id = b.company_id
WHERE b.EMPLOYEES_COUNT_MAX < 101;

SELECT COUNT(a.JOB_ID) AS EMPLOYEE_GREATET_999
FROM table_1 AS a
LEFT JOIN table_2 AS b
ON a.company_id = b.company_id
WHERE b.EMPLOYEES_COUNT_MAX >999;

/*Count the number of jobs across different industry across different locations. 
For instance, how many Frontend Engineer jobs are there in Bangalore as compared to Data Analytics jobs in Bangalore, 
or how many Data Analytics jobs are there in Bangalore as compared to number of Data Scientists job in Gurgaon - 
this needs to be done in SQL but presented in the above created Excel dashboard*/

/*To create Master Table For Analysis*/

select * from table_1;
select * from table_2;
select * from table_3;

select * from table_1 as a left join table_2 as b on a.company_id = b.company_id
left join table_3 as c on a.details_id = c.details_id