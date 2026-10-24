SELECT * FROM orders_flat;

CREATE TABLE IF NOT EXISTS customers AS 
SELECT 
    ROW_NUMBER() OVER (ORDER BY customer_name) AS customer_id,
    customer_name,
    customer_city
FROM (SELECT DISTINCT customer_name, customer_city FROM orders_flat);

CREATE TABLE IF NOT EXISTS products AS 
SELECT 
    ROW_NUMBER() OVER (ORDER BY product) AS product_id,
    product,
    product_price
FROM (SELECT DISTINCT product, product_price FROM orders_flat);


CREATE TABLE IF NOT EXISTS orders AS 
SELECT
    DISTINCT f.order_id,
    f.order_date,
    c.customer_id
FROM orders_flat f 
JOIN customers c ON c.customer_name = f.customer_name
                AND c.customer_city = f.customer_city;

CREATE TABLE orderlines AS 
SELECT 
    f.order_id,
    ROW_NUMBER() OVER (PARTITION BY f.order_id ORDER BY p.product_id) AS line_no,
    p.product_id,
    f.qty
FROM orders_flat f 
JOIN products p ON p.product = f.product
               AND p.product_price = f.product_price;

exit
