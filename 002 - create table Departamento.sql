use SSASA
go

create table Departamento (
	DepartamentoId int not null identity(1,1) primary key
	, Nombre nvarchar(25) not null default ''
	, Estado nvarchar(5) not null default 'Inact'
	, Fecha_Creacion date not null default getdate()
	, Fecha_Cambio_Estado date null
)