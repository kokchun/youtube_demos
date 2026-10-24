DESC system.orderlines;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM orderlines;

SELECT * FROM orders_flat;

SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.customer_city,
    p.product,
    p.product_price,
    ol.qty
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN orderlines ol ON ol.order_id = o.order_id
JOIN products p ON p.product_id = ol.product_id
ORDER BY o.order_id;

EXIT
