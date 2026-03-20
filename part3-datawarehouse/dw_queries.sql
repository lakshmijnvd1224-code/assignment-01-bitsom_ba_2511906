-- Q1: Total sales revenue by product category for each month
SELECT
    dp.category,
    dd.year,
    dd.month,
    SUM(fs.total_sales) AS total_revenue
FROM fact_sales fs
JOIN dim_product dp ON fs.product_key = dp.product_key
JOIN dim_date dd ON fs.date_key = dd.date_key
GROUP BY dp.category, dd.year, dd.month
ORDER BY dd.year, dd.month;


-- Q2: Top 2 performing stores by total revenue
SELECT
    ds.store_name,
    SUM(fs.total_sales) AS total_revenue
FROM fact_sales fs
JOIN dim_store ds ON fs.store_key = ds.store_key
GROUP BY ds.store_name
ORDER BY total_revenue DESC
LIMIT 2;


-- Q3: Month-over-month sales trend across all stores
SELECT
    dd.year,
    dd.month,
    SUM(fs.total_sales) AS monthly_sales
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
GROUP BY dd.year, dd.month
ORDER BY dd.year, dd.month;