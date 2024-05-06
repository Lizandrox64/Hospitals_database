


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