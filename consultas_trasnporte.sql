SELECT * FROM despues_noche_mview;
REFRESH MATERIALIZED VIEW despues_noche_mview;

DELETE FROM "VIAJE" WHERE id = 6;

SELECT * FROM "VIAJE"
WHERE inicio > '22:00:00';

SELECT * FROM despues_noche_mview;
REFRESH MATERIALIZED VIEW despues_noche_mview;