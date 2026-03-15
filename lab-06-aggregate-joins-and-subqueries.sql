-- Goal: Practice aggregate functions, GROUP BY, JOINs, and subqueries
-- using the Oracle sample CO schema.

SELECT
    order_id,
    order_datetime,
    order_status,
    customer_id,
    email_address,
    full_name,
    order_total,
    items
FROM co.customer_order_products;

SELECT AVG(unit_price) AS avg_price
FROM co.products;

SELECT MAX(unit_price) AS max_price
FROM co.products;

SELECT
    customer_id,
    SUM(order_total) AS total
FROM co.customer_order_products
GROUP BY customer_id;

SELECT order_status
FROM co.customer_order_products
GROUP BY order_status;

SELECT
    COUNT(DISTINCT customer_id) AS no_of_customers,
    order_status
FROM co.customer_order_products
WHERE order_status = 'CANCELLED'
GROUP BY order_status;

SELECT
    c.customer_id,
    c.full_name,
    o.order_id
FROM co.customers c
LEFT JOIN co.orders o
    ON c.customer_id = o.customer_id;

SELECT store_name
FROM co.stores
WHERE store_id IN (
    SELECT store_id
    FROM co.orders
    WHERE order_status = 'Refunded'
);

SELECT *
FROM co.orders
WHERE customer_id = (
    SELECT customer_id
    FROM co.customers
    WHERE full_name = 'Victor Morris'
);