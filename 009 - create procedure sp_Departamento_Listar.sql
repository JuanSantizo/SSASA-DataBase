use SSASA
go

create procedure sp_Departamento_Listar
as
begin
	select DepartamentoId, Nombre, Estado
	from Departamento	
	order by Nombre
end