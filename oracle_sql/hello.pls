SET SERVEROUTPUT ON;

DECLARE
    message varchar2(20):='Hello PL/SQL';
BEGIN
    dbms_output.put_line(message);
END;
/
