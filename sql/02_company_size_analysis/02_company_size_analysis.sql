--Does company size affect AI ROI?--
/*
SELECT 
    company_size,
    ROUND(AVG(revenue_growth_percent), 2) AS Average_Growth_Ratio_by_Company_Size,
    ROUND(AVG(ai_budget_percentage), 2) AS Average_AI_Budget_Ratio_by_Company_Size,
    ROUND(AVG(cost_reduction_percent), 2) AS Average_Cost_Reduction
FROM
    company_adoption
GROUP BY company_size
ORDER BY Average_Cost_Reduction DESC
/*

--Which company size group displaces the most jobs but creates the least?--
/*
SELECT 
    company_size,
    SUM(jobs_created) AS Number_of_Created,
    SUM(jobs_displaced) AS Number_of_Displaced,
    CASE
        WHEN (SUM(jobs_created) > SUM(jobs_displaced)) THEN 'Positive'
        ELSE 'Negative'
    END AS AI_Productivity
FROM
    company_adoption
GROUP BY company_size
ORDER BY Number_of_Created DESC
/*

--Employee satisfaction vs AI adoption stage by company size--
/*
SELECT 
    company_size,
    ai_adoption_stage AS Stage_Name,
    ROUND(AVG(employee_satisfaction_score), 2) AS Employee_Satisfaction_Score
FROM
    company_adoption
GROUP BY company_size , ai_adoption_stage
ORDER BY Employee_Satisfaction_Score DESC
/*

