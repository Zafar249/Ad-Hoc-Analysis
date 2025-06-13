-- Which channel helped to bring more gross sales in the fiscal year 2021
-- and the percentage of contribution? The final output contains these fields,
-- channel
-- gross_sales_mln
-- percentage

SELECT channel, 
	ROUND(SUM(sold_quantity * gross_price), 2) AS gross_sales_mln,
    (ROUND(SUM(sold_quantity * gross_price), 2) /
    (SELECT SUM(sold_quantity * gross_price) FROM gdb023.fact_sales_monthly s
    INNER JOIN gdb023.fact_gross_price g ON g.product_code = s.product_code
    WHERE s.fiscal_year = 2021)) AS PERCENTAGE
FROM gdb023.dim_customer c
INNER JOIN gdb023.fact_sales_monthly s
ON c.customer_code = s.customer_code
INNER JOIN gdb023.fact_gross_price g
ON g.product_code = s.product_code
WHERE s.fiscal_year = 2021
GROUP BY channel
