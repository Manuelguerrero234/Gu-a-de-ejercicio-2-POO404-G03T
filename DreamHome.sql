USE [master]
GO
/****** Object:  Database [DreamHouse]    Script Date: 28/09/2024 09:23:44 p. m. ******/
CREATE DATABASE [DreamHouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DreamHouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DreamHouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DreamHouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DreamHouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DreamHouse] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DreamHouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DreamHouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DreamHouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DreamHouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DreamHouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DreamHouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [DreamHouse] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DreamHouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DreamHouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DreamHouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DreamHouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DreamHouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DreamHouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DreamHouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DreamHouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DreamHouse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DreamHouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DreamHouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DreamHouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DreamHouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DreamHouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DreamHouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DreamHouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DreamHouse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DreamHouse] SET  MULTI_USER 
GO
ALTER DATABASE [DreamHouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DreamHouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DreamHouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DreamHouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DreamHouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DreamHouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DreamHouse] SET QUERY_STORE = OFF
GO
USE [DreamHouse]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/09/2024 09:23:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] NOT NULL,
	[primer_nombre] [varchar](100) NULL,
	[segundo_nombre] [varchar](100) NULL,
	[primer_apellido] [varchar](100) NULL,
	[segundo_apellido] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[email] [varchar](255) NULL,
	[tipo_preferido_inmueble] [varchar](100) NULL,
	[importe_maximo] [decimal](10, 2) NULL,
	[fecha_registro] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 28/09/2024 09:23:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrato](
	[id_contrato] [int] NOT NULL,
	[id_cliente] [int] NULL,
	[id_inmueble] [int] NULL,
	[modo_pago] [varchar](100) NULL,
	[duracion_contrato] [int] NULL,
	[fecha_inicio] [date] NULL,
	[fecha_vencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 28/09/2024 09:23:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] NOT NULL,
	[primer_nombre] [varchar](100) NULL,
	[segundo_nombre] [varchar](100) NULL,
	[primer_apellido] [varchar](100) NULL,
	[segundo_apellido] [varchar](100) NULL,
	[direccion] [varchar](255) NULL,
	[categoria_laboral] [varchar](100) NULL,
	[salario] [decimal](10, 2) NULL,
	[email] [varchar](255) NULL,
	[fecha_nacimiento] [date] NULL,
	[edad] [int] NULL,
	[id_sucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inmueble]    Script Date: 28/09/2024 09:23:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmueble](
	[id_inmueble] [int] NOT NULL,
	[direccion_calle] [varchar](255) NULL,
	[direccion_colonia] [varchar](255) NULL,
	[direccion_ciudad] [varchar](255) NULL,
	[direccion_departamento] [varchar](255) NULL,
	[tipo_inmueble] [varchar](100) NULL,
	[numero_habitaciones] [int] NULL,
	[costo_alquiler] [decimal](10, 2) NULL,
	[id_propietario] [int] NULL,
	[id_sucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inmueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 28/09/2024 09:23:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[id_propietario] [int] NOT NULL,
	[primer_nombre] [varchar](100) NULL,
	[segundo_nombre] [varchar](100) NULL,
	[primer_apellido] [varchar](100) NULL,
	[segundo_apellido] [varchar](100) NULL,
	[direccion] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_propietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 28/09/2024 09:23:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[id_sucursal] [int] NOT NULL,
	[direccion_calle] [varchar](255) NULL,
	[direccion_colonia] [varchar](255) NULL,
	[direccion_ciudad] [varchar](255) NULL,
	[direccion_departamento] [varchar](255) NULL,
	[telefono] [varchar](15) NULL,
	[id_empleado_encargado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cliente__AB6E6164E260020F]    Script Date: 28/09/2024 09:23:45 p. m. ******/
ALTER TABLE [dbo].[Cliente] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Empleado__AB6E6164AE261453]    Script Date: 28/09/2024 09:23:45 p. m. ******/
ALTER TABLE [dbo].[Empleado] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Propieta__AB6E6164BCF2F332]    Script Date: 28/09/2024 09:23:45 p. m. ******/
ALTER TABLE [dbo].[Propietario] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD FOREIGN KEY([id_inmueble])
REFERENCES [dbo].[Inmueble] ([id_inmueble])
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD FOREIGN KEY([id_propietario])
REFERENCES [dbo].[Propietario] ([id_propietario])
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[Sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD FOREIGN KEY([id_empleado_encargado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
USE [master]
GO
ALTER DATABASE [DreamHouse] SET  READ_WRITE 
GO
