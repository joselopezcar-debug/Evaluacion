CREATE OR REPLACE PROCEDURE VERIFICAR_STOCKS
IS
    CURSOR c_productos IS
        SELECT ID_PRODUCTO, NOMBRE, STOCK_ACTUAL, STOCK_MINIMO
        FROM PRODUCTOS;

    v_prod c_productos%ROWTYPE;
BEGIN
    OPEN c_productos;

    LOOP
        FETCH c_productos INTO v_prod;
        EXIT WHEN c_productos%NOTFOUND;

        IF v_prod.STOCK_ACTUAL <= v_prod.STOCK_MINIMO THEN
            DBMS_OUTPUT.PUT_LINE(
                'ALERTA: Producto ' || v_prod.NOMBRE || 
                ' tiene stock bajo (' || v_prod.STOCK_ACTUAL || ')'
            );
        END IF;

    END LOOP;

    CLOSE c_productos;
END;
/

SET SERVEROUTPUT ON;
BEGIN
    VERIFICAR_STOCKS;
END;
/