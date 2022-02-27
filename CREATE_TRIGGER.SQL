CREATE FUNCTION public.impl() -- Primero creo la trigger function
	RETURNS TRIGGER -- Debe returnar un trigger
	LANGUAGE 'plpgsql' -- Declaro el lenguaje en el que la estoy programando
	COST 100 -- Valores por defecto que pueden ser obviados
	VOLATILE NOT LEAKPROOF -- Valores por defecto que pueden ser obviados
AS -- Tal función va a contener lo siguiente:
$BODY$
DECLARE -- Defino las variables de mi función
	rec record;
	contador integer := 0;
BEGIN -- Inicio del proceso de mi función
	FOR rec IN SELECT * FROM "PASAJERO" LOOP -- Recorro cada fila de mi tabla de pasajeros
	contador := contador +1; -- Cuento la cantidad de pasajeros que recorrí
	END LOOP; -- Termino el loop
	INSERT INTO "CONT_PASAJERO" (total, tiempo) -- Inserto en mi nueva tabla de registro el total y la hora de registro
	VALUES (contador, now());
	RETURN NEW; -- Le indico que me debe returnar a mi nueva tabla los valores posteriores a la actualización. 
END -- Fin de la acción
$BODY$

-- Creación del trigger. 


CREATE TRIGGER mitrigger
	AFTER INSERT -- Se debe correr el trigger luego de un insert
	ON public."PASAJERO" -- ¿Donde es el insert? En la tabla de pasajero
	FOR EACH ROW -- Cada vez que se inserte una fila
	EXECUTE PROCEDURE public.impl(); -- Trigger function que debo ejecutar

-- Al correr un insert en pasajero como el siguiente tmb se va a registar la info de cantidad de pasajeros y hora del registro en cant_pasajeros
INSERT INTO public."PASAJERO"(
	 nombre, direccion, fecha)
	VALUES ('Jacinto Roldan', 'Delta del Amazonas 174', '2017-01-18');

-- Puedo asociar un segundo trigger a la misma función. Por ejemplo para dejar registrado los deletes de mi tabla de pasajeros de esta forma
CREATE TRIGGER mitrigger2
	AFTER DELETE
	ON public."PASAJERO"
	FOR EACH ROW
	EXECUTE PROCEDURE public.impl();

