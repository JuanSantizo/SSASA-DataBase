use SSASA
go

create procedure Sp_DepartamentoEmpleados_Desactivar
	@p_DepartamentoId int 
as
begin
	update Empleados set Estado = 'Inact'
		, Fecha_Cambio_Estado = GETDATE()
	where DepartamentoId = @p_DepartamentoId
		and Estado = 'Act'
end