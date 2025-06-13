-- Generate a report which contains the top 5 customers who received an
-- average high pre_invoice_discount_pct for the fiscal year 2021 and in the
-- Indian market. The final output contains these fields,
-- customer_code
-- customer
-- average_discount_percentage

SELECT i.customer_code, customer,
	AVG(pre_invoice_discount_pct) AS average_discount_percentage
FROM gdb023.fact_pre_invoice_deductions i
INNER JOIN gdb023.dim_customer c
ON c.customer_code = i.customer_code
WHERE market = "India"
AND fiscal_year = 2021
GROUP BY i.customer_code, customer
ORDER BY average_discount_percentage DESC
LIMIT 5;