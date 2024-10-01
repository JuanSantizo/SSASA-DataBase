use SSASA
go

create procedure Sp_Departamento_Seleccionar
	@p_DepartamentoId int 
as
begin
	select DepartamentoId, Nombre, Estado, Fecha_Cambio_Estado
	from Departamento
	where Estado = 'Act'
		and DepartamentoId = @p_DepartamentoId 
	order by Nombre
end