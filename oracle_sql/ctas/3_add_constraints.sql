ALTER TABLE customers ADD CONSTRAINTS customers_pk PRIMARY KEY (customer_id);
ALTER TABLE products    ADD CONSTRAINT products_pk    PRIMARY KEY (product_id);
ALTER TABLE orders      ADD CONSTRAINT orders_pk      PRIMARY KEY (order_id);
ALTER TABLE orderlines ADD CONSTRAINT orderlines_pk PRIMARY KEY (order_id, line_no);

ALTER TABLE orders ADD CONSTRAINT orders_cust_fk
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
ALTER TABLE orderlines ADD CONSTRAINT ol_order_fk
  FOREIGN KEY (order_id)   REFERENCES orders (order_id);
ALTER TABLE orderlines ADD CONSTRAINT ol_prod_fk
  FOREIGN KEY (product_id) REFERENCES products (product_id);


EXIT
