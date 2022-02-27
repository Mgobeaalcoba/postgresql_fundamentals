DO -- reservada para hacer una consulta PL
$$
DECLARE -- Declaramos las variables
 rec record;
 contador integer := 0;
BEGIN -- Declaramos la acción
 FOR rec IN SELECT * FROM "PASAJERO" LOOP
 	RAISE NOTICE 'Un pasajero se llama %', rec.nombre;
	contador := contador + 1;
 END LOOP;
 RAISE NOTICE 'Conteo es %', contador;
END
$$
LANGUAGE PLPGSQL

CREATE FUNCTION importantePL() -- reservado para crear una función en PL
 RETURNS void -- No nos retorna nada en este caso
AS 
$$
DECLARE -- Declaramos las variables
 rec record;
 contador integer := 0;
BEGIN -- Declaramos la acción
 FOR rec IN SELECT * FROM "PASAJERO" LOOP
 	RAISE NOTICE 'Un pasajero se llama %', rec.nombre;
	contador := contador + 1;
 END LOOP;
 RAISE NOTICE 'Conteo es %', contador;
END
$$
LANGUAGE PLPGSQL

-- Una vez guardada corremos la funcion de la siguiente forma

SELECT importantePL();

DROP FUNCTION importantePL(); -- Elimino la función anterior
CREATE FUNCTION importantePL() -- reservado para crear una función en PL
 RETURNS integer -- Le digo que me va a retornar un entero en el campo de tablas
AS 
$$
DECLARE -- Declaramos las variables
 rec record;
 contador integer := 0;
BEGIN -- Declaramos la acción
 FOR rec IN SELECT * FROM "PASAJERO" LOOP
 	RAISE NOTICE 'Un pasajero se llama %', rec.nombre;
	contador := contador + 1;
 END LOOP;
 RAISE NOTICE 'Conteo es %', contador;
 RETURN contador; -- Le especifico que entero quiero que me retorne. 
END
$$
LANGUAGE PLPGSQL
