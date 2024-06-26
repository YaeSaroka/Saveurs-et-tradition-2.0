USE [master]
GO
/****** Object:  Database [Saveurs]    Script Date: 12/4/2024 12:02:05 ******/
CREATE DATABASE [Saveurs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Saveurs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Saveurs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Saveurs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Saveurs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Saveurs] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Saveurs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Saveurs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Saveurs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Saveurs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Saveurs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Saveurs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Saveurs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Saveurs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Saveurs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Saveurs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Saveurs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Saveurs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Saveurs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Saveurs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Saveurs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Saveurs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Saveurs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Saveurs] SET RECOVERY FULL 
GO
ALTER DATABASE [Saveurs] SET  MULTI_USER 
GO
ALTER DATABASE [Saveurs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Saveurs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Saveurs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Saveurs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Saveurs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Saveurs', N'ON'
GO
ALTER DATABASE [Saveurs] SET QUERY_STORE = OFF
GO
USE [Saveurs]
GO
/****** Object:  User [alumno]    Script Date: 12/4/2024 12:02:05 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] NOT NULL,
	[NombreCategoria] [varchar](200) NULL,
	[Descripcion] [varchar](500) NULL,
	[Imagen] [varchar](150) NULL,
	[Banner] [varchar](500) NULL,
 CONSTRAINT [PK__Categori__A3C02A100680C461] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[IdIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Ingrediente] [varchar](150) NOT NULL,
 CONSTRAINT [PK__Ingredie__3DA4DD60CCC790B6] PRIMARY KEY CLUSTERED 
(
	[IdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdCategoria] [int] NOT NULL,
	[Imagen] [varchar](200) NULL,
	[Titulo] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[Pasos] [varchar](50) NULL,
	[CantidadPersonas] [int] NULL,
	[Tiempo] [varchar](50) NULL,
	[Precio] [int] NULL,
	[Video] [varchar](150) NULL,
	[Ingredientes] [varchar](max) NULL,
	[Cantidad] [varchar](max) NULL,
 CONSTRAINT [PK__Receta__2CEFF1570F5578D6] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta_Carrousel]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta_Carrousel](
	[IdRecetaCarrousel] [int] NOT NULL,
	[IdReceta] [int] NOT NULL,
 CONSTRAINT [PK__Receta_C__1441D1D26561C84A] PRIMARY KEY CLUSTERED 
(
	[IdRecetaCarrousel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetaxIngrediente]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaxIngrediente](
	[IdRecetaxIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [varchar](50) NOT NULL,
	[IdReceta] [int] NULL,
	[IdIngrediente] [int] NOT NULL,
 CONSTRAINT [PK_RecetaxIngrediente] PRIMARY KEY CLUSTERED 
(
	[IdRecetaxIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Mail] [varchar](200) NOT NULL,
	[Contraseña] [varchar](200) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Foto] [varchar](200) NULL,
	[IdRecetaFavorita] [int] NULL,
 CONSTRAINT [PK__Usuario__5B65BF97C9B713E0] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (1, N'Pastas', N'ff', N'https://media.ambito.com/p/eeeb0aa8490c86a5ed10e052acb243d0/adjuntos/239/imagenes/039/444/0039444907/pastasjpg.jpg ', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (2, N'Carnes', N'dd', N'https://media.gq.com.mx/photos/620bcf7243f71a078a355280/master/pass/carnes-85650597.jpg', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (3, N'Postres', NULL, N'https://www.clara.es/medio/2021/11/28/postres-navidenos_3f462fd7_1280x1115.jpg', NULL)
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (4, N'Ensaladas', N'gg', N'https://s1.abcstatics.com/media/gurmesevilla/2013/08/ensalada-caribena.jpg', N'ENSALADAS_DE_LA_HUERTA.png')
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 

INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (1, N'tomate')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (2, N'lechuga')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (3, N'cebolla')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (4, N'ajo')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (5, N'perejil')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (6, N'atun')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (7, N'pepino')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (8, N'pimiento')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (9, N'sal')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (10, N'aceite de oliva')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (11, N'vinagre')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (12, N'maiz')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (13, N'leche')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (14, N'azúcar morena')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (15, N'naranja')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (16, N'vainilla')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (17, N'maizena')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (18, N'agua')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (19, N'licor')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (20, N'crema')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (21, N'cocoa')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (22, N'fresas')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (23, N'canela')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (24, N'bizcocho')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (25, N'peras')
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta] ON 

INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (1, 1, 4, N'https://imag.bonviveur.com/imagen-de-la-ensalada-mixta.jpg', N'Ensalada Mixta, estilo español', N'Si estás buscando una opción saludable y deliciosa para tu próxima comida...?
 ¡has llegado al lugar adecuado! 

Esta ensalada es una combinación perfecta de sabores frescos y coloridos que te harán disfrutar de cada bocado.', N'1', 2, N'10 minutos', 1600, N'https://www.youtube.com/embed/hH1ZldJGqKs?si=7vopT9qk8yAqe1t6', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (2, 2, 4, N'https://assets.unileversolutions.com/recipes-v2/248351.jpg', N'Sopa Inglesa Italiana', N'Delicia', N'2', 4, N'1 hora', 3500, N'https://www.youtube.com/watch?v=xCPRPPtifuE', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (3, 3, 4, N'https://assets.elgourmet.com/wp-content/uploads/2023/03/cover_w57l6qc9hj_iv-29-dic-54-1024x683.jpg.webp', N'CheeseCake', N'rico', N'3', 4, N'1 hora', 3000, N'VIDEO 3', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (4, 4, 4, N'https://www.recetasnestle.com.ec/sites/default/files/styles/recipe_detail_desktop/public/srh_recipes/7985d6cf276630976f2f84d561de8dd3.jpg?itok=S6rRF0Fy', N'Estofado de Carne típico', N'tradicional y rico', N'4', 6, N'1 hora', 3500, N'https://www.youtube.com/watch?v=-lcDJpgT2TM6rRF0Fy', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (8, 1, 1, NULL, N'sss', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (9, 1, 4, NULL, N'ggg', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (10, 2, 4, NULL, N'hhh', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
INSERT [dbo].[Receta_Carrousel] ([IdRecetaCarrousel], [IdReceta]) VALUES (1, 1)
INSERT [dbo].[Receta_Carrousel] ([IdRecetaCarrousel], [IdReceta]) VALUES (2, 3)
GO
SET IDENTITY_INSERT [dbo].[RecetaxIngrediente] ON 

INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (1, N'media mediana', 1, 2)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (2, N'200', 2, 2)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (3, N'1', 3, 3)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (4, N'2 maduros', 1, 1)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (5, N'2 latas pequeñas', 1, 6)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (6, N'1 mediano', 1, 7)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (7, N'1 pequeña', 1, 3)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (8, N'medio mediano', 1, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (9, N'lata pequeña', 1, 12)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (10, N'a gusto', 1, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (11, N'a gusto', 1, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (12, N'a gusto', 1, 11)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (13, N'1 taza', 2, 13)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (14, N'120 gramos o 4 cdas', 2, 14)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (15, N'1 cascara', 2, 15)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (16, N'una pizca o una rajita', 2, 22)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (17, N'1 cdita', 2, 16)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (18, N'2 cdas', 2, 17)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (19, N'30 ml', 2, 18)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (20, N'100 gr', 2, 14)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (21, N'1/2 taza', 2, 18)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (22, N'30 ml', 2, 19)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (23, N'1/2 taza', 2, 20)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (24, N'a gusto', 2, 21)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (25, N'a gusto', 2, 22)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (26, N'El que tengas', 2, 24)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (27, N'1', 8, 4)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (28, N'1', 9, 4)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (29, N'1', 10, 4)
SET IDENTITY_INSERT [dbo].[RecetaxIngrediente] OFF
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (1, N'admin@gmail.com', N'123', N'admin', N'https://tork.news/__export/1648489549559/sites/tork/img/2022/03/28/92832.png_521680808.png', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (2, N'tom.as@gmail.com', N'tommm111', N'tomi_2', N'https://pbs.twimg.com/media/FYZuyRuXwAA75yd?format=jpg&name=large', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (3, N'tito_donQuijote@hotmail.com', N'delamancha', N'tito_de_lamancha', N'https://www.bbva.com/wp-content/uploads/2016/03/don-quijote-de-la-mancha-1920x0-c-f-1.jpg', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (4, N'olioli1406@gmail.com', N'oliiEliteamor', N'oli_vivi', N'https://media.vogue.es/photos/60af7ee155ce5f590cf4642a/2:3/w_2560%2Cc_limit/GettyImages-1317477121.jpg', NULL)
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Categoria]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Usuario]
GO
ALTER TABLE [dbo].[Receta_Carrousel]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Carrousel_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[Receta_Carrousel] CHECK CONSTRAINT [FK_Receta_Carrousel_Receta]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Ingrediente1] FOREIGN KEY([IdIngrediente])
REFERENCES [dbo].[Ingrediente] ([IdIngrediente])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Ingrediente1]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Receta]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Receta1] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Receta1]
GO
/****** Object:  StoredProcedure [dbo].[AgregarIngrediente]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarIngrediente]
	-- Add the parameters for the stored procedure here
	@IdReceta INT, @IdIngrediente INT, @Cantidad varchar(650)
AS
BEGIN
	insert into RecetaxIngrediente (IdReceta, IdIngrediente, Cantidad)
	values( @IdReceta, @IdIngrediente, @Cantidad);
END

GO
/****** Object:  StoredProcedure [dbo].[AgregarIngredienteAdmin]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarIngredienteAdmin]
	-- Add the parameters for the stored procedure here
	@Nombre_Ingrediente varchar(650)
AS
BEGIN
	INSERT INTO Ingrediente(Nombre_Ingrediente)
	VALUES (@Nombre_Ingrediente)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarReceta]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarReceta]
	-- Add the parameters for the stored procedure here
	@IdCategoria INT, @Imagen varchar(500), @Titulo varchar(150), @Descripcion varchar(150),@Pasos varchar(5000),@CantidadPersonas INT,@Tiempo INT,@Precio INT,@Video varchar(650),@IdUsuario int
AS
BEGIN
	INSERT INTO Receta (Imagen, Titulo, Descripcion, Pasos, CantidadPersonas, Tiempo, Precio, Video, IdCategoria,IdUsuario)
	VALUES (@Imagen, @Titulo, @Descripcion, @Pasos, @CantidadPersonas, @Tiempo, @Precio, @Video, @IdCategoria, @IdUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPorIngrediente]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarPorIngrediente]
	-- Add the parameters for the stored procedure here
	@NombreIngrediente varchar
AS
BEGIN
	SELECT IdIngrediente FROM Ingrediente WHERE @NombreIngrediente = Nombre_Ingrediente and IdIngrediente IN (SELECT IdReceta FROM RecetaxIngrediente)
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPorReceta]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* BUSCADOR*/
CREATE PROCEDURE [dbo].[BuscarPorReceta]
	-- Add the parameters for the stored procedure here
	@Titulo varchar
AS
BEGIN
	SELECT * FROM Receta WHERE @Titulo=Titulo
END
GO
/****** Object:  StoredProcedure [dbo].[CantidadesIngredientes]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CantidadesIngredientes]
	@IdReceta INT

AS
BEGIN
	SELECT RecetaxIngrediente.Cantidad FROM RecetaxIngrediente
	INNER JOIN Ingrediente ON RecetaxIngrediente.IdIngrediente=Ingrediente.IdIngrediente
	WHERE RecetaxIngrediente.IdReceta=@IdReceta
END

GO
/****** Object:  StoredProcedure [dbo].[CargarCategoriaCard]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarCategoriaCard]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT Categoria.* FROM Categoria 
END
GO
/****** Object:  StoredProcedure [dbo].[CargarCategoriaxId]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CargarCategoriaxId]
	-- Add the parameters for the stored procedure here
	@IdCategoria INT
AS
BEGIN
	SELECT * FROM Categoria WHERE @IdCategoria=IdCategoria
END

GO
/****** Object:  StoredProcedure [dbo].[CargarInfoUsuario]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarInfoUsuario]
	-- Add the parameters for the stored procedure here
	@IdUsuario INT
AS
BEGIN
	SELECT Mail, Username, Foto FROM Usuario WHERE @IdUsuario=IdUsuario
END

GO
/****** Object:  StoredProcedure [dbo].[CargarReceta]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* RECETAS*/
CREATE PROCEDURE [dbo].[CargarReceta]
	-- Add the parameters for the stored procedure here
	@IdReceta INT
AS
BEGIN
	SELECT * FROM Receta WHERE @IdReceta=IdReceta
END
GO
/****** Object:  StoredProcedure [dbo].[CargarRecetasCarrousel]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarRecetasCarrousel]
AS
BEGIN
	SELECT Receta.* FROM Receta_Carrousel 
		INNER JOIN Receta ON Receta.IdReceta = Receta_Carrousel.IdReceta
END
GO
/****** Object:  StoredProcedure [dbo].[CargarRecetaxCategoria]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CargarRecetaxCategoria]
	-- Add the parameters for the stored procedure here
	@IdCategoria INT
AS
BEGIN
	SELECT * FROM Receta WHERE @IdCategoria=IdCategoria
END

GO
/****** Object:  StoredProcedure [dbo].[Favoritos]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Favoritos]
	@IdReceta INT

AS
BEGIN
	SELECT * FROM Receta
	WHERE IdReceta=@IdReceta
END

GO
/****** Object:  StoredProcedure [dbo].[IngredientesModal]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IngredientesModal]
	@IdReceta INT

AS
BEGIN
	SELECT Ingrediente.Nombre_Ingrediente FROM Ingrediente
	INNER JOIN RecetaxIngrediente ON RecetaxIngrediente.IdIngrediente=Ingrediente.IdIngrediente
	WHERE RecetaxIngrediente.IdReceta=@IdReceta
END

GO
/****** Object:  StoredProcedure [dbo].[Login_VerificarContraseña]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login_VerificarContraseña]
	-- Add the parameters for the stored procedure here
	@Contraseña varchar(150)
AS
BEGIN
	SELECT Contraseña FROM Usuario WHERE  @Contraseña=Contraseña 
END

GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
	-- Add the parameters for the stored procedure here
	@pUsername varchar(150), @pContraseña varchar(150)
AS
BEGIN
	SELECT * FROM Usuario WHERE @pUsername=Username AND @pContraseña=Contraseña
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimaReceta]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUltimaReceta]
AS
BEGIN
	select max(IdReceta) as IdReceta from Receta
END

GO
/****** Object:  StoredProcedure [dbo].[OlvideMiContraseña]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OlvideMiContraseña]
	-- Add the parameters for the stored procedure here
	@Mail varchar(150)
AS
BEGIN
	SELECT Contraseña FROM Usuario WHERE @Mail=Mail
END

GO
/****** Object:  StoredProcedure [dbo].[Registro]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Registro]
	-- Add the parameters for the stored procedure here
	@Username varchar(150), @Contraseña varchar(150), @Mail varchar(150)
AS
BEGIN
	INSERT INTO Usuario(Username, Contraseña, Mail) VALUES (@Username, @Contraseña, @Mail)
END

GO
/****** Object:  StoredProcedure [dbo].[Registro_VerificarExistencia]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Registro_VerificarExistencia]
	-- Add the parameters for the stored procedure here
	@Username varchar
AS
BEGIN
	SELECT Username FROM Usuario WHERE @Username= Username
END
GO
/****** Object:  StoredProcedure [dbo].[TodosIngredientes]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TodosIngredientes]
AS
BEGIN 
	SELECT Nombre_Ingrediente FROM Ingrediente
END

GO
/****** Object:  StoredProcedure [dbo].[UnIngrediente]    Script Date: 12/4/2024 12:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UnIngrediente]
@Searching varchar(150)
AS
BEGIN 
	SELECT * FROM Ingrediente
	WHERE Nombre_Ingrediente LIKE CONCAT(@Searching, '%')
END

GO
USE [master]
GO
ALTER DATABASE [Saveurs] SET  READ_WRITE 
GO
