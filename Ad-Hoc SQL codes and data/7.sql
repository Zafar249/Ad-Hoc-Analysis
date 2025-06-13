-- 7. Get the complete report of the Gross sales amount for the customer “Atliq
-- Exclusive” for each month. This analysis helps to get an idea of low and
-- high-performing months and take strategic decisions.
-- The final report contains these columns:
-- Month
-- Year
-- Gross sales Amount

SELECT MONTH(date) AS Month, s.fiscal_year AS Year, 
	ROUND(SUM(sold_quantity * gross_price), 2) AS Gross_Sales_Amount
FROM gdb023.fact_sales_monthly s
INNER JOIN gdb023.dim_customer c
ON c.customer_code = s.customer_code
INNER JOIN gdb023.fact_gross_price g
ON g.product_code = s.product_code
WHERE customer = "Atliq Exclusive"
GROUP BY Month, Year