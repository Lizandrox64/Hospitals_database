CREATE or alter VIEW PersonalContacto AS
SELECT 
    p.nombre_1 + ' ' + p.apellido_1 AS Nombre,
    p.apellido_2 AS Apellido,
    c.Telefono,
    c.Correo,
    DATEDIFF(YEAR, p.fecha_nacimiento, GETDATE()) AS Edad
FROM 
    Persona p
JOIN 
    Contacto c ON p.id_persona = c.id_contacto;

	select * from PersonaContacto 
