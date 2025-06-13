-- Follow-up: Which segment had the most increase in unique products in
-- 2021 vs 2020? The final output contains these fields,
-- segment
-- product_count_2020
-- product_count_2021
-- difference

SELECT 
	segment, 
	COUNT(IF(cost_year = 2020,1,NULL)) AS product_count_2020,
    COUNT(IF(cost_year = 2021,1,NULL)) AS product_count_2021,
    COUNT(IF(cost_year = 2021,1,NULL))-COUNT(IF(cost_year = 2020,1,NULL))
    AS difference
FROM gdb023.dim_product p
INNER JOIN gdb023.fact_manufacturing_cost m
ON p.product_code = m.product_code
GROUP BY segment
