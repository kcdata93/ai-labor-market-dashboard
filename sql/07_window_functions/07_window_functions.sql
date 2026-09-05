/* RANK countries by net workforce change per year
WITH country_avg AS (
    SELECT 
        country,
        year,
        ROUND(AVG(net_workforce_change_pct), 2) AS avg_net_wf_change
    FROM workforce_displacement
    GROUP BY country, year
)
SELECT 
    RANK() OVER (PARTITION BY year ORDER BY avg_net_wf_change DESC) AS Country_Rank,
    country,
    year,
    avg_net_wf_change
FROM country_avg
/* LAG function — year over year change in AI investment per country
SELECT 
Year, 
AI_Investment_BillionUSD ,
LAG(AI_Investment_BillionUSD) OVER (PARTITION BY country ORDER BY Year) 
	AS Previous_Year_Investment,
ROUND(AI_Investment_BillionUSD - LAG(AI_Investment_BillionUSD) OVER (PARTITION BY country ORDER BY Year),2) 
	AS YoY_Change,
ROUND(((ROUND(AI_Investment_BillionUSD - LAG(AI_Investment_BillionUSD) OVER (PARTITION BY country ORDER BY Year),2)/LAG(AI_Investment_BillionUSD) OVER (PARTITION BY country ORDER BY Year)) * 100) ,2) as YoY_Change_Perc,
country 
FROM ai_workforce_automation
/* Running total of jobs displaced vs created globally over time
WITH Yearly_Total AS
(SELECT 
	SUM(Job_Displacement_Million) as Total_Displaced, 
    SUM(Job_Creation_Million) as Total_Created, 
    Year 
FROM ai_workforce_automation
GROUP BY Year)

SELECT 
    Year, 
    ROUND(SUM(Total_Displaced) OVER (ORDER BY Year),2) as Running_Total_Displaced, 
    ROUND(SUM(Total_Created) OVER (ORDER BY Year),2) as Running_Total_Created
FROM
    Yearly_Total
/* RANK job roles by burnout score within each industry
WITH AVG_Burnout_Scr AS (
    SELECT 
        job_role, 
        industry, 
        ROUND(AVG(burnout_score), 2) AS AVG_Burnout
    FROM worker_burnout
    GROUP BY industry, job_role
)
SELECT 
    RANK() OVER (PARTITION BY industry ORDER BY AVG_Burnout DESC) AS Burnout_Rank,
    industry,
    job_role,
    AVG_Burnout
FROM AVG_Burnout_Scr
