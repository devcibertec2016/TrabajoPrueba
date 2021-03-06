use master
go
create database DB_Trabajo_1
go
USE [DB_Trabajo_1]
GO
/****** Object:  Table [dbo].[tTR_Categoria]    Script Date: 11/02/2016 18:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tTR_Categoria](
	[iIdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[vNombreCategoria] [varchar](50) NULL,
	[iEstado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tTR_Producto]    Script Date: 11/02/2016 18:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tTR_Producto](
	[iIdProducto] [int] IDENTITY(1,1) NOT NULL,
	[iIdCategoria] [int] NULL,
	[iIdProveedor] [int] NULL,
	[vNombreProducto] [varchar](100) NULL,
	[vDescripcionProducto] [varchar](250) NULL,
	[nPrecioCompra] [decimal](18, 2) NULL,
	[nPrecioVenta] [decimal](18, 2) NULL,
	[iStockActual] [int] NULL,
	[iStockMinimo] [int] NULL,
	[iEstado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tTR_Proveedor]    Script Date: 11/02/2016 18:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tTR_Proveedor](
	[iIdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[vNombreProveedor] [varchar](25) NULL,
	[vRuc] [varchar](11) NULL,
	[vDireccion] [varchar](250) NULL,
	[vTelefono1] [varchar](9) NULL,
	[vTelefono2] [varchar](9) NULL,
	[iEstado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tTR_Roles]    Script Date: 11/02/2016 18:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tTR_Roles](
	[iIdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[vNombreRol] [varchar](100) NULL,
	[iEstado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iIdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tTR_Usuarios]    Script Date: 11/02/2016 18:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tTR_Usuarios](
	[iIdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[iIdRol] [int] NULL,
	[vNombreUsuario] [varchar](25) NOT NULL,
	[vPassword] [varchar](25) NULL,
	[vNombre] [varchar](100) NULL,
	[vApellidos] [varchar](250) NULL,
	[iEstado] [int] NULL,
	[sRutaImagen] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[vNombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tTR_Categoria] ON 

INSERT [dbo].[tTR_Categoria] ([iIdCategoria], [vNombreCategoria], [iEstado]) VALUES (1, N'Galletas', 1)
INSERT [dbo].[tTR_Categoria] ([iIdCategoria], [vNombreCategoria], [iEstado]) VALUES (3, N'Gaseosas', 1)
INSERT [dbo].[tTR_Categoria] ([iIdCategoria], [vNombreCategoria], [iEstado]) VALUES (4, N'Helados', 1)
INSERT [dbo].[tTR_Categoria] ([iIdCategoria], [vNombreCategoria], [iEstado]) VALUES (24, N'Comida China', 1)
INSERT [dbo].[tTR_Categoria] ([iIdCategoria], [vNombreCategoria], [iEstado]) VALUES (26, N'Agua', 1)
SET IDENTITY_INSERT [dbo].[tTR_Categoria] OFF
SET IDENTITY_INSERT [dbo].[tTR_Producto] ON 

INSERT [dbo].[tTR_Producto] ([iIdProducto], [iIdCategoria], [iIdProveedor], [vNombreProducto], [vDescripcionProducto], [nPrecioCompra], [nPrecioVenta], [iStockActual], [iStockMinimo], [iEstado]) VALUES (1, 3, 3, N'Inka Kolax', N'Gaseosa', CAST(1.80 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 100, 10, 1)
INSERT [dbo].[tTR_Producto] ([iIdProducto], [iIdCategoria], [iIdProveedor], [vNombreProducto], [vDescripcionProducto], [nPrecioCompra], [nPrecioVenta], [iStockActual], [iStockMinimo], [iEstado]) VALUES (2, 4, 3, N'Dolcetto', N'Helado de chocolate con lucuma', CAST(1.80 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), 25, 10, 1)
INSERT [dbo].[tTR_Producto] ([iIdProducto], [iIdCategoria], [iIdProveedor], [vNombreProducto], [vDescripcionProducto], [nPrecioCompra], [nPrecioVenta], [iStockActual], [iStockMinimo], [iEstado]) VALUES (3, 24, 3, N'Chifas', N'China work', CAST(2.50 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 500, 25, 1)
INSERT [dbo].[tTR_Producto] ([iIdProducto], [iIdCategoria], [iIdProveedor], [vNombreProducto], [vDescripcionProducto], [nPrecioCompra], [nPrecioVenta], [iStockActual], [iStockMinimo], [iEstado]) VALUES (4, 26, 5, N'Agua Cielo', N'Agua cielo de dos ltrs', CAST(2.00 AS Decimal(18, 2)), CAST(2.80 AS Decimal(18, 2)), 50, 15, 1)
SET IDENTITY_INSERT [dbo].[tTR_Producto] OFF
SET IDENTITY_INSERT [dbo].[tTR_Proveedor] ON 

INSERT [dbo].[tTR_Proveedor] ([iIdProveedor], [vNombreProveedor], [vRuc], [vDireccion], [vTelefono1], [vTelefono2], [iEstado]) VALUES (3, N'Asociados Comida', N'20514674669', N'Lima', N'123123', N'123321', 1)
INSERT [dbo].[tTR_Proveedor] ([iIdProveedor], [vNombreProveedor], [vRuc], [vDireccion], [vTelefono1], [vTelefono2], [iEstado]) VALUES (4, N'Asociados Comidaw', N'20514674669', N'321321', N'32131', N'32132', 1)
INSERT [dbo].[tTR_Proveedor] ([iIdProveedor], [vNombreProveedor], [vRuc], [vDireccion], [vTelefono1], [vTelefono2], [iEstado]) VALUES (5, N'Agua Cielo', N'12231123123', N'Av Jose de San Martin 1234', N'556654546', N'5456454', 1)
INSERT [dbo].[tTR_Proveedor] ([iIdProveedor], [vNombreProveedor], [vRuc], [vDireccion], [vTelefono1], [vTelefono2], [iEstado]) VALUES (7, N'Pollos Rokys', N'20411111111', N'Miraflores Lima', N'465564566', N'1234567', 1)
SET IDENTITY_INSERT [dbo].[tTR_Proveedor] OFF
SET IDENTITY_INSERT [dbo].[tTR_Roles] ON 

INSERT [dbo].[tTR_Roles] ([iIdUsuario], [vNombreRol], [iEstado]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[tTR_Roles] ([iIdUsuario], [vNombreRol], [iEstado]) VALUES (3, N'Usuario Uno', 1)
SET IDENTITY_INSERT [dbo].[tTR_Roles] OFF
SET IDENTITY_INSERT [dbo].[tTR_Usuarios] ON 

INSERT [dbo].[tTR_Usuarios] ([iIdUsuario], [iIdRol], [vNombreUsuario], [vPassword], [vNombre], [vApellidos], [iEstado], [sRutaImagen]) VALUES (1, 1, N'bvislao', N'123456', N'Bryan', N'Vislao Chavez', 1, N'../../WebImage/universitariodedeportes.jpg')
INSERT [dbo].[tTR_Usuarios] ([iIdUsuario], [iIdRol], [vNombreUsuario], [vPassword], [vNombre], [vApellidos], [iEstado], [sRutaImagen]) VALUES (16, 1, N'fhuamani', N'123456', N'fernando ', N'huamani', 1, N'../../WebImage/no_image.png')
INSERT [dbo].[tTR_Usuarios] ([iIdUsuario], [iIdRol], [vNombreUsuario], [vPassword], [vNombre], [vApellidos], [iEstado], [sRutaImagen]) VALUES (2, 3, N'jaraujo', N'123456', N'Jorge', N'Araujo', 1, N'../../WebImage/planetatierra.jpg')
INSERT [dbo].[tTR_Usuarios] ([iIdUsuario], [iIdRol], [vNombreUsuario], [vPassword], [vNombre], [vApellidos], [iEstado], [sRutaImagen]) VALUES (17, 1, N'lcano', N'123456', N'Luis', N'Cano Jauregui', 1, N'../../WebImage/universitariodedeportes.jpg')
INSERT [dbo].[tTR_Usuarios] ([iIdUsuario], [iIdRol], [vNombreUsuario], [vPassword], [vNombre], [vApellidos], [iEstado], [sRutaImagen]) VALUES (18, 3, N'ventas', N'123456', N'ventas ', N'adv', 1, N'../../WebImage/no_image.png')
SET IDENTITY_INSERT [dbo].[tTR_Usuarios] OFF
ALTER TABLE [dbo].[tTR_Producto]  WITH CHECK ADD  CONSTRAINT [FK_tTR_Producto_Proveedor] FOREIGN KEY([iIdProveedor])
REFERENCES [dbo].[tTR_Proveedor] ([iIdProveedor])
GO
ALTER TABLE [dbo].[tTR_Producto] CHECK CONSTRAINT [FK_tTR_Producto_Proveedor]
GO
ALTER TABLE [dbo].[tTR_Producto]  WITH CHECK ADD  CONSTRAINT [FK_tTR_Producto_ToTable] FOREIGN KEY([iIdCategoria])
REFERENCES [dbo].[tTR_Categoria] ([iIdCategoria])
GO
ALTER TABLE [dbo].[tTR_Producto] CHECK CONSTRAINT [FK_tTR_Producto_ToTable]
GO
ALTER TABLE [dbo].[tTR_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Rol_User] FOREIGN KEY([iIdRol])
REFERENCES [dbo].[tTR_Roles] ([iIdUsuario])
GO
ALTER TABLE [dbo].[tTR_Usuarios] CHECK CONSTRAINT [FK_Rol_User]
GO
