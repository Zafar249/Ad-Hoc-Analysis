-- Get the Top 3 products in each division that have a high
-- total_sold_quantity in the fiscal_year 2021? The final output contains these
-- fields,
-- division
-- product_code
-- product
-- total_sold_quantity
-- rank_order

WITH Ranked_Products AS (SELECT division, p.product_code, product,
	SUM(sold_quantity) AS total_sold_quantity,
    rank() OVER (PARTITION BY division 
    ORDER BY SUM(sold_quantity) DESC) AS rank_order
from gdb023.dim_product p
INNER JOIN gdb023.fact_sales_monthly s
ON s.product_code = p.product_code
GROUP by division, p.product_code, product)

SELECT division, product_code, product, total_sold_quantity, rank_order
FROM Ranked_Products
WHERE rank_order <= 3
ORDER BY division, rank_order
