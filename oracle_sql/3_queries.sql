SET SQLFORMAT DEFAULT
SET WRAP OFF
SET LINESIZE 100
SET PAGESIZE 1000

SELECT joke_id, category, rating, joke  FROM jokes;

SET SERVEROUTPUT ON

DECLARE
    msg varchar2(20):='Pick out top 5 jokes';
BEGIN
    dbms_output.put_line(msg);
END;
/




SELECT 
    joke_id, rating, category, joke 
FROM jokes
ORDER BY rating DESC
FETCH FIRST 5 ROWS ONLY;

EXIT
