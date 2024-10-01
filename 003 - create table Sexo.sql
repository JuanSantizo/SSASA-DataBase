use SSASA
go

create table Sexo (
	SexoId int not null identity(1,1) primary key
	, Descripcion nvarchar(20)
)