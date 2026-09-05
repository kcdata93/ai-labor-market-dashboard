--Which job roles have the highest burnout score?--
/*
SELECT 
    job_role AS Title,
    ROUND(AVG(burnout_score), 2) AS Average_Burnout_Score,
    ROUND(AVG(productivity_score), 2) AS Average_Productivity_Score,
    CASE
        WHEN (AVG(burnout_score) > AVG(productivity_score)) THEN 'Overextended'
        ELSE 'Balanced'
    END AS Statu
FROM
    worker_burnout
GROUP BY job_role
ORDER BY Average_Burnout_Score DESC
/*

--Does fear of AI replacement correlate with attrition risk?--
/*
SELECT 
    fear_of_ai_replacement AS Fear_of_AI,
    ROUND(AVG(job_satisfaction_1_5), 2) AS 'Average_Satisfaction(1-5)',
    attrition_risk AS Attrition_Risk
FROM
    worker_burnout
GROUP BY fear_of_ai_replacement , attrition_risk
ORDER BY Fear_of_AI , Attrition_Risk
/*

--Does more AI tool usage increase burnout or productivity?--
/*
SELECT 
    ai_tools_used_per_day AS AI_Using_A_Day,
    ROUND(AVG(burnout_score), 2) AS Average_Burnout_Score,
    ROUND(AVG(hours_with_ai_assistance_daily), 2) AS Average_AI_Using_of_Hour_A_Day,
    ROUND(AVG(productivity_score), 2) AS Average_Productivity_Score
FROM
    worker_burnout
GROUP BY AI_Using_A_Day
ORDER BY AI_Using_A_Day
/*

--Salary vs burnout vs AI replacement fear by industry--
/*
SELECT 
    industry,
    ROUND(AVG(salary_usd_k), 2) AS 'Salary($K)',
    ROUND(AVG(burnout_score), 2) AS Average_Burnout_Score,
    fear_of_ai_replacement AS Fear_of_AI
FROM
    worker_burnout
GROUP BY Fear_of_AI , industry
ORDER BY ROUND(AVG(salary_usd_k), 2) DESC
/*

