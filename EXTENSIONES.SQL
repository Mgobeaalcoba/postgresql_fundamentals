-- Postgress nos da la opcion de instalar muchas extensiones. No solo dblink para acceso remoto 
-- Algunos ejemplos son: 

CREATE EXTENSION fuzzystrmatch;

SELECT levenshtein('Oswaldo','Osvaldo');

SELECT difference ('beard','bird');

