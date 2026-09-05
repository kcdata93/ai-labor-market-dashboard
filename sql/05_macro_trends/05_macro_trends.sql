/*AI investment vs employment rate over years by country

SELECT 
    Year,
    Country,
    avg(AI_Investment_BillionUSD) AS 'AI_Inv_$B',
    avg(Employment_Rate_Percent) AS 'Emp_Rate%'
FROM
    ai_workforce_automation
    group by country, year
    
/* Does productivity index grow as automation rate increases?
SELECT 
    year,
    ROUND(AVG(Automation_Rate_Percent), 2) AS AVG_Automation_Rate_Percent,
    ROUND(AVG(Productivity_Index), 2) AS AVG_Productivity_Index,
    ROUND(AVG(Average_Salary_USD), 2) AS 'AVG_Salary($)'
FROM
    ai_workforce_automation
GROUP BY year

/* Job displacement vs job creation trend — net effect over 10 years
SELECT 
    Year,
    ROUND(AVG(Job_Displacement_Million), 2) AS AVG_Job_Displacement_Million,
    ROUND(AVG(Job_Creation_Million), 2) AS AVG_Job_Creation_Million
FROM
    ai_workforce_automation
GROUP BY Year
