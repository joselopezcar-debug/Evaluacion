@Tabla.sql

SET SERVEROUTPUT ON;
DECLARE
    v_verify DEPART%ROWTYPE;
BEGIN
    SELECT *
    INTO v_verify
    FROM PRODUCTOS
    WHERE dept_no = 10;
END;
/