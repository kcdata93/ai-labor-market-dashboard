--Which industries invest the most in AI, and does it drive revenue growth?--
/*
SELECT 
    industry,
    ROUND(AVG(ai_budget_percentage), 2) AS Average_AI_Budget_Ratio_by_Sector,
    ROUND(AVG(revenue_growth_percent), 2) AS Average_Growth_Ratio_by_Sector
FROM
    company_adoption
GROUP BY industry
ORDER BY Average_AI_Budget_Ratio_by_Sector DESC
/*

--Which industries create vs. displace the most jobs?--
/*
SELECT 
    industry,
    SUM(jobs_created) AS Number_of_Created,
    SUM(jobs_displaced) AS Number_of_Displaced
FROM
    company_adoption
GROUP BY industry
ORDER BY Number_of_Displaced
/*

--Which industries have the highest productivity change due to AI?--
/*
SELECT 
    industry,
    ROUND(AVG(productivity_change_percent), 2) AS Productivity_Ratio_by_Sector,
    ROUND(AVG(task_automation_rate), 2) AS Automation_Ratio_by_Sector
FROM
    company_adoption
GROUP BY industry
ORDER BY Productivity_Ratio_by_Sector DESC
/*

--AI maturity stage distribution by industry — how many companies are in pilot vs optimizing?--
/* 
SELECT 
    industry,
    ai_adoption_stage AS Stage_Name,
    COUNT(company_id) AS Number_of_Company
FROM
    company_adoption
GROUP BY Stage_Name , industry
ORDER BY industry
/*


