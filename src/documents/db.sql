USE [master]
GO
/****** Object:  Database [LucilApp_DataBase]    Script Date: 14/6/2024 08:29:04 ******/
CREATE DATABASE [LucilApp_DataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LucilApp_BataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LucilApp_BataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LucilApp_BataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LucilApp_BataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LucilApp_DataBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LucilApp_DataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LucilApp_DataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LucilApp_DataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LucilApp_DataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LucilApp_DataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LucilApp_DataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [LucilApp_DataBase] SET  MULTI_USER 
GO
ALTER DATABASE [LucilApp_DataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LucilApp_DataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LucilApp_DataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LucilApp_DataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LucilApp_DataBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LucilApp_DataBase', N'ON'
GO
ALTER DATABASE [LucilApp_DataBase] SET QUERY_STORE = OFF
GO
USE [LucilApp_DataBase]
GO
/****** Object:  User [username]    Script Date: 14/6/2024 08:29:04 ******/
CREATE USER [username] FOR LOGIN [username] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 14/6/2024 08:29:04 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [username]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [username]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Pendientes] [int] NOT NULL,
	[TiempoTarea] [int] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria_Filtro]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria_Filtro](
	[IdCategoria] [int] NOT NULL,
	[IdFiltro] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Edad] [int] NULL,
	[Genero] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filtro]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filtro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Filtro_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MetodoPago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacion]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Notificacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Tomada] [bit] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdUsuario] [int] NULL,
	[TiempoCreacion] [datetime] NULL,
 CONSTRAINT [PK_Tarea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
	[Contrasenia] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Dni] [varchar](50) NOT NULL,
	[Validado] [bit] NOT NULL,
	[Nivel] [int] NOT NULL,
	[Saldo] [float] NOT NULL,
	[CantSolucionadas] [int] NOT NULL,
	[IdIdioma] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Categoria]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Categoria](
	[IdUsuario] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_MetodoPago]    Script Date: 14/6/2024 08:29:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_MetodoPago](
	[IdUsuario] [int] NOT NULL,
	[IdMetodoPago] [int] NOT NULL,
	[Cbu] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nombre], [Pendientes], [TiempoTarea]) VALUES (3, N'Excel', 2, 4)
INSERT [dbo].[Categoria] ([Id], [Nombre], [Pendientes], [TiempoTarea]) VALUES (4, N'Instagram', 3, 7)
INSERT [dbo].[Categoria] ([Id], [Nombre], [Pendientes], [TiempoTarea]) VALUES (6, N'Sacar_Turno', 1, 2)
INSERT [dbo].[Categoria] ([Id], [Nombre], [Pendientes], [TiempoTarea]) VALUES (7, N'YouTube', 1, 1)
INSERT [dbo].[Categoria] ([Id], [Nombre], [Pendientes], [TiempoTarea]) VALUES (9, N'Instalar_Apps', 1, 2)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
INSERT [dbo].[Categoria_Filtro] ([IdCategoria], [IdFiltro]) VALUES (6, 1)
INSERT [dbo].[Categoria_Filtro] ([IdCategoria], [IdFiltro]) VALUES (4, 2)
INSERT [dbo].[Categoria_Filtro] ([IdCategoria], [IdFiltro]) VALUES (3, 2)
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (1, N'Raul', 11111112, 87, N'Masculino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (2, N'Martha', 11111113, 93, N'Femenino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (3, N'Humberto', 11111114, 83, N'Masculino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (4, N'Alfio', 11111115, 75, N'Masculino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (5, N'Sandra', 11111116, 82, N'Femenino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (6, N'Lucrecia', 11111117, 94, N'Femenino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (7, N'Salome', 11111118, 80, N'Femenino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (8, N'Ernesto', 11111119, 86, N'Masculino')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Telefono], [Edad], [Genero]) VALUES (9, N'Guillermo', 11111120, 78, N'Masculino')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Filtro] ON 

INSERT [dbo].[Filtro] ([Id], [Nombre]) VALUES (1, N'Medico')
INSERT [dbo].[Filtro] ([Id], [Nombre]) VALUES (2, N'Apps')
SET IDENTITY_INSERT [dbo].[Filtro] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([Id], [Nombre]) VALUES (1, N'Mercado_Pago')
INSERT [dbo].[MetodoPago] ([Id], [Nombre]) VALUES (2, N'Banco_Galicia')
SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarea] ON 

INSERT [dbo].[Tarea] ([Id], [Descripcion], [Tomada], [IdCategoria], [IdCliente], [IdUsuario], [TiempoCreacion]) VALUES (1, N'No se como guardar el excel', 0, 3, 1, NULL, CAST(N'2024-03-20T13:00:00.000' AS DateTime))
INSERT [dbo].[Tarea] ([Id], [Descripcion], [Tomada], [IdCategoria], [IdCliente], [IdUsuario], [TiempoCreacion]) VALUES (2, N'Quiero crear un usuario de instagram', 1, 4, 1, 1, CAST(N'2024-03-20T14:00:00.000' AS DateTime))
INSERT [dbo].[Tarea] ([Id], [Descripcion], [Tomada], [IdCategoria], [IdCliente], [IdUsuario], [TiempoCreacion]) VALUES (5, N'Quiero subir un video a youtube', 0, 7, 8, 5, CAST(N'2024-03-20T15:00:00.000' AS DateTime))
INSERT [dbo].[Tarea] ([Id], [Descripcion], [Tomada], [IdCategoria], [IdCliente], [IdUsuario], [TiempoCreacion]) VALUES (6, N'Quiero sacar un turno para una resonancia', 0, 6, 4, 3, CAST(N'2024-03-20T16:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tarea] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nombre], [Foto], [Contrasenia], [Mail], [Telefono], [Dni], [Validado], [Nivel], [Saldo], [CantSolucionadas], [IdIdioma]) VALUES (1, N'Julio', NULL, N'Julio123', N'Julio@gmail.com', 11111111, N'1', 0, 2, 6000, 18, 1)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Foto], [Contrasenia], [Mail], [Telefono], [Dni], [Validado], [Nivel], [Saldo], [CantSolucionadas], [IdIdioma]) VALUES (3, N'Santiago', NULL, N'Santi123', N'Santi@gmail.com', 21111111, N'2', 1, 1, 500, 1, 1)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Foto], [Contrasenia], [Mail], [Telefono], [Dni], [Validado], [Nivel], [Saldo], [CantSolucionadas], [IdIdioma]) VALUES (4, N'Marcos', NULL, N'Marcos123', N'Marcos@gmail.com', 31111111, N'3', 1, 3, 4000, 25, 1)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Foto], [Contrasenia], [Mail], [Telefono], [Dni], [Validado], [Nivel], [Saldo], [CantSolucionadas], [IdIdioma]) VALUES (5, N'Agostina', NULL, N'Agos123', N'Agos@gmail.com', 41111111, N'4', 0, 1, 0, 0, 1)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Foto], [Contrasenia], [Mail], [Telefono], [Dni], [Validado], [Nivel], [Saldo], [CantSolucionadas], [IdIdioma]) VALUES (6, N'Ivan', NULL, N'Ivan123', N'Ivan@gmail.com', 51111111, N'5', 1, 2, 1500, 3, 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[Usuario_Categoria] ([IdUsuario], [IdCategoria]) VALUES (1, 3)
INSERT [dbo].[Usuario_Categoria] ([IdUsuario], [IdCategoria]) VALUES (1, 4)
GO
INSERT [dbo].[Usuario_MetodoPago] ([IdUsuario], [IdMetodoPago], [Cbu]) VALUES (1, 1, 999999)
INSERT [dbo].[Usuario_MetodoPago] ([IdUsuario], [IdMetodoPago], [Cbu]) VALUES (1, 2, 888888)
GO
ALTER TABLE [dbo].[Categoria_Filtro]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Filtro_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Categoria_Filtro] CHECK CONSTRAINT [FK_Categoria_Filtro_Categoria]
GO
ALTER TABLE [dbo].[Categoria_Filtro]  WITH CHECK ADD  CONSTRAINT [FK_Categoria_Filtro_Filtro] FOREIGN KEY([IdFiltro])
REFERENCES [dbo].[Filtro] ([Id])
GO
ALTER TABLE [dbo].[Categoria_Filtro] CHECK CONSTRAINT [FK_Categoria_Filtro_Filtro]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_Usuario]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Categoria]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Cliente]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Usuario]
GO
ALTER TABLE [dbo].[Usuario_Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Categoria_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Usuario_Categoria] CHECK CONSTRAINT [FK_Usuario_Categoria_Categoria]
GO
ALTER TABLE [dbo].[Usuario_Categoria]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Categoria_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Usuario_Categoria] CHECK CONSTRAINT [FK_Usuario_Categoria_Usuario]
GO
ALTER TABLE [dbo].[Usuario_MetodoPago]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_MetodoPago_MetodoPago] FOREIGN KEY([IdMetodoPago])
REFERENCES [dbo].[MetodoPago] ([Id])
GO
ALTER TABLE [dbo].[Usuario_MetodoPago] CHECK CONSTRAINT [FK_Usuario_MetodoPago_MetodoPago]
GO
ALTER TABLE [dbo].[Usuario_MetodoPago]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_MetodoPago_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Usuario_MetodoPago] CHECK CONSTRAINT [FK_Usuario_MetodoPago_Usuario]
GO
USE [master]
GO
ALTER DATABASE [LucilApp_DataBase] SET  READ_WRITE 
GO

CREATE LOGIN [username] WITH PASSWORD = 'root';

USE [LucilApp_DataBase];
CREATE USER [username] FOR LOGIN [username];

EXEC sp_addrolemember 'db_datareader', 'username';
EXEC sp_addrolemember 'db_datawriter', 'username';