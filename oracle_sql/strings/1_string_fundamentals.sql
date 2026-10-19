-- concatenation
SELECT 
    ' hello' || ' ' || 'oracle' AS concat_operator,
    CONCAT('hello', ' ','oracle') AS concat_func,
    'total: ' || 42 AS implicit_type_conversion,
    '' AS null_col;


-- string functions

-- case function and length
SELECT 
    UPPER('oracle sql'),
    LOWER('ORACLE Sql'),
    INITCAP('oracle sql'),
    LENGTH('oracle');

-- extract substrings
SELECT 
    SUBSTR(s, 1,6) AS first_six,
    SUBSTR(s, 3) AS from_three,
    SUBSTR(s, -3) AS last_three
FROM 
    (SELECT 'Oracle SQL' AS s);

-- searching with INSTR (in string)
SELECT 
    INSTR('idempotent operation', 'operation') AS first_occ,
    INSTR('banana', 'an', 1, 2) AS second_occ,
    SUBSTR('cool@evilcorp.com', INSTR('cool@evilcorp.com', '@')+1) AS domain_name;

-- some other functions
SELECT 
    REPLACE('2026-07-08', '-', '/') AS replaced,
    TRANSLATE('hello', 'el', 'ip') AS translated,
    LPAD('42',4,'/') AS left_pad,
    RPAD('name: ', 9, '.') AS right_pad,
    REVERSE('abcd') AS rev;

-- trim and replace to clean a string 
SELECT 
    s,
    TRIM(s),
    LTRIM(s),
    RTRIM(s),
    REPLACE(s, 'l', 'x'),
    INITCAP(REPLACE(TRIM(s),'   ', ' ')) AS cleaned
FROM (SELECT '     hEllO   Oracle    ' AS s);









EXIT
