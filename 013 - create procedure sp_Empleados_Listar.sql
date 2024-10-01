use SSASA
go

create procedure sp_Empleados_Listar
as
begin
	select DPI
		, Nombres
		, Apellidos
		, Fecha_Ingreso
		, e.SexoId
		, s.Descripcion Sexo
		, e.FechaNacimiento
		, Edad
		, Direccion
		, NIT
		, e.DepartamentoId
		, d.Nombre Departamento
		, e.Estado
	from Empleados e
	inner join Sexo s on e.SexoId = s.SexoId 
	inner join Departamento d on d.DepartamentoId = e.DepartamentoId
end
	