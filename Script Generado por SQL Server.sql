USE [master]
GO
/****** Object:  Database [SSASA]    Script Date: 30/09/2024 22:19:07 ******/
CREATE DATABASE [SSASA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SSASA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SSASA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SSASA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SSASA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SSASA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SSASA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SSASA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SSASA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SSASA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SSASA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SSASA] SET ARITHABORT OFF 
GO
ALTER DATABASE [SSASA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SSASA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SSASA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SSASA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SSASA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SSASA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SSASA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SSASA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SSASA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SSASA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SSASA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SSASA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SSASA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SSASA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SSASA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SSASA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SSASA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SSASA] SET RECOVERY FULL 
GO
ALTER DATABASE [SSASA] SET  MULTI_USER 
GO
ALTER DATABASE [SSASA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SSASA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SSASA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SSASA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SSASA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SSASA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SSASA', N'ON'
GO
ALTER DATABASE [SSASA] SET QUERY_STORE = ON
GO
ALTER DATABASE [SSASA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SSASA]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](25) NOT NULL,
	[Estado] [nvarchar](5) NOT NULL,
	[Fecha_Creacion] [date] NOT NULL,
	[Fecha_Cambio_Estado] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[DPI] [nvarchar](25) NOT NULL,
	[Nombres] [nvarchar](40) NOT NULL,
	[Apellidos] [nvarchar](40) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[SexoId] [int] NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Edad] [int] NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[NIT] [nvarchar](25) NOT NULL,
	[DepartamentoId] [int] NOT NULL,
	[Estado] [nvarchar](5) NULL,
	[Fecha_Cambio_Estado] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DPI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[SexoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SexoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departamento] ADD  DEFAULT ('') FOR [Nombre]
GO
ALTER TABLE [dbo].[Departamento] ADD  DEFAULT ('Inact') FOR [Estado]
GO
ALTER TABLE [dbo].[Departamento] ADD  DEFAULT (getdate()) FOR [Fecha_Creacion]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ('') FOR [Nombres]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ('') FOR [Apellidos]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ((0)) FOR [Edad]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ('') FOR [Direccion]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ('') FOR [NIT]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ('Inact') FOR [Estado]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([DepartamentoId])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([SexoId])
REFERENCES [dbo].[Sexo] ([SexoId])
GO
/****** Object:  StoredProcedure [dbo].[Sp_Departamento_Actualizar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Sp_Departamento_Actualizar]
	@p_DepartamentoId int 
	, @p_Nombre nvarchar(25)
as
begin
	update Departamento set Nombre = @p_Nombre
	where DepartamentoId = @p_DepartamentoId
		and Estado = 'Act'
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Departamento_Desactivar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Sp_Departamento_Desactivar]
	@p_DepartamentoId int 
as
begin
	update Departamento set Estado = 'Inact'
		, Fecha_Cambio_Estado = GETDATE()
	where DepartamentoId = @p_DepartamentoId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_Insertar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_Departamento_Insertar]
	@p_Nombre nvarchar(25)
as
begin
	insert into Departamento (
		Nombre
		, Estado
	) values (
		@p_Nombre
		, 'Act'
	)	
end
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Departamento_Listar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_Departamento_Listar]
as
begin
	select DepartamentoId, Nombre, Estado
	from Departamento	
	order by Nombre
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Departamento_Seleccionar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Sp_Departamento_Seleccionar]
	@p_DepartamentoId int 
as
begin
	select DepartamentoId, Nombre, Estado, Fecha_Cambio_Estado
	from Departamento
	where Estado = 'Act'
		and DepartamentoId = @p_DepartamentoId 
	order by Nombre
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_DepartamentoEmpleados_Desactivar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Sp_DepartamentoEmpleados_Desactivar]
	@p_DepartamentoId int 
as
begin
	update Empleados set Estado = 'Inact'
		, Fecha_Cambio_Estado = GETDATE()
	where DepartamentoId = @p_DepartamentoId
		and Estado = 'Act'
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Empleados_Actualizar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Sp_Empleados_Actualizar]
	@p_DPI nvarchar(25)
	, @p_Nombres nvarchar(40)
	, @p_Apellidos nvarchar(40)
	, @p_FechaNacimiento date 
	, @p_SexoId int 
	, @p_Fecha_Ingreso date 
	, @p_Edad int
	, @p_Direccion nvarchar(50) 
	, @p_NIT nvarchar(25) 
	, @p_DepartamentoId int 
as
begin
	update Empleados set Nombres = @p_Nombres 
		, Apellidos = @p_Apellidos 
		, FechaNacimiento = @p_FechaNacimiento
		, SexoId = @p_SexoId
		, Fecha_Ingreso = @p_Fecha_Ingreso
		, Edad = @p_Edad
		, Direccion = @p_Direccion
		, NIT = @p_NIT
		, DepartamentoId = @p_DepartamentoId
	where DPI = @p_DPI
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Empleados_Desactivar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Sp_Empleados_Desactivar]
	@p_DPI nvarchar(25)
as
begin
	update Empleados set Estado = 'Inact'
		, Fecha_Cambio_Estado = GETDATE()
	where DPI = @p_DPI
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleados_Insertar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_Empleados_Insertar]
	@p_DPI nvarchar(25) 
	, @p_Nombres nvarchar(40)
	, @p_Apellidos nvarchar(40)
	, @p_FechaNacimiento date
	, @p_SexoId int
	, @p_Fecha_Ingreso date 
	, @p_Edad int 
	, @p_Direccion nvarchar(50)
	, @p_NIT nvarchar(25)
	, @p_DepartamentoId int
as
begin
	insert into Empleados(
		DPI
		, Nombres 
		, Apellidos
		, FechaNacimiento 
		, SexoId 
		, Fecha_Ingreso 
		, Edad 
		, Direccion 
		, NIT 
		, DepartamentoId 
		, Estado 		
	) values (
		@p_DPI
		, @p_Nombres
		, @p_Apellidos
		, @p_FechaNacimiento
		, @p_SexoId
		, @p_Fecha_Ingreso
		, @p_Edad
		, @p_Direccion
		, @p_NIT
		, @p_DepartamentoId 
		, 'Act'
	)
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Empleados_Listar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_Empleados_Listar]
as
begin
	select DPI
		, Nombres
		, Apellidos
		, Fecha_Ingreso
		, e.SexoId
		, s.Descripcion Sexo
		, e.FechaNacimiento
		, Edad
		, Direccion
		, NIT
		, e.DepartamentoId
		, d.Nombre Departamento
		, e.Estado
	from Empleados e
	inner join Sexo s on e.SexoId = s.SexoId 
	inner join Departamento d on d.DepartamentoId = e.DepartamentoId
end
	
GO
/****** Object:  StoredProcedure [dbo].[Sp_Empleados_Seleccionar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Sp_Empleados_Seleccionar]
	@p_DPI nvarchar(25)
as
begin
	select DPI
		, Nombres
		, Apellidos
		, FechaNacimiento
		, SexoId
		, Fecha_Ingreso
		, Edad
		, Direccion
		, NIT
		, DepartamentoId
		, Estado
	from Empleados
	where DPI = @p_DPI
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Sexo_Listar]    Script Date: 30/09/2024 22:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_Sexo_Listar]
as
begin
	select SexoId, Descripcion from Sexo
end
GO
USE [master]
GO
ALTER DATABASE [SSASA] SET  READ_WRITE 
GO
