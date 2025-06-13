-- What is the percentage of unique product increase in 2021 vs. 2020? The
-- final output contains these fields,
-- unique_products_2020
-- unique_products_2021
-- percentage_chg

SELECT 
	COUNT(IF(cost_year = 2020,1,NULL)) AS unique_products_2020,
    COUNT(IF(cost_year = 2021,1,NULL)) AS unique_products_2021,
    ROUND((COUNT(IF(cost_year = 2021,1,NULL))/COUNT(IF(cost_year = 2020,1,NULL))) * 100, 2)
    AS percentage_chg
FROM gdb023.fact_manufacturing_cost;


