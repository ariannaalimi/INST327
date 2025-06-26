USE richest_companies_db;

SELECT AVG(current_price) as avg_current_price
FROM Companies;

SELECT Company, Current_Price
FROM Companies
WHERE Current_Price < (SELECT AVG(current_price) 
						FROM Companies)
ORDER BY Current_Price DESC;

SELECT MIN(avg_current_price) as min_avg_fee
FROM (SELECT AVG(current_price) as avg_current_price
		FROM Companies) avg_current_price_company;
        
WITH avg_current_price_company AS
(SELECT AVG(current_price) as avg_current_price
		FROM Companies
)

SELECT MIN(avg_current_price)
FROM avg_current_price_company;

WITH avg_rank_table AS
(
SELECT Company, current_price,
ROW_NUMBER() over (ORDER BY current_price DESC) avg_rank_table
FROM Companies
)

SELECT*
FROM avg_rank_table;