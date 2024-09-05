-- Calculate key financial metrics for cities and counties by average gross margin.
WITH cte AS (
    SELECT 
        "Date" as date,
		"Store Number" as store_number,
		"Vendor Number" as vendor_number,
		"Item Number" as item_number,
		"City" AS city, 
        "County" AS county, 
        "Sale (Dollars)" AS sale_dollars, 
        "State Bottle Cost" AS state_bottle_cost, 
        "Bottles Sold" AS bottles_sold, 
        ("State Bottle Cost" * "Bottles Sold") AS cogs,
        ("Sale (Dollars)" - ("State Bottle Cost" * "Bottles Sold")) AS profit,
        CASE 
            WHEN ("State Bottle Cost" * "Bottles Sold") = 0 THEN 0 
            ELSE ("Sale (Dollars)" - ("State Bottle Cost" * "Bottles Sold")) / ("State Bottle Cost" * "Bottles Sold") 
        END AS gross_margin,
        CASE 
            WHEN "Sale (Dollars)" = 0 THEN 0 
            ELSE ("Sale (Dollars)" - ("State Bottle Cost" * "Bottles Sold")) / "Sale (Dollars)"
        END AS profit_ratio
    FROM 
        public.sales
    WHERE 
        "County" IS NOT NULL 
        AND "City" IS NOT NULL
        AND EXTRACT(YEAR FROM "Date") BETWEEN EXTRACT(YEAR FROM CURRENT_DATE) - 6 AND EXTRACT(YEAR FROM CURRENT_DATE) - 1
)
SELECT 
    date,
	store_number,
	vendor_number,
	item_number,
	city, 
    county,
    COUNT(*) AS order_count, 
    ROUND(SUM(sale_dollars), 2) AS rev_sum, 
    ROUND(SUM(sale_dollars) / COUNT(*), 2) AS sales_per_order,
    ROUND(SUM(cogs), 2) AS COGS,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(AVG(gross_margin), 2) as avg_gross_margin,
    ROUND(AVG(profit_ratio), 2) as avg_profit_ratio
FROM 
    cte
GROUP BY 
    date, store_number,item_number, vendor_number, county, city
ORDER BY 
    avg_gross_margin DESC