USE failed_startups_db;

SELECT COUNT(*)
FROM startups;

SELECT sectors, count(startup_id) AS total_failed_startups, CONCAT(ROUND(AVG(how_much_raised)/1000000, 0), " million dollars raised on average") AS avg_amount_raised
FROM startups
JOIN how_much_raised
USING (how_much_raised_id)
JOIN sectors
USING (sectors_id)
GROUP BY sectors
ORDER BY avg_amount_raised DESC;

SELECT startup, SUM(giants + no_budget + competition + poor_market_fit + acquisition_stagnation + 
					high_operational_costs + monetization_failure + niche_limits + execution_flaws + 
                    trend_flaws + platform_dependency + toxicity_trust_issues + regulatory_pressure + overhype)
                    AS total_failed_factors
FROM startups
JOIN failure_factors
USING (factor_id) 
GROUP BY startup
HAVING total_failed_factors >= 6
ORDER BY total_failed_factors DESC;
                    
SELECT sectors, ROUND(AVG(number_of_years), 1) AS avg_number_of_years, MIN(start_year) AS earliest_start_year
FROM startups
JOIN sectors
USING (sectors_id)
JOIN years_of_operation
USING (years_of_operation_id)
GROUP BY sectors
ORDER BY avg_number_of_years DESC;

SELECT takeaway, count(factor_id) AS total_num_of_startups
FROM startups
JOIN takeaways
USING (takeaway_id)
JOIN failure_factors
USING (factor_id)
GROUP BY takeaway
HAVING total_num_of_startups >= 5
ORDER BY total_num_of_startups DESC, takeaway ASC;

