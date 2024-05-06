
--creacion de tabla de control de personal  

create table control(
	usario varchar (30),
	fecha date,
	accion varchar(50)
);

Select * from control

-- creacion de triggees de nuevo ingreso al personal

Create or alter trigger tgr_nuevos_ingresos
on personal
after insert
as 
	begin
		declare @usario varchar (30);
		set @usario =SUSER_NAME();
		insert into control values (@usario, getdate(),'insercion');
end;