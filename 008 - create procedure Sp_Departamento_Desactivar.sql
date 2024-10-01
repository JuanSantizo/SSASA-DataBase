use SSASA
go

create procedure Sp_Departamento_Desactivar
	@p_DepartamentoId int 
as
begin
	update Departamento set Estado = 'Inact'
		, Fecha_Cambio_Estado = GETDATE()
	where DepartamentoId = @p_DepartamentoId
end
