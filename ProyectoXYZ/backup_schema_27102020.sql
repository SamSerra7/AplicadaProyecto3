USE [XYZ]
GO
/****** Object:  Schema [customers]    Script Date: 27/10/2020 22:37:45 ******/
CREATE SCHEMA [customers]
GO
/****** Object:  Schema [sales]    Script Date: 27/10/2020 22:37:45 ******/
CREATE SCHEMA [sales]
GO
/****** Object:  Table [customers].[cliente]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [customers].[cliente](
	[cedula] [int] NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[apellido1] [varchar](50) NULL,
	[apellido2] [varchar](50) NULL,
	[cantidad_compras] [int] NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [customers].[direccion]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [customers].[direccion](
	[direccion] [varchar](200) NOT NULL,
	[cedula] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_direccion] PRIMARY KEY CLUSTERED 
(
	[direccion] ASC,
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [customers].[email]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [customers].[email](
	[email] [varchar](50) NOT NULL,
	[cedula] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_email] PRIMARY KEY CLUSTERED 
(
	[email] ASC,
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [customers].[tarjeta_credito]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [customers].[tarjeta_credito](
	[n_tarjeta] [varbinary](max) NULL,
	[cedula] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_tarjeta_credito] PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [customers].[telefono]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [customers].[telefono](
	[telefono] [int] NOT NULL,
	[cedula] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_telefono] PRIMARY KEY CLUSTERED 
(
	[telefono] ASC,
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[factura]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[factura](
	[id_factura] [int] NOT NULL,
	[total] [int] NULL,
	[cedula] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC,
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[producto]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[producto](
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [int] NULL,
	[impuesto] [numeric](2, 0) NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[producto_fatura]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[producto_fatura](
	[id_factura] [int] NOT NULL,
	[cedula] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[migrado] [bit] NULL,
 CONSTRAINT [pk_producto_factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC,
	[cedula] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [customers].[cliente] ADD  DEFAULT ((0)) FOR [cantidad_compras]
GO
ALTER TABLE [customers].[cliente] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [customers].[direccion] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [customers].[email] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [customers].[tarjeta_credito] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [customers].[telefono] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [sales].[factura] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [sales].[producto] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [sales].[producto_fatura] ADD  DEFAULT ((0)) FOR [migrado]
GO
ALTER TABLE [customers].[email]  WITH CHECK ADD  CONSTRAINT [email_valido] CHECK  (([email] like '_%@_%._%'))
GO
ALTER TABLE [customers].[email] CHECK CONSTRAINT [email_valido]
GO
/****** Object:  StoredProcedure [customers].[eliminar_Tablas]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [customers].[eliminar_Tablas] 

as 
begin
delete from sales.factura  where migrado=1
delete from customers.cliente  where migrado=1

return 0
end
GO
/****** Object:  StoredProcedure [customers].[eliminar_Tablas_Jobs]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [customers].[eliminar_Tablas_Jobs]
as 
begin

delete from [customers].[direccion] where migrado=1
delete from [customers].[email]  where migrado=1
delete from [customers].[tarjeta_credito] where migrado=1
delete from [customers].[telefono] where migrado=1
delete from [sales].[producto] where migrado=1
delete from [sales].[producto_fatura]where migrado=1

end
GO
/****** Object:  StoredProcedure [customers].[insertarTarjeta]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [customers].[insertarTarjeta]
@n_tarjeta varchar(max),
@cedula int,
@fecha datetime
as
declare
@ps1 varbinary(max)
begin 
set @ps1=(ENCRYPTBYPASSPHRASE('encriptacion',@n_tarjeta));
insert into customers.tarjeta_credito (n_tarjeta,cedula,fecha_creacion) values (@ps1,@cedula,@fecha) 
end
GO
/****** Object:  StoredProcedure [customers].[listar_clientes]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [customers].[listar_clientes]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select  [cedula], [nombre], [apellido1], [apellido2], [cantidad_compras],fecha_creacion
	from customers.cliente
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion
	
	UPDATE customers.cliente
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final

end
GO
/****** Object:  StoredProcedure [customers].[listar_Direccion]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [customers].[listar_Direccion]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select direccion, cedula,fecha_creacion
	from [customers].[direccion]
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion

UPDATE [customers].[direccion]
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final
end

GO
/****** Object:  StoredProcedure [customers].[listar_Email]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [customers].[listar_Email]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select [email], [cedula],[fecha_creacion]
	from [customers].[email]
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion


 UPDATE   [customers].[email]
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final

end
GO
/****** Object:  StoredProcedure [customers].[listar_tarjeta]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [customers].[listar_tarjeta]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select  Tarjeta = cast(CONVERT(varchar(50), DECRYPTBYPASSPHRASE ('encriptacion',n_tarjeta))as numeric),cedula,fecha_creacion
	from customers.tarjeta_credito 
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion 


 UPDATE    customers.tarjeta_credito 
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final
end
GO
/****** Object:  StoredProcedure [customers].[listar_Telefono]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [customers].[listar_Telefono]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select [telefono], [cedula],fecha_creacion
	from [customers].[telefono]
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion 

 UPDATE   [customers].[telefono]
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final
end
GO
/****** Object:  StoredProcedure [sales].[listar_factura]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [sales].[listar_factura]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select  id_factura,total,cedula,fecha_creacion
	from sales.factura
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion 


 UPDATE  sales.factura
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final
end
GO
/****** Object:  StoredProcedure [sales].[listar_Producto]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [sales].[listar_Producto]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select  [id_producto], [nombre], [precio], [impuesto], [fecha_creacion]
	from sales.producto
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion 
	
	UPDATE sales.producto
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final
end
GO
/****** Object:  StoredProcedure [sales].[listar_Producto_factura]    Script Date: 27/10/2020 22:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   PROCEDURE [sales].[listar_Producto_factura]
@fecha_inicio datetime, @fecha_final datetime
as 
begin 
	select [id_factura], [cedula], [id_producto],fecha_creacion
	from [sales].[producto_fatura]
	where migrado = 0
	and fecha_creacion between @fecha_inicio and @fecha_final
	order by fecha_creacion 

	
    UPDATE [sales].[producto_fatura]
    SET migrado = 1
	where fecha_creacion between @fecha_inicio and @fecha_final


end
GO
