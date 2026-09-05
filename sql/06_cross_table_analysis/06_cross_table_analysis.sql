/*Countries where AI investment is high but job loss is low — who are the winners?

SELECT 
    wd.country AS Country,
    ROUND(AVG(awa.AI_Investment_BillionUSD), 2) AS 'AVG_AI_Inv_B($)',
    ROUND(AVG(wd.pct_sector_workforce_displaced),
            2) AS AVG_PCT_Sector_Workforce_Displaced
FROM
    ai_workforce_automation AS awa
        INNER JOIN
    workforce_displacement AS wd ON awa.country = wd.country
GROUP BY wd.country
ORDER BY ROUND(AVG(awa.AI_Investment_BillionUSD), 2) DESC

/*Do companies in high-reskilling countries displace fewer workers?
SELECT 
    wd.country AS Country,
    ROUND(AVG(wd.reskilling_programs_count), 2) AS AVG_Reskilling_Programs_Count,
    ROUND(AVG(ca.jobs_displaced), 2) AS AVG_Jobs_Displaced
FROM
    workforce_displacement AS wd
        INNER JOIN
    company_adoption AS ca ON wd.country = ca.country
GROUP BY wd.country

/*Burnout risk by country — does national AI maturity affect worker wellbeing?
SELECT 
    wb.country AS Country,
    ROUND(AVG(wb.burnout_score), 2) AS AVG_Burnout_Scr,
    ROUND(AVG(ca.ai_maturity_score), 2) AS AVG_AI_Maturity_Scr
FROM
    company_adoption AS ca
        INNER JOIN
    worker_burnout AS wb ON ca.country = wb.country
GROUP BY wb.country
/* AI budget vs displacement vs burnout vs macro growth
SELECT 
    ca.country AS Country,
    ROUND(AVG(ca.ai_budget_percentage), 2) AS 'AVG_AI_Budget%',
    ROUND(AVG(ca.jobs_displaced), 2) AS AVG_Jobs_Displaced,
    ROUND(AVG(wb.burnout_score), 2) AS AVG_Burnout_Score,
    ROUND(AVG(awa.AI_Investment_BillionUSD), 2) AS AVG_AI_Investment_BillionUSD,
    ROUND(AVG(awa.Employment_Rate_Percent), 2) AS AVG_Employment_Rate_Percent
FROM
    company_adoption AS ca
        INNER JOIN
    worker_burnout AS wb ON ca.country = wb.country
        INNER JOIN
    ai_workforce_automation AS awa ON ca.country = awa.Country
GROUP BY ca.country

