USE [master]
GO
/****** Object:  Database [FerreteriaJackelin]    Script Date: 23/08/2023 07:34:49 p. m. ******/
CREATE DATABASE [FerreteriaJackelin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FerreteriaJackelin', FILENAME = N'C:\Users\Y\Desktop\archivos no pertecientes a la empresa\MSSQL16.SQLEXPRESS01\MSSQL\DATA\FerreteriaJackelin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FerreteriaJackelin_log', FILENAME = N'C:\Users\Y\Desktop\archivos no pertecientes a la empresa\MSSQL16.SQLEXPRESS01\MSSQL\DATA\FerreteriaJackelin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FerreteriaJackelin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FerreteriaJackelin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FerreteriaJackelin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET ARITHABORT OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FerreteriaJackelin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FerreteriaJackelin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FerreteriaJackelin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FerreteriaJackelin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FerreteriaJackelin] SET  MULTI_USER 
GO
ALTER DATABASE [FerreteriaJackelin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FerreteriaJackelin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FerreteriaJackelin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FerreteriaJackelin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FerreteriaJackelin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FerreteriaJackelin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FerreteriaJackelin] SET QUERY_STORE = ON
GO
ALTER DATABASE [FerreteriaJackelin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FerreteriaJackelin]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 23/08/2023 07:34:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Cliente_id] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](200) NULL,
	[Codigo] [int] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesVenta]    Script Date: 23/08/2023 07:34:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesVenta](
	[Detalle_id] [int] NOT NULL,
	[Venta_id] [int] NULL,
	[Producto_id] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](10, 2) NULL,
 CONSTRAINT [PK_DetallesVenta] PRIMARY KEY CLUSTERED 
(
	[Detalle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 23/08/2023 07:34:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Producto_id] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Categoria] [varchar](100) NULL,
	[Descripcion] [varchar](250) NULL,
	[Precio] [decimal](10, 2) NULL,
	[Cantidad] [int] NULL,
	[Detalle_id] [int] NULL,
	[Cliente_id] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 23/08/2023 07:34:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Proveerdor_id] [int] NOT NULL,
	[NombreEmpresa] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Proveerdor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 23/08/2023 07:34:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Ventas_id] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Cantidad] [decimal](10, 2) NULL,
	[Proveedor_id] [int] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Ventas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (1, N'Maria', N'8096754321', N'mariaelena6@gmail.com ', 77771)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (2, N'Estefani', N'8495674532', N'estdm90@gmail.com ', 77772)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (3, N'Tracy', N'8097653231', N'tracyrat43@gmail.com ', 77773)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (4, N'Veronica', N'8294306758', N'veronic34@gmail.com ', 77774)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (5, N'Alan', N'8096054637', N'alandemen4@gmail.com ', 77775)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (6, N'Gino', N'8297653452', N'ginomt6@gmail.com ', 77776)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (7, N'Alex', N'8095432678', N'alexcvv78@gmail.com ', 77777)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (8, N'Michael', N'8094563214', N'michaeljack7@gmail.com ', 77778)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (9, N'Caroline', N'8296547382', N'carobmm67@gmail.com', 77779)
INSERT [dbo].[Clientes] ([Cliente_id], [Nombre], [Telefono], [Correo], [Codigo]) VALUES (10, N'Maciel', N'8092335567 ', N'macielkmm90@gmail.com', NULL)
GO
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (1, 1, 1, 100, CAST(45.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (2, 3, 2, 45, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (3, 4, 3, 25, CAST(38.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (4, 5, 4, 59, CAST(94.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (5, 6, 5, 80, CAST(75.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (6, 7, 6, 32, CAST(68.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (7, 8, 7, 28, CAST(69.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (8, 9, 8, 12, CAST(18.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (9, 10, 9, 18, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([Detalle_id], [Venta_id], [Producto_id], [Cantidad], [PrecioUnitario]) VALUES (10, 2, 10, 20, CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (1, N'Pistola de calor', N'Herramienta electrica', N'peso: 2.14 lib, potencia: 1500 w, temperatura 250 grado', CAST(1525.00 AS Decimal(10, 2)), 150, 1, 2)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (2, N'sierra caladora', N'Herramienta electrica', N'potencia 400 w y tiene 6 velocidades ', CAST(2000.00 AS Decimal(10, 2)), 100, 2, 4)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (3, N'alicate', N'Herramienta manuales', N'cuerpo forjado de acero 200mm', CAST(250.00 AS Decimal(10, 2)), 95, 3, 6)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (4, N'Cinta metrica', N'Herramienta manuales', N'diseño ergonomico 10 Ft', CAST(500.00 AS Decimal(10, 2)), 85, 4, 7)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (5, N'Pulidora', N'Herramienta electrica', N'potencia 11.2 amp 6 velocidades', CAST(1500.00 AS Decimal(10, 2)), 20, 5, 9)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (6, N'Taladro', N'Herramienta electrica', N'inalambrico, 12 voltio, cabeza doble 50 mm', CAST(3100.00 AS Decimal(10, 2)), 40, 6, 1)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (7, N'detornillador punta plana ', N'Herramienta manuales', N'hoja de cromo, punta magnetica ', CAST(220.00 AS Decimal(10, 2)), 60, 7, 3)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (8, N'broca', N'accesorio', N'mecha 1/2 compatible con todos los taladros', CAST(150.00 AS Decimal(10, 2)), 10, 8, 5)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (9, N'disco', N'accesorio', N'pro-abrao 141 angulo de 4 pulgadas ', CAST(325.00 AS Decimal(10, 2)), 100, 9, 8)
INSERT [dbo].[Producto] ([Producto_id], [Nombre], [Categoria], [Descripcion], [Precio], [Cantidad], [Detalle_id], [Cliente_id]) VALUES (10, N'Pistola de calor', N'Herramienta eléctrica', N'peso: 2.14 lib, potencia: 1500 w, temperatura 250 grado', CAST(413.00 AS Decimal(10, 2)), 2, 10, NULL)
GO
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (1, N'truper', N'valle del este calle hatuey ', N'8096754321', N'trupeune87@gmail.com')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (2, N'almacenes loza', N'brisa del este calle hipica ', N'8495674532', N'
loza0982t@gmail.com
')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (3, N'cadena comercial', N'los mameyes calle#7', N'8097653231', N'comerci987l@gmail.com')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (4, N'comercializadora colonial', N'los frailesII calle#09', N'8294306758', N'tcoloni65@gmail.com ')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (5, N'stezac', N'mendoza calle los prados', N'8096054637', N'tzatesac7@gmail.com ')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (6, N'distribuidora perales', N'Herrera calle el café', N'8297653452', N'dperales45@gmail.com')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (7, N'alvaro obregon', N'los tres ojos calle#21', N'8095432678', N'obregonV2@gmail.com ')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (8, N'rodrigues serrano IN', N'los mameyes calle#26', N'8094563214', N'serranolkm@gmail.com')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (9, N'Gate retail', N'valle del este calle mirador#3', N'8296547382', N'ratil89mn@gmail.com')
INSERT [dbo].[Proveedores] ([Proveerdor_id], [NombreEmpresa], [Direccion], [Telefono], [Correo]) VALUES (10, N'comercializadora PT', N'los minas calle#65', N'8092335567', NULL)
GO
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (1, CAST(N'2022-04-05' AS Date), CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (2, CAST(N'2022-06-04' AS Date), CAST(45.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (3, CAST(N'2022-07-03' AS Date), CAST(38.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (4, CAST(N'2023-03-13' AS Date), CAST(94.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (5, CAST(N'2023-07-04' AS Date), CAST(75.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (6, CAST(N'2023-05-07' AS Date), CAST(68.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (7, CAST(N'2023-05-10' AS Date), CAST(69.00 AS Decimal(10, 2)), 6)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (8, CAST(N'2022-07-06' AS Date), CAST(18.00 AS Decimal(10, 2)), 7)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (9, CAST(N'2023-03-29' AS Date), CAST(20.00 AS Decimal(10, 2)), 8)
INSERT [dbo].[Ventas] ([Ventas_id], [Fecha], [Cantidad], [Proveedor_id]) VALUES (10, CAST(N'2023-04-23' AS Date), CAST(10.00 AS Decimal(10, 2)), NULL)
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetallesVenta_Producto] FOREIGN KEY([Producto_id])
REFERENCES [dbo].[Producto] ([Producto_id])
GO
ALTER TABLE [dbo].[DetallesVenta] CHECK CONSTRAINT [FK_DetallesVenta_Producto]
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetallesVenta_Ventas] FOREIGN KEY([Venta_id])
REFERENCES [dbo].[Ventas] ([Ventas_id])
GO
ALTER TABLE [dbo].[DetallesVenta] CHECK CONSTRAINT [FK_DetallesVenta_Ventas]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Clientes] FOREIGN KEY([Cliente_id])
REFERENCES [dbo].[Clientes] ([Cliente_id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Clientes]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_DetallesVenta] FOREIGN KEY([Detalle_id])
REFERENCES [dbo].[DetallesVenta] ([Detalle_id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_DetallesVenta]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Proveedores] FOREIGN KEY([Proveedor_id])
REFERENCES [dbo].[Proveedores] ([Proveerdor_id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Proveedores]
GO
USE [master]
GO
ALTER DATABASE [FerreteriaJackelin] SET  READ_WRITE 
GO
