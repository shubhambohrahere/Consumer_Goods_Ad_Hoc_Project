WITH sales_with_quarters AS (
    SELECT
        CASE
            WHEN MONTH(date) IN (9, 10, 11) THEN 'Q1'
            WHEN MONTH(date) IN (12, 1, 2) THEN 'Q2'
            WHEN MONTH(date) IN (3, 4, 5) THEN 'Q3'
            WHEN MONTH(date) IN (6, 7, 8) THEN 'Q4'
        END AS Quarter,
        fiscal_year,
        SUM(sold_quantity) AS total_sold_quantity
    FROM
        fact_sales_monthly
    WHERE
        fiscal_year = 2020 -- Filter for the year 2020
    GROUP BY
        fiscal_year,
        CASE
            WHEN MONTH(date) IN (9, 10, 11) THEN 'Q1'
            WHEN MONTH(date) IN (12, 1, 2) THEN 'Q2'
            WHEN MONTH(date) IN (3, 4, 5) THEN 'Q3'
            WHEN MONTH(date) IN (6, 7, 8) THEN 'Q4'
        END
)
SELECT
    Quarter,
    total_sold_quantity
FROM
    sales_with_quarters
ORDER BY
    total_sold_quantity DESC
LIMIT 1;
