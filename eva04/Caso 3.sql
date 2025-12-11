@Tabla.sql

SET SERVEROUTPUT ON;
DECLARE
    v_empleados EMPLEADOS%ROWCOUNT;
BEGIN
    v_empleados.NOMBRE := 'Elvis Tazo';
    v_empleados.SALARIO := 100;
    INSERT INTO EMPLEADOS VALUES v_empleados;

    v_empleados.NOMBRE := 'Susana Oria';
    v_empleados.SALARIO := 500;
    INSERT INTO EMPLEADOS VALUES v_empleados;

    v_empleados.NOMBRE := 'Armando Paredes';
    v_empleados.SALARIO := 220;
    INSERT INTO EMPLEADOS VALUES v_empleados;

    v_empleados.NOMBRE := 'José Luis Lamata Feliz';
    v_empleados.SALARIO := 360;
    INSERT INTO EMPLEADOS VALUES v_empleados;

    v_empleados.NOMBRE := 'Jorge Nitales';
    v_empleados.SALARIO := 246;
    INSERT INTO EMPLEADOS VALUES v_empleados;

    v_empleados.NOMBRE := 'Elsa Pato';
    v_empleados.SALARIO := 341;
    INSERT INTO EMPLEADOS VALUES v_empleados;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Registros insertados correctamente.');
END;
/

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_salariobase (p_salario NUMBER) IS
        SELECT NOMBRE, SALARIO
        FROM EMPLEADOS
        WHERE SALARIO > p_salario;

    v_empleados c_salariobase%ROWTYPE;
BEGIN
    OPEN c_salariobase(300);

    LOOP
        FETCH c_salariobase INTO v_empleados;
        EXIT WHEN c_salariobase%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Empleado: ' || v_empleados.NOMBRE || 
            ' - Salario: ' || v_empleados.SALARIO
        );
    END LOOP;

    CLOSE c_salariobase;
END;
/