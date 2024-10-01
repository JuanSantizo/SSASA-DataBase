use SSASA
go

create table Empleados(	
	DPI nvarchar(25) not null primary key
	, Nombres nvarchar(40) not null default ''
	, Apellidos nvarchar(40) not null default ''
	, FechaNacimiento date not null
	, SexoId int not null
	, Fecha_Ingreso date not null
	, Edad int not null default 0
	, Direccion nvarchar(50) not null default ''
	, NIT nvarchar(25) not null default ''
	, DepartamentoId int not null
	, Estado nvarchar(5) default 'Inact'
	, Fecha_Cambio_Estado date

	, foreign key (SexoId) references Sexo(SexoId)
	, foreign key (DepartamentoId) references Departamento(DepartamentoId)
)