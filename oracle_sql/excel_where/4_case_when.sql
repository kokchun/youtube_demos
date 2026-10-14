SET PAGESIZE 100

DESC system.amazon;

SELECT AVG(profit) FROM amazon;

SELECT 
    product_name,
    category,
    profit,
    CASE 
        WHEN profit < AVG(profit) OVER () THEN 'Low'
        WHEN profit < MAX(profit) OVER () - 50 THEN 'High'
        ELSE 'Super high'
    END AS profit_level
FROM amazon
ORDER BY profit DESC;
        



EXIT
