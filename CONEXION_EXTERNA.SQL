-- CREATE EXTENSION dblink; Si aún no tenemos instalado dblink debemos hacerlo con este comando primero

SELECT * FROM public."PASAJERO"
JOIN
dblink ('dbname = remota
		port = 5432
		host = 127.0.0.1
	    user = usuario_consulta
	    password = XXXX',
	    'SELECT id, fecha FROM "VIP"') 
		AS datos_remotos (id integer, fecha date)
ON ("PASAJERO".id = datos_remotos.id);
 
-- Al llamarse de la misma forma los cammpos a joinear podemos resumir el "ON" usando el USING

SELECT * FROM public."PASAJERO"
JOIN
dblink ('dbname = remota
		port = 5432
		host = 127.0.0.1
	    user = usuario_consulta
	    password = XXXX',
	    'SELECT id, fecha FROM "VIP"') 
		AS datos_remotos (id integer, fecha date)
USING (id);

-- Misma conexión hecha de forma inversa, es decir desde "remota":

CREATE EXTENSION dblink;

SELECT * FROM public."VIP"
JOIN
dblink ('dbname = transporte
		port = 5432
		host = 127.0.0.1
	    user = usuario_consulta
	    password = XXXX',
	    'SELECT * FROM "PASAJERO"') 
		AS datos_remotos (id integer, nombre varchar, direccion varchar, fecha date)
USING (id);