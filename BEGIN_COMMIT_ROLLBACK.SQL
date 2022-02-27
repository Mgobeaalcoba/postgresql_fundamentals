-- Las transacciones en PostgresSQL se inician con BEGIN y se cierran con COMMIT o ROLLBACK
-- Sirven para guardar una serie de acciones solo si todas ellas se ejecutan de forma correcta. 
-- Bloque transaccional: Bloque desde el BEGIN hasta el COMMIT o ROLLBACk
-- El rollback se usa siempre que falla una parte de una transaccion.

BEGIN;

INSERT INTO public."TREN"(
    modelo, capacidad)
    VALUES ('Modelo Trns 2', 1234);

INSERT INTO public."ESTACION"(
    id, nombre, direccion)
    VALUES (100, 'Estacion Transacc 2', 'dirsasdasd');

COMMIT;

-- Es importante desactivar el autocommit cuando vamos a hacer esto.