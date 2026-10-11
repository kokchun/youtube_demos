SET PAGESIZE 100

DESC system.salaries_sf;

SELECT
    id,
    employeename,
    jobtitle,
    totalpaybenefits
FROM 
    salaries_sf
ORDER BY totalpaybenefits DESC
FETCH FIRST .1 PERCENT ROWS ONLY;



SELECT
    id,
    employeename,
    basepay
FROM 
    salaries_sf
ORDER BY employeename, basepay DESC
FETCH FIRST .1 PERCENT ROWS ONLY;



-- exits sqlcl
EXIT
