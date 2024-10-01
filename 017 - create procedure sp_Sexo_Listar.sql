use SSASA
go

create procedure sp_Sexo_Listar
as
begin
	select SexoId, Descripcion from Sexo
end