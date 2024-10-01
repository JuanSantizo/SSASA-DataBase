use SSASA
go

create procedure Sp_Empleados_Desactivar
	@p_DPI nvarchar(25)
as
begin
	update Empleados set Estado = 'Inact'
		, Fecha_Cambio_Estado = GETDATE()
	where DPI = @p_DPI
end
