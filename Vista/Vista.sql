
-- pago de bono 


CREATE VIEW pago_bono
AS
SELECT id_cargo, id_persona, fecha_ingreso
FROM Personal
WHERE fecha_ingreso > '2023-06-01';


select * From pago_bono;