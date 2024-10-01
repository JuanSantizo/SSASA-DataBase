use SSASA
go

create procedure Sp_Empleados_Seleccionar
	@p_DPI nvarchar(25)
as
begin
	select DPI
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
	from Empleados
	where DPI = @p_DPI
end