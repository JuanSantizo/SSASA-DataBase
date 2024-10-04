use ssasa
go

create procedure sp_Estados
as
begin
	select 'Act' Status, 'Activo' Estado
	union all
	select 'Inact' Status, 'Inactivo' Estado
end
