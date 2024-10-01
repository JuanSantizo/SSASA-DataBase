use SSASA
go

create procedure sp_Empleados_Insertar
	@p_DPI nvarchar(25) 
	, @p_Nombres nvarchar(40)
	, @p_Apellidos nvarchar(40)
	, @p_FechaNacimiento date
	, @p_SexoId int
	, @p_Fecha_Ingreso date 
	, @p_Edad int 
	, @p_Direccion nvarchar(50)
	, @p_NIT nvarchar(25)
	, @p_DepartamentoId int
as
begin
	insert into Empleados(
		DPI
		, Nombres 
		, Apellidos
		, FechaNacimiento 
		, SexoId 
		, Fecha_Ingreso 
		, Edad 
		, Direccion 
		, NIT 
		, DepartamentoId 
		, Estado 		
	) values (
		@p_DPI
		, @p_Nombres
		, @p_Apellidos
		, @p_FechaNacimiento
		, @p_SexoId
		, @p_Fecha_Ingreso
		, @p_Edad
		, @p_Direccion
		, @p_NIT
		, @p_DepartamentoId 
		, 'Act'
	)
	
end