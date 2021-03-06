USE [master]
GO
/****** Object:  Database [SIPRE]    Script Date: 22/10/2016 10:08:29 p. m. ******/
CREATE DATABASE [SIPRE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SIPRE', FILENAME = N'D:\RDSDBDATA\DATA\SIPRE.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'SIPRE_log', FILENAME = N'D:\RDSDBDATA\DATA\SIPRE_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SIPRE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SIPRE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SIPRE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SIPRE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SIPRE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SIPRE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SIPRE] SET ARITHABORT OFF 
GO
ALTER DATABASE [SIPRE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SIPRE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SIPRE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SIPRE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SIPRE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SIPRE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SIPRE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SIPRE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SIPRE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SIPRE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SIPRE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SIPRE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SIPRE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SIPRE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SIPRE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SIPRE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SIPRE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SIPRE] SET RECOVERY FULL 
GO
ALTER DATABASE [SIPRE] SET  MULTI_USER 
GO
ALTER DATABASE [SIPRE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SIPRE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SIPRE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SIPRE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SIPRE] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SIPRE]
GO
/****** Object:  User [zuyto]    Script Date: 22/10/2016 10:08:31 p. m. ******/
CREATE USER [zuyto] FOR LOGIN [zuyto] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa]    Script Date: 22/10/2016 10:08:32 p. m. ******/
CREATE USER [sa] FOR LOGIN [sa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JhonJoya]    Script Date: 22/10/2016 10:08:32 p. m. ******/
CREATE USER [JhonJoya] FOR LOGIN [JhonJoya] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [EfAyala]    Script Date: 22/10/2016 10:08:32 p. m. ******/
CREATE USER [EfAyala] FOR LOGIN [EfAyala] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AlejoZepol]    Script Date: 22/10/2016 10:08:33 p. m. ******/
CREATE USER [AlejoZepol] FOR LOGIN [AlejoZepol] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [zuyto]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [zuyto]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa]
GO
ALTER ROLE [db_owner] ADD MEMBER [JhonJoya]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [JhonJoya]
GO
ALTER ROLE [db_owner] ADD MEMBER [EfAyala]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [EfAyala]
GO
ALTER ROLE [db_owner] ADD MEMBER [AlejoZepol]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [AlejoZepol]
GO
/****** Object:  Schema [m2ss]    Script Date: 22/10/2016 10:08:35 p. m. ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  UserDefinedFunction [dbo].[CalcEdad]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalcEdad](
@dt1 date,
@dt2 date
)
RETURNS smallint
WITH RETURNS NULL ON NULL INPUT
AS
BEGIN
RETURN (
SELECT
	DATEDIFF([year], @dt1, @dt2) - 
	CASE 
	WHEN (MONTH(@dt2) * 100) + DAY(@dt2) < (MONTH(@dt1) * 100) + DAY(@dt1) THEN 1
	ELSE 0
	END
);
END;

GO
/****** Object:  Table [dbo].[Be_solicitud]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Be_solicitud](
	[codSolicitud] [int] IDENTITY(104,1) NOT NULL,
	[codProveedor] [int] NOT NULL,
	[codTomador] [int] NOT NULL,
	[estSolicitud] [nchar](1) NOT NULL,
	[fecSolicitud] [date] NOT NULL,
	[codservicios] [int] NOT NULL,
	[observaciones] [nvarchar](255) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_be_solicitudbeneficios_codSoli] PRIMARY KEY CLUSTERED 
(
	[codSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Be_Tipobeneficios]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Be_Tipobeneficios](
	[codServicio] [int] NOT NULL,
	[codProveedor] [int] NOT NULL,
	[codTipoServicio] [int] NOT NULL,
	[tipContrato] [nchar](1) NOT NULL,
	[indActividad] [nchar](1) NULL,
	[indPrescipciones] [nchar](1) NULL,
	[porEmpleado] [float] NOT NULL,
	[porEmpresa] [float] NOT NULL,
	[actUsuario] [nvarchar](15) NOT NULL,
	[actEstado] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_be_tipobeneficio_codServicio] PRIMARY KEY CLUSTERED 
(
	[codServicio] ASC,
	[tipContrato] ASC,
	[codProveedor] ASC,
	[codTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Be_TipoServicios]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Be_TipoServicios](
	[codTipoServicio] [int] NOT NULL,
	[nomServicio] [nvarchar](20) NOT NULL,
	[indActividad] [nchar](1) NOT NULL,
	[natServicio] [nchar](1) NOT NULL,
	[indFactura] [nchar](1) NOT NULL,
	[actUsuario] [int] NOT NULL,
	[estActividad] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_be_tiposervicio_codTipServicio] PRIMARY KEY CLUSTERED 
(
	[codTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bi_Beneficiarios]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bi_Beneficiarios](
	[codEmpleado] [int] NOT NULL,
	[codBeneficiario] [int] NOT NULL,
	[munNacimiento] [int] NOT NULL,
	[fecNacimiento] [date] NOT NULL,
	[fecInicioContrato] [date] NOT NULL,
	[fecFinContrato] [date] NOT NULL,
	[actUsuario] [int] NOT NULL,
	[actHora] [datetime] NOT NULL,
	[tipBeneficiario] [int] NULL,
 CONSTRAINT [PK_bi_beneficiariosempleados_codBeneficiario] PRIMARY KEY CLUSTERED 
(
	[codBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bi_Empleados]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bi_Empleados](
	[codEmpleado] [int] NOT NULL,
	[numContrato] [int] NOT NULL,
	[munNacimiento] [int] NOT NULL,
	[fecNacimiento] [date] NOT NULL,
	[tipContrato] [nchar](1) NOT NULL,
	[fecInicioContrato] [date] NOT NULL,
	[fecFinContrato] [date] NOT NULL,
	[sueBasico] [int] NOT NULL,
	[actUsuario] [varchar](15) NOT NULL,
	[actEstado] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_bi_datosempleado_codEmpleado] PRIMARY KEY CLUSTERED 
(
	[codEmpleado] ASC,
	[numContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bi_Proveedores]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bi_Proveedores](
	[codProveedor] [int] NOT NULL,
	[tipProveedor] [nchar](1) NOT NULL,
	[fecInicio] [date] NOT NULL,
	[fecFinal] [date] NOT NULL,
	[actUsuario] [int] NOT NULL,
	[actEstado] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_bi_datosproveedor_codProveedor] PRIMARY KEY CLUSTERED 
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bi_Terceros]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bi_Terceros](
	[codTercero] [int] NOT NULL,
	[tipTercero] [nchar](1) NOT NULL,
	[tipIdentificacion] [int] NOT NULL,
	[priNombre] [nvarchar](20) NOT NULL,
	[segNombre] [nvarchar](20) NULL,
	[priApellido] [nvarchar](20) NOT NULL,
	[segApellido] [nvarchar](20) NULL,
	[indActividad] [nchar](1) NOT NULL,
	[codMunicipio] [int] NOT NULL,
	[dirResidencia] [nvarchar](15) NOT NULL,
	[telResidencia] [int] NOT NULL,
	[corElectronico] [nvarchar](45) NOT NULL,
	[actUsuario] [int] NOT NULL,
	[actEsta] [nchar](1) NOT NULL,
	[actHora] [datetime] NOT NULL,
 CONSTRAINT [PK_bi_datosterceros_codTerc] PRIMARY KEY CLUSTERED 
(
	[codTercero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_Auditoria]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gn_Auditoria](
	[codAuditoria] [int] IDENTITY(1,1) NOT NULL,
	[tabla] [varchar](20) NULL,
	[usuario] [varchar](15) NULL,
	[descripcion] [text] NULL,
	[tipoModificacion] [char](1) NULL,
	[fecha] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gn_Departamentos]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_Departamentos](
	[codDepartamento] [int] NOT NULL,
	[codPais] [int] NOT NULL,
	[nomDepartamento] [nvarchar](30) NULL,
	[usuActividad] [nchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_departamento_codDepartamento] PRIMARY KEY CLUSTERED 
(
	[codDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_DetalleMenu]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_DetalleMenu](
	[codMenu] [int] NOT NULL,
	[codPrograma] [int] NOT NULL,
	[codRol] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_detallemenu_codMenu] PRIMARY KEY CLUSTERED 
(
	[codMenu] ASC,
	[codPrograma] ASC,
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_DetalleRol]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_DetalleRol](
	[codRol] [int] NOT NULL,
	[codUsuario] [nchar](15) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_detallerol_codRol] PRIMARY KEY CLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_DocAdjuntos]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_DocAdjuntos](
	[codTercero] [int] NOT NULL,
	[codDocumento] [int] NOT NULL,
	[rutArchivo] [int] NOT NULL,
	[tipDocumento] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_documentosadjuntostercero_codTercero] PRIMARY KEY CLUSTERED 
(
	[codTercero] ASC,
	[codDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_Menu]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_Menu](
	[codMenu] [int] NOT NULL,
	[nomMenu] [nvarchar](40) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_menu_codMenu] PRIMARY KEY CLUSTERED 
(
	[codMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_Municipios]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_Municipios](
	[codMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[codDepartamento] [int] NOT NULL,
	[codSuip] [int] NOT NULL,
	[nomMunicipio] [nvarchar](30) NULL,
	[usuActividad] [nchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_municipio_codMunicipio] PRIMARY KEY CLUSTERED 
(
	[codMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_Pais]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_Pais](
	[codPais] [int] NOT NULL,
	[nomPais] [nvarchar](30) NULL,
	[usuActividad] [nchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_pais_codPais] PRIMARY KEY CLUSTERED 
(
	[codPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_Programas]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_Programas](
	[codPrograma] [int] NOT NULL,
	[nomPrograma] [nvarchar](40) NOT NULL,
	[dirPrograma] [nvarchar](40) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_programassistema_codPrograma] PRIMARY KEY CLUSTERED 
(
	[codPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_Roles]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_Roles](
	[codRol] [int] NOT NULL,
	[nomRol] [nvarchar](20) NOT NULL,
	[TipRol] [nchar](1) NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_roles_codRol] PRIMARY KEY CLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_TipoBeneficiarios]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gn_TipoBeneficiarios](
	[codTipoBeneficiario] [int] NOT NULL,
	[nomTipoBeneficiario] [varchar](15) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gn_TipoDocumentos]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gn_TipoDocumentos](
	[codTipoDocumentos] [int] NOT NULL,
	[nomDocumento] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_Gn_TipoDocumentos] PRIMARY KEY CLUSTERED 
(
	[codTipoDocumentos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gn_TipoIdentificaciones]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gn_TipoIdentificaciones](
	[codTipoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[nomTipoIdentificacion] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gn_Usuarios]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gn_Usuarios](
	[codUsuario] [varchar](15) NOT NULL,
	[Clave] [nchar](15) NOT NULL,
	[codTercero] [int] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_gn_usuarios_codUsuario] PRIMARY KEY CLUSTERED 
(
	[codUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pe_AsignacionPresupuestos]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pe_AsignacionPresupuestos](
	[codPresupuesto] [int] NOT NULL,
	[anoPresupuesto] [int] NOT NULL,
	[valInicial] [float] NOT NULL,
	[valEjecutado] [float] NOT NULL,
	[valPendiente] [float] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pe_asignacionpresupuesto_codPresupuesto] PRIMARY KEY CLUSTERED 
(
	[codPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pe_DetallePresupuesto]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pe_DetallePresupuesto](
	[codDetallePresupuesto] [int] IDENTITY(132,1) NOT NULL,
	[codPresupuesto] [int] NOT NULL,
	[codFactura] [int] NOT NULL,
	[codProveedor] [int] NOT NULL,
	[codTomador] [int] NOT NULL,
	[valEmpresa] [float] NOT NULL,
	[usuActividad] [nvarchar](15) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pe_detallepresupuesto_codDetPresupuesto] PRIMARY KEY CLUSTERED 
(
	[codDetallePresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pr_Facturacion]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pr_Facturacion](
	[codFactura] [int] NOT NULL,
	[codServicio] [int] NOT NULL,
	[valEmpleado] [float] NOT NULL,
	[valEmpresa] [float] NOT NULL,
	[usuActividad] [int] NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pr_facturacionproveedor_codFactura] PRIMARY KEY CLUSTERED 
(
	[codFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pr_ValoresServicios]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pr_ValoresServicios](
	[codValor] [int] NOT NULL,
	[tipBeneficio] [int] NOT NULL,
	[observacion] [nvarchar](max) NULL,
	[fecFinalVigencia] [date] NOT NULL,
	[valServicio] [float] NOT NULL,
	[usuActividad] [nchar](11) NOT NULL,
	[tipActividad] [nchar](1) NOT NULL,
	[horActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_pr_valoresservicioproveedor_codValor] PRIMARY KEY CLUSTERED 
(
	[codValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[gn_divPolitica]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[gn_divPolitica]
AS
SELECT        mu.codMunicipio, p.codPais, p.nomPais, de.codDepartamento, de.nomDepartamento, mu.codSuip, mu.nomMunicipio
FROM            dbo.Gn_Pais AS p INNER JOIN
                         dbo.Gn_Departamentos AS de ON p.codPais = de.codPais INNER JOIN
                         dbo.Gn_Municipios AS mu ON de.codDepartamento = mu.codDepartamento

GO
/****** Object:  View [dbo].[Bi_detalleEmpleado]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bi_detalleEmpleado] as
SELECT	t.tipTercero AS 'Tipo Tercero', 
		t.indActividad as 'Indicador de Actividad',
		ti.nomTipoIdentificacion as 'Tipo Identificación',
		e.CODEMPLEADO as 'Identificación',
--Nombres y Apellidos
		t.priNombre as 'Primer Nombre',
		t.segNombre as 'Segundo Nombre',
		t.priApellido as 'Primer Apellido',
		t.segApellido as 'Segundo Apellido',
--Nacimiento--
		e.fecNacimiento as 'Fecha de Nacimiento',
		dbo.CalcEdad(e.fecNacimiento,getDate()) as 'Edad',
		dpn.nomPais as 'Pais Nacimiento',
		dpn.nomDepartamento as 'Departamento Nacimiento',
		dpn.nomMunicipio as 'Municipio Nacimiento',
--Residencia--
		t.corElectronico as 'Correo Electronico',
		t.telResidencia as 'Telefono Residencia',
		t.dirResidencia as 'Direccion',
		dpr.nomPais as 'Pais Residencia',
		dpr.nomDepartamento as 'Departamento Residencia',
		dpr.nomMunicipio as 'Municipio Residencia',
--Contrato--
		e.numContrato as 'Numero Contrato', 
		e.tipContrato as 'Tipo Contrato',
		e.fecInicioContrato as 'Fecha Inicio',
		e.fecFinContrato as 'Fecha Fin',
		e.sueBasico as 'Sueldo Basico'
FROM BI_TERCEROS T
INNER JOIN BI_EMPLEADOS E ON  E.CODEMPLEADO=T.CODTERCERO
inner Join gn_TipoIdentificaciones ti on ti.codtipoIdentificacion=t.tipIdentificacion
inner join gn_divPolitica dpn on dpn.codmunicipio=e.munNacimiento
inner join gn_divPolitica dpr on dpr.codmunicipio=t.codMunicipio
where t.tipTercero='E'



GO
/****** Object:  View [dbo].[Bi_detalleBeneficiario]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bi_detalleBeneficiario] as
SELECT	tb.tipTercero AS 'Tipo Tercero', 
		tb.indActividad as 'Indicador de Actividad',
--Datos Empleado
		b.CODEMPLEADO as 'Identificación Empleado',
		(te.priNombre+' '+te.segNombre) as 'Nombres Empleado',
		(te.priApellido+' '+te.segApellido) as 'Apellidos Empleado',
--Datos Beneficiario
		cb.nomTipoBeneficiario as 'TipoBeneficiario',
		ti.nomTipoIdentificacion as 'Tipo Identificación',
		b.codBeneficiario as 'Identificación',
		(tb.priNombre+' '+tb.segNombre) as 'Nombres',
		(tb.priApellido+' '+tb.segApellido) as 'Apellidos',
--Nacimiento--
		b.fecNacimiento as 'Fecha de Nacimiento',
		dbo.CalcEdad(b.fecNacimiento,getDate()) as 'Edad',
		dpn.nomPais as 'Pais Nacimiento',
		dpn.nomDepartamento as 'Departamento Nacimiento',
		dpn.nomMunicipio as 'Municipio Nacimiento',
--Residencia--
		tb.corElectronico as 'Correo Electronico',
		tb.telResidencia as 'Telefono Residencia',
		tb.dirResidencia as 'Direccion',
		dpr.nomPais as 'Pais Residencia',
		dpr.nomDepartamento as 'Departamento Residencia',
		dpr.nomMunicipio as 'Municipio Residencia'
FROM BI_TERCEROS Tb
inner join bi_Beneficiarios b on b.codBeneficiario=tb.CodTercero
inner join bi_Terceros te on te.codTercero=b.codEmpleado
inner Join gn_TipoIdentificaciones ti on ti.codtipoIdentificacion=tb.tipIdentificacion
inner join gn_divPolitica dpn on dpn.codmunicipio=b.munNacimiento
inner join gn_divPolitica dpr on dpr.codmunicipio=tb.codMunicipio
inner join gn_tipoBeneficiarios cb on cb.codTipoBeneficiario=b.tipBeneficiario 
where tb.tipTercero='B';



GO
/****** Object:  View [dbo].[BI_TablaTercero]    Script Date: 22/10/2016 10:08:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BI_TablaTercero] 
		AS SELECT 
		(case a.tipTercero 
			when 'E' then 'EMPLEDO' 
			when 'B' then 'BENEFICIARIO' 
			when 'p' then 'PROVEEDOR' 
			ELSE 'Not for sale'end) as 'Tipo de Tercero', 
		a.codTercero AS 'Identificación', 
		(a.priNombre+' '+ a.segNombre) as 'Nombres', 
		(a.priApellido +' '+ a.segApellido) as'Apellidos',
		(case a.indActividad when 'A' then 'ACTIVO'
		else case a.indActividad when 'I' then 'INACTIVO' end END) as 'Indicador de Actividad' 
from Bi_Terceros a;

GO
SET IDENTITY_INSERT [dbo].[Be_solicitud] ON 

INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (2, 800150280, 30388309, N'R', CAST(N'2016-08-02' AS Date), 30, N'0', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (3, 860034594, 52104025, N'T', CAST(N'2016-08-02' AS Date), 22, N'0', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (72, 800037800, 79503353, N'R', CAST(N'2016-08-02' AS Date), 21, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (73, 800088702, 79505504, N'R', CAST(N'2016-08-02' AS Date), 1, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (74, 800106339, 79526451, N'R', CAST(N'2016-08-02' AS Date), 2, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (75, 800130907, 79622262, N'R', CAST(N'2016-08-02' AS Date), 3, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (76, 800139690, 79626621, N'R', CAST(N'2016-08-02' AS Date), 4, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (77, 800140680, 79646350, N'R', CAST(N'2016-08-02' AS Date), 30, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (78, 800140949, 79702885, N'R', CAST(N'2016-08-02' AS Date), 22, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (79, 800144331, 79872394, N'V', CAST(N'2016-08-02' AS Date), 21, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (80, 800150280, 80114936, N'V', CAST(N'2016-08-02' AS Date), 1, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (81, 800159085, 80134085, N'V', CAST(N'2016-08-02' AS Date), 2, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (82, 800170494, 80171743, N'V', CAST(N'2016-08-02' AS Date), 3, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (83, 800176994, 80217437, N'V', CAST(N'2016-08-02' AS Date), 4, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (84, 800184549, 80500206, N'V', CAST(N'2016-08-02' AS Date), 30, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (85, 800189529, 80850966, N'V', CAST(N'2016-08-02' AS Date), 22, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (86, 800198281, 80863451, N'V', CAST(N'2016-08-02' AS Date), 21, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (87, 800198644, 80863865, N'V', CAST(N'2016-08-02' AS Date), 1, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (88, 800224827, 86084659, N'T', CAST(N'2016-08-02' AS Date), 2, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (89, 800226175, 88213876, N'T', CAST(N'2016-08-02' AS Date), 3, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (90, 800227940, 91353894, N'T', CAST(N'2016-08-02' AS Date), 4, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (91, 800229256, 91424840, N'T', CAST(N'2016-08-02' AS Date), 30, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (92, 800229739, 91474044, N'T', CAST(N'2016-08-02' AS Date), 22, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (93, 800231967, 91478221, N'T', CAST(N'2016-08-02' AS Date), 21, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (94, 800250119, 91528420, N'T', CAST(N'2016-08-02' AS Date), 1, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (95, 800251440, 91538345, N'T', CAST(N'2016-08-02' AS Date), 2, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (96, 800253055, 91541739, N'T', CAST(N'2016-08-02' AS Date), 3, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (97, 804001273, 1010189408, N'T', CAST(N'2016-08-02' AS Date), 4, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (98, 805000427, 1013613998, N'T', CAST(N'2016-08-02' AS Date), 30, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (99, 805001157, 1014192553, N'T', CAST(N'2016-08-02' AS Date), 22, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (100, 811015884, 1016027413, N'T', CAST(N'2016-08-02' AS Date), 21, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (101, 830003564, 1016035412, N'T', CAST(N'2016-08-02' AS Date), 1, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (102, 830006404, 1018501836, N'T', CAST(N'2016-08-02' AS Date), 2, N'', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
INSERT [dbo].[Be_solicitud] ([codSolicitud], [codProveedor], [codTomador], [estSolicitud], [fecSolicitud], [codservicios], [observaciones], [usuActividad], [tipActividad], [horActividad]) VALUES (103, 830009783, 1019026394, N'T', CAST(N'2016-08-02' AS Date), 3, N'
', 0, N' ', CAST(N'2016-08-04T15:42:30.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Be_solicitud] OFF
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (1, 800150280, 4, N'I', N'A', N'S', 0, 50, N'SIPRE', N'A', CAST(N'2016-08-02T23:09:23.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (2, 800088702, 1, N'I', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-03T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (3, 800106339, 2, N'F', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-04T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (4, 800130907, 3, N'I', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-05T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (5, 800139690, 4, N'F', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-06T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (6, 800140680, 5, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-07T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (7, 800140949, 1, N'I', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-08T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (8, 800144331, 2, N'F', N'A', N'S', 0, 100, N'SIPRE', N'A', CAST(N'2016-08-09T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (9, 800150280, 3, N'I', N'A', N'S', 0, 100, N'SIPRE', N'A', CAST(N'2016-08-10T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (10, 800159085, 4, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-11T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (11, 800170494, 5, N'I', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-12T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (12, 800176994, 1, N'F', N'A', N'N', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-13T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (13, 800184549, 2, N'I', N'A', N'N', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-14T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (14, 800189529, 3, N'F', N'A', N'N', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-15T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (15, 800198281, 4, N'I', N'A', N'N', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-16T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (16, 800198644, 5, N'F', N'A', N'S', 0, 100, N'SIPRE', N'A', CAST(N'2016-08-17T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (17, 800224827, 4, N'I', N'A', N'S', 0, 100, N'SIPRE', N'A', CAST(N'2016-08-18T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (18, 800226175, 1, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-19T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (19, 800227940, 2, N'I', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-20T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (20, 800229256, 3, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-21T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (21, 800229739, 4, N'I', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-22T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (22, 800231967, 5, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-23T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (23, 800250119, 1, N'I', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-24T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (24, 800251440, 2, N'F', N'A', N'S', 0, 100, N'SIPRE', N'A', CAST(N'2016-08-25T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (25, 800253055, 3, N'I', N'A', N'S', 0, 100, N'SIPRE', N'A', CAST(N'2016-08-26T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (26, 804001273, 4, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-27T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (27, 805000427, 5, N'I', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-28T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (28, 805001157, 1, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-29T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (29, 811015884, 2, N'I', N'A', N'S', 70, 30, N'SIPRE', N'A', CAST(N'2016-08-30T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_Tipobeneficios] ([codServicio], [codProveedor], [codTipoServicio], [tipContrato], [indActividad], [indPrescipciones], [porEmpleado], [porEmpresa], [actUsuario], [actEstado], [actHora]) VALUES (30, 830003564, 3, N'F', N'A', N'S', 50, 50, N'SIPRE', N'A', CAST(N'2016-08-31T23:09:00.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (1, N'EDUCACION', N'A', N'P', N'N', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (2, N'VIVIENDA', N'A', N'P', N'N', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (3, N'MEDICINA GENERAL', N'A', N'P', N'N', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (4, N'DEFUNCION', N'A', N'P', N'N', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (5, N'SERVICIO MEDICO', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (6, N'ANATOMIA PATOLOGICAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (7, N'ANESTESIOLOGIA PEDIA', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (8, N'ANESTESIOLOGIA Y REC', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (9, N'CARDIOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (10, N'CARDIOLOGIA PEDIATRI', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (11, N'CIRUGIA DE TORAX NO ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (12, N'CIRUGIA DE TORAX Y C', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (13, N'CIRUGIA GENERALÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (14, N'CIRUGIA ONCOLOGICAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (15, N'CIRUGIA PEDIATRICAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (16, N'CIRUGIA PLASTICA Y R', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (17, N'DERMATOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (18, N'ENDOCRINOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (19, N'GASTROENTEROLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (20, N'GERIATRIA Y GERONTOL', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (21, N'GINECOLOGIA ONCOLOGI', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (22, N'GINECOLOGIA Y OBSTET', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (23, N'HEMATOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (24, N'HEMATOLOGIA PEDIATRI', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (25, N'INFECTOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (26, N'INFECTOLOGIA PEDIATR', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (27, N'INMUNOLOGIA CLINICA ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (28, N'MEDICINA CRITICA PED', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (29, N'MEDICINA CRITICA Y T', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (30, N'MEDICINA DE EMERGENC', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (31, N'MEDICINA FAMILIAR Y ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (32, N'MEDICINA FISICA Y RE', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (33, N'MEDICINA INTERNAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (34, N'MEDICINA MATERNO FET', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (35, N'NEFROLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (36, N'NEFROLOGIA PEDIATRIC', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (37, N'NEONATOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (38, N'NEUMOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (39, N'NEUMOLOGIA PEDIATRIC', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (40, N'NEUROCIRUGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (41, N'NEUROLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (42, N'OFTALMOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (43, N'ONCOLOGIA MEDICAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (44, N'ORTOPEDIA Y TRAUMATO', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (45, N'ORTOPEDIA Y TRAUMATO', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (46, N'OTORRINOLARINGOLOGIA', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (47, N'PATOLOGIA PEDIATRICA', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (48, N'PEDIATRIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (49, N'PSICOLOGIA CLINICAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (50, N'PSIQUIATRIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (51, N'RADIOLOGIA E IMAGENE', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (52, N'RADIOTERAPIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (53, N'REUMATOLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (54, N'UROLOGIAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Be_TipoServicios] ([codTipoServicio], [nomServicio], [indActividad], [natServicio], [indFactura], [actUsuario], [estActividad], [actHora]) VALUES (55, N'UROLOGIA PEDIATRICAÿ', N'A', N'D', N'S', 0, N' ', CAST(N'2016-08-04T15:42:52.000' AS DateTime))
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52047977, 52047977, 17, CAST(N'1995-03-07' AS Date), CAST(N'2016-03-06' AS Date), CAST(N'2017-03-01' AS Date), 0, CAST(N'2016-10-06T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52068354, 52068354, 17, CAST(N'1995-03-08' AS Date), CAST(N'2016-03-07' AS Date), CAST(N'2017-03-02' AS Date), 0, CAST(N'2016-10-07T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52104025, 52104025, 17, CAST(N'1995-03-09' AS Date), CAST(N'2016-03-08' AS Date), CAST(N'2017-03-03' AS Date), 0, CAST(N'2016-10-08T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52120349, 52120349, 17, CAST(N'1995-03-10' AS Date), CAST(N'2016-03-09' AS Date), CAST(N'2017-03-04' AS Date), 0, CAST(N'2016-10-09T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52125917, 52125917, 18, CAST(N'1995-03-11' AS Date), CAST(N'2016-03-10' AS Date), CAST(N'2017-03-05' AS Date), 0, CAST(N'2016-10-10T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52130407, 52130407, 18, CAST(N'1995-03-12' AS Date), CAST(N'2016-03-11' AS Date), CAST(N'2017-03-06' AS Date), 0, CAST(N'2016-10-11T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52178847, 52178847, 18, CAST(N'1995-03-13' AS Date), CAST(N'2016-03-12' AS Date), CAST(N'2017-03-07' AS Date), 0, CAST(N'2016-10-12T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52216630, 52216630, 18, CAST(N'1995-03-14' AS Date), CAST(N'2016-03-13' AS Date), CAST(N'2017-03-08' AS Date), 0, CAST(N'2016-10-13T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52219588, 52219588, 19, CAST(N'1995-03-15' AS Date), CAST(N'2016-03-14' AS Date), CAST(N'2017-03-09' AS Date), 0, CAST(N'2016-10-14T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52220927, 52220927, 19, CAST(N'1995-03-16' AS Date), CAST(N'2016-03-15' AS Date), CAST(N'2017-03-10' AS Date), 0, CAST(N'2016-10-15T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52279904, 52279904, 19, CAST(N'1995-03-17' AS Date), CAST(N'2016-03-16' AS Date), CAST(N'2017-03-11' AS Date), 0, CAST(N'2016-10-16T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52300251, 52300251, 19, CAST(N'1995-03-18' AS Date), CAST(N'2016-03-17' AS Date), CAST(N'2017-03-12' AS Date), 0, CAST(N'2016-10-17T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52363417, 52363417, 20, CAST(N'1995-03-19' AS Date), CAST(N'2016-03-18' AS Date), CAST(N'2017-03-13' AS Date), 0, CAST(N'2016-10-18T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52394922, 52394922, 20, CAST(N'1995-03-20' AS Date), CAST(N'2016-03-19' AS Date), CAST(N'2017-03-14' AS Date), 0, CAST(N'2016-10-19T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52417009, 52417009, 20, CAST(N'1995-03-21' AS Date), CAST(N'2016-03-20' AS Date), CAST(N'2017-03-15' AS Date), 0, CAST(N'2016-10-20T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52460130, 52460130, 20, CAST(N'1995-03-22' AS Date), CAST(N'2016-03-21' AS Date), CAST(N'2017-03-16' AS Date), 0, CAST(N'2016-10-21T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52489985, 52489985, 21, CAST(N'1995-03-23' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2017-03-17' AS Date), 0, CAST(N'2016-10-22T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52514037, 52514037, 21, CAST(N'1995-03-24' AS Date), CAST(N'2016-03-23' AS Date), CAST(N'2017-03-18' AS Date), 0, CAST(N'2016-10-23T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52757161, 52757161, 21, CAST(N'1995-03-25' AS Date), CAST(N'2016-03-24' AS Date), CAST(N'2017-03-19' AS Date), 0, CAST(N'2016-10-24T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52795700, 52795700, 21, CAST(N'1995-03-26' AS Date), CAST(N'2016-03-25' AS Date), CAST(N'2017-03-20' AS Date), 0, CAST(N'2016-10-25T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52799604, 52799604, 22, CAST(N'1995-03-27' AS Date), CAST(N'2016-03-26' AS Date), CAST(N'2017-03-21' AS Date), 0, CAST(N'2016-10-26T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52800597, 52800597, 22, CAST(N'1995-03-28' AS Date), CAST(N'2016-03-27' AS Date), CAST(N'2017-03-22' AS Date), 0, CAST(N'2016-10-27T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52816026, 52816026, 22, CAST(N'1995-03-29' AS Date), CAST(N'2016-03-28' AS Date), CAST(N'2017-03-23' AS Date), 0, CAST(N'2016-10-28T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52857106, 52857106, 22, CAST(N'1995-03-30' AS Date), CAST(N'2016-03-29' AS Date), CAST(N'2017-03-24' AS Date), 0, CAST(N'2016-10-29T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52917611, 52917611, 23, CAST(N'1995-03-31' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2017-03-25' AS Date), 0, CAST(N'2016-10-30T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (52950230, 52950230, 23, CAST(N'1995-04-01' AS Date), CAST(N'2016-03-31' AS Date), CAST(N'2017-03-26' AS Date), 0, CAST(N'2016-10-31T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (53003318, 53003318, 23, CAST(N'1995-04-02' AS Date), CAST(N'2016-04-01' AS Date), CAST(N'2017-03-27' AS Date), 0, CAST(N'2016-11-01T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (53032953, 53032953, 23, CAST(N'1995-04-03' AS Date), CAST(N'2016-04-02' AS Date), CAST(N'2017-03-28' AS Date), 0, CAST(N'2016-11-02T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (53095235, 53095235, 24, CAST(N'1995-04-04' AS Date), CAST(N'2016-04-03' AS Date), CAST(N'2017-03-29' AS Date), 0, CAST(N'2016-11-03T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (53101729, 53101729, 24, CAST(N'1995-04-05' AS Date), CAST(N'2016-04-04' AS Date), CAST(N'2017-03-30' AS Date), 0, CAST(N'2016-11-04T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (53140295, 53140295, 24, CAST(N'1995-04-06' AS Date), CAST(N'2016-04-05' AS Date), CAST(N'2017-03-31' AS Date), 0, CAST(N'2016-11-05T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (53153548, 53153548, 24, CAST(N'1995-04-07' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2017-04-01' AS Date), 0, CAST(N'2016-11-06T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (53910933, 53910933, 25, CAST(N'1995-04-08' AS Date), CAST(N'2016-04-07' AS Date), CAST(N'2017-04-02' AS Date), 0, CAST(N'2016-11-07T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (55165731, 55165731, 25, CAST(N'1995-04-09' AS Date), CAST(N'2016-04-08' AS Date), CAST(N'2017-04-03' AS Date), 0, CAST(N'2016-11-08T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (55169600, 55169600, 25, CAST(N'1995-04-10' AS Date), CAST(N'2016-04-09' AS Date), CAST(N'2017-04-04' AS Date), 0, CAST(N'2016-11-09T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51986661, 91474044, 16, CAST(N'1995-03-06' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2017-02-28' AS Date), 0, CAST(N'2016-10-05T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51984513, 91478221, 16, CAST(N'1995-03-05' AS Date), CAST(N'2016-03-04' AS Date), CAST(N'2017-02-27' AS Date), 0, CAST(N'2016-10-04T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51974965, 91528420, 16, CAST(N'1995-03-04' AS Date), CAST(N'2016-03-03' AS Date), CAST(N'2017-02-26' AS Date), 0, CAST(N'2016-10-03T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51839922, 91538345, 16, CAST(N'1995-03-03' AS Date), CAST(N'2016-03-02' AS Date), CAST(N'2017-02-25' AS Date), 0, CAST(N'2016-10-02T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51826349, 91541739, 15, CAST(N'1995-03-02' AS Date), CAST(N'2016-03-01' AS Date), CAST(N'2017-02-24' AS Date), 0, CAST(N'2016-10-01T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51720586, 1010189408, 15, CAST(N'1995-03-01' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2017-02-23' AS Date), 0, CAST(N'2016-09-30T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51635023, 1013613998, 15, CAST(N'1995-02-28' AS Date), CAST(N'2016-02-28' AS Date), CAST(N'2017-02-22' AS Date), 0, CAST(N'2016-09-29T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (51577957, 1014192553, 15, CAST(N'1995-02-27' AS Date), CAST(N'2016-02-27' AS Date), CAST(N'2017-02-21' AS Date), 0, CAST(N'2016-09-28T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (45758730, 1016027413, 14, CAST(N'1995-02-26' AS Date), CAST(N'2016-02-26' AS Date), CAST(N'2017-02-20' AS Date), 0, CAST(N'2016-09-27T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (45593580, 1016035412, 14, CAST(N'1995-02-25' AS Date), CAST(N'2016-02-25' AS Date), CAST(N'2017-02-19' AS Date), 0, CAST(N'2016-09-26T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (45495337, 1018501836, 14, CAST(N'1995-02-24' AS Date), CAST(N'2016-02-24' AS Date), CAST(N'2017-02-18' AS Date), 0, CAST(N'2016-09-25T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (45440153, 1019026394, 14, CAST(N'1995-02-23' AS Date), CAST(N'2016-02-23' AS Date), CAST(N'2017-02-17' AS Date), 0, CAST(N'2016-09-24T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (43454420, 1020404020, 13, CAST(N'1995-02-22' AS Date), CAST(N'2016-02-22' AS Date), CAST(N'2017-02-16' AS Date), 0, CAST(N'2016-09-23T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (41107318, 1022328244, 13, CAST(N'1995-02-21' AS Date), CAST(N'2016-02-21' AS Date), CAST(N'2017-02-15' AS Date), 0, CAST(N'2016-09-22T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (40343260, 1022979027, 13, CAST(N'1995-02-20' AS Date), CAST(N'2016-02-20' AS Date), CAST(N'2017-02-14' AS Date), 0, CAST(N'2016-09-21T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (39795274, 1022992673, 13, CAST(N'1995-02-19' AS Date), CAST(N'2016-02-19' AS Date), CAST(N'2017-02-13' AS Date), 0, CAST(N'2016-09-20T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (39787609, 1023947705, 12, CAST(N'1995-02-18' AS Date), CAST(N'2016-02-18' AS Date), CAST(N'2017-02-12' AS Date), 0, CAST(N'2016-09-19T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (39541778, 1024474036, 12, CAST(N'1995-02-17' AS Date), CAST(N'2016-02-17' AS Date), CAST(N'2017-02-11' AS Date), 0, CAST(N'2016-09-18T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (38070432, 1024515553, 12, CAST(N'1995-02-16' AS Date), CAST(N'2016-02-16' AS Date), CAST(N'2017-02-10' AS Date), 0, CAST(N'2016-09-17T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37939589, 1030558927, 12, CAST(N'1995-02-15' AS Date), CAST(N'2016-02-15' AS Date), CAST(N'2017-02-09' AS Date), 0, CAST(N'2016-09-16T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37939382, 1030609499, 11, CAST(N'1995-02-14' AS Date), CAST(N'2016-02-14' AS Date), CAST(N'2017-02-08' AS Date), 0, CAST(N'2016-09-15T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37939262, 1031120858, 11, CAST(N'1995-02-13' AS Date), CAST(N'2016-02-13' AS Date), CAST(N'2017-02-07' AS Date), 0, CAST(N'2016-09-14T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37936908, 1031122775, 11, CAST(N'1995-02-12' AS Date), CAST(N'2016-02-12' AS Date), CAST(N'2017-02-06' AS Date), 0, CAST(N'2016-09-13T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37933619, 1031143670, 11, CAST(N'1995-02-11' AS Date), CAST(N'2016-02-11' AS Date), CAST(N'2017-02-05' AS Date), 0, CAST(N'2016-09-12T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37931606, 1032375696, 10, CAST(N'1995-02-10' AS Date), CAST(N'2016-02-10' AS Date), CAST(N'2017-02-04' AS Date), 0, CAST(N'2016-09-11T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37931129, 1032383813, 10, CAST(N'1995-02-09' AS Date), CAST(N'2016-02-09' AS Date), CAST(N'2017-02-03' AS Date), 0, CAST(N'2016-09-10T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37927881, 1032407275, 10, CAST(N'1995-02-08' AS Date), CAST(N'2016-02-08' AS Date), CAST(N'2017-02-02' AS Date), 0, CAST(N'2016-09-09T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37926843, 1032408636, 10, CAST(N'1995-02-07' AS Date), CAST(N'2016-02-07' AS Date), CAST(N'2017-02-01' AS Date), 0, CAST(N'2016-09-08T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37925665, 1032486690, 9, CAST(N'1995-02-06' AS Date), CAST(N'2016-02-06' AS Date), CAST(N'2017-01-31' AS Date), 0, CAST(N'2016-09-07T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37924787, 1033709413, 9, CAST(N'1995-02-05' AS Date), CAST(N'2016-02-05' AS Date), CAST(N'2017-01-30' AS Date), 0, CAST(N'2016-09-06T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37922676, 1033712778, 9, CAST(N'1995-02-04' AS Date), CAST(N'2016-02-04' AS Date), CAST(N'2017-01-29' AS Date), 0, CAST(N'2016-09-05T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37892554, 1033788473, 9, CAST(N'1995-02-03' AS Date), CAST(N'2016-02-03' AS Date), CAST(N'2017-01-28' AS Date), 0, CAST(N'2016-09-04T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37863808, 1047405010, 8, CAST(N'1995-02-02' AS Date), CAST(N'2016-02-02' AS Date), CAST(N'2017-01-27' AS Date), 0, CAST(N'2016-09-03T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37752015, 1047410567, 8, CAST(N'1995-02-01' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2017-01-26' AS Date), 0, CAST(N'2016-09-02T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37745608, 1047439284, 8, CAST(N'1995-01-31' AS Date), CAST(N'2016-01-31' AS Date), CAST(N'2017-01-25' AS Date), 0, CAST(N'2016-09-01T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37618882, 1072421152, 8, CAST(N'1995-01-30' AS Date), CAST(N'2016-01-30' AS Date), CAST(N'2017-01-24' AS Date), 0, CAST(N'2016-08-31T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37578737, 1073506519, 7, CAST(N'1995-01-29' AS Date), CAST(N'2016-01-29' AS Date), CAST(N'2017-01-23' AS Date), 0, CAST(N'2016-08-30T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37549209, 1075266723, 7, CAST(N'1995-01-28' AS Date), CAST(N'2016-01-28' AS Date), CAST(N'2017-01-22' AS Date), 0, CAST(N'2016-08-29T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37512098, 1076648344, 7, CAST(N'1995-01-27' AS Date), CAST(N'2016-01-27' AS Date), CAST(N'2017-01-21' AS Date), 0, CAST(N'2016-08-28T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37271992, 1091592778, 7, CAST(N'1995-01-26' AS Date), CAST(N'2016-01-26' AS Date), CAST(N'2017-01-20' AS Date), 0, CAST(N'2016-08-27T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (37176748, 1095818716, 6, CAST(N'1995-01-25' AS Date), CAST(N'2016-01-25' AS Date), CAST(N'2017-01-19' AS Date), 0, CAST(N'2016-08-26T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (36378724, 1096196289, 6, CAST(N'1995-01-24' AS Date), CAST(N'2016-01-24' AS Date), CAST(N'2017-01-18' AS Date), 0, CAST(N'2016-08-25T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (35537800, 1096202596, 6, CAST(N'1995-01-23' AS Date), CAST(N'2016-01-23' AS Date), CAST(N'2017-01-17' AS Date), 0, CAST(N'2016-08-24T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (33379082, 1096203174, 6, CAST(N'1995-01-22' AS Date), CAST(N'2016-01-22' AS Date), CAST(N'2017-01-16' AS Date), 0, CAST(N'2016-08-23T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (32862708, 1096216526, 5, CAST(N'1995-01-21' AS Date), CAST(N'2016-01-21' AS Date), CAST(N'2017-01-15' AS Date), 0, CAST(N'2016-08-22T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (30766858, 1096218397, 5, CAST(N'1995-01-20' AS Date), CAST(N'2016-01-20' AS Date), CAST(N'2017-01-14' AS Date), 0, CAST(N'2016-08-21T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (30388309, 1096222004, 5, CAST(N'1995-01-19' AS Date), CAST(N'2016-01-19' AS Date), CAST(N'2017-01-13' AS Date), 0, CAST(N'2016-08-20T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (28484102, 1096222137, 5, CAST(N'1995-01-18' AS Date), CAST(N'2016-01-18' AS Date), CAST(N'2017-01-12' AS Date), 0, CAST(N'2016-08-19T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (28268671, 1096223245, 4, CAST(N'1995-01-17' AS Date), CAST(N'2016-01-17' AS Date), CAST(N'2017-01-11' AS Date), 0, CAST(N'2016-08-18T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (22491851, 1096230066, 4, CAST(N'1995-01-16' AS Date), CAST(N'2016-01-16' AS Date), CAST(N'2017-01-10' AS Date), 0, CAST(N'2016-08-17T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (22447043, 1096234078, 4, CAST(N'1995-01-15' AS Date), CAST(N'2016-01-15' AS Date), CAST(N'2017-01-09' AS Date), 0, CAST(N'2016-08-16T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (21182195, 1096235801, 4, CAST(N'1995-01-14' AS Date), CAST(N'2016-01-14' AS Date), CAST(N'2017-01-08' AS Date), 0, CAST(N'2016-08-15T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (19195436, 1096242637, 3, CAST(N'1995-01-13' AS Date), CAST(N'2016-01-13' AS Date), CAST(N'2017-01-07' AS Date), 0, CAST(N'2016-08-14T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (16257476, 1096957599, 3, CAST(N'1995-01-12' AS Date), CAST(N'2016-01-12' AS Date), CAST(N'2017-01-06' AS Date), 0, CAST(N'2016-08-13T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (13888309, 1098626359, 3, CAST(N'1995-01-11' AS Date), CAST(N'2016-01-11' AS Date), CAST(N'2017-01-05' AS Date), 0, CAST(N'2016-08-12T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (13887667, 1098652841, 3, CAST(N'1995-01-10' AS Date), CAST(N'2016-01-10' AS Date), CAST(N'2017-01-04' AS Date), 0, CAST(N'2016-08-11T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (13850071, 1098698268, 2, CAST(N'1995-01-09' AS Date), CAST(N'2016-01-09' AS Date), CAST(N'2017-01-03' AS Date), 0, CAST(N'2016-08-10T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (13749758, 1098708497, 2, CAST(N'1995-01-08' AS Date), CAST(N'2016-01-08' AS Date), CAST(N'2017-01-02' AS Date), 0, CAST(N'2016-08-09T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (13570962, 1098756062, 2, CAST(N'1995-01-07' AS Date), CAST(N'2016-01-07' AS Date), CAST(N'2017-01-01' AS Date), 0, CAST(N'2016-08-08T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (13275270, 1098789775, 2, CAST(N'1995-01-06' AS Date), CAST(N'2016-01-06' AS Date), CAST(N'2016-12-31' AS Date), 0, CAST(N'2016-08-07T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (13246034, 1102364904, 2, CAST(N'1995-01-05' AS Date), CAST(N'2016-01-05' AS Date), CAST(N'2016-12-30' AS Date), 0, CAST(N'2016-08-06T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (11511150, 1102377103, 1, CAST(N'1995-01-04' AS Date), CAST(N'2016-01-04' AS Date), CAST(N'2016-12-29' AS Date), 0, CAST(N'2016-08-05T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (9525543, 1129570120, 1, CAST(N'1995-01-03' AS Date), CAST(N'2016-01-03' AS Date), CAST(N'2016-12-28' AS Date), 0, CAST(N'2016-08-04T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (7713170, 1143344749, 1, CAST(N'1995-01-02' AS Date), CAST(N'2016-01-02' AS Date), CAST(N'2016-12-27' AS Date), 0, CAST(N'2016-08-03T22:32:23.000' AS DateTime), 1)
INSERT [dbo].[Bi_Beneficiarios] ([codEmpleado], [codBeneficiario], [munNacimiento], [fecNacimiento], [fecInicioContrato], [fecFinContrato], [actUsuario], [actHora], [tipBeneficiario]) VALUES (3162669, 1143956502, 1, CAST(N'1995-01-01' AS Date), CAST(N'2016-01-01' AS Date), CAST(N'2016-12-26' AS Date), 0, CAST(N'2016-08-02T22:32:23.000' AS DateTime), 1)
GO
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (3162669, 1, 1, CAST(N'1989-01-01' AS Date), N'F', CAST(N'2015-01-01' AS Date), CAST(N'2015-10-08' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (7713170, 1, 1, CAST(N'1989-01-02' AS Date), N'F', CAST(N'2015-01-01' AS Date), CAST(N'2015-10-08' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (9525543, 1, 1, CAST(N'1989-01-03' AS Date), N'F', CAST(N'2015-01-02' AS Date), CAST(N'2015-10-09' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (11511150, 1, 1, CAST(N'1989-01-04' AS Date), N'F', CAST(N'2015-01-03' AS Date), CAST(N'2015-10-10' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (13246034, 1, 2, CAST(N'1989-01-05' AS Date), N'F', CAST(N'2015-01-04' AS Date), CAST(N'2015-10-11' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (13275270, 1, 2, CAST(N'1989-01-06' AS Date), N'F', CAST(N'2015-01-05' AS Date), CAST(N'2015-10-12' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (13570962, 1, 2, CAST(N'1989-01-07' AS Date), N'F', CAST(N'2015-01-06' AS Date), CAST(N'2015-10-13' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (13749758, 1, 2, CAST(N'1989-01-08' AS Date), N'F', CAST(N'2015-01-07' AS Date), CAST(N'2015-10-14' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (13850071, 1, 2, CAST(N'1989-01-09' AS Date), N'F', CAST(N'2015-01-08' AS Date), CAST(N'2015-10-15' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (13887667, 1, 3, CAST(N'1989-01-10' AS Date), N'F', CAST(N'2015-01-09' AS Date), CAST(N'2015-10-16' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (13888309, 1, 3, CAST(N'1989-01-11' AS Date), N'F', CAST(N'2015-01-10' AS Date), CAST(N'2015-10-17' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (16257476, 1, 3, CAST(N'1989-01-12' AS Date), N'F', CAST(N'2015-01-11' AS Date), CAST(N'2015-10-18' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (19195436, 1, 3, CAST(N'1989-01-13' AS Date), N'F', CAST(N'2015-01-12' AS Date), CAST(N'2015-10-19' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (21182195, 1, 4, CAST(N'1989-01-14' AS Date), N'F', CAST(N'2015-01-13' AS Date), CAST(N'2015-10-20' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (22447043, 1, 4, CAST(N'1989-01-15' AS Date), N'F', CAST(N'2015-01-14' AS Date), CAST(N'2015-10-21' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (22491851, 1, 4, CAST(N'1989-01-16' AS Date), N'F', CAST(N'2015-01-15' AS Date), CAST(N'2015-10-22' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (28268671, 1, 4, CAST(N'1989-01-17' AS Date), N'F', CAST(N'2015-01-16' AS Date), CAST(N'2015-10-23' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (28484102, 1, 5, CAST(N'1989-01-18' AS Date), N'F', CAST(N'2015-01-17' AS Date), CAST(N'2015-10-24' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (30388309, 1, 5, CAST(N'1989-01-19' AS Date), N'F', CAST(N'2015-01-18' AS Date), CAST(N'2015-10-25' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (30766858, 1, 5, CAST(N'1989-01-20' AS Date), N'F', CAST(N'2015-01-19' AS Date), CAST(N'2015-10-26' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (32862708, 1, 5, CAST(N'1989-01-21' AS Date), N'F', CAST(N'2015-01-20' AS Date), CAST(N'2015-10-27' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (33379082, 1, 6, CAST(N'1989-01-22' AS Date), N'F', CAST(N'2015-01-21' AS Date), CAST(N'2015-10-28' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (35537800, 1, 6, CAST(N'1989-01-23' AS Date), N'F', CAST(N'2015-01-22' AS Date), CAST(N'2015-10-29' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (36378724, 1, 6, CAST(N'1989-01-24' AS Date), N'F', CAST(N'2015-01-23' AS Date), CAST(N'2015-10-30' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37176748, 1, 6, CAST(N'1989-01-25' AS Date), N'F', CAST(N'2015-01-24' AS Date), CAST(N'2015-10-31' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37271992, 1, 7, CAST(N'1989-01-26' AS Date), N'F', CAST(N'2015-01-25' AS Date), CAST(N'2015-11-01' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37512098, 1, 7, CAST(N'1989-01-27' AS Date), N'F', CAST(N'2015-01-26' AS Date), CAST(N'2015-11-02' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37549209, 1, 7, CAST(N'1989-01-28' AS Date), N'F', CAST(N'2015-01-27' AS Date), CAST(N'2015-11-03' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37578737, 1, 7, CAST(N'1989-01-29' AS Date), N'F', CAST(N'2015-01-28' AS Date), CAST(N'2015-11-04' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37618882, 1, 8, CAST(N'1989-01-30' AS Date), N'F', CAST(N'2015-01-29' AS Date), CAST(N'2015-11-05' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37745608, 1, 8, CAST(N'1989-01-31' AS Date), N'F', CAST(N'2015-01-30' AS Date), CAST(N'2015-11-06' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37752015, 1, 8, CAST(N'1989-02-01' AS Date), N'F', CAST(N'2015-01-31' AS Date), CAST(N'2015-11-07' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37863808, 1, 8, CAST(N'1989-02-02' AS Date), N'F', CAST(N'2015-02-01' AS Date), CAST(N'2015-11-08' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37892554, 1, 9, CAST(N'1989-02-03' AS Date), N'F', CAST(N'2015-02-02' AS Date), CAST(N'2015-11-09' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37922676, 1, 9, CAST(N'1989-02-04' AS Date), N'F', CAST(N'2015-02-03' AS Date), CAST(N'2015-11-10' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37924787, 1, 9, CAST(N'1989-02-05' AS Date), N'F', CAST(N'2015-02-04' AS Date), CAST(N'2015-11-11' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37925665, 1, 9, CAST(N'1989-02-06' AS Date), N'F', CAST(N'2015-02-05' AS Date), CAST(N'2015-11-12' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37926843, 1, 10, CAST(N'1989-02-07' AS Date), N'F', CAST(N'2015-02-06' AS Date), CAST(N'2015-11-13' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37927881, 1, 10, CAST(N'1989-02-08' AS Date), N'F', CAST(N'2015-02-07' AS Date), CAST(N'2015-11-14' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37931129, 1, 10, CAST(N'1989-02-09' AS Date), N'F', CAST(N'2015-02-08' AS Date), CAST(N'2015-11-15' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37931606, 1, 10, CAST(N'1989-02-10' AS Date), N'F', CAST(N'2015-02-09' AS Date), CAST(N'2015-11-16' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37933619, 1, 11, CAST(N'1989-02-11' AS Date), N'F', CAST(N'2015-02-10' AS Date), CAST(N'2015-11-17' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37936908, 1, 11, CAST(N'1989-02-12' AS Date), N'F', CAST(N'2015-02-11' AS Date), CAST(N'2015-11-18' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37939262, 1, 11, CAST(N'1989-02-13' AS Date), N'F', CAST(N'2015-02-12' AS Date), CAST(N'2015-11-19' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37939382, 1, 11, CAST(N'1989-02-14' AS Date), N'F', CAST(N'2015-02-13' AS Date), CAST(N'2015-11-20' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (37939589, 1, 12, CAST(N'1989-02-15' AS Date), N'F', CAST(N'2015-02-14' AS Date), CAST(N'2015-11-21' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (38070432, 1, 12, CAST(N'1989-02-16' AS Date), N'F', CAST(N'2015-02-15' AS Date), CAST(N'2015-11-22' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (39541778, 1, 12, CAST(N'1989-02-17' AS Date), N'F', CAST(N'2015-02-16' AS Date), CAST(N'2015-11-23' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (39787609, 1, 12, CAST(N'1989-02-18' AS Date), N'F', CAST(N'2015-02-17' AS Date), CAST(N'2015-11-24' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (39795274, 1, 13, CAST(N'1989-02-19' AS Date), N'F', CAST(N'2015-02-18' AS Date), CAST(N'2015-11-25' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (40343260, 1, 13, CAST(N'1989-02-20' AS Date), N'F', CAST(N'2015-02-19' AS Date), CAST(N'2015-11-26' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (41107318, 1, 13, CAST(N'1989-02-21' AS Date), N'F', CAST(N'2015-02-20' AS Date), CAST(N'2015-11-27' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (43454420, 1, 13, CAST(N'1989-02-22' AS Date), N'F', CAST(N'2015-02-21' AS Date), CAST(N'2015-11-28' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (45440153, 1, 14, CAST(N'1989-02-23' AS Date), N'F', CAST(N'2015-02-22' AS Date), CAST(N'2015-11-29' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (45495337, 1, 14, CAST(N'1989-02-24' AS Date), N'F', CAST(N'2015-02-23' AS Date), CAST(N'2015-11-30' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (45593580, 1, 14, CAST(N'1989-02-25' AS Date), N'F', CAST(N'2015-02-24' AS Date), CAST(N'2015-12-01' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (45758730, 1, 14, CAST(N'1989-02-26' AS Date), N'F', CAST(N'2015-02-25' AS Date), CAST(N'2015-12-02' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51577957, 1, 15, CAST(N'1989-02-27' AS Date), N'F', CAST(N'2015-02-26' AS Date), CAST(N'2015-12-03' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51635023, 1, 15, CAST(N'1989-02-28' AS Date), N'F', CAST(N'2015-02-27' AS Date), CAST(N'2015-12-04' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51720586, 1, 15, CAST(N'1989-03-01' AS Date), N'F', CAST(N'2015-02-28' AS Date), CAST(N'2015-12-05' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51826349, 1, 15, CAST(N'1989-03-02' AS Date), N'F', CAST(N'2015-03-01' AS Date), CAST(N'2015-12-06' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51839922, 1, 16, CAST(N'1989-03-03' AS Date), N'F', CAST(N'2015-03-02' AS Date), CAST(N'2015-12-07' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51974965, 1, 16, CAST(N'1989-03-04' AS Date), N'F', CAST(N'2015-03-03' AS Date), CAST(N'2015-12-08' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51984513, 1, 16, CAST(N'1989-03-05' AS Date), N'F', CAST(N'2015-03-04' AS Date), CAST(N'2015-12-09' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Empleados] ([codEmpleado], [numContrato], [munNacimiento], [fecNacimiento], [tipContrato], [fecInicioContrato], [fecFinContrato], [sueBasico], [actUsuario], [actEstado], [actHora]) VALUES (51986661, 1, 16, CAST(N'1989-03-06' AS Date), N'F', CAST(N'2015-03-05' AS Date), CAST(N'2015-12-10' AS Date), 1500000, N'SIPRE', N'A', CAST(N'2016-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800037800, N'I', CAST(N'2015-01-01' AS Date), CAST(N'2015-12-27' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800088702, N'M', CAST(N'2015-01-02' AS Date), CAST(N'2015-12-28' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800106339, N'F', CAST(N'2015-01-03' AS Date), CAST(N'2015-12-29' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800130907, N'I', CAST(N'2015-01-04' AS Date), CAST(N'2015-12-30' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800139690, N'M', CAST(N'2015-01-05' AS Date), CAST(N'2015-12-31' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800140680, N'F', CAST(N'2015-01-06' AS Date), CAST(N'2016-01-01' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800140949, N'I', CAST(N'2015-01-07' AS Date), CAST(N'2016-01-02' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800144331, N'M', CAST(N'2015-01-08' AS Date), CAST(N'2016-01-03' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800150280, N'F', CAST(N'2015-01-09' AS Date), CAST(N'2016-01-04' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800159085, N'I', CAST(N'2015-01-10' AS Date), CAST(N'2016-01-05' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800170494, N'M', CAST(N'2015-01-11' AS Date), CAST(N'2016-01-06' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800176994, N'F', CAST(N'2015-01-12' AS Date), CAST(N'2016-01-07' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800184549, N'I', CAST(N'2015-01-13' AS Date), CAST(N'2016-01-08' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800189529, N'M', CAST(N'2015-01-14' AS Date), CAST(N'2016-01-09' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800198281, N'F', CAST(N'2015-01-15' AS Date), CAST(N'2016-01-10' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800198644, N'I', CAST(N'2015-01-16' AS Date), CAST(N'2016-01-11' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800224827, N'M', CAST(N'2015-01-17' AS Date), CAST(N'2016-01-12' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800226175, N'F', CAST(N'2015-01-18' AS Date), CAST(N'2016-01-13' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800227940, N'I', CAST(N'2015-01-19' AS Date), CAST(N'2016-01-14' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800229256, N'M', CAST(N'2015-01-20' AS Date), CAST(N'2016-01-15' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800229739, N'F', CAST(N'2015-01-21' AS Date), CAST(N'2016-01-16' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800231967, N'I', CAST(N'2015-01-22' AS Date), CAST(N'2016-01-17' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800250119, N'M', CAST(N'2015-01-23' AS Date), CAST(N'2016-01-18' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800251440, N'F', CAST(N'2015-01-24' AS Date), CAST(N'2016-01-19' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (800253055, N'I', CAST(N'2015-01-25' AS Date), CAST(N'2016-01-20' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (804001273, N'M', CAST(N'2015-01-26' AS Date), CAST(N'2016-01-21' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (805000427, N'F', CAST(N'2015-01-27' AS Date), CAST(N'2016-01-22' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (805001157, N'I', CAST(N'2015-01-28' AS Date), CAST(N'2016-01-23' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (811015884, N'M', CAST(N'2015-01-29' AS Date), CAST(N'2016-01-24' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (830003564, N'F', CAST(N'2015-01-30' AS Date), CAST(N'2016-01-25' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (830006404, N'I', CAST(N'2015-01-31' AS Date), CAST(N'2016-01-26' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (830009783, N'M', CAST(N'2015-02-01' AS Date), CAST(N'2016-01-27' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (830038085, N'F', CAST(N'2015-02-02' AS Date), CAST(N'2016-01-28' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (830113831, N'I', CAST(N'2015-02-03' AS Date), CAST(N'2016-01-29' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (844003392, N'M', CAST(N'2015-02-04' AS Date), CAST(N'2016-01-30' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860002398, N'F', CAST(N'2015-02-05' AS Date), CAST(N'2016-01-31' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860002962, N'I', CAST(N'2015-02-06' AS Date), CAST(N'2016-02-01' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860003020, N'M', CAST(N'2015-02-07' AS Date), CAST(N'2016-02-02' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860006773, N'F', CAST(N'2015-02-08' AS Date), CAST(N'2016-02-03' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860007335, N'I', CAST(N'2015-02-09' AS Date), CAST(N'2016-02-04' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860011153, N'M', CAST(N'2015-02-10' AS Date), CAST(N'2016-02-05' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860013570, N'F', CAST(N'2015-02-11' AS Date), CAST(N'2016-02-06' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860013743, N'I', CAST(N'2015-02-12' AS Date), CAST(N'2016-02-07' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860013816, N'M', CAST(N'2015-02-13' AS Date), CAST(N'2016-02-08' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860027404, N'F', CAST(N'2015-02-14' AS Date), CAST(N'2016-02-09' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860034133, N'I', CAST(N'2015-02-15' AS Date), CAST(N'2016-02-10' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860034313, N'M', CAST(N'2015-02-16' AS Date), CAST(N'2016-02-11' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860034594, N'F', CAST(N'2015-02-17' AS Date), CAST(N'2016-02-12' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860035827, N'I', CAST(N'2015-02-18' AS Date), CAST(N'2016-02-13' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860066942, N'M', CAST(N'2015-02-19' AS Date), CAST(N'2016-02-14' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (860512237, N'F', CAST(N'2015-02-20' AS Date), CAST(N'2016-02-15' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890200106, N'I', CAST(N'2015-02-21' AS Date), CAST(N'2016-02-16' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890201063, N'M', CAST(N'2015-02-22' AS Date), CAST(N'2016-02-17' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890201578, N'F', CAST(N'2015-02-23' AS Date), CAST(N'2016-02-18' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890270109, N'I', CAST(N'2015-02-24' AS Date), CAST(N'2016-02-19' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890303208, N'M', CAST(N'2015-02-25' AS Date), CAST(N'2016-02-20' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890480023, N'F', CAST(N'2015-02-26' AS Date), CAST(N'2016-02-21' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890500675, N'I', CAST(N'2015-02-27' AS Date), CAST(N'2016-02-22' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890900841, N'M', CAST(N'2015-02-28' AS Date), CAST(N'2016-02-23' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890903937, N'F', CAST(N'2015-03-01' AS Date), CAST(N'2016-02-24' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (890903938, N'I', CAST(N'2015-03-02' AS Date), CAST(N'2016-02-25' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (891180008, N'M', CAST(N'2015-03-03' AS Date), CAST(N'2016-02-26' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (891200337, N'F', CAST(N'2015-03-04' AS Date), CAST(N'2016-02-27' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (892000146, N'I', CAST(N'2015-03-05' AS Date), CAST(N'2016-02-28' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (899999034, N'M', CAST(N'2015-03-06' AS Date), CAST(N'2016-02-29' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (899999239, N'F', CAST(N'2015-03-07' AS Date), CAST(N'2016-03-01' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (899999284, N'I', CAST(N'2015-03-08' AS Date), CAST(N'2016-03-02' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (900047282, N'M', CAST(N'2015-03-09' AS Date), CAST(N'2016-03-03' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (900074992, N'F', CAST(N'2015-03-10' AS Date), CAST(N'2016-03-04' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (900156264, N'I', CAST(N'2015-03-11' AS Date), CAST(N'2016-03-05' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Proveedores] ([codProveedor], [tipProveedor], [fecInicio], [fecFinal], [actUsuario], [actEstado], [actHora]) VALUES (987654321, N'M', CAST(N'2015-03-12' AS Date), CAST(N'2016-03-06' AS Date), 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (3162669, N'E', 3, N'HENRY', N'                    ', N'AYALA', N' AYALA              ', N'A', 1, N'CR 116 77B 42 C', 2285427, N'HENRYAYALA AYALA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (7713170, N'E', 3, N'YEISON', N' URIAS              ', N'VILLARREAL', N' PEREZ              ', N'A', 1, N'CL 7 SUR 13 40 ', 7123353, N'YEISON URIASVILLARREAL PEREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (9525543, N'E', 3, N'LAUREANO', N'                    ', N'NUÑEZ', N' CALA               ', N'A', 1, N'DG 77 B 116 51 ', 5900580, N'LAUREANONUÑEZ CALA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (11511150, N'E', 3, N'JULIAN', N' FERNANDO           ', N'TOBON', N' CAJAS              ', N'A', 1, N'CR 8 40 15 AP 6', 6090165, N'JULIAN FERNANDOTOBON CAJAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (13246034, N'E', 3, N'CRISTO', N' HUMBERTO           ', N'GOMEZ', N' NAVARRO            ', N'A', 2, N'CL 23N 3 96    ', 5879965, N'CRISTO HUMBERTOGOMEZ NAVARRO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (13275270, N'E', 3, N'FRANKIN', N' EDUARDO            ', N'GAMBOA', N' APONTE             ', N'A', 2, N'CL L 10 BN 2 35', 5950946, N'FRANKIN EDUARDOGAMBOA APONTE@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (13570962, N'E', 3, N'NESTOR', N' LEONEL             ', N'BALLESTEROS', N' LEAL               ', N'A', 2, N'CL 46 30 16B', 5900580, N'NESTOR LEONELBALLESTEROS LEAL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (13749758, N'E', 3, N'HERNAN', N' DARIO              ', N'PORRAS', N' PIMIENTA           ', N'A', 2, N'CL 57 24 84    ', 5900580, N'HERNAN DARIOPORRAS PIMIENTA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (13850071, N'E', 3, N'ALIRIO', N'                    ', N'RIVERO', N' MEJIA              ', N'A', 2, N'CR 24 58 51    ', 6228164, N'ALIRIORIVERO MEJIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (13887667, N'E', 3, N'ALVARO', N' DE JESUS           ', N'MORALES', N' ARTEAGA            ', N'A', 3, N'CL 83 BIS 24 42', 5334819, N'ALVARO DE JESUSMORALES ARTEAGA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (13888309, N'E', 3, N'ROBERTO', N' EXPEDITO           ', N'VALENCIA', N' GOMEZ              ', N'A', 3, N'CL 49 19 40 PIS', 6110153, N'ROBERTO EXPEDITOVALENCIA GOMEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (16257476, N'E', 3, N'RAMIRO', N'                    ', N'DURAN', N' CAICEDO            ', N'A', 3, N'CL 74  32 31   ', 6025063, N'RAMIRODURAN CAICEDO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (19195436, N'E', 3, N'LUIS', N' ANTONIO            ', N'CORTES', N' UMAÑA              ', N'A', 3, N'CR 7 45 48 AP 1', 2324324, N'LUIS ANTONIOCORTES UMAÑA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (21182195, N'E', 3, N'LILIANA', N'                    ', N'AGUIRRE', N' VALLEJO            ', N'A', 4, N'C R A 19 D 19 3', 5900580, N'LILIANAAGUIRRE VALLEJO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (22447043, N'E', 3, N'LUBBY', N' ISABEL             ', N'AGUILAR', N' TOVAR              ', N'A', 4, N'CL 58 19 12 AP ', 76006524, N'LUBBY ISABELAGUILAR TOVAR@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (22491851, N'E', 3, N'NATALIA', N'                    ', N'GONZALEZ', N' RUBIO SALAZAR      ', N'A', 4, N'CL 127 C  2 B 8', 5900580, N'NATALIAGONZALEZ RUBIO SALAZAR@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (28268671, N'E', 3, N'YANETH', N'                    ', N'CASTELLANOS', N' VARGAS             ', N'A', 4, N'CR 14A 148 39 C', 6146055, N'YANETHCASTELLANOS VARGAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (28484102, N'E', 3, N'ROCIO', N' DEL PILAR          ', N'FLOREZ', N' ANZOLA             ', N'A', 5, N'CL 52 16 48    ', 5900580, N'ROCIO DEL PILARFLOREZ ANZOLA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (30388309, N'E', 3, N'ANA', N' BEATRIZ            ', N'OCAMPO', N'                    ', N'A', 5, N'0', 0, N'ANA BEATRIZOCAMPO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (30766858, N'E', 3, N'OLGA', N' CECILIA            ', N'PAJARO', N' HERRERA            ', N'A', 5, N'TV 71C  31I 36 ', 6534822, N'OLGA CECILIAPAJARO HERRERA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (32862708, N'E', 3, N'MILENYS', N' JUDITH             ', N'CASTAÑEDA', N' URZOLA             ', N'A', 5, N'CL 146 22 256 P', 5900580, N'MILENYS JUDITHCASTAÑEDA URZOLA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (33379082, N'E', 3, N'JESSICA', N' NATHALIE           ', N'VANEGAS', N' ACERO              ', N'A', 6, N'C A L L E  83  ', 4401624, N'JESSICA NATHALIEVANEGAS ACERO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (35537800, N'E', 3, N'MARIA', N' ALEJANDRA          ', N'GARZON', N' PINEDA             ', N'A', 6, N'CL 2E 1A 24 SUR', 8427203, N'MARIA ALEJANDRAGARZON PINEDA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (36378724, N'E', 3, N'YANETH', N'                    ', N'VARGAS', N' ANGEL              ', N'A', 6, N'0', 0, N'YANETHVARGAS ANGEL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37176748, N'E', 3, N'YOLANDA', N'                    ', N'MENDOZA', N' PEREZ              ', N'A', 6, N'CR 84 35 62 AP ', 4117550, N'YOLANDAMENDOZA PEREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37271992, N'E', 3, N'LUZ', N' STELLA             ', N'SUAREZ', N' DIAZ               ', N'A', 7, N'CR 7 K 83      ', 5900580, N'LUZ STELLASUAREZ DIAZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37512098, N'E', 3, N'LUZ', N' ELENA              ', N'QUINTERO', N' SUAREZ             ', N'A', 7, N'CR 42 7ASUR 92 ', 3527885, N'LUZ ELENAQUINTERO SUAREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37549209, N'E', 3, N'SANDRA', N' LUCIA              ', N'BAHAMON', N' ALVARADO           ', N'A', 7, N'CL 72B 36 39   ', 6022204, N'SANDRA LUCIABAHAMON ALVARADO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37578737, N'E', 3, N'MILENA', N'                    ', N'RODRIGUEZ', N' SUAREZ             ', N'A', 7, N'CL 38 61 32 B  ', 6028017, N'MILENARODRIGUEZ SUAREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37618882, N'E', 3, N'FANNY', N'                    ', N'MARIN', N' URREA              ', N'A', 8, N'CR 90 6D 80 CA ', 8036416, N'FANNYMARIN URREA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37745608, N'E', 3, N'TATIANA', N' MARCELA            ', N'CORTES', N' MARTINEZ           ', N'A', 8, N'AUT 144 114 CON', 5900580, N'TATIANA MARCELACORTES MARTINEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37752015, N'E', 3, N'ELIZABETH', N'                    ', N'BAUTISTA', N' HERNANDEZ          ', N'A', 8, N'CL 58A 12 68   ', 6815486, N'ELIZABETHBAUTISTA HERNANDEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37863808, N'E', 3, N'ADRIANA', N' MARIA              ', N'HERNANDEZ', N' HERNANDEZ          ', N'A', 8, N'CL 56A 55A 05  ', 5900580, N'ADRIANA MARIAHERNANDEZ HERNANDEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37892554, N'E', 3, N'LUZ', N' AMPARO             ', N'ROJAS', N' RODRIGUEZ          ', N'A', 9, N'CL 99A  71A 55 ', 6631693, N'LUZ AMPAROROJAS RODRIGUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37922676, N'E', 3, N'VILMA', N'                    ', N'CAMPO', N' ALVAREZ            ', N'A', 9, N'CL 60 21 56    ', 6204031, N'VILMACAMPO ALVAREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37924787, N'E', 3, N'MARITZA', N'                    ', N'CASTRO', N' OSPINO             ', N'A', 9, N'CR 24  58 27   ', 376203909, N'MARITZACASTRO OSPINO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37925665, N'E', 3, N'LIA', N'                    ', N'JARAMILLO', N' PORTILLO           ', N'A', 9, N'CR 24 73 15    ', 5900580, N'LIAJARAMILLO PORTILLO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37926843, N'E', 3, N'EDITH', N'                    ', N'MONT', N' AMELL              ', N'A', 10, N'CL 61    17 05 ', 5900580, N'EDITHMONT AMELL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37927881, N'E', 3, N'BERTHA', N' EUGENIA            ', N'RAMOS', N' COLMENARES         ', N'A', 10, N'TV ORIENTAL 94 ', 6997086, N'BERTHA EUGENIARAMOS COLMENARES@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37931129, N'E', 3, N'NILDA', N' LUZ                ', N'FLOREZ', N' URRUTIA            ', N'A', 10, N'CL 48 27 66    ', 6027074, N'NILDA LUZFLOREZ URRUTIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37931606, N'E', 3, N'FRANCIA', N' DONELIA            ', N'RICARDO', N' SANTOS             ', N'A', 10, N'CL 66 B 20 84 C', 6228048, N'FRANCIA DONELIARICARDO SANTOS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37933619, N'E', 3, N'YOLANDA', N'                    ', N'ALQUICHIRE', N' PLATA              ', N'A', 11, N'CL 46 26 52    ', 5900580, N'YOLANDAALQUICHIRE PLATA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37936908, N'E', 3, N'DORIS', N' EUGENIA            ', N'ESTEVEZ', N' ARDILA             ', N'A', 11, N'CL 65 38 04    ', 6005812, N'DORIS EUGENIAESTEVEZ ARDILA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37939262, N'E', 3, N'NIDIA', N'                    ', N'GOMEZ', N' LOZANO             ', N'A', 11, N'CR 20 102 97 AP', 6310633, N'NIDIAGOMEZ LOZANO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37939382, N'E', 3, N'ROSMERY', N'                    ', N'RUEDA', N' CORREA             ', N'A', 11, N'CL L 60 A 18 B ', 6228018, N'ROSMERYRUEDA CORREA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (37939589, N'E', 3, N'MARIA', N' VICTORIA           ', N'MUÑOZ', N' AVENDAÑO           ', N'A', 12, N'CR 33  71 15   ', 6225388, N'MARIA VICTORIAMUÑOZ AVENDAÑO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (38070432, N'E', 3, N'KATERIN', N' ZORELY             ', N'DIAZ', N' HINCAPIE           ', N'A', 12, N'AV CR 68 1A 55 ', 5900580, N'KATERIN ZORELYDIAZ HINCAPIE@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (39541778, N'E', 3, N'FLOR', N' ALBA               ', N'SANCHEZ', N' CARVAJAL           ', N'A', 12, N'CL 76 A 100 B 7', 8123834, N'FLOR ALBASANCHEZ CARVAJAL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (39787609, N'E', 3, N'LUZ', N' AMPARO             ', N'ORTEGA', N' ARAQUE             ', N'A', 12, N'TV 16 F 48 16 S', 2053623, N'LUZ AMPAROORTEGA ARAQUE@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (39795274, N'E', 3, N'ROSA', N' HIMELDA            ', N'CAÑON', N' CAÑON              ', N'A', 13, N'CR 36 21 24 MUL', 5900580, N'ROSA HIMELDACAÑON CAÑON@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (40343260, N'E', 3, N'HEGDA', N' VANESSA            ', N'LUNA', N' HERNANDEZ          ', N'A', 13, N'CR 48 127 51   ', 7, N'HEGDA VANESSALUNA HERNANDEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (41107318, N'E', 3, N'ELISABET', N'                    ', N'CARDONA', N' GONZALES           ', N'A', 13, N'CL 1 8 37      ', 5900580, N'ELISABETCARDONA GONZALES@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (43454420, N'E', 3, N'CLAUDIA', N' YULIETH            ', N'ROJAS', N' TORO               ', N'A', 13, N'C A L L E 51 A ', 0, N'CLAUDIA YULIETHROJAS TORO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (45440153, N'E', 3, N'MARITZA', N'                    ', N'MARIN', N' SANDOVAL           ', N'A', 14, N'ED NAUTILUS AP ', 95, N'MARITZAMARIN SANDOVAL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (45495337, N'E', 3, N'SANDRA', N' LIZETH             ', N'ESPITIA', N' GONZALEZ           ', N'A', 14, N'PIE LA POPA CAM', 6692824, N'SANDRA LIZETHESPITIA GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (45593580, N'E', 3, N'GIOCONDA', N' MARGARITA          ', N'PIÑA', N' ELLES              ', N'A', 14, N'CL 120    16 70', 2366824, N'GIOCONDA MARGARITAPIÑA ELLES@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (45758730, N'E', 3, N'LUZ', N' MARLENE            ', N'ALZATE', N' RODRÍGUEZ          ', N'A', 14, N'CL 24    82A 14', 6570086, N'LUZ MARLENEALZATE RODRÍGUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51577957, N'E', 3, N'LUZ', N' MERY               ', N'MORENO', N' TURGA              ', N'A', 15, N'CL 149 54 16 TO', 4735654, N'LUZ MERYMORENO TURGA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51635023, N'E', 3, N'SONIA', N' MARINA             ', N'JARAMILLO', N' CABALLERO          ', N'A', 15, N'CR 57 53 50 IN ', 5900580, N'SONIA MARINAJARAMILLO CABALLERO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51720586, N'E', 3, N'LUCERO', N'                    ', N'MOSQUERA', N' MARIN              ', N'A', 15, N'CL 55 SUR 24 C ', 8021919, N'LUCEROMOSQUERA MARIN@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51826349, N'E', 3, N'SONIA', N' MERCEDES           ', N'MARIN', N' GONZALEZ           ', N'A', 15, N'KR 17 173 52 TO', 3880064, N'SONIA MERCEDESMARIN GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51839922, N'E', 3, N'RUBI', N' ISABEL             ', N'GONZALEZ', N' MARIN              ', N'A', 16, N'CL 2F    38B 40', 5605487, N'RUBI ISABELGONZALEZ MARIN@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51974965, N'E', 3, N'CLAUDIA', N' PATRICIA           ', N'GRANADOS', N' KOPP               ', N'A', 16, N'CL 169    58 46', 4875290, N'CLAUDIA PATRICIAGRANADOS KOPP@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51984513, N'E', 3, N'SANDRA', N' JANETTE            ', N'PIEDRAHITA', N' URUENA             ', N'A', 16, N'CL 64 A  57 23 ', 6966711, N'SANDRA JANETTEPIEDRAHITA URUENA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (51986661, N'E', 3, N'SANDRA', N' PATRICIA           ', N'BOLIVAR', N' RODRIGUEZ          ', N'A', 16, N'CL 28 78 B 30 T', 4162238, N'SANDRA PATRICIABOLIVAR RODRIGUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52047977, N'E', 3, N'VIANETH', N'                    ', N'LIZARAZO', N' ESTUPIÑAN          ', N'A', 17, N'CL 74 94 20    ', 4368126, N'VIANETHLIZARAZO ESTUPIÑAN@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52068354, N'E', 3, N'ANGELICA', N' MARIA              ', N'LAGOS', N' PINZON             ', N'A', 17, N'CL 127 BIS 88 0', 7039790, N'ANGELICA MARIALAGOS PINZON@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52104025, N'E', 3, N'RUBY', N'                    ', N'FRANCO', N' RODRIGUEZ          ', N'A', 17, N'CL 152 54 75 CA', 8057995, N'RUBYFRANCO RODRIGUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52120349, N'E', 3, N'DORA', N' LILIANA            ', N'CASTIBLANCO', N' LOZANO             ', N'A', 17, N'0', 0, N'DORA LILIANACASTIBLANCO LOZANO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52125917, N'E', 3, N'SANDRA', N' JACKELINNE         ', N'GARCIA', N' VESGA              ', N'A', 18, N'CR 65 64 A 76 S', 7532252, N'SANDRA JACKELINNEGARCIA VESGA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52130407, N'E', 3, N'YOVILENY', N'                    ', N'MONTENEGRO', N' SOLANO             ', N'A', 18, N'CL 11 A 79 A 28', 4025121, N'YOVILENYMONTENEGRO SOLANO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52178847, N'E', 3, N'MONICA', N'                    ', N'BONZA', N' SUAREZ             ', N'A', 18, N'CL 22 D 86 21 A', 4590073, N'MONICABONZA SUAREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52216630, N'E', 3, N'PAOLA', N' LISBET             ', N'AMARIS', N' ARRIETA            ', N'A', 18, N'CR 30 47 47    ', 6030824, N'PAOLA LISBETAMARIS ARRIETA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52219588, N'E', 3, N'JUDITH', N' LUCRECIA           ', N'SUAREZ', N' SEGURA             ', N'A', 19, N'CL 16 6 35 ESTE', 5900580, N'JUDITH LUCRECIASUAREZ SEGURA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52220927, N'E', 3, N'EDNA', N' MARGARITA          ', N'CARDONA', N' GONZALEZ           ', N'A', 19, N'CR 50 16 93 SUR', 2029148, N'EDNA MARGARITACARDONA GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52279904, N'E', 3, N'FRANCELIS', N' INGRID             ', N'SUAREZ', N' SARMIENTO          ', N'A', 19, N'CL 2 SUR 7 46  ', 4758879, N'FRANCELIS INGRIDSUAREZ SARMIENTO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52300251, N'E', 3, N'DORIS', N'                    ', N'MONTAÑA', N' RODRIGUEZ          ', N'A', 19, N'CR 73 40 31 SUR', 4546388, N'DORISMONTAÑA RODRIGUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52363417, N'E', 3, N'LINA', N' MARIA              ', N'LOSADA', N' ORTIZ              ', N'A', 20, N'TV 56 104A 10  ', 5900580, N'LINA MARIALOSADA ORTIZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52394922, N'E', 3, N'SANDRA', N' MILENA             ', N'GARCIA', N' MORA               ', N'A', 20, N'CR 58 B 130 61 ', 5223458, N'SANDRA MILENAGARCIA MORA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52417009, N'E', 3, N'ANTONIA', N' ELENA              ', N'GALLARDO', N' AREVALO            ', N'A', 20, N'ZN VERDE ALFAGU', 5900580, N'ANTONIA ELENAGALLARDO AREVALO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52460130, N'E', 3, N'SANDRA', N' MILENA             ', N'PATIÑO', N' BAQUERO            ', N'A', 20, N'CL 38 24 74 URB', 5900580, N'SANDRA MILENAPATIÑO BAQUERO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52489985, N'E', 3, N'EDNA', N' CAROLINA           ', N'LOPEZ', N' VASQUEZ            ', N'A', 21, N'CL 86 A 112 G 2', 5900580, N'EDNA CAROLINALOPEZ VASQUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52514037, N'E', 3, N'HEYDY', N' MARISOL            ', N'DIAZ', N' BELLO              ', N'A', 21, N'CL 3 SUR 69A 91', 2, N'HEYDY MARISOLDIAZ BELLO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52757161, N'E', 3, N'ARGENIS', N'                    ', N'HUERTAS', N' MONTES             ', N'A', 21, N'CL 34    2 78  ', 9019512, N'ARGENISHUERTAS MONTES@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52795700, N'E', 3, N'MONICA', N' JULIETH            ', N'MOLANO', N' GONZALEZ           ', N'A', 21, N'CL 167 58 B 20 ', 4796310, N'MONICA JULIETHMOLANO GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52799604, N'E', 3, N'CAROLINA', N'                    ', N'PRIETO', N' GARCIA             ', N'A', 22, N'CR 120 B 148 40', 8066273, N'CAROLINAPRIETO GARCIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52800597, N'E', 3, N'MARIA', N' FERNANDA           ', N'MORENO', N' PEÑA               ', N'A', 22, N'CR 92 80B 17   ', 2239408, N'MARIA FERNANDAMORENO PEÑA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52816026, N'E', 3, N'YULLY', N' ZULEY              ', N'ALBARRACIN', N' QUINTERO           ', N'A', 22, N'CR 54D 134 21 A', 5900580, N'YULLY ZULEYALBARRACIN QUINTERO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52857106, N'E', 3, N'JULIA', N' JANNETH            ', N'HERRERA', N' RAMIREZ            ', N'A', 22, N'CR 36A 54A 27 S', 8020859, N'JULIA JANNETHHERRERA RAMIREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52917611, N'E', 3, N'YULY', N' PAOLA              ', N'CASTILLO', N' PAREDES            ', N'A', 23, N'CR 7C 146 45 AP', 5900580, N'YULY PAOLACASTILLO PAREDES@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (52950230, N'E', 3, N'LIDA', N' ISABEL             ', N'BORBON', N' PRIETO             ', N'A', 23, N'CARRERA 17 F # ', 7908956, N'LIDA ISABELBORBON PRIETO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (53003318, N'E', 3, N'ANGELA', N' MARCELA            ', N'VIRGUEZ', N' CARRILLO           ', N'A', 23, N'CL 159  56 75 I', 4680479, N'ANGELA MARCELAVIRGUEZ CARRILLO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (53032953, N'E', 3, N'JOHANNA', N'                    ', N'AHUMADA', N' GUZMAN             ', N'A', 23, N'CR 99 B 16 B 67', 4188750, N'JOHANNAAHUMADA GUZMAN@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (53095235, N'E', 3, N'JHOJANA', N'                    ', N'ALVARINO', N' GARZON             ', N'A', 24, N'TV 70G 63 52   ', 8011865, N'JHOJANAALVARINO GARZON@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (53101729, N'E', 3, N'LADY', N' JOHANNA            ', N'SIERRA', N' LOPEZ              ', N'A', 24, N'AV CL 153 115 4', 6625012, N'LADY JOHANNASIERRA LOPEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (53140295, N'E', 3, N'SANDY', N'                    ', N'AGUILERA', N' HURTADO            ', N'A', 24, N'CL 48 M SUR 5 A', 7608205, N'SANDYAGUILERA HURTADO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (53153548, N'E', 3, N'JOHANA', N'                    ', N'RAMIREZ', N' VELASQUEZ          ', N'A', 24, N'CL 68 13 22    ', 3654662, N'JOHANARAMIREZ VELASQUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (53910933, N'E', 3, N'LAURA', N' MILENA             ', N'GOMEZ', N' ACHURY             ', N'A', 25, N'CR 114 80 51   ', 8125949, N'LAURA MILENAGOMEZ ACHURY@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (55165731, N'E', 3, N'CARMENZA', N'                    ', N'HERRERA', N' PERALTA            ', N'A', 25, N'CL 19 46 45 CA ', 8623403, N'CARMENZAHERRERA PERALTA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (55169600, N'E', 3, N'LINA', N' MARCELA            ', N'URIBE', N' GONZALEZ           ', N'A', 25, N'128B    72 59  ', 33282830, N'LINA MARCELAURIBE GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
GO
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (56085611, N'E', 3, N'OLINDA', N'                    ', N'IGUARAN', N' CORONADO           ', N'A', 25, N'CR 49 A 15 40 A', 5900580, N'OLINDAIGUARAN CORONADO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (60435050, N'E', 3, N'DALIAS', N'                    ', N'CASTIYEJO', N' PARADA             ', N'A', 26, N'CL 13 7 65 B TE', 5900580, N'DALIASCASTIYEJO PARADA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63318334, N'E', 3, N'NHORA', N' PATRICIA           ', N'RUIZ', N' DIAZ               ', N'A', 26, N'CR 49    65 28 ', 6907635, N'NHORA PATRICIARUIZ DIAZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63346069, N'E', 3, N'ALBA', N' LUCIA              ', N'GARCIA', N' GUERRA             ', N'A', 26, N'CL 15N 16 B E 2', 5753788, N'ALBA LUCIAGARCIA GUERRA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63349300, N'E', 3, N'GLADYS', N' SOFIA              ', N'CASTRO', N' DUARTE             ', N'A', 26, N'CR 18 A 55 42  ', 6228156, N'GLADYS SOFIACASTRO DUARTE@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63358148, N'E', 3, N'MARTHA', N' YANETH             ', N'HERNANDEZ', N' MENDOZA            ', N'A', 27, N'CD REAL MINAS A', 6443728, N'MARTHA YANETHHERNANDEZ MENDOZA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63431778, N'E', 3, N'ANGELA', N'                    ', N'GUARGUATI', N' CASTILLO           ', N'A', 27, N'197    15 425  ', 6190231, N'ANGELAGUARGUATI CASTILLO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63457162, N'E', 3, N'MARIA', N' EUGENIA            ', N'MARTINEZ', N' ROJAS              ', N'A', 27, N'CR 24 A 45 59 B', 6031991, N'MARIA EUGENIAMARTINEZ ROJAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63459969, N'E', 3, N'BERTHA', N'                    ', N'GONZALEZ', N' BARROS             ', N'A', 27, N'CR 19  56 09   ', 6027408, N'BERTHAGONZALEZ BARROS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63460585, N'E', 3, N'GLENDA', N'                    ', N'QUIROGA', N' GARCES             ', N'A', 28, N'CL 52 B 23 28  ', 6226032, N'GLENDAQUIROGA GARCES@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63463645, N'E', 3, N'SANDRA', N' PATRICIA           ', N'HERNANDEZ', N' VESGA              ', N'A', 28, N'CL 35 33 02    ', 6002263, N'SANDRA PATRICIAHERNANDEZ VESGA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63467998, N'E', 3, N'MONICA', N'                    ', N'MENE', N' GUEVARA            ', N'A', 28, N'CL 50 B N 41 D ', 0, N'MONICAMENE GUEVARA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63470374, N'E', 3, N'OSIRIS', N' MARIA              ', N'MENCO', N' SIERRA             ', N'A', 28, N'CL 54 35 20/24 ', 5900580, N'OSIRIS MARIAMENCO SIERRA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63471497, N'E', 3, N'PAOLA', N' ALEXANDRA          ', N'TABORDA', N' VILORIA            ', N'A', 29, N'CL 49 31 76    ', 6027294, N'PAOLA ALEXANDRATABORDA VILORIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63473080, N'E', 3, N'DEYANIRA', N'                    ', N'TRECO', N' SANABRIA           ', N'A', 29, N'CL 46 28 69 AP ', 5900580, N'DEYANIRATRECO SANABRIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63483540, N'E', 3, N'ELIANA', N'                    ', N'URIBE', N' CASTRO             ', N'A', 29, N'CL 66 45 17    ', 5900580, N'ELIANAURIBE CASTRO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63497056, N'E', 3, N'ADRIANA', N' ISABEL             ', N'ARTEAGA', N' NAVARRO            ', N'A', 29, N'CR 24 NRO 54 24', 6116864, N'ADRIANA ISABELARTEAGA NAVARRO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63523799, N'E', 3, N'NANCY', N' ELVIRA             ', N'GAMBOA', N' GARCIA             ', N'A', 30, N'CR 3 55 100    ', 5900580, N'NANCY ELVIRAGAMBOA GARCIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (63539100, N'E', 3, N'YUDY', N' ISOLINA            ', N'AVILA', N' ROJAS              ', N'A', 30, N'CL 54 1W 31    ', 6442575, N'YUDY ISOLINAAVILA ROJAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (64577082, N'E', 3, N'GLORIA', N' VICTORIA           ', N'ROJAS', N' GARRIDO            ', N'A', 30, N'CL 48 22 61 CA ', 6203909, N'GLORIA VICTORIAROJAS GARRIDO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (65792229, N'E', 3, N'JACQUELINE', N'                    ', N'SANCHEZ', N' ARANGO             ', N'A', 30, N'CL 44 D 45 45 A', 3322830, N'JACQUELINESANCHEZ ARANGO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (73190671, N'E', 3, N'JONATAN', N' AMADO              ', N'CAMPO', N' CASTILLO           ', N'A', 31, N'URB VILLA DEL S', 5900580, N'JONATAN AMADOCAMPO CASTILLO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (73243185, N'E', 3, N'MARTIN', N' ARMANDO            ', N'NAVARRO', N' RADA               ', N'A', 31, N'DG 22 49 14 AP ', 5900580, N'MARTIN ARMANDONAVARRO RADA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (73376009, N'E', 3, N'JAVIER', N' ALFONSO            ', N'TORRES', N' BUELVAS            ', N'A', 31, N'TV 73 31G 06   ', 5900580, N'JAVIER ALFONSOTORRES BUELVAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79245645, N'E', 3, N'CESAR', N' AUGUSTO            ', N'LOPEZ', N' MOLINA             ', N'A', 31, N'118    83A 91  ', 8003140, N'CESAR AUGUSTOLOPEZ MOLINA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79252278, N'E', 3, N'JOSE', N' WILLIAM            ', N'PEÑA', N' CAICEDO            ', N'A', 32, N'CR 11 144 45 AP', 2712117, N'JOSE WILLIAMPEÑA CAICEDO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79370413, N'E', 3, N'LUIS', N' ALEJANDRO          ', N'PINZON', N' GANTIVA            ', N'A', 32, N'CL 6B 80B 85 AP', 5900580, N'LUIS ALEJANDROPINZON GANTIVA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79400609, N'E', 3, N'JOSE', N' MANUEL             ', N'LARA', N' SANDOVAL           ', N'A', 32, N'CR 81 B 19 B 80', 4040073, N'JOSE MANUELLARA SANDOVAL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79406307, N'E', 3, N'CARLOS', N' HERNAN             ', N'ORDUZ', N' HERNANDEZ          ', N'A', 32, N'CR 73 2 52     ', 4536061, N'CARLOS HERNANORDUZ HERNANDEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79463626, N'E', 3, N'JUAN', N' CARLOS             ', N'MORA', N' MONTENEGRO         ', N'A', 33, N'CR 90 6D 80 CA ', 8036416, N'JUAN CARLOSMORA MONTENEGRO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79467290, N'E', 3, N'JUAN', N' PABLO              ', N'ISAZA', N' MONTAÑA            ', N'A', 33, N'CR 71 D 12 C 60', 4851770, N'JUAN PABLOISAZA MONTAÑA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79474500, N'E', 3, N'CARLOS', N' JULIO              ', N'ROJAS', N' ROJAS              ', N'A', 33, N'CL 37 SUR 77 40', 4698189, N'CARLOS JULIOROJAS ROJAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79503353, N'E', 3, N'HARLEGZ', N'                    ', N'DIAZ', N' HERNANDEZ          ', N'A', 33, N'CL 34 36 43    ', 6027553, N'HARLEGZDIAZ HERNANDEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79505504, N'E', 3, N'ROBERTO', N' GIOVANNI           ', N'LINERO', N' FLOREZ             ', N'A', 34, N'CR 87 B 19 A 66', 7024764, N'ROBERTO GIOVANNILINERO FLOREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79526451, N'E', 3, N'YESID', N' ALONSO             ', N'NIETO', N' LOPEZ              ', N'A', 34, N'CL 9C    69 19 ', 7488573, N'YESID ALONSONIETO LOPEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79622262, N'E', 3, N'GILBERTO', N'                    ', N'REBELLON', N' GONZALEZ           ', N'A', 34, N'CL 148  A  56A ', 5900580, N'GILBERTOREBELLON GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79626621, N'E', 3, N'RICARDO', N'                    ', N'UNIGARRO', N' GUTIERREZ          ', N'A', 34, N'CR 31A 25A 41  ', 5900580, N'RICARDOUNIGARRO GUTIERREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79646350, N'E', 3, N'ALVARO', N' GIOVANNI           ', N'GUTIERREZ', N' GODOY              ', N'A', 35, N'CL 145 7F 89 AP', 4648951, N'ALVARO GIOVANNIGUTIERREZ GODOY@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79702885, N'E', 3, N'ALEXANDER', N' ALBERTO            ', N'RAMOS', N' PINTO              ', N'A', 35, N'CR 14 C 157 91 ', 5900580, N'ALEXANDER ALBERTORAMOS PINTO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (79872394, N'E', 3, N'FRANCISCO', N' YESID              ', N'ALVARADO', N' BERNAL             ', N'A', 35, N'CL 155 14 80 IN', 6799843, N'FRANCISCO YESIDALVARADO BERNAL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80114936, N'E', 3, N'JUAN', N' MANUEL             ', N'SARMIENTO', N' MOLANO             ', N'A', 35, N'CL 24 12 67 AP ', 2845137, N'JUAN MANUELSARMIENTO MOLANO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80134085, N'E', 3, N'ANDRES', N'                    ', N'ROCHA', N' DONCEL             ', N'A', 36, N'CL 152 B 58 C 5', 5900580, N'ANDRESROCHA DONCEL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80171743, N'E', 3, N'FRANCISCO', N' JAVIER             ', N'QUIÑONES', N' CALONJE            ', N'A', 36, N'CL 74 A 100 32 ', 7599203, N'FRANCISCO JAVIERQUIÑONES CALONJE@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80217437, N'E', 3, N'LUIS', N' FERNANDO           ', N'PALACIOS', N' BAHAMON            ', N'A', 36, N'AV 3 31 04 AP 4', 3705536, N'LUIS FERNANDOPALACIOS BAHAMON@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80500206, N'E', 3, N'EDWIN', N' CESAR              ', N'SANCHEZ', N' PRIETO             ', N'A', 36, N'AC 28 23 39 PIS', 4669382, N'EDWIN CESARSANCHEZ PRIETO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80850966, N'E', 3, N'LUIS', N' EDUARDO            ', N'RINCON', N' SOSA               ', N'A', 37, N'CR 53 37A 93 SU', 2382289, N'LUIS EDUARDORINCON SOSA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80863451, N'E', 3, N'CARLOS', N' ALIRIO             ', N'GARCIA', N' LEON               ', N'A', 37, N'CL 65A 72A 42  ', 2231870, N'CARLOS ALIRIOGARCIA LEON@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (80863865, N'E', 3, N'FREDY', N' ALEXANDER          ', N'AMAYA', N' ACEVEDO            ', N'A', 37, N'CL 64F 105D 46 ', 4828152, N'FREDY ALEXANDERAMAYA ACEVEDO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (86084659, N'E', 3, N'JOHN', N' FREDY              ', N'REY', N' CARDONA            ', N'A', 37, N'CL 23 15C 15   ', 5900580, N'JOHN FREDYREY CARDONA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (88213876, N'E', 3, N'DANILSON', N'                    ', N'DUARTE', N' LOPEZ              ', N'A', 38, N'CL 74 23 61    ', 6004073, N'DANILSONDUARTE LOPEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (91353894, N'E', 3, N'WILVER', N' ALFREDO            ', N'ORTEGA', N' GELVEZ             ', N'A', 38, N'CL 33 29 28 AP ', 5900580, N'WILVER ALFREDOORTEGA GELVEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (91424840, N'E', 3, N'JESUS', N'                    ', N'CHAVES', N' MACIAS             ', N'A', 38, N'CR 23 52 50    ', 5900580, N'JESUSCHAVES MACIAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (91474044, N'B', 3, N'ALFREDO', N' ADENIS             ', N'BOHORQUEZ', N' GARCIA             ', N'A', 38, N'TV 58 108 78   ', 6176480, N'ALFREDO ADENISBOHORQUEZ GARCIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (91478221, N'B', 3, N'CARLOS', N' ANDRES             ', N'ARDILA', N' DIAZ               ', N'A', 39, N'CL 64 4 85 ED Z', 5900580, N'CARLOS ANDRESARDILA DIAZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (91528420, N'B', 3, N'LUIS', N' EDUARDO            ', N'VARGAS', N' ARDILA             ', N'A', 39, N'DG 36 34 147 AP', 6394387, N'LUIS EDUARDOVARGAS ARDILA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (91538345, N'B', 3, N'JAVIER', N' ENRIQUE            ', N'VIVIESCAS', N' MORA               ', N'A', 39, N'CL 106 26 15   ', 5900580, N'JAVIER ENRIQUEVIVIESCAS MORA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (91541739, N'B', 3, N'LUIS', N' FERNANDO           ', N'QUINTERO', N' QUINTERO           ', N'A', 39, N'CON BALCON DEL ', 6317014, N'LUIS FERNANDOQUINTERO QUINTERO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800037800, N'P', 1, N'BANCO AGRARIO', N'', N'', N'', N'A', 1, N'CR 15 12 31', 3821400, N'BANCO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800088702, N'P', 1, N'SUSALUDEPS SURA', N'', N'', N'', N'A', 1, N'CR 15 12 32', 3821401, N'SUSAL@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800106339, N'P', 1, N'SALUD COLMENASALUD C', N'', N'', N'', N'A', 1, N'CR 15 12 33', 3821402, N'SALUD@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800130907, N'P', 1, N'E.P.S. SALUD TOTALE.', N'', N'', N'', N'A', 1, N'CR 15 12 34', 3821403, N'E.P.S@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800139690, N'P', 1, N'COLPATRIA.', N'', N'', N'', N'A', 2, N'CR 15 12 35', 3821404, N'COLPA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800140680, N'P', 1, N'UNIMEC S.A.UNIMEC S.', N'', N'', N'', N'A', 2, N'CR 15 12 36', 3821405, N'UNIME@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800140949, N'P', 1, N'CAFESALUDCAFESALUD', N'', N'', N'', N'A', 2, N'CR 15 12 37', 3821406, N'CAFES@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800144331, N'P', 1, N'PORVENIRPORVENIR', N'', N'', N'', N'A', 2, N'CR 15 12 38', 3821407, N'PORVE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800150280, N'P', 1, N'FIDUCOLOMBIA SOCIEDA', N'', N'', N'', N'A', 3, N'CR 15 12 39', 3821408, N'FIDUC@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800159085, N'P', 1, N'DAVIVIRING FONDO DE ', N'', N'', N'', N'A', 3, N'CR 15 12 40', 3821409, N'DAVIV@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800170494, N'P', 1, N'PROTECCION  S.A.PROT', N'', N'', N'', N'A', 3, N'CR 15 12 41', 3821410, N'PROTE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800176994, N'P', 1, N'UNICEF COLOMBIA0', N'', N'', N'', N'A', 3, N'CR 15 12 42', 3821411, N'UNICE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800184549, N'P', 1, N'SKANDIA PENSIONES Y ', N'', N'', N'', N'A', 4, N'CR 15 12 43', 3821412, N'SKAND@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800189529, N'P', 1, N'HORIZONTE.', N'', N'', N'', N'A', 4, N'CR 15 12 44', 3821413, N'HORIZ@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800198281, N'P', 1, N'FONDO DE PENSIONES V', N'', N'', N'', N'A', 4, N'CR 15 12 45', 3821414, N'FONDO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800198644, N'P', 1, N'COLFONDOS.', N'', N'', N'', N'A', 4, N'CR 15 12 46', 3821415, N'COLFO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800224827, N'P', 1, N'PENSIONES SANTANDERI', N'', N'', N'', N'A', 5, N'CR 15 12 47', 3821416, N'PENSI@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800226175, N'P', 1, N'COLMENA RIESGOS PROF', N'', N'', N'', N'A', 5, N'CR 15 12 48', 3821417, N'COLME@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800227940, N'P', 1, N'COLFONDOSCOLFONDOS', N'', N'', N'', N'A', 5, N'CR 15 12 49', 3821418, N'COLFO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800229256, N'P', 1, N'PENSIONES Y CESANTIA', N'', N'', N'', N'A', 5, N'CR 15 12 50', 3821419, N'PENSI@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800229739, N'P', 1, N'PROTECCIàN S.A.PROTE', N'', N'', N'', N'A', 6, N'CR 15 12 51', 3821420, N'PROTE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800231967, N'P', 1, N'BBVA HORIZONTEBBVA H', N'', N'', N'', N'A', 6, N'CR 15 12 52', 3821421, N'BBVA @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800250119, N'P', 1, N'SALUDCOOPSALUDCOOP', N'', N'', N'', N'A', 6, N'CR 15 12 53', 3821422, N'SALUD@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800251440, N'P', 1, N'E. P.S. SANITASE. P.', N'', N'', N'', N'A', 6, N'CR 15 12 54', 3821423, N'E. P.@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (800253055, N'P', 1, N'PENSIONES SKANDIAPEN', N'', N'', N'', N'A', 7, N'CR 15 12 55', 3821424, N'PENSI@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (804001273, N'P', 1, N'SOLSALUD', N'', N'', N'', N'A', 7, N'CR 15 12 56', 3821425, N'SOLSA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (805000427, N'P', 1, N'COOMEVA E.P.S.COOMEV', N'', N'', N'', N'A', 7, N'CR 15 12 57', 3821426, N'COOME@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (805001157, N'P', 1, N'SERV. OCCIDENTAL DE ', N'', N'', N'', N'A', 7, N'CR 15 12 58', 3821427, N'SERV.@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (811015884, N'P', 1, N'FIDUCOLOMBIA SOCIED', N'', N'', N'', N'A', 8, N'CR 15 12 59', 3821428, N'FIDUC@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (830003564, N'P', 1, N'E.P.S.  FAMISANARE.P', N'', N'', N'', N'A', 8, N'CR 15 12 60', 3821429, N'E.P.S@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (830006404, N'P', 1, N'HUMANAVIVIRHUMANAVIV', N'', N'', N'', N'A', 8, N'CR 15 12 61', 3821430, N'HUMAN@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (830009783, N'P', 1, N'CRUZ BLANCA ENTID.PR', N'', N'', N'', N'A', 8, N'CR 15 12 62', 3821431, N'CRUZ @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (830038085, N'P', 1, N'FONDO DE PENS.VOLUNT', N'', N'', N'', N'A', 9, N'CR 15 12 63', 3821432, N'FONDO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (830113831, N'P', 1, N'COLIPS', N'', N'', N'', N'A', 9, N'CR 15 12 64', 3821433, N'COLIP@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (844003392, N'P', 1, N'CAJA DE COMPENSACION', N'', N'', N'', N'A', 9, N'CR 15 12 65', 3821434, N'CAJA @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860002398, N'P', 1, N'AIG VIDA.', N'', N'', N'', N'A', 9, N'CR 15 12 66', 3821435, N'AIG V@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860002962, N'P', 1, N'BANCAFE.', N'', N'', N'', N'A', 10, N'CR 15 12 67', 3821436, N'BANCA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860003020, N'P', 1, N'BBVA COLOMBIA', N'', N'', N'', N'A', 10, N'CR 15 12 68', 3821437, N'BBVA @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860006773, N'P', 1, N'CAVIPETROLCAVIPETROL', N'', N'', N'', N'A', 10, N'CR 15 12 69', 3821438, N'CAVIP@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860007335, N'P', 1, N'COLMENA BCSC', N'', N'', N'', N'A', 10, N'CR 15 12 70', 3821439, N'COLME@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860011153, N'P', 1, N'POSITIVA COMPAÑIA DE', N'', N'', N'', N'A', 11, N'CR 15 12 71', 3821440, N'POSIT@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860013570, N'P', 1, N'CAJA DE COMPENSACIàN', N'', N'', N'', N'A', 11, N'CR 15 12 72', 3821441, N'CAJA @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860013743, N'P', 1, N'COOPETROLCAJA COOPER', N'', N'', N'', N'A', 11, N'CR 15 12 73', 3821442, N'COOPE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
GO
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860013816, N'P', 1, N'SEGURO SOCIAL RIESGO', N'', N'', N'', N'A', 11, N'CR 15 12 74', 3821443, N'SEGUR@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860027404, N'P', 1, N'COLSEGUROS E.P.S.COL', N'', N'', N'', N'A', 12, N'CR 15 12 75', 3821444, N'COLSE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860034133, N'P', 1, N'GRANAHORRAR.', N'', N'', N'', N'A', 12, N'CR 15 12 76', 3821445, N'GRANA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860034313, N'P', 1, N'DAVIVIENDA', N'', N'', N'', N'A', 12, N'CR 15 12 77', 3821446, N'DAVIV@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860034594, N'P', 1, N'COLPATRIA.', N'', N'', N'', N'A', 12, N'CR 15 12 78', 3821447, N'COLPA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860035827, N'P', 1, N'BANCO COMERCIAL AV V', N'', N'', N'', N'A', 13, N'CR 15 12 79', 3821448, N'BANCO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860066942, N'P', 1, N'E.P.S. COMPENSARE.P.', N'', N'', N'', N'A', 13, N'CR 15 12 80', 3821449, N'E.P.S@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (860512237, N'P', 1, N'SALUD COLPATRIA E.P.', N'', N'', N'', N'A', 13, N'CR 15 12 81', 3821450, N'SALUD@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890200106, N'P', 1, N'CAJASANCAJASAN', N'', N'', N'', N'A', 13, N'CR 15 12 82', 3821451, N'CAJAS@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890201063, N'P', 1, N'COOMULTRASAN', N'', N'', N'', N'A', 14, N'CR 15 12 83', 3821452, N'COOMU@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890201578, N'P', 1, N'COMFENALCOCOMFENALCO', N'', N'', N'', N'A', 14, N'CR 15 12 84', 3821453, N'COMFE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890270109, N'P', 1, N'APORTES CLUB DE INFA', N'', N'', N'', N'A', 14, N'CR 15 12 85', 3821454, N'APORT@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890303208, N'P', 1, N'CCF DEL VALLE DEL CA', N'', N'', N'', N'A', 14, N'CR 15 12 86', 3821455, N'CCF D@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890480023, N'P', 1, N'COMFENALCO CARTAGENA', N'', N'', N'', N'A', 15, N'CR 15 12 87', 3821456, N'COMFE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890500675, N'P', 1, N'COMFAORIENTECOMFAORI', N'', N'', N'', N'A', 15, N'CR 15 12 88', 3821457, N'COMFA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890900841, N'P', 1, N'COMFAMACOMFAMA', N'', N'', N'', N'A', 15, N'CR 15 12 89', 3821458, N'COMFA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890903937, N'P', 1, N'BANCO SANTANDER', N'', N'', N'', N'A', 15, N'CR 15 12 90', 3821459, N'BANCO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (890903938, N'P', 1, N'BANCOLOMBIA', N'', N'', N'', N'A', 16, N'CR 15 12 91', 3821460, N'BANCO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (891180008, N'P', 1, N'CAJA DE COMP.FAM. DE', N'', N'', N'', N'A', 16, N'CR 15 12 92', 3821461, N'CAJA @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (891200337, N'P', 1, N'CAJA DE COMPENS.FAMI', N'', N'', N'', N'A', 16, N'CR 15 12 93', 3821462, N'CAJA @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (892000146, N'P', 1, N'CAJA DE COMP.FAMIL.R', N'', N'', N'', N'A', 16, N'CR 15 12 94', 3821463, N'CAJA @ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (899999034, N'P', 1, N'SERVICIO NACIONAL DE', N'', N'', N'', N'A', 17, N'CR 15 12 95', 3821464, N'SERVI@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (899999239, N'P', 1, N'INSTITUTO COLOMBIANO', N'', N'', N'', N'A', 17, N'CR 15 12 96', 3821465, N'INSTI@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (899999284, N'P', 1, N'FONDO NACIONAL DEL A', N'', N'', N'', N'A', 17, N'CR 15 12 97', 3821466, N'FONDO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (900047282, N'P', 1, N'CONSORCIO FIDUFOSYGA', N'', N'', N'', N'A', 17, N'CR 15 12 98', 3821467, N'CONSO@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (900074992, N'P', 1, N'GOLDEN GROUP EPS', N'', N'', N'', N'A', 18, N'CR 15 12 99', 3821468, N'GOLDE@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (900156264, N'P', 1, N'NUEVA EPS S.A.', N'', N'', N'', N'A', 18, N'CR 15 12 100', 3821469, N'NUEVA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (987654321, N'P', 1, N'GRANAHORRAR.', N'', N'', N'', N'A', 18, N'CR 15 12 101', 3821470, N'GRANA@ejemplo.com', 0, N'A', CAST(N'2016-08-02T15:00:00.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1010189408, N'B', 3, N'YULI', N' VIVIANA            ', N'GARCIA', N' VARGAS             ', N'A', 40, N'CR 2 ESTE 2A 62', 3335474, N'YULI VIVIANAGARCIA VARGAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1013613998, N'B', 3, N'DIANA', N' LUCIA              ', N'AYALA', N' CASTIBLANCO        ', N'A', 40, N'CR 26 17 51 SUR', 4082906, N'DIANA LUCIAAYALA CASTIBLANCO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1014192553, N'B', 3, N'GIOVANNI', N' ANDRES             ', N'AMADO', N' CASAS              ', N'A', 40, N'CL 76 A 100 B 3', 4352383, N'GIOVANNI ANDRESAMADO CASAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1016027413, N'B', 3, N'DIANA', N' MILENA             ', N'MURCIA', N' MENDEZ             ', N'A', 40, N'CL 43 A SUR 72 ', 5900580, N'DIANA MILENAMURCIA MENDEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1016035412, N'B', 3, N'JEIMY', N' MAXSEIDEL          ', N'CASTRO', N' CLAVIJO            ', N'A', 41, N'CR 108 16J 26  ', 2983190, N'JEIMY MAXSEIDELCASTRO CLAVIJO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1018501836, N'B', 6, N'JONATHAN', N' ANDRES             ', N'ARDILA', N' AVILA              ', N'A', 41, N'CR 97C 71 47 SU', 5900580, N'JONATHAN ANDRESARDILA AVILA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1019026394, N'B', 3, N'GINA', N' TATIANA            ', N'MARROQUIN', N' CAITA              ', N'A', 41, N'CR 89 145 47   ', 5900580, N'GINA TATIANAMARROQUIN CAITA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1020404020, N'B', 3, N'JHON', N' ESTEBAN            ', N'ROJAS', N' GONZALEZ           ', N'A', 41, N'CL 47 58 A 16  ', 5974920, N'JHON ESTEBANROJAS GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1022328244, N'B', 3, N'GHELEN', N' ROCIO              ', N'ARAGON', N' LOPEZ              ', N'A', 42, N'CR 11 A 190 46 ', 5511723, N'GHELEN ROCIOARAGON LOPEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1022979027, N'B', 3, N'ANDRÉS', N' FELIPE             ', N'MURCIA', N' FERNANDEZ          ', N'A', 42, N'CR 80C 10F 28  ', 3007266, N'ANDRÉS FELIPEMURCIA FERNANDEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1022992673, N'B', 3, N'MIGUEL', N' ANGEL              ', N'CELY', N' SACHICA            ', N'A', 42, N'TRANSVERSAL 1D ', 4977685, N'MIGUEL ANGELCELY SACHICA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1023947705, N'B', 3, N'CLAUDIA', N' MARCELA            ', N'VILLARRAGA', N' RODRIGUEZ          ', N'A', 42, N'CL 32 A SUR 1 D', 2066722, N'CLAUDIA MARCELAVILLARRAGA RODRIGUEZ@EJEMPLO.C', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1024474036, N'B', 3, N'YENIFER', N' ANDREA             ', N'VITERI', N' RIASCOS            ', N'A', 43, N'0', 0, N'YENIFER ANDREAVITERI RIASCOS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1024515553, N'B', 3, N'JULIAN', N' CAMILO             ', N'ARANGO', N' GUTIERREZ          ', N'A', 43, N'TV 1 ESTE 27 B ', 7817675, N'JULIAN CAMILOARANGO GUTIERREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1030558927, N'B', 3, N'CINDY', N' MAYERLY            ', N'PARRA', N' QUEVEDO            ', N'A', 43, N'CL 42 SUR 93C 0', 2739483, N'CINDY MAYERLYPARRA QUEVEDO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1030609499, N'B', 3, N'JENYFER', N' LORENA             ', N'GALAN', N' GARCIA             ', N'A', 43, N'CL 11C 73 52   ', 3224417, N'JENYFER LORENAGALAN GARCIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1031120858, N'B', 3, N'LUISA', N' FERNANDA           ', N'BOLIVAR', N' ROMERO             ', N'A', 44, N'TV 72 F 43 59 S', 3782785, N'LUISA FERNANDABOLIVAR ROMERO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1031122775, N'B', 3, N'LEYDY', N' MARCELA            ', N'COMAS', N' BARBOSA            ', N'A', 44, N'CR 147 A 119 F ', 5900580, N'LEYDY MARCELACOMAS BARBOSA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1031143670, N'B', 3, N'PAOLA', N' ALEXANDRA          ', N'RIOS', N' PEREZ              ', N'A', 44, N'CL 65   SUR 68C', 2796892, N'PAOLA ALEXANDRARIOS PEREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1032375696, N'B', 3, N'HECTOR', N' MAURICIO           ', N'LOPEZ', N' BERNAL             ', N'A', 44, N'CR 51 167 50 TO', 5900580, N'HECTOR MAURICIOLOPEZ BERNAL@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1032383813, N'B', 3, N'DIEGO', N' ARMANDO            ', N'PALACIOS', N' ALDANA             ', N'A', 45, N'CL 75 105 D 53 ', 4407558, N'DIEGO ARMANDOPALACIOS ALDANA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1032407275, N'B', 3, N'LADY', N' JANETH             ', N'GUTIERREZ', N' CORREDOR           ', N'A', 45, N'CR 99 B 16 B BI', 5900580, N'LADY JANETHGUTIERREZ CORREDOR@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1032408636, N'B', 3, N'PAOLA', N' ANDREA             ', N'PARRA', N' MENDOZA            ', N'A', 45, N'CL 43 A SUR 72 ', 5900580, N'PAOLA ANDREAPARRA MENDOZA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1032486690, N'B', 3, N'MARIA', N' PAULA              ', N'TORRES', N' AGUILLON           ', N'A', 45, N'CR 100 50 45 SU', 5900580, N'MARIA PAULATORRES AGUILLON@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1033709413, N'B', 3, N'OSCAR', N' JAVIER             ', N'QUINTANA', N' RAMIREZ            ', N'A', 46, N'CL 47 B SUR  23', 7602807, N'OSCAR JAVIERQUINTANA RAMIREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1033712778, N'B', 3, N'ANGELA', N' JAZMIN             ', N'VARGAS', N' VILLANUEVA         ', N'A', 46, N'CL 52A 24C 20 S', 5900580, N'ANGELA JAZMINVARGAS VILLANUEVA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1033788473, N'B', 3, N'LILIANA', N' KATHERINE          ', N'DURAN', N' RODRIGUEZ          ', N'A', 46, N'TV 5C N 52C 19 ', 5900580, N'LILIANA KATHERINEDURAN RODRIGUEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1047405010, N'B', 3, N'YAMILETH', N'                    ', N'LOPEZ', N' DUQUE              ', N'A', 46, N'CL 30  56 221  ', 6626652, N'YAMILETHLOPEZ DUQUE@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1047410567, N'B', 3, N'LENYS', N' TATIANA            ', N'CARRILLO', N' SEPULVEDA          ', N'A', 47, N'CRESPO AV 4 67 ', 0, N'LENYS TATIANACARRILLO SEPULVEDA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1047439284, N'B', 3, N'LUIS', N' CARLOS JOEL        ', N'AGUILAR', N' ORTIZ              ', N'A', 47, N'MZ H LT 1 URBAN', 5900580, N'LUIS CARLOS JOELAGUILAR ORTIZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1072421152, N'B', 3, N'JORGE', N' LUIS               ', N'ROJAS', N' PENAGOS            ', N'A', 47, N'CL 2 93 D 35   ', 5900580, N'JORGE LUISROJAS PENAGOS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1073506519, N'B', 3, N'JUAN', N' SEBASTIAN          ', N'VIRVIESCAS', N' YOPASA             ', N'A', 47, N'CR 24 A 10 98 A', 5900580, N'JUAN SEBASTIANVIRVIESCAS YOPASA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1075266723, N'B', 3, N'YURI', N' TATIANA            ', N'ALARCON', N' CHALA              ', N'A', 48, N'CL 47 23 41    ', 8760175, N'YURI TATIANAALARCON CHALA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1076648344, N'B', 3, N'ADRIANA', N' ESPERANZA          ', N'CAMARGO', N' SANTANA            ', N'A', 48, N'CR 106 A 71 A 2', 5900580, N'ADRIANA ESPERANZACAMARGO SANTANA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1091592778, N'B', 3, N'DANIEL', N' AUGUSTO            ', N'GARCIA', N' GARCIA             ', N'A', 48, N'CR 9 15 36     ', 5900580, N'DANIEL AUGUSTOGARCIA GARCIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1095818716, N'B', 3, N'LEIDY', N' PAOLA              ', N'DURAN', N' GUTIERREZ          ', N'A', 48, N'CR 14 B 9 39   ', 6599259, N'LEIDY PAOLADURAN GUTIERREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096196289, N'B', 3, N'SANDRA', N' MARCELA            ', N'JALABE', N' RODELO             ', N'A', 49, N'CL 60    36E 41', 6217865, N'SANDRA MARCELAJALABE RODELO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096202596, N'B', 3, N'CARLOS', N' OMAR JUNIOR        ', N'MOSQUERA', N' GONZALEZ           ', N'A', 49, N'CR 20    66 19 ', 6223931, N'CARLOS OMAR JUNIORMOSQUERA GONZALEZ@EJEMPLO.C', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096203174, N'B', 3, N'MARIA', N' FERNANDA           ', N'MOSQUERA', N' MOSQUERA           ', N'A', 49, N'DG 55 15B 143  ', 5900580, N'MARIA FERNANDAMOSQUERA MOSQUERA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096216526, N'B', 3, N'LIZETH', N' JOHANA             ', N'PARRA', N' MORENO             ', N'A', 49, N'CENTRO ECOPETRO', 6109156, N'LIZETH JOHANAPARRA MORENO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096218397, N'B', 3, N'ANGELLY', N' MILENA             ', N'RIOS', N' LOZANO             ', N'A', 50, N'CR 23    53 53 ', 6025665, N'ANGELLY MILENARIOS LOZANO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096222004, N'B', 3, N'VIVIANA', N' MARCELA            ', N'RUEDA', N' GONZALEZ           ', N'A', 50, N'BRR LOS LAURELE', 6204187, N'VIVIANA MARCELARUEDA GONZALEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096222137, N'B', 3, N'ANGIE', N' VANESSA            ', N'SANCHEZ', N' CASTILLO           ', N'A', 50, N'CL 29 48 14    ', 6204671, N'ANGIE VANESSASANCHEZ CASTILLO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096223245, N'B', 3, N'KAREN', N' PATRICIA           ', N'ALMENDRALES', N' PEREZ              ', N'A', 50, N'0', 0, N'KAREN PATRICIAALMENDRALES PEREZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096230066, N'B', 3, N'RICARDO', N' SNEIDER            ', N'DUARTE', N' MONSALVE           ', N'A', 51, N'CR 61 48A 75   ', 5900580, N'RICARDO SNEIDERDUARTE MONSALVE@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096234078, N'B', 3, N'JENIFER', N' ALEJANDRA          ', N'MACIAS', N' PADILLA            ', N'A', 51, N'0', 0, N'JENIFER ALEJANDRAMACIAS PADILLA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096235801, N'B', 3, N'KATHERINE', N'                    ', N'AVILA', N' BORJA              ', N'A', 51, N'0', 0, N'KATHERINEAVILA BORJA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096242637, N'B', 3, N'DANIELA', N'                    ', N'AYALA', N' AVILES             ', N'A', 51, N'CL 53    19 84 ', 6115164, N'DANIELAAYALA AVILES@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1096957599, N'B', 3, N'MAYERLY', N'                    ', N'DAZA', N' GOMEZ              ', N'A', 52, N'CARRERA 7 # 9-5', 5900580, N'MAYERLYDAZA GOMEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1098626359, N'B', 3, N'ADRIANA', N' MILENA             ', N'RODRIGUEZ', N' ORTIZ              ', N'A', 52, N'CR 27B 34 06   ', 6532249, N'ADRIANA MILENARODRIGUEZ ORTIZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1098652841, N'B', 3, N'JUDITH', N' PAOLA              ', N'SUAREZ', N' CONTRERAS          ', N'A', 52, N'CL 60 48 W 05 P', 6411038, N'JUDITH PAOLASUAREZ CONTRERAS@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1098698268, N'B', 3, N'FRANK', N' ALONSO             ', N'INFANTE', N' CEPEDA             ', N'A', 52, N'0', 0, N'FRANK ALONSOINFANTE CEPEDA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1098708497, N'B', 3, N'MARLY', N' KATHERINE          ', N'VELANDIA', N' CARREÑO            ', N'A', 53, N'CL 9 39 28     ', 5900580, N'MARLY KATHERINEVELANDIA CARREÑO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1098756062, N'B', 3, N'CINDY', N' JOHANNA            ', N'MENDEZ', N' OCHOA              ', N'A', 53, N'CALLE 89 # 21-6', 6360645, N'CINDY JOHANNAMENDEZ OCHOA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1098789775, N'B', 3, N'BRAYAN', N' ALBERTO            ', N'MEJIA', N' CHACON             ', N'A', 53, N'CALLE 52 # 16-7', 6428060, N'BRAYAN ALBERTOMEJIA CHACON@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1102364904, N'B', 3, N'MARLY', N' JOHANA             ', N'COBOS', N' BAYONA             ', N'A', 53, N'CR 29 11 49 ED ', 5900580, N'MARLY JOHANACOBOS BAYONA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1102377103, N'B', 3, N'DANITZA', N'                    ', N'FERRER', N' GARCIA             ', N'A', 54, N'CL 15 D 0 39', 0, N'DANITZAFERRER GARCIA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1129570120, N'B', 3, N'ROSELYN', N' MARGARITA          ', N'ROSANIA', N' MARTINEZ           ', N'A', 54, N'CR 87 B 19 A 66', 7465884, N'ROSELYN MARGARITAROSANIA MARTINEZ@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1143344749, N'B', 3, N'AMY', N' MARCELA            ', N'ARNEDO', N' LUNA               ', N'A', 54, N'DG 30A 58 40   ', 6572374, N'AMY MARCELAARNEDO LUNA@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Bi_Terceros] ([codTercero], [tipTercero], [tipIdentificacion], [priNombre], [segNombre], [priApellido], [segApellido], [indActividad], [codMunicipio], [dirResidencia], [telResidencia], [corElectronico], [actUsuario], [actEsta], [actHora]) VALUES (1143956502, N'B', 3, N'EVELYN', N' CRISTINA           ', N'BOLAÑOS', N' ORREGO             ', N'A', 54, N'CL 72 Z 2 28F 3', 4371651, N'EVELYN CRISTINABOLAÑOS ORREGO@EJEMPLO.COM', 0, N'A', CAST(N'2016-08-02T22:32:23.000' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (5, 169, N'ANTIOQUIA', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:14.423' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (8, 169, N'ATLANTICO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:28.970' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (11, 169, N'DISTRITO CAPITAL              ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:32.700' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (13, 169, N'BOLIVAR                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:36.533' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (15, 169, N'BOYACA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:40.403' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (17, 169, N'CALDAS                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:44.113' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (18, 169, N'CAQUETA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:47.920' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (19, 169, N'CAUCA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:51.803' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (20, 169, N'CESAR                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:55.900' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (25, 169, N'CUNDINAMARCA                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:39:59.580' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (27, 169, N'CHOCO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:02.960' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (30, 169, N'CORDOBA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:06.540' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (41, 169, N'HUILA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:10.540' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (44, 169, N'GUAJIRA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:14.313' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (47, 169, N'MAGDALENA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:18.237' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (50, 169, N'META                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:22.217' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (52, 169, N'NARI¥O                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:26.010' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (54, 169, N'NORTE DE SANTANDER            ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:29.940' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (63, 169, N'QUINDIO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:33.700' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (66, 169, N'RISARALDA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:37.477' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (68, 169, N'SANTANDER                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:41.377' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (70, 169, N'SUCRE                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:45.053' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (73, 169, N'TOLIMA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:48.957' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (76, 169, N'VALLE DEL CAUCA               ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:52.730' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (81, 169, N'ARAUCA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:40:56.540' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (85, 169, N'CASANARE                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:41:00.110' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (86, 169, N'PUTUMAYO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:41:04.090' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (88, 169, N'SAN ANDRES                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:41:07.897' AS DateTime))
INSERT [dbo].[Gn_Departamentos] ([codDepartamento], [codPais], [nomDepartamento], [usuActividad], [tipActividad], [horActividad]) VALUES (91, 169, N'AMAZONAS                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T08:41:11.677' AS DateTime))
INSERT [dbo].[Gn_DetalleRol] ([codRol], [codUsuario], [usuActividad], [tipActividad], [horActividad]) VALUES (1, N'1234           ', 10, N'E', CAST(N'2016-08-16T11:56:36.000' AS DateTime))
INSERT [dbo].[Gn_DetalleRol] ([codRol], [codUsuario], [usuActividad], [tipActividad], [horActividad]) VALUES (2, N'1235           ', 11, N'C', CAST(N'2016-08-16T11:57:09.000' AS DateTime))
INSERT [dbo].[Gn_DetalleRol] ([codRol], [codUsuario], [usuActividad], [tipActividad], [horActividad]) VALUES (3, N'1236           ', 12, N'D', CAST(N'2016-08-16T11:57:29.000' AS DateTime))
INSERT [dbo].[Gn_Menu] ([codMenu], [nomMenu], [usuActividad], [tipActividad], [horActividad]) VALUES (1, N'BIODATA', 0, N' ', CAST(N'2016-08-04T15:44:18.000' AS DateTime))
INSERT [dbo].[Gn_Menu] ([codMenu], [nomMenu], [usuActividad], [tipActividad], [horActividad]) VALUES (2, N'GESTION DE BENEFICIO', 0, N' ', CAST(N'2016-08-04T15:44:18.000' AS DateTime))
INSERT [dbo].[Gn_Menu] ([codMenu], [nomMenu], [usuActividad], [tipActividad], [horActividad]) VALUES (3, N'GESTION DE PRESUPUESTO', 0, N' ', CAST(N'2016-08-04T15:44:18.000' AS DateTime))
INSERT [dbo].[Gn_Menu] ([codMenu], [nomMenu], [usuActividad], [tipActividad], [horActividad]) VALUES (4, N'GESTION DE PROVEEDORES', 0, N' ', CAST(N'2016-08-04T15:44:18.000' AS DateTime))
INSERT [dbo].[Gn_Menu] ([codMenu], [nomMenu], [usuActividad], [tipActividad], [horActividad]) VALUES (5, N'FACTURACION', 0, N' ', CAST(N'2016-08-04T15:44:18.000' AS DateTime))
INSERT [dbo].[Gn_Menu] ([codMenu], [nomMenu], [usuActividad], [tipActividad], [horActividad]) VALUES (6, N'PARAMETROS', 0, N' ', CAST(N'2016-08-04T15:44:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Gn_Municipios] ON 

INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (1, 5, 1, N'MEDELLIN', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (2, 5, 2, N'ABEJORRAL', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (3, 5, 3, N'BELLO', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (4, 5, 4, N'ABRIAQUI', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (5, 5, 21, N'ALEJANDRIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (6, 5, 30, N'AMAGA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (7, 5, 31, N'AMALFI', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (8, 5, 34, N'ANDES', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (9, 5, 36, N'ANGELOPOLIS', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (10, 5, 38, N'ANGOSTURA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (11, 5, 40, N'ANORI', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (12, 5, 42, N'SANTAFE DE ANTIOQUIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (13, 5, 44, N'ANZA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (14, 5, 45, N'APARTADO', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (15, 5, 51, N'ARBOLETES', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (16, 5, 55, N'ARGELIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (17, 5, 59, N'ARMENIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (18, 5, 79, N'BARBOSA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (19, 5, 91, N'BETANIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (20, 5, 93, N'BETULIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (21, 5, 101, N'CIUDAD BOLIVAR', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (22, 5, 113, N'BURITICA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (23, 5, 129, N'CALDAS', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (24, 5, 134, N'CAMPAMENTO', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (25, 5, 138, N'CAÑASGORDAS', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (26, 5, 142, N'CARACOLI', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (27, 5, 145, N'CARAMANTA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (28, 5, 147, N'CAREPA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (29, 5, 154, N'CAUCASIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (30, 5, 172, N'CHIGORODO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:37:40.563' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (31, 5, 190, N'CISNEROS                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:37:44.227' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (32, 5, 197, N'COCORNA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:37:48.113' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (33, 5, 206, N'CONCEPCION                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:37:52.307' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (34, 5, 209, N'CONCORDIA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:37:55.987' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (35, 5, 212, N'COPACABANA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:00.693' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (36, 5, 234, N'DABEIBA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:04.850' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (37, 5, 237, N'DON MATIAS                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:08.737' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (38, 5, 240, N'EBEJICO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:12.443' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (39, 5, 264, N'ENTRERRIOS                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:17.270' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (40, 5, 266, N'ENVIGADO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:20.907' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (41, 5, 282, N'FREDONIA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:25.093' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (42, 5, 306, N'GIRALDO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:29.300' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (43, 5, 308, N'GIRARDOTA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:32.990' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (44, 5, 310, N'GOMEZ PLATA                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:37.147' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (45, 5, 313, N'GRANADA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:40.817' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (46, 5, 315, N'GUADALUPE                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:44.507' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (47, 5, 318, N'GUARNE                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:48.223' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (48, 5, 347, N'HELICONIA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:51.933' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (49, 5, 353, N'HISPANIA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:38:56.630' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (50, 5, 360, N'ITAGUI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:00.313' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (51, 5, 361, N'ITUANGO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:04.023' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (52, 5, 364, N'JARDIA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:07.690' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (53, 5, 368, N'JERICO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:11.850' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (54, 5, 376, N'LA CEJA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:16.050' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (55, 5, 380, N'LA ESTRELLA                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:19.723' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (56, 5, 400, N'LA UNION                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:23.877' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (57, 5, 411, N'LIBORINA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:27.567' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (58, 5, 425, N'MACEO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:31.247' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (59, 5, 467, N'MONTEBELLO                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:34.907' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (60, 5, 480, N'MUTATA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:39.640' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (61, 5, 483, N'NARI¥O                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:43.360' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (62, 5, 490, N'NECOCLI                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:47.527' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (63, 5, 495, N'NECHI                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:51.177' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (64, 5, 501, N'OLAYA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:54.920' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (65, 5, 541, N'PE¥OL                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:39:58.587' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (66, 5, 543, N'PEQUE                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:02.283' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (67, 5, 579, N'PUERTO BERRIO                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:05.990' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (68, 5, 585, N'PUERTO NARE                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:09.667' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (69, 5, 591, N'PUERTO TRIUNFO                ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:13.843' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (70, 5, 604, N'REMEDIOS                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:17.507' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (71, 5, 607, N'RETIRO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:21.703' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (72, 5, 615, N'RIONEGRO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:25.410' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (73, 5, 631, N'SABANETA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:29.093' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (74, 5, 642, N'SALGAR                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:33.773' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (75, 5, 647, N'SAN ANDRES                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:37.430' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (76, 5, 649, N'SAN CARLOS                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:41.087' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (77, 5, 652, N'SAN FRANCISCO                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:44.767' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (78, 5, 656, N'SAN JERONIMO                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:50.040' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (79, 5, 658, N'SAN JOSE DE LA MONTA¥A        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:53.723' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (80, 5, 659, N'SAN JUAN DE URABA             ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:40:57.397' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (81, 5, 660, N'SAN LUIS                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:01.603' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (82, 5, 664, N'SAN PEDRO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:05.313' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (83, 5, 665, N'SAN PEDRO DE URABA            ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:08.993' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (84, 5, 667, N'SAB RAFAEL                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:13.187' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (85, 5, 670, N'SAN ROQUE                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:16.877' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (86, 5, 679, N'SANTA BARBARA                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:20.537' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (87, 5, 686, N'SATA ROSA DE OSOS             ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:24.190' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (88, 5, 690, N'SANTO DOMINGO                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:27.830' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (89, 5, 697, N'EL SANTUARIO                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:31.503' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (90, 5, 736, N'SEGOVIA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:35.673' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (91, 5, 756, N'SONSON                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:39.333' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (92, 5, 761, N'SOPETRAN                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:43.530' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (93, 5, 789, N'TAMESIS                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:47.193' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (94, 5, 790, N'TARAZA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:50.890' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (95, 5, 792, N'TARSO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:55.070' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (96, 5, 809, N'TITRIBI                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:41:59.273' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (97, 5, 819, N'TOLEDO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:03.930' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (98, 5, 837, N'TURBO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:07.590' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (99, 5, 842, N'URAMITA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:11.277' AS DateTime))
GO
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (100, 5, 847, N'URRAO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:14.990' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (101, 5, 854, N'VALDIVIA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:18.677' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (102, 5, 856, N'VALPARAISO                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:22.360' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (103, 5, 858, N'VEGACHI                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:26.017' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (104, 5, 861, N'VENECIA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:29.663' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (105, 5, 873, N'VIGA DEL FUERTE               ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:33.947' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (106, 5, 885, N'YALI                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:37.640' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (107, 5, 887, N'YURUMAL                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:41.823' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (108, 5, 890, N'YOLOMBO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:45.537' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (109, 5, 895, N'ZARAGOZA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:49.740' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (110, 8, 1, N'BARRANQUILLA                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:54.100' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (111, 8, 2, N'SOLEDAD                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:42:58.007' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (112, 11, 1, N'BOGOTA D.C.                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:01.793' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (113, 11, 20, N'ENGATIVA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:06.017' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (114, 11, 30, N'FONTIBON                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:09.720' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (115, 11, 40, N'SUBA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:13.383' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (116, 11, 50, N'USAQUEN                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:17.570' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (117, 11, 60, N'USME                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:21.247' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (118, 11, 92, N'BOSA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:25.450' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (119, 13, 1, N'CARTAGENA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:29.133' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (120, 13, 6, N'ACHI                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:32.773' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (121, 13, 30, N'ALTOS DEL ROSARIO             ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:36.423' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (122, 13, 42, N'ARENAL                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:40.640' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (123, 13, 43, N'SIMITI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:44.317' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (124, 13, 52, N'ARJONA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:48.023' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (125, 13, 74, N'BARRANCO DE LOBA              ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:51.730' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (126, 13, 140, N'CALAMAR                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:55.410' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (127, 13, 160, N'CANTA GALLO                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:43:59.080' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (128, 13, 212, N'CORDOBA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:03.907' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (129, 13, 222, N'CLEMENCIA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:08.723' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (130, 13, 300, N'HASTILLO DE LOBA              ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:12.930' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (131, 13, 430, N'MAGANGUE                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:16.617' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (132, 13, 433, N'MAHATES                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:20.340' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (133, 13, 440, N'MARGARITA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:24.050' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (134, 13, 442, N'MARIA LA BAJA                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:28.333' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (135, 13, 458, N'MONTECRISTO                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:32.043' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (136, 13, 468, N'MOMPOS                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:36.267' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (137, 13, 473, N'MORALES                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:39.917' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (138, 13, 549, N'PINILLOS                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:43.583' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (139, 13, 600, N'RIO VIEJO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:47.810' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (140, 13, 620, N'SAN CRISTOBAL                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:51.540' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (141, 13, 647, N'SAN ESTANISLAO                ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:55.740' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (142, 13, 650, N'SAN FERNANDO                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:44:59.467' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (143, 13, 654, N'SAN JACINTO                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:04.143' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (144, 13, 657, N'SAN JUAN NEPOMUCENO           ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:07.823' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (145, 13, 667, N'SAN MARTIN DE LOBA            ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:11.490' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (146, 13, 670, N'SAN PABLO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:16.260' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (147, 13, 673, N'SANTA CATALINA                ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:20.420' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (148, 13, 744, N'SIMITI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:24.107' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (149, 13, 760, N'SOPLAVIENTO                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:28.287' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (150, 13, 780, N'TALAIGUA NUEVO                ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:33.087' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (151, 13, 810, N'TIQUISIO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:36.770' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (152, 13, 836, N'TURBACO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:40.457' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (153, 13, 838, N'TURBANA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:44.650' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (154, 13, 873, N'VILLANUEVA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:48.850' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (155, 13, 894, N'ZAMBRANO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:53.063' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (156, 15, 1, N'TUNJA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:45:57.253' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (157, 15, 47, N'AQUITANIA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:01.440' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (158, 15, 51, N'ARCABUCO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:05.637' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (159, 15, 87, N'BELEN                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:09.523' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (160, 15, 90, N'BERBEO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:13.453' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (161, 15, 92, N'BETEITIVA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:17.413' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (162, 15, 97, N'BOAVITA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:21.843' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (163, 15, 104, N'BOYACA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:26.270' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (164, 15, 109, N'BUENAVISTA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:30.730' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (165, 15, 114, N'BUSBANZA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:35.190' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (166, 15, 131, N'CALDAS                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:39.647' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (167, 15, 135, N'CAMPOHERMOSO                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:44.127' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (168, 15, 162, N'CERINZA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:48.050' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (169, 15, 172, N'CHINAVITA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:53.540' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (170, 15, 176, N'CHIQUINQUIRA                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:46:57.500' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (171, 15, 180, N'CHISCAS                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:01.460' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (172, 15, 183, N'CHITA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:05.417' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (173, 15, 185, N'CHITARAQUE                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:09.380' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (174, 15, 187, N'CHIVATA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:13.337' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (175, 15, 189, N'CIENEGA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:17.297' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (176, 15, 204, N'COMBITA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:21.237' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (177, 15, 212, N'COPER                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:25.250' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (178, 15, 215, N'CORRALES                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:29.243' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (179, 15, 218, N'COVARACHIA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:33.210' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (180, 15, 223, N'CUBARA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:37.187' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (181, 15, 224, N'CUCAITA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:41.140' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (182, 15, 226, N'CUITIVA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:45.080' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (183, 15, 232, N'CHIQUIZA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:49.040' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (184, 15, 236, N'CHIVOR                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:53.520' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (185, 15, 238, N'DUITAMA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:47:58.457' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (186, 15, 244, N'EL COCUY                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:02.907' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (187, 15, 248, N'EL ESPINO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:06.837' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (188, 15, 272, N'FIRAVITOBAI                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:10.827' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (189, 15, 276, N'FLORESTA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:15.790' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (190, 15, 293, N'GACHANTIVA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:20.273' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (191, 15, 296, N'GAMEZA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:24.750' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (192, 15, 299, N'GARAGOA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:28.753' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (193, 15, 317, N'GUACAMAYAS                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:32.750' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (194, 15, 322, N'GUATEQUE                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:36.690' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (195, 15, 325, N'GUAYATA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:40.680' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (196, 15, 332, N'GUICAN                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:44.663' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (197, 15, 362, N'IZA                           ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:48.663' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (198, 15, 367, N'JENESANO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:53.137' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (199, 15, 368, N'JERICO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:48:57.620' AS DateTime))
GO
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (200, 15, 377, N'LABRANZAGRANDE                ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:01.560' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (201, 15, 380, N'LA CAPILLA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:06.030' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (202, 15, 401, N'LA VICTORIA                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:10.053' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (203, 15, 403, N'LA UVITA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:15.143' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (204, 15, 407, N'VILLA DE LEYVA                ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:19.080' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (205, 15, 425, N'MACANAL                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:23.060' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (206, 15, 442, N'MARIPI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:26.997' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (207, 15, 455, N'MIRAFLORES                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:30.957' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (208, 15, 464, N'MONGUA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:34.910' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (209, 15, 466, N'MONGUI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:38.693' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (210, 15, 469, N'MONIQUIRA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:42.890' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (211, 15, 476, N'MOTAVITA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:46.567' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (212, 15, 480, N'MUZO                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:50.263' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (213, 15, 491, N'NOBSA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:53.960' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (214, 15, 494, N'NUEVO COLON                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:49:57.673' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (215, 15, 500, N'OICATA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:01.340' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (216, 15, 507, N'OTANCHE                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:05.023' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (217, 15, 511, N'PACHAVITA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:09.760' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (218, 15, 514, N'PAEZ                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:13.433' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (219, 15, 516, N'PAIPA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:17.110' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (220, 15, 518, N'PAJARITO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:20.847' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (221, 15, 531, N'PAUNA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:24.513' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (222, 15, 533, N'PAYA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:28.233' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (223, 15, 537, N'PAZ DE RIO                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:31.930' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (224, 15, 542, N'PESCA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:35.633' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (225, 15, 550, N'PISBA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:39.837' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (226, 15, 572, N'PUERTO BOYACA                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:44.007' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (227, 15, 580, N'QUIPAMA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:47.677' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (228, 15, 599, N'RAMIRIQUI                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:51.400' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (229, 15, 600, N'RAQUIRA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:55.090' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (230, 15, 621, N'RONDON                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:50:59.300' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (231, 15, 632, N'SABOYA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:03.493' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (232, 15, 638, N'SACHICA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:07.687' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (233, 15, 646, N'SAMACA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:11.353' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (234, 15, 660, N'SAN EDUARDO                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:16.127' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (235, 15, 664, N'SAN JOSE DE PARE              ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:20.303' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (236, 15, 667, N'SAN LUIS DE GACENO            ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:24.477' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (237, 15, 673, N'SAN MATEO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:28.143' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (238, 15, 676, N'SAN MIGUEL DE SEMA            ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:31.817' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (239, 15, 681, N'SAN PABLO DE BORBUR           ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:35.500' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (240, 15, 686, N'SANTANA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:39.200' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (241, 15, 690, N'SANTA MARIA                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:43.400' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (242, 15, 693, N'SANTA ROSA DE VITERBO         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:47.090' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (243, 15, 696, N'SANTA SOFIA                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:50.760' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (244, 15, 720, N'SATIVANORTE                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:54.473' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (245, 15, 723, N'SATIVASUR                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:51:58.180' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (246, 15, 740, N'SIACHOQUE                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:01.860' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (247, 15, 753, N'SOATA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:06.060' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (248, 15, 755, N'SOCOTA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:09.750' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (249, 15, 757, N'SOCHA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:14.437' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (250, 15, 759, N'SOGAMOSO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:18.563' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (251, 15, 761, N'SOMONDOCO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:22.237' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (252, 15, 762, N'SORA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:25.893' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (253, 15, 763, N'SOTAQUIRA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:29.607' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (254, 15, 764, N'SORACA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:33.777' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (255, 15, 774, N'SUSACON                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:37.507' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (256, 15, 776, N'SUTAMARCHAN                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:42.560' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (257, 15, 778, N'SUTATENZA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:46.370' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (258, 15, 790, N'TASCO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:50.077' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (259, 15, 798, N'TENZA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:53.767' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (260, 15, 804, N'TIBANA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:52:57.450' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (261, 15, 806, N'TIBASOSA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:01.150' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (262, 15, 808, N'TINJACA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:04.830' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (263, 15, 810, N'TIPACOQUE                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:08.993' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (264, 15, 814, N'TOCA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:12.700' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (265, 15, 822, N'TOTA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:16.413' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (266, 15, 832, N'TUNUNGUA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:20.113' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (267, 15, 835, N'TURMEQUE                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:23.800' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (268, 15, 837, N'TUTA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:27.483' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (269, 15, 839, N'TUTAZA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:31.173' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (270, 15, 842, N'UBITA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:35.407' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (271, 15, 861, N'VENTAQUEMADA                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:39.617' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (272, 15, 879, N'VIRACACHA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:43.813' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (273, 15, 897, N'ZETAQUIRA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:48.080' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (274, 17, 1, N'MANIZALES                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:51.770' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (275, 17, 2, N'SUPIA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:55.527' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (276, 17, 3, N'AGUADAS                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:53:59.780' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (277, 18, 1, N'FLORENCIA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:03.503' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (278, 19, 1, N'POPAYAN                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:07.757' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (279, 20, 1, N'VALLEDEUPAR                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:11.490' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (280, 20, 11, N'AGUACHICA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:15.210' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (281, 25, 1, N'AGUA DE DIOS                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:19.390' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (282, 25, 19, N'ALBAN                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:23.580' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (283, 25, 35, N'ANAPOIMA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:27.227' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (284, 25, 40, N'ANOLAIMA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:30.887' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (285, 25, 86, N'BELTRAN                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:34.553' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (286, 25, 95, N'BITUIMA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:38.770' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (287, 25, 99, N'BOJACA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:42.467' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (288, 25, 120, N'CABRERA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:46.140' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (289, 25, 123, N'CACHIPAY                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:49.827' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (290, 25, 126, N'CAJICA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:53.977' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (291, 25, 148, N'CAPARRAPI                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:54:58.157' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (292, 25, 151, N'CAQUEZA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:02.990' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (293, 25, 154, N'CARMEN DE CARUPA              ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:06.970' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (294, 25, 168, N'CHAGUANI                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:11.623' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (295, 25, 175, N'CHIA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:15.290' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (296, 25, 178, N'CHIPAQUE                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:19.030' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (297, 25, 181, N'CHOACHI                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:23.210' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (298, 25, 183, N'CHOCONTA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:26.933' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (299, 25, 200, N'COGUA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:31.110' AS DateTime))
GO
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (300, 25, 214, N'COTA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:34.773' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (301, 25, 245, N'EL COLEGIO                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:38.470' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (302, 25, 258, N'EL PE¥ON                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:42.190' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (303, 25, 269, N'FACATATIVA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:45.920' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (304, 25, 279, N'FOMEQUE                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:50.150' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (305, 25, 281, N'FOSCA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:53.843' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (306, 25, 290, N'FUSAGASUGA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:55:57.540' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (307, 25, 295, N'GACHANCIPA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:01.213' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (308, 25, 297, N'GACHETA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:05.440' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (309, 25, 299, N'GAMA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:09.143' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (310, 25, 307, N'GIRARDOT                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:12.850' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (311, 25, 312, N'GRANADA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:16.583' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (312, 25, 317, N'GUACHETA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:20.827' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (313, 25, 320, N'GUADUAS                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:24.527' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (314, 25, 322, N'GUASCA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:28.853' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (315, 25, 324, N'GUATAQUI                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:33.033' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (316, 25, 326, N'GUATAVITA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:37.933' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (317, 25, 335, N'GUAYABETAL                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:41.730' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (318, 25, 339, N'GUTIERREZ                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:45.510' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (319, 25, 368, N'JERUSALEN                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:49.160' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (320, 25, 372, N'JUNIN                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:52.897' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (321, 25, 377, N'LA CALERA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:56:57.643' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (322, 25, 386, N'LA MESA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:01.380' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (323, 25, 394, N'LA PALMA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:05.153' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (324, 25, 398, N'LA PE¥A                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:08.853' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (325, 25, 402, N'LA VEGA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:12.550' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (326, 25, 407, N'LENGUAZAQUE                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:16.353' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (327, 25, 408, N'GACHALA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:20.640' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (328, 25, 426, N'MACHETA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:24.350' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (329, 25, 430, N'MADRID                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:29.143' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (330, 25, 436, N'MANTA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:33.020' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (331, 25, 438, N'MEDINA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:36.760' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (332, 25, 473, N'MOSQUERA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:40.537' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (333, 25, 483, N'NARI¥O                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:44.747' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (334, 25, 486, N'NEMOCON                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:48.960' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (335, 25, 488, N'NILO                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:52.710' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (336, 25, 489, N'NIMAIMA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:57:56.983' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (337, 25, 491, N'NOCAIMA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:01.197' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (338, 25, 506, N'VENECIA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:05.437' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (339, 25, 513, N'PACHO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:09.140' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (340, 25, 518, N'PAIME                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:12.857' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (341, 25, 530, N'PARATEBUENO                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:16.597' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (342, 25, 535, N'PASCA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:20.317' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (343, 25, 572, N'PUERTO SALGAR                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:24.003' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (344, 25, 580, N'PULI                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:27.713' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (345, 25, 592, N'QUEBRADANEGRA                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:31.933' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (346, 25, 594, N'QUETAME                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:36.170' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (347, 25, 596, N'QUIPILE                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:39.963' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (348, 25, 599, N'APULO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:43.680' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (349, 25, 612, N'RICAURTE                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:47.503' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (350, 25, 645, N'SAN ANTONIO DE TEQUENDAMA     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:51.720' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (351, 25, 649, N'SAN BERNARDO                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:55.420' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (352, 25, 653, N'SAN CAYETANO                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:58:59.627' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (353, 25, 658, N'SAN FRANCISCO                 ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:03.400' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (354, 25, 662, N'SAN JUAN DE RIO SECO          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:07.130' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (355, 25, 718, N'SASAIMA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:10.873' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (356, 25, 736, N'SESQUILE                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:14.617' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (357, 25, 740, N'SIBATE                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:19.397' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (358, 25, 743, N'SILVANIA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:23.123' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (359, 25, 745, N'SIMIJACA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:27.380' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (360, 25, 754, N'SOACHA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:31.633' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (361, 25, 758, N'SOPO                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:35.370' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (362, 25, 769, N'SUBACHOQUE                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:39.080' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (363, 25, 772, N'SUESCA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:42.787' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (364, 25, 777, N'SUPATA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:47.007' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (365, 25, 779, N'SUSA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:50.760' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (366, 25, 780, N'FUNZA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:54.487' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (367, 25, 781, N'SUTATAUSA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T09:59:58.837' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (368, 25, 785, N'TABIO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:02.560' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (369, 25, 793, N'TAUSA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:07.330' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (370, 25, 797, N'TENA                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:11.017' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (371, 25, 799, N'TENJO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:14.763' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (372, 25, 805, N'TIBACUY                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:18.463' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (373, 25, 807, N'TIBIRITA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:22.203' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (374, 25, 815, N'TOCAIMA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:26.423' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (375, 25, 817, N'TOCANCIPA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:30.180' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (376, 25, 823, N'TOPAIPI                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:34.933' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (377, 25, 839, N'UBALA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:38.647' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (378, 25, 841, N'UBAQUE                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:42.420' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (379, 25, 843, N'UBATE                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:46.177' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (380, 25, 845, N'UNE                           ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:51.440' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (381, 25, 851, N'UTICA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:00:55.210' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (382, 25, 862, N'VERGARA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:00.047' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (383, 25, 871, N'VILLAGOMEZ                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:04.180' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (384, 25, 873, N'VILLAPINZON                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:08.360' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (385, 25, 875, N'VILLETA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:12.543' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (386, 25, 878, N'VIOTA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:16.250' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (387, 25, 885, N'YACOPI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:19.977' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (388, 25, 898, N'ZIPACON                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:24.233' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (389, 25, 899, N'ZIPAQUIRA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:27.987' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (390, 25, 901, N'ARBELAEZ                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:31.730' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (391, 27, 1, N'QUIBDO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:36.553' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (392, 27, 6, N'ACANDI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:40.570' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (393, 27, 25, N'ALTO BAUDIO                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:44.593' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (394, 27, 73, N'BAGADO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:50.080' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (395, 27, 75, N'BAHIA SOLANO                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:54.060' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (396, 27, 77, N'BAJO BAUDO                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:01:59.130' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (397, 27, 99, N'BOJAYA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:03.170' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (398, 27, 135, N'CANTON DEL SAN PABLO          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:07.107' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (399, 27, 205, N'CONDOTO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:11.037' AS DateTime))
GO
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (400, 27, 361, N'ITSMINA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:14.963' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (401, 27, 372, N'JURADO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:18.973' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (402, 27, 413, N'LLORO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:23.523' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (403, 27, 450, N'LITORAL DEL BAJO SAN JUAN     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:28.013' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (404, 27, 491, N'NOVITA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:32.490' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (405, 27, 495, N'NUQUI                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:36.473' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (406, 27, 615, N'RIOSUCIO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:40.490' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (407, 27, 660, N'SAN JOSE DEL PALMAR           ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:44.463' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (408, 27, 745, N'SIPI                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:48.477' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (409, 27, 787, N'TADO                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:52.977' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (410, 27, 800, N'UNGUIA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:02:56.983' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (411, 30, 189, N'CIENAGA DE ORO                ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:00.927' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (412, 41, 1, N'NEIVA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:05.410' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (413, 41, 13, N'AGRADO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:09.417' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (414, 41, 14, N'LA PLATA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:13.383' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (415, 41, 16, N'AIPE                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:17.820' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (416, 41, 20, N'ALGECIRAS                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:22.903' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (417, 41, 26, N'ALTAMIRA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:26.840' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (418, 41, 78, N'BARAYA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:30.827' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (419, 41, 132, N'CAMPOALEGRE                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:34.860' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (420, 41, 206, N'COLOMBIA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:38.860' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (421, 41, 244, N'ELIAS                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:42.907' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (422, 41, 298, N'GARZON                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:46.930' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (423, 41, 306, N'GIGANTE                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:51.377' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (424, 41, 319, N'GUADALUPE                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:55.333' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (425, 41, 349, N'HOBO                          ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:03:59.310' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (426, 41, 359, N'SAN JOSE DE ISNOS             ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:03.290' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (427, 41, 378, N'LA ARGENTINA                  ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:07.220' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (428, 41, 518, N'PAICOL                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:11.167' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (429, 41, 530, N'PALESTINA                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:15.667' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (430, 41, 531, N'PALERMO                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:20.607' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (431, 41, 548, N'PITAL                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:24.540' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (432, 41, 551, N'PITALITO                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:29.027' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (433, 41, 668, N'SAN AGUSTIN                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:33.087' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (434, 41, 676, N'SANTA MARIA                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:37.067' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (435, 41, 770, N'SUAZA                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:41.073' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (436, 41, 791, N'TARQUI                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:45.520' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (437, 41, 797, N'TESALIA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:49.573' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (438, 41, 799, N'TELLO                         ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:53.533' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (439, 41, 801, N'TERUEL                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:04:57.507' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (440, 41, 807, N'TIMANA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:01.520' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (441, 41, 872, N'VILLAVIEJA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:05.517' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (442, 41, 885, N'YAGUARA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:09.650' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (443, 44, 1, N'RIOHACHA                      ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:14.740' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (444, 44, 78, N'BARRANCAS                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:19.853' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (445, 44, 110, N'ALBANIA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:25.463' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (446, 44, 279, N'FONSECA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:29.397' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (447, 44, 430, N'MAICAO                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:33.850' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (448, 44, 847, N'URIBIA                        ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:37.820' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (449, 44, 855, N'URUMITA                       ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:42.817' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (450, 44, 874, N'VILLANUEVA                    ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:46.780' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (451, 44, 875, N'SAN JUAN DEL CESAR            ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:50.790' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (452, 44, 876, N'EL MOLINO                     ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:55.280' AS DateTime))
INSERT [dbo].[Gn_Municipios] ([codMunicipio], [codDepartamento], [codSuip], [nomMunicipio], [usuActividad], [tipActividad], [horActividad]) VALUES (453, 47, 1, N'SANTA MARTA                   ', N'SIPRE          ', N'A', CAST(N'2016-10-23T10:05:59.250' AS DateTime))
SET IDENTITY_INSERT [dbo].[Gn_Municipios] OFF
INSERT [dbo].[Gn_Pais] ([codPais], [nomPais], [usuActividad], [tipActividad], [horActividad]) VALUES (169, N'COLOMBIA', N'SIPRE          ', N'A', CAST(N'2016-08-02T19:48:53.000' AS DateTime))
INSERT [dbo].[Gn_Roles] ([codRol], [nomRol], [TipRol], [usuActividad], [tipActividad], [horActividad]) VALUES (1, N'EMPLEADO', N'E', 0, N' ', CAST(N'2016-08-04T15:44:47.000' AS DateTime))
INSERT [dbo].[Gn_Roles] ([codRol], [nomRol], [TipRol], [usuActividad], [tipActividad], [horActividad]) VALUES (2, N'USUARIO FUNCIONAL', N'C', 0, N' ', CAST(N'2016-08-04T15:44:47.000' AS DateTime))
INSERT [dbo].[Gn_Roles] ([codRol], [nomRol], [TipRol], [usuActividad], [tipActividad], [horActividad]) VALUES (3, N'ADMINISTRADOR', N'D', 0, N' ', CAST(N'2016-08-04T15:44:47.000' AS DateTime))
INSERT [dbo].[Gn_Roles] ([codRol], [nomRol], [TipRol], [usuActividad], [tipActividad], [horActividad]) VALUES (4, N'PROVEEDOR', N'P', 0, N' ', CAST(N'2016-08-04T15:44:47.000' AS DateTime))
INSERT [dbo].[Gn_TipoBeneficiarios] ([codTipoBeneficiario], [nomTipoBeneficiario]) VALUES (1, N'Hijo')
INSERT [dbo].[Gn_TipoBeneficiarios] ([codTipoBeneficiario], [nomTipoBeneficiario]) VALUES (2, N'Padres')
INSERT [dbo].[Gn_TipoBeneficiarios] ([codTipoBeneficiario], [nomTipoBeneficiario]) VALUES (3, N'Conyugue')
SET IDENTITY_INSERT [dbo].[Gn_TipoIdentificaciones] ON 

INSERT [dbo].[Gn_TipoIdentificaciones] ([codTipoIdentificacion], [nomTipoIdentificacion]) VALUES (1, N'NIT')
INSERT [dbo].[Gn_TipoIdentificaciones] ([codTipoIdentificacion], [nomTipoIdentificacion]) VALUES (2, N'RUT')
INSERT [dbo].[Gn_TipoIdentificaciones] ([codTipoIdentificacion], [nomTipoIdentificacion]) VALUES (3, N'Cedula ciudadania')
INSERT [dbo].[Gn_TipoIdentificaciones] ([codTipoIdentificacion], [nomTipoIdentificacion]) VALUES (5, N'Cedula extranjeria')
INSERT [dbo].[Gn_TipoIdentificaciones] ([codTipoIdentificacion], [nomTipoIdentificacion]) VALUES (6, N'Tarjeta identidad')
INSERT [dbo].[Gn_TipoIdentificaciones] ([codTipoIdentificacion], [nomTipoIdentificacion]) VALUES (7, N'Registro Civil')
SET IDENTITY_INSERT [dbo].[Gn_TipoIdentificaciones] OFF
INSERT [dbo].[Pe_AsignacionPresupuestos] ([codPresupuesto], [anoPresupuesto], [valInicial], [valEjecutado], [valPendiente], [usuActividad], [tipActividad], [horActividad]) VALUES (1, 2015, 108000000, 0, 0, 0, N' ', CAST(N'2016-08-04T15:45:42.000' AS DateTime))
INSERT [dbo].[Pe_AsignacionPresupuestos] ([codPresupuesto], [anoPresupuesto], [valInicial], [valEjecutado], [valPendiente], [usuActividad], [tipActividad], [horActividad]) VALUES (2, 2015, 108000000, 0, 0, 0, N' ', CAST(N'2016-08-04T15:45:42.000' AS DateTime))
INSERT [dbo].[Pe_AsignacionPresupuestos] ([codPresupuesto], [anoPresupuesto], [valInicial], [valEjecutado], [valPendiente], [usuActividad], [tipActividad], [horActividad]) VALUES (3, 2015, 108000000, 0, 0, 0, N' ', CAST(N'2016-08-04T15:45:42.000' AS DateTime))
INSERT [dbo].[Pe_AsignacionPresupuestos] ([codPresupuesto], [anoPresupuesto], [valInicial], [valEjecutado], [valPendiente], [usuActividad], [tipActividad], [horActividad]) VALUES (4, 2015, 108000000, 0, 0, 0, N' ', CAST(N'2016-08-04T15:45:42.000' AS DateTime))
INSERT [dbo].[Pe_AsignacionPresupuestos] ([codPresupuesto], [anoPresupuesto], [valInicial], [valEjecutado], [valPendiente], [usuActividad], [tipActividad], [horActividad]) VALUES (5, 2015, 108000000, 0, 0, 0, N' ', CAST(N'2016-08-04T15:45:42.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pe_DetallePresupuesto] ON 

INSERT [dbo].[Pe_DetallePresupuesto] ([codDetallePresupuesto], [codPresupuesto], [codFactura], [codProveedor], [codTomador], [valEmpresa], [usuActividad], [tipActividad], [horActividad]) VALUES (127, 1, 12, 800140949, 79626621, 12300, N'Sipre', N'A', CAST(N'2016-08-17T13:19:45.000' AS DateTime))
INSERT [dbo].[Pe_DetallePresupuesto] ([codDetallePresupuesto], [codPresupuesto], [codFactura], [codProveedor], [codTomador], [valEmpresa], [usuActividad], [tipActividad], [horActividad]) VALUES (128, 2, 13, 800150280, 79646350, 13300, N'Sipre', N'A', CAST(N'2016-08-17T13:21:01.000' AS DateTime))
INSERT [dbo].[Pe_DetallePresupuesto] ([codDetallePresupuesto], [codPresupuesto], [codFactura], [codProveedor], [codTomador], [valEmpresa], [usuActividad], [tipActividad], [horActividad]) VALUES (129, 3, 13, 800037800, 79503353, 14300, N'Sipre', N'A', CAST(N'2016-08-17T13:21:43.000' AS DateTime))
INSERT [dbo].[Pe_DetallePresupuesto] ([codDetallePresupuesto], [codPresupuesto], [codFactura], [codProveedor], [codTomador], [valEmpresa], [usuActividad], [tipActividad], [horActividad]) VALUES (130, 4, 12, 800088702, 79505504, 15300, N'Sipre', N'A', CAST(N'2016-08-17T13:22:16.000' AS DateTime))
INSERT [dbo].[Pe_DetallePresupuesto] ([codDetallePresupuesto], [codPresupuesto], [codFactura], [codProveedor], [codTomador], [valEmpresa], [usuActividad], [tipActividad], [horActividad]) VALUES (131, 5, 13, 800130907, 79503353, 16300, N'Sipre', N'A', CAST(N'2016-08-17T13:22:43.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pe_DetallePresupuesto] OFF
INSERT [dbo].[Pr_Facturacion] ([codFactura], [codServicio], [valEmpleado], [valEmpresa], [usuActividad], [tipActividad], [horActividad]) VALUES (12, 30, 1200, 200000, 12, N'A', CAST(N'2016-08-16T21:07:18.000' AS DateTime))
INSERT [dbo].[Pr_Facturacion] ([codFactura], [codServicio], [valEmpleado], [valEmpresa], [usuActividad], [tipActividad], [horActividad]) VALUES (13, 14, 1300, 30000, 13, N'A', CAST(N'2016-08-16T21:08:21.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (1, 1, N'', CAST(N'2016-06-21' AS Date), 120000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (2, 2, N'', CAST(N'2016-06-21' AS Date), 80000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (3, 3, N'', CAST(N'2016-06-21' AS Date), 53333, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (4, 4, N'', CAST(N'2016-06-21' AS Date), 35556, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (5, 5, N'', CAST(N'2016-06-21' AS Date), 23704, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (6, 6, N'', CAST(N'2016-06-21' AS Date), 15802, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (7, 7, N'', CAST(N'2016-06-21' AS Date), 10535, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (8, 1, N'', CAST(N'2016-06-21' AS Date), 480000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (9, 2, N'', CAST(N'2016-06-21' AS Date), 320000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (10, 3, N'', CAST(N'2016-06-21' AS Date), 213332, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (11, 4, N'', CAST(N'2016-06-21' AS Date), 142224, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (12, 5, N'', CAST(N'2016-06-21' AS Date), 94816, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (13, 6, N'', CAST(N'2016-06-21' AS Date), 63208, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (14, 7, N'', CAST(N'2016-06-21' AS Date), 42140, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (15, 1, N'', CAST(N'2016-06-21' AS Date), 94816, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (16, 2, N'', CAST(N'2016-06-21' AS Date), 42140, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (17, 3, N'', CAST(N'2016-06-21' AS Date), 853328, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (18, 4, N'', CAST(N'2016-06-21' AS Date), 568896, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (19, 5, N'', CAST(N'2016-06-21' AS Date), 379264, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (20, 6, N'', CAST(N'2016-06-21' AS Date), 252832, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (21, 7, N'', CAST(N'2016-06-21' AS Date), 168560, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (22, 1, N'', CAST(N'2016-06-21' AS Date), 379264, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (23, 2, N'', CAST(N'2016-06-21' AS Date), 168560, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (24, 3, N'', CAST(N'2016-06-21' AS Date), 120000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (25, 4, N'', CAST(N'2016-06-21' AS Date), 80000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (26, 5, N'', CAST(N'2016-06-21' AS Date), 53333, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (27, 6, N'', CAST(N'2016-06-21' AS Date), 35556, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (28, 7, N'', CAST(N'2016-06-21' AS Date), 23704, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (29, 1, N'', CAST(N'2016-06-21' AS Date), 15802, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (30, 2, N'', CAST(N'2016-06-21' AS Date), 10535, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (31, 3, N'', CAST(N'2016-06-21' AS Date), 480000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (32, 4, N'', CAST(N'2016-06-21' AS Date), 320000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (33, 5, N'', CAST(N'2016-06-21' AS Date), 213332, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (34, 6, N'', CAST(N'2016-06-21' AS Date), 142224, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (35, 7, N'', CAST(N'2016-06-21' AS Date), 94816, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (36, 1, N'', CAST(N'2016-06-21' AS Date), 63208, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (37, 2, N'', CAST(N'2016-06-21' AS Date), 42140, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (38, 3, N'', CAST(N'2016-06-21' AS Date), 94816, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (39, 4, N'', CAST(N'2016-06-21' AS Date), 42140, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (40, 5, N'', CAST(N'2016-06-21' AS Date), 853328, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (41, 6, N'', CAST(N'2016-06-21' AS Date), 568896, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (42, 7, N'', CAST(N'2016-06-21' AS Date), 379264, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (43, 1, N'', CAST(N'2016-06-21' AS Date), 252832, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (44, 2, N'', CAST(N'2016-06-21' AS Date), 168560, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (45, 3, N'', CAST(N'2016-06-21' AS Date), 379264, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (46, 4, N'', CAST(N'2016-06-21' AS Date), 168560, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (47, 5, N'', CAST(N'2016-06-21' AS Date), 120000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (48, 6, N'', CAST(N'2016-06-21' AS Date), 80000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (49, 7, N'', CAST(N'2016-06-21' AS Date), 53333, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (50, 1, N'', CAST(N'2016-06-21' AS Date), 35556, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (51, 2, N'', CAST(N'2016-06-21' AS Date), 23704, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (52, 3, N'', CAST(N'2016-06-21' AS Date), 15802, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (53, 4, N'', CAST(N'2016-06-21' AS Date), 10535, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (54, 5, N'', CAST(N'2016-06-21' AS Date), 480000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (55, 6, N'', CAST(N'2016-06-21' AS Date), 320000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (56, 7, N'', CAST(N'2016-06-21' AS Date), 213332, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (57, 2, N'', CAST(N'2016-06-21' AS Date), 142224, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (58, 3, N'', CAST(N'2016-06-21' AS Date), 94816, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (59, 4, N'', CAST(N'2016-06-21' AS Date), 63208, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (60, 1, N'', CAST(N'2016-06-21' AS Date), 42140, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (61, 2, N'', CAST(N'2016-06-21' AS Date), 94816, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (62, 3, N'', CAST(N'2016-06-21' AS Date), 42140, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (63, 4, N'', CAST(N'2016-06-21' AS Date), 853328, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (64, 5, N'', CAST(N'2016-06-21' AS Date), 568896, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (65, 6, N'', CAST(N'2016-06-21' AS Date), 379264, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (66, 7, N'', CAST(N'2016-06-21' AS Date), 252832, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (67, 12, N'', CAST(N'2016-06-21' AS Date), 168560, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (68, 13, N'', CAST(N'2016-06-21' AS Date), 379264, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (69, 14, N'', CAST(N'2016-06-21' AS Date), 168560, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (70, 15, N'', CAST(N'2016-06-21' AS Date), 120000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
INSERT [dbo].[Pr_ValoresServicios] ([codValor], [tipBeneficio], [observacion], [fecFinalVigencia], [valServicio], [usuActividad], [tipActividad], [horActividad]) VALUES (71, 16, N'', CAST(N'2016-06-21' AS Date), 80000, N'SIPRE      ', N'A', CAST(N'2016-08-03T19:56:32.000' AS DateTime))
/****** Object:  Index [FKcodser]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKcodser] ON [dbo].[Be_solicitud]
(
	[codservicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKproveedoress]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKproveedoress] ON [dbo].[Be_solicitud]
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKTERCE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKTERCE] ON [dbo].[Be_solicitud]
(
	[codTomador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [be_tipobeneficio$codServ_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Be_Tipobeneficios] ADD  CONSTRAINT [be_tipobeneficio$codServ_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkbetser_idx]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkbetser_idx] ON [dbo].[Be_Tipobeneficios]
(
	[codTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkprdatob_idx]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkprdatob_idx] ON [dbo].[Be_Tipobeneficios]
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [be_tiposervicio$codTser_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Be_TipoServicios] ADD  CONSTRAINT [be_tiposervicio$codTser_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [bi_beneficiariosempleados$codBenef_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Bi_Beneficiarios] ADD  CONSTRAINT [bi_beneficiariosempleados$codBenef_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [bi_beneficiariosempleados$codEmpl_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Bi_Beneficiarios] ADD  CONSTRAINT [bi_beneficiariosempleados$codEmpl_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKmuninaci]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKmuninaci] ON [dbo].[Bi_Beneficiarios]
(
	[munNacimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [bi_datosempleado$codEmpl_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Bi_Empleados] ADD  CONSTRAINT [bi_datosempleado$codEmpl_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKmuni]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKmuni] ON [dbo].[Bi_Empleados]
(
	[munNacimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [bi_datosproveedor$idprDatob_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Bi_Proveedores] ADD  CONSTRAINT [bi_datosproveedor$idprDatob_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [bi_datosterceros$codTerc_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Bi_Terceros] ADD  CONSTRAINT [bi_datosterceros$codTerc_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codTercero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKMUNITERC]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKMUNITERC] ON [dbo].[Bi_Terceros]
(
	[codMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Gn_Auditoria]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_Auditoria] ADD  CONSTRAINT [PK_Gn_Auditoria] PRIMARY KEY NONCLUSTERED 
(
	[codAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_departamento$codPais_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_Departamentos] ADD  CONSTRAINT [gn_departamento$codPais_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKpais]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKpais] ON [dbo].[Gn_Departamentos]
(
	[codPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_detallemenu$codMenu_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_DetalleMenu] ADD  CONSTRAINT [gn_detallemenu$codMenu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_detallemenu$codRolu_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_DetalleMenu] ADD  CONSTRAINT [gn_detallemenu$codRolu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkprograma_idx]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkprograma_idx] ON [dbo].[Gn_DetalleMenu]
(
	[codPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_detallerol$codRolu_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_DetalleRol] ADD  CONSTRAINT [gn_detallerol$codRolu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [fkusuar]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkusuar] ON [dbo].[Gn_DetalleRol]
(
	[codUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fktipdocum_idx]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fktipdocum_idx] ON [dbo].[Gn_DocAdjuntos]
(
	[codDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_menu$codMenu_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_Menu] ADD  CONSTRAINT [gn_menu$codMenu_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_municipio$codPais_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_Municipios] ADD  CONSTRAINT [gn_municipio$codPais_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKmunicipio]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKmunicipio] ON [dbo].[Gn_Municipios]
(
	[codDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_pais$codPais_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_Pais] ADD  CONSTRAINT [gn_pais$codPais_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_programassistema$codProg_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_Programas] ADD  CONSTRAINT [gn_programassistema$codProg_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [gn_roles$codRoll_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_Roles] ADD  CONSTRAINT [gn_roles$codRoll_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Gn_TipoBeneficiarios]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_TipoBeneficiarios] ADD  CONSTRAINT [PK_Gn_TipoBeneficiarios] PRIMARY KEY NONCLUSTERED 
(
	[codTipoBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_Gn_TipoIdentificaciones]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Gn_TipoIdentificaciones] ADD  CONSTRAINT [PK_Gn_TipoIdentificaciones] PRIMARY KEY NONCLUSTERED 
(
	[codTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pe_asignacionpresupuesto$codPres_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Pe_AsignacionPresupuestos] ADD  CONSTRAINT [pe_asignacionpresupuesto$codPres_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pe_detallepresupuesto$codDpre_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Pe_DetallePresupuesto] ADD  CONSTRAINT [pe_detallepresupuesto$codDpre_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codDetallePresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_pedeta_besoli]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FK_pedeta_besoli] ON [dbo].[Pe_DetallePresupuesto]
(
	[codTomador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkCODprovee]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkCODprovee] ON [dbo].[Pe_DetallePresupuesto]
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkfactura_idx]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkfactura_idx] ON [dbo].[Pe_DetallePresupuesto]
(
	[codFactura] ASC,
	[codTomador] ASC,
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkpresupuesto_idx]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkpresupuesto_idx] ON [dbo].[Pe_DetallePresupuesto]
(
	[codPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pr_facturacionproveedor$codFact_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Pr_Facturacion] ADD  CONSTRAINT [pr_facturacionproveedor$codFact_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkbetipbe_idx]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [fkbetipbe_idx] ON [dbo].[Pr_Facturacion]
(
	[codServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [pr_valoresservicioproveedor$codValo_UNIQUE]    Script Date: 22/10/2016 10:08:51 p. m. ******/
ALTER TABLE [dbo].[Pr_ValoresServicios] ADD  CONSTRAINT [pr_valoresservicioproveedor$codValo_UNIQUE] UNIQUE NONCLUSTERED 
(
	[codValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKtservici]    Script Date: 22/10/2016 10:08:51 p. m. ******/
CREATE NONCLUSTERED INDEX [FKtservici] ON [dbo].[Pr_ValoresServicios]
(
	[tipBeneficio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Be_solicitud] ADD  DEFAULT ((0)) FOR [codProveedor]
GO
ALTER TABLE [dbo].[Be_solicitud] ADD  DEFAULT ((0)) FOR [codTomador]
GO
ALTER TABLE [dbo].[Be_solicitud] ADD  DEFAULT (N'0') FOR [estSolicitud]
GO
ALTER TABLE [dbo].[Be_solicitud] ADD  DEFAULT ((0)) FOR [codservicios]
GO
ALTER TABLE [dbo].[Be_solicitud] ADD  DEFAULT (N'0') FOR [observaciones]
GO
ALTER TABLE [dbo].[Be_solicitud] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Be_Tipobeneficios] ADD  DEFAULT (NULL) FOR [indActividad]
GO
ALTER TABLE [dbo].[Be_Tipobeneficios] ADD  DEFAULT (NULL) FOR [indPrescipciones]
GO
ALTER TABLE [dbo].[Be_Tipobeneficios] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[Be_TipoServicios] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[Bi_Beneficiarios] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[Bi_Empleados] ADD  CONSTRAINT [DF__bi_datose__actHo__6C190EBB]  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[Bi_Proveedores] ADD  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[Bi_Terceros] ADD  CONSTRAINT [DF__bi_datost__segNo__6E01572D]  DEFAULT (NULL) FOR [segNombre]
GO
ALTER TABLE [dbo].[Bi_Terceros] ADD  CONSTRAINT [DF__bi_datost__segAp__6EF57B66]  DEFAULT (NULL) FOR [segApellido]
GO
ALTER TABLE [dbo].[Bi_Terceros] ADD  CONSTRAINT [DF__bi_datost__actHo__6FE99F9F]  DEFAULT (getdate()) FOR [actHora]
GO
ALTER TABLE [dbo].[Gn_Departamentos] ADD  DEFAULT (NULL) FOR [nomDepartamento]
GO
ALTER TABLE [dbo].[Gn_Departamentos] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_DetalleMenu] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_DetalleRol] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_DocAdjuntos] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_Menu] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_Municipios] ADD  CONSTRAINT [DF__gn_munici__nomMu__76969D2E]  DEFAULT (NULL) FOR [nomMunicipio]
GO
ALTER TABLE [dbo].[Gn_Municipios] ADD  CONSTRAINT [DF__gn_munici__horAc__778AC167]  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_Pais] ADD  DEFAULT (NULL) FOR [nomPais]
GO
ALTER TABLE [dbo].[Gn_Pais] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_Programas] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_Roles] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_TipoDocumentos] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Gn_Usuarios] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Pe_AsignacionPresupuestos] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Pr_Facturacion] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Pr_ValoresServicios] ADD  DEFAULT (getdate()) FOR [horActividad]
GO
ALTER TABLE [dbo].[Be_solicitud]  WITH NOCHECK ADD  CONSTRAINT [be_solicitudbeneficios$FKproveedoress] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[Bi_Proveedores] ([codProveedor])
GO
ALTER TABLE [dbo].[Be_solicitud] CHECK CONSTRAINT [be_solicitudbeneficios$FKproveedoress]
GO
ALTER TABLE [dbo].[Be_solicitud]  WITH NOCHECK ADD  CONSTRAINT [be_solicitudbeneficios$FKTERCE] FOREIGN KEY([codTomador])
REFERENCES [dbo].[Bi_Terceros] ([codTercero])
GO
ALTER TABLE [dbo].[Be_solicitud] CHECK CONSTRAINT [be_solicitudbeneficios$FKTERCE]
GO
ALTER TABLE [dbo].[Be_solicitud]  WITH CHECK ADD  CONSTRAINT [FK_be_solicitudbeneficios_be_TipoBeneficio] FOREIGN KEY([codservicios])
REFERENCES [dbo].[Be_Tipobeneficios] ([codServicio])
GO
ALTER TABLE [dbo].[Be_solicitud] CHECK CONSTRAINT [FK_be_solicitudbeneficios_be_TipoBeneficio]
GO
ALTER TABLE [dbo].[Be_Tipobeneficios]  WITH NOCHECK ADD  CONSTRAINT [be_tipobeneficio$fkbetser] FOREIGN KEY([codTipoServicio])
REFERENCES [dbo].[Be_TipoServicios] ([codTipoServicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Be_Tipobeneficios] CHECK CONSTRAINT [be_tipobeneficio$fkbetser]
GO
ALTER TABLE [dbo].[Be_Tipobeneficios]  WITH NOCHECK ADD  CONSTRAINT [be_tipobeneficio$fkprdatob] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[Bi_Proveedores] ([codProveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Be_Tipobeneficios] CHECK CONSTRAINT [be_tipobeneficio$fkprdatob]
GO
ALTER TABLE [dbo].[Bi_Beneficiarios]  WITH NOCHECK ADD  CONSTRAINT [bi_beneficiariosempleados$fkbiemple] FOREIGN KEY([codEmpleado])
REFERENCES [dbo].[Bi_Empleados] ([codEmpleado])
GO
ALTER TABLE [dbo].[Bi_Beneficiarios] CHECK CONSTRAINT [bi_beneficiariosempleados$fkbiemple]
GO
ALTER TABLE [dbo].[Bi_Beneficiarios]  WITH NOCHECK ADD  CONSTRAINT [bi_beneficiariosempleados$fkbiterce] FOREIGN KEY([codBeneficiario])
REFERENCES [dbo].[Bi_Terceros] ([codTercero])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bi_Beneficiarios] CHECK CONSTRAINT [bi_beneficiariosempleados$fkbiterce]
GO
ALTER TABLE [dbo].[Bi_Beneficiarios]  WITH NOCHECK ADD  CONSTRAINT [bi_beneficiariosempleados$FKmuninaci] FOREIGN KEY([munNacimiento])
REFERENCES [dbo].[Gn_Municipios] ([codMunicipio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bi_Beneficiarios] CHECK CONSTRAINT [bi_beneficiariosempleados$FKmuninaci]
GO
ALTER TABLE [dbo].[Bi_Beneficiarios]  WITH CHECK ADD  CONSTRAINT [FK_bi_beneficiarios_gn_tipoBeneficiarios] FOREIGN KEY([tipBeneficiario])
REFERENCES [dbo].[Gn_TipoBeneficiarios] ([codTipoBeneficiario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bi_Beneficiarios] CHECK CONSTRAINT [FK_bi_beneficiarios_gn_tipoBeneficiarios]
GO
ALTER TABLE [dbo].[Bi_Empleados]  WITH NOCHECK ADD  CONSTRAINT [bi_datosempleado$fk_biTerc] FOREIGN KEY([codEmpleado])
REFERENCES [dbo].[Bi_Terceros] ([codTercero])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bi_Empleados] CHECK CONSTRAINT [bi_datosempleado$fk_biTerc]
GO
ALTER TABLE [dbo].[Bi_Empleados]  WITH NOCHECK ADD  CONSTRAINT [bi_datosempleado$FKmuni] FOREIGN KEY([munNacimiento])
REFERENCES [dbo].[Gn_Municipios] ([codMunicipio])
GO
ALTER TABLE [dbo].[Bi_Empleados] CHECK CONSTRAINT [bi_datosempleado$FKmuni]
GO
ALTER TABLE [dbo].[Bi_Proveedores]  WITH NOCHECK ADD  CONSTRAINT [bi_datosproveedor$FKtecer_prove] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[Bi_Terceros] ([codTercero])
GO
ALTER TABLE [dbo].[Bi_Proveedores] CHECK CONSTRAINT [bi_datosproveedor$FKtecer_prove]
GO
ALTER TABLE [dbo].[Bi_Terceros]  WITH NOCHECK ADD  CONSTRAINT [bi_datosterceros$FKMUNITERC] FOREIGN KEY([codMunicipio])
REFERENCES [dbo].[Gn_Municipios] ([codMunicipio])
GO
ALTER TABLE [dbo].[Bi_Terceros] CHECK CONSTRAINT [bi_datosterceros$FKMUNITERC]
GO
ALTER TABLE [dbo].[Bi_Terceros]  WITH CHECK ADD  CONSTRAINT [FK_bi_terceros_gn_tipoidentificacion] FOREIGN KEY([tipIdentificacion])
REFERENCES [dbo].[Gn_TipoIdentificaciones] ([codTipoIdentificacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bi_Terceros] CHECK CONSTRAINT [FK_bi_terceros_gn_tipoidentificacion]
GO
ALTER TABLE [dbo].[Gn_Departamentos]  WITH NOCHECK ADD  CONSTRAINT [gn_departamento$FKpais] FOREIGN KEY([codPais])
REFERENCES [dbo].[Gn_Pais] ([codPais])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gn_Departamentos] CHECK CONSTRAINT [gn_departamento$FKpais]
GO
ALTER TABLE [dbo].[Gn_DetalleMenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkmenu] FOREIGN KEY([codMenu])
REFERENCES [dbo].[Gn_Menu] ([codMenu])
GO
ALTER TABLE [dbo].[Gn_DetalleMenu] CHECK CONSTRAINT [gn_detallemenu$fkmenu]
GO
ALTER TABLE [dbo].[Gn_DetalleMenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkprograma] FOREIGN KEY([codPrograma])
REFERENCES [dbo].[Gn_Programas] ([codPrograma])
GO
ALTER TABLE [dbo].[Gn_DetalleMenu] CHECK CONSTRAINT [gn_detallemenu$fkprograma]
GO
ALTER TABLE [dbo].[Gn_DetalleMenu]  WITH NOCHECK ADD  CONSTRAINT [gn_detallemenu$fkroll] FOREIGN KEY([codRol])
REFERENCES [dbo].[Gn_Roles] ([codRol])
GO
ALTER TABLE [dbo].[Gn_DetalleMenu] CHECK CONSTRAINT [gn_detallemenu$fkroll]
GO
ALTER TABLE [dbo].[Gn_DetalleRol]  WITH NOCHECK ADD  CONSTRAINT [gn_detallerol$fkrol] FOREIGN KEY([codRol])
REFERENCES [dbo].[Gn_Roles] ([codRol])
GO
ALTER TABLE [dbo].[Gn_DetalleRol] CHECK CONSTRAINT [gn_detallerol$fkrol]
GO
ALTER TABLE [dbo].[Gn_DocAdjuntos]  WITH CHECK ADD  CONSTRAINT [FK_Gn_DocAdjuntos_Gn_TipoDocumentos] FOREIGN KEY([tipDocumento])
REFERENCES [dbo].[Gn_TipoDocumentos] ([codTipoDocumentos])
GO
ALTER TABLE [dbo].[Gn_DocAdjuntos] CHECK CONSTRAINT [FK_Gn_DocAdjuntos_Gn_TipoDocumentos]
GO
ALTER TABLE [dbo].[Gn_DocAdjuntos]  WITH NOCHECK ADD  CONSTRAINT [gn_documentosadjuntostercero$fktercero] FOREIGN KEY([codTercero])
REFERENCES [dbo].[Bi_Terceros] ([codTercero])
GO
ALTER TABLE [dbo].[Gn_DocAdjuntos] CHECK CONSTRAINT [gn_documentosadjuntostercero$fktercero]
GO
ALTER TABLE [dbo].[Gn_Municipios]  WITH CHECK ADD  CONSTRAINT [FK_Gn_Municipio_Gn_Departamento] FOREIGN KEY([codDepartamento])
REFERENCES [dbo].[Gn_Departamentos] ([codDepartamento])
GO
ALTER TABLE [dbo].[Gn_Municipios] CHECK CONSTRAINT [FK_Gn_Municipio_Gn_Departamento]
GO
ALTER TABLE [dbo].[Gn_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_gn_usuario_bi_tercero] FOREIGN KEY([codTercero])
REFERENCES [dbo].[Bi_Terceros] ([codTercero])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gn_Usuarios] CHECK CONSTRAINT [FK_gn_usuario_bi_tercero]
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto]  WITH CHECK ADD  CONSTRAINT [FK_Pe_DetallePresupuesto_bi_proveedores1] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[Bi_Proveedores] ([codProveedor])
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto] CHECK CONSTRAINT [FK_Pe_DetallePresupuesto_bi_proveedores1]
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto]  WITH CHECK ADD  CONSTRAINT [FK_Pe_DetallePresupuesto_bi_tercero] FOREIGN KEY([codTomador])
REFERENCES [dbo].[Bi_Terceros] ([codTercero])
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto] CHECK CONSTRAINT [FK_Pe_DetallePresupuesto_bi_tercero]
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto]  WITH NOCHECK ADD  CONSTRAINT [pe_detallepresupuesto$FK] FOREIGN KEY([codFactura])
REFERENCES [dbo].[Pr_Facturacion] ([codFactura])
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto] CHECK CONSTRAINT [pe_detallepresupuesto$FK]
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto]  WITH NOCHECK ADD  CONSTRAINT [pe_detallepresupuesto$FK4pres] FOREIGN KEY([codPresupuesto])
REFERENCES [dbo].[Pe_AsignacionPresupuestos] ([codPresupuesto])
GO
ALTER TABLE [dbo].[Pe_DetallePresupuesto] CHECK CONSTRAINT [pe_detallepresupuesto$FK4pres]
GO
ALTER TABLE [dbo].[Pr_Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_Pr_Facturacion_be_TipoBeneficios] FOREIGN KEY([codServicio])
REFERENCES [dbo].[Be_Tipobeneficios] ([codServicio])
GO
ALTER TABLE [dbo].[Pr_Facturacion] CHECK CONSTRAINT [FK_Pr_Facturacion_be_TipoBeneficios]
GO
ALTER TABLE [dbo].[Pr_ValoresServicios]  WITH NOCHECK ADD  CONSTRAINT [pr_valoresservicioproveedor$FKtservici] FOREIGN KEY([tipBeneficio])
REFERENCES [dbo].[Be_Tipobeneficios] ([codServicio])
GO
ALTER TABLE [dbo].[Pr_ValoresServicios] CHECK CONSTRAINT [pr_valoresservicioproveedor$FKtservici]
GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 22/10/2016 10:08:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [rds_deny_backups_trigger] ON DATABASE WITH EXECUTE AS 'dbo' FOR
 ADD_ROLE_MEMBER, GRANT_DATABASE AS BEGIN
   SET NOCOUNT ON;
   SET ANSI_PADDING ON;
 
   DECLARE @data xml;
   DECLARE @user sysname;
   DECLARE @role sysname;
   DECLARE @type sysname;
   DECLARE @sql NVARCHAR(MAX);
   DECLARE @permissions TABLE(name sysname PRIMARY KEY);
   
   SELECT @data = EVENTDATA();
   SELECT @type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    
   IF @type = 'ADD_ROLE_MEMBER' BEGIN
      SELECT @user = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
       @role = @data.value('(/EVENT_INSTANCE/RoleName)[1]', 'sysname');

      IF @role IN ('db_owner', 'db_backupoperator') BEGIN
         SELECT @sql = 'DENY BACKUP DATABASE, BACKUP LOG TO ' + QUOTENAME(@user);
         EXEC(@sql);
      END
   END ELSE IF @type = 'GRANT_DATABASE' BEGIN
      INSERT INTO @permissions(name)
      SELECT Permission.value('(text())[1]', 'sysname') FROM
       @data.nodes('/EVENT_INSTANCE/Permissions/Permission')
      AS DatabasePermissions(Permission);
      
      IF EXISTS (SELECT * FROM @permissions WHERE name IN ('BACKUP DATABASE',
       'BACKUP LOG'))
         RAISERROR('Cannot grant backup database or backup log', 15, 1) WITH LOG;       
   END
END


GO
ENABLE TRIGGER [rds_deny_backups_trigger] ON DATABASE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.be_solicitudbeneficios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Be_solicitud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.be_tipobeneficio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Be_Tipobeneficios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.be_tiposervicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Be_TipoServicios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_beneficiariosempleados' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bi_Beneficiarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_datosempleado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bi_Empleados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_datosproveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bi_Proveedores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.bi_datosterceros' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bi_Terceros'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_Departamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_detallemenu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_DetalleMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_detallerol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_DetalleRol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_documentosadjuntostercero' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_DocAdjuntos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_municipio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_Municipios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_Pais'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_programassistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_Programas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_roles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_Roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_tipodocumentosadjuntos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_TipoDocumentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.gn_usuarios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gn_Usuarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pe_asignacionpresupuesto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pe_AsignacionPresupuestos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pe_detallepresupuesto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pe_DetallePresupuesto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pr_facturacionproveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pr_Facturacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sipre.pr_valoresservicioproveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pr_ValoresServicios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[12] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -3772
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "de"
            Begin Extent = 
               Top = 11
               Left = 385
               Bottom = 141
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mu"
            Begin Extent = 
               Top = 264
               Left = 625
               Bottom = 394
               Right = 834
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'gn_divPolitica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'gn_divPolitica'
GO
USE [master]
GO
ALTER DATABASE [SIPRE] SET  READ_WRITE 
GO
