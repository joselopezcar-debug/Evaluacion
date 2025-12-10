create table EMPLEADOS (
    ID_EMPLEADO number primary key,
    NOMBRE varchar2(50),
    SALARIO number(10,2)
);

create table PRODUCTOS (
    ID_PRODUCTO number primary key,
    NOMBRE VARCHAR2(100),
    STOCK_ACTUAL number,
    STOCK_MINIMO number
);