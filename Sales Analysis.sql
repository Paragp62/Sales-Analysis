 -- using orders table
-- Monthly Revenue and Order volume

SELECT
    ->     EXTRACT(YEAR FROM order_date) AS year,
    ->     EXTRACT(MONTH FROM order_date) AS month,
    ->     SUM(sales) AS total_revenue,
    ->     COUNT(DISTINCT order_id) AS order_volume
    -> FROM
    ->     orders
    -> GROUP BY
    ->     EXTRACT(YEAR FROM order_date),
    ->     EXTRACT(MONTH FROM order_date)
    -> ORDER BY
    ->     year,
    ->     month;

-- Top 3 months by Total Revenue

 SELECT
    ->     YEAR(order_date) AS year,
    ->     MONTH(order_date) AS month,
    ->     SUM(sales) AS total_revenue
    -> FROM orders
    -> GROUP BY YEAR(order_date), MONTH(order_date)
    -> ORDER BY total_revenue DESC
    -> LIMIT 3;


-- Monthly Average Order Value

SELECT
    ->     YEAR(order_date) AS year,
    ->     MONTH(order_date) AS month,
    ->     SUM(sales) / COUNT(DISTINCT order_id) AS avg_order_value
    -> FROM orders
    -> GROUP BY YEAR(order_date), MONTH(order_date)
    -> ORDER BY year, month;

Monthly Sales Growth


 SELECT
    ->     YEAR(order_date) AS year,
    ->     MONTH(order_date) AS month,
    ->     SUM(sales) AS monthly_sales
    -> FROM orders
    -> GROUP BY YEAR(order_date), MONTH(order_date)
    -> ORDER BY year, month;

-- Orders Count per month ship mode
 SELECT
    ->     YEAR(order_date) AS year,
    ->     MONTH(order_date) AS month,
    ->     ship_mode,
    ->     COUNT(DISTINCT order_id) AS total_orders
    -> FROM orders
    -> GROUP BY YEAR(order_date), MONTH(order_date), ship_mode
    -> ORDER BY year, month, total_orders DESC;