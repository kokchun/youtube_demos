SET PAGESIZE 100;

SELECT * FROM amazon
FETCH FIRST 5 ROWS ONLY;

DESC system.amazon;

SELECT
    order_id,
    category,
    product_name,
    sales,
    quantity,
    profit
FROM amazon
WHERE profit > 190
ORDER BY profit DESC;

-- number of orders where profit > 190
SELECT count(*)
FROM amazon
WHERE profit > 190;


SELECT * FROM amazon
WHERE order_id = 'CA-2012-111780';

SELECT 
    MIN(sales),
    MEDIAN(sales),
    ROUND(AVG(sales)),
    MAX(sales)
FROM amazon;

SELECT
    MIN(sales),
    MEDIAN(sales),
    ROUND(AVG(sales)),
    MAX(sales)
FROM amazon
WHERE category = 'Phones';

-- IN
SELECT * FROM amazon WHERE category IN ('Phones', 'Chairs');
    

















EXIT


