use SSASA
go

create procedure sp_Reporte
	@p_Departamento int
	, @p_Estado nvarchar(5)
as
begin
	select e.DPI, e.Nombres, e.Apellidos, s.Descripcion Sexo, d.Nombre Departamento
		, case when e.Estado = 'Act' then 'Activo'
				when e.Estado = 'Inact' then 'Inactivo'
				else '' end Estado
		, e.Estado EstadoId
		, e.DepartamentoId
	from Empleados e
	inner join Sexo s on e.SexoId = s.SexoId
	inner join Departamento d on d.DepartamentoId = e.DepartamentoId 
	where case when @p_Departamento = 0 then 1 else case when @p_Departamento = e.DepartamentoId then 1 else 0 end end = 1
		and case when @p_Estado = '0' then 1 else case when @p_Estado = e.Estado then 1 else 0 end end = 1
end