SET PAGESIZE 100

DESC system.salaries_sf;

SELECT 
    COUNT(*) AS number_rows, 
    COUNT(*) number_rows
FROM salaries_sf;

SELECT 
    COUNT(DISTINCT jobtitle) AS unique_jobs,
    COUNT(DISTINCT year) AS unique_years,
    COUNT(DISTINCT agency) AS unique_agency
FROM salaries_sf;

SELECT DISTINCT agency FROM salaries_sf;

-- exits sqlcl
EXIT
