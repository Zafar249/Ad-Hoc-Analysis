-- In which quarter of 2020, got the maximum total_sold_quantity? The final
-- output contains these fields sorted by the total_sold_quantity,
-- Quarter
-- total_sold_quantity

SELECT 
CASE 
	WHEN MONTH(DATE) BETWEEN 1 AND 3 THEN "QUARTER1"
    WHEN MONTH(DATE) BETWEEN 4 AND 6 THEN "QUARTER2"
    WHEN MONTH(DATE) BETWEEN 7 AND 9 THEN "QUARTER3"
    WHEN MONTH(DATE) BETWEEN 10 AND 12 THEN "QUARTER4"
END AS Quarter,SUM(sold_quantity) AS total_sold_quantity
FROM gdb023.fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarter
ORDER BY total_sold_quantity;
