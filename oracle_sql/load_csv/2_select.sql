SET PAGESIZE 100

DESC system.salaries_sf;

SELECT *
FROM salaries_sf
FETCH FIRST 20 ROWS ONLY;

SELECT COUNT(*) FROM salaries_sf;

-- picks out few columns and paginate
SELECT 
    id,
    employeename,
    jobtitle,
    totalpay,
    status
FROM salaries_sf
OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;

-- top x percent
SELECT 
    id, employeename, totalpaybenefits
FROM salaries_sf
FETCH FIRST .2 PERCENT ROWS ONLY;


-- exits sqlcl
EXIT
