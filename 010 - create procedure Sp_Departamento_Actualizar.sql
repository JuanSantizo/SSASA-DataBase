use SSASA
go

create procedure Sp_Departamento_Actualizar
	@p_DepartamentoId int 
	, @p_Nombre nvarchar(25)
as
begin
	update Departamento set Nombre = @p_Nombre
	where DepartamentoId = @p_DepartamentoId
		and Estado = 'Act'
end