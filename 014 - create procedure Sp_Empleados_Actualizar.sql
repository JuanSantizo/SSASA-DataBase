use SSASA
go

create procedure Sp_Empleados_Actualizar
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
	update Empleados set Nombres = @p_Nombres 
		, Apellidos = @p_Apellidos 
		, FechaNacimiento = @p_FechaNacimiento
		, SexoId = @p_SexoId
		, Fecha_Ingreso = @p_Fecha_Ingreso
		, Edad = @p_Edad
		, Direccion = @p_Direccion
		, NIT = @p_NIT
		, DepartamentoId = @p_DepartamentoId
	where DPI = @p_DPI
end
