
CREATE TABLE orders_flat (
  order_id       NUMBER,
  order_date     DATE,
  customer_name  VARCHAR2(50),
  customer_city  VARCHAR2(50),
  product        VARCHAR2(50),
  product_price  NUMBER(8,2),
  qty            NUMBER
);

INSERT INTO orders_flat VALUES
  (1, DATE '2026-10-01', 'Anna Lindqvist', 'Göteborg',  'Tangentbord', 500,  2),
  (1, DATE '2026-10-01', 'Anna Lindqvist', 'Göteborg',  'Mus',         200,  1),
  (1, DATE '2026-10-01', 'Anna Lindqvist', 'Göteborg',  'Skärm',       2000, 1),
  (2, DATE '2026-10-02', 'Erik Johansson', 'Malmö',     'Tangentbord', 500,  1),
  (3, DATE '2026-10-03', 'Anna Lindqvist', 'Göteborg',  'Mus',         200,  3),
  (4, DATE '2026-10-04', 'Sven Karlsson',  'Stockholm', 'Skärm',       2000, 2),
  (4, DATE '2026-10-04', 'Sven Karlsson',  'Stockholm', 'Hörlurar',    800,  1);

COMMIT;




EXIT
