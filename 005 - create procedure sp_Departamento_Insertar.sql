use SSASA
go

create procedure sp_Departamento_Insertar
	@p_Nombre nvarchar(25)
as
begin
	insert into Departamento (
		Nombre
		, Estado
	) values (
		@p_Nombre
		, 'Act'
	)	
end
	
