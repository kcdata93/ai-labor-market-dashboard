/* Which Sectors Are Most Exposed?
SELECT 
    industry_sector AS Sector,
    ROUND(AVG(sector_automation_risk_score), 2) AS AVG_SARS,
    ROUND(AVG(pct_sector_workforce_new_roles_created),
            2) AS AVG_PCT_SWNRC,
    ROUND(AVG(pct_sector_workforce_displaced), 2) AS AVG_Sector_WF_Displaced
FROM
    workforce_displacement
GROUP BY industry_sector
ORDER BY industry_sector

/*Investment vs Actual Displacement
SELECT 
    reskilling_programs_count AS Reskilling_Pr_Count,
    ROUND(AVG(net_workforce_change_pct), 3) AS WF_Change,
    ROUND(AVG(pct_sector_workforce_displaced), 3) AS Sector_WF_Displaced
FROM
    workforce_displacement
GROUP BY reskilling_programs_count
ORDER BY reskilling_programs_count DESC

/* Gender Impact of AI-Driven Displacement
SELECT 
    industry_sector AS Sector,
    ROUND(AVG(pct_displaced_roles_female),2) AS Displaced_Roles_F,
    ROUND(AVG(pct_workforce_female),2) AS WF_F
FROM
    workforce_displacement
GROUP BY industry_sector

/* Does Government AI Policy Protect Workers?
SELECT 
    country AS Country,
    ROUND(AVG(govt_ai_policy_score_1_to_10),2) AS AVG_Govt_AI_Policy_Sc,
    ROUND(AVG(net_workforce_change_pct),2) as Net_WF_Change
FROM
    workforce_displacement
GROUP BY country
ORDER BY AVG(govt_ai_policy_score_1_to_10) DESC