SET PAGESIZE 100
DESC system.computer_prices;

SELECT * FROM computer_prices
FETCH FIRST 5 ROWS ONLY;

SELECT 
    device_type,
    CAST(AVG(price) AS INT) AS avg_price,
    CAST(AVG(weight_kg) AS INT) AS avg_weight_kg,
    CAST(AVG(cpu_threads) AS INT) AS avg_cpu_threads,
    count(*) AS number_devices
FROM computer_prices
GROUP BY device_type;

SELECT 
    brand,
    device_type,
    CAST(AVG(price) AS INT) AS avg_price,
    CAST(AVG(weight_kg) AS INT) AS avg_weight_kg,
    CAST(AVG(cpu_threads) AS INT) AS avg_cpu_threads,
    count(*) AS number_devices
FROM computer_prices
GROUP BY brand, device_type
ORDER BY brand;

SELECT 
    brand,
    count(*) AS number_devices,
    ROUND(AVG(price),2) AS avg_price
FROM computer_prices
GROUP BY brand;

-- WHERE vs HAVING
SELECT 
    brand,
    count(*) AS number_devices,
    ROUND(AVG(price),2) AS avg_price
FROM computer_prices
WHERE release_year > 2023
GROUP BY brand
HAVING number_devices > 3000
ORDER BY avg_price DESC;

EXIT
