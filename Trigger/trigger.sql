-- contro de modificaciones de la tabla personal 


create table control(
	usario varchar (30),
	fecha date,
	accion varchar(50)
);

Select * from control

Create or alter trigger tgr_nuevos_ingresos
on personal
after insert
as 
	begin
		declare @usario varchar (30);
		set @usario =SUSER_NAME();
		insert into control values (@usario, getdate(),'insercion');
end;


-- actualizacion de tabla personal 

Create or alter trigger tgr_Actualizacion_personal
on personal
after insert
as 
	begin
		declare @usario varchar (30);
		set @usario =SUSER_NAME();
		insert into control values (@usario, getdate(),'Actualizacion');
end;

--Borrado de datos de la tabla personal 

Create or alter trigger tgr_Desvinculacion
on personal
after insert
as 
	begin
		declare @usario varchar (30);
		set @usario =SUSER_NAME();
		insert into control values (@usario, getdate(),'desvincualcion');
end;