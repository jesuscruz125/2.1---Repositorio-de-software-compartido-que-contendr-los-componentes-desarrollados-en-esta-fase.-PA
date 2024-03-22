create database pizza_progra;

use pizza_progra;

CREATE TABLE Sucursales (
  ID_Sucursal int IDENTITY(1,1) NOT NULL ,
  Ubicacion VARCHAR(40) NOT NULL,
  Num_Sucursal INT NOT NULL,
  ID_Empleado INT,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Sucursal)
);


CREATE TABLE Proveedores (
  ID_Proveedor int IDENTITY(1,1) NOT NULL ,
  Tipo_Persona VARCHAR(30) NOT NULL,
  Nombre VARCHAR(40) NOT NULL,
  Domicilio VARCHAR(40),
  RepresentanteLegal VARCHAR(40) NOT NULL,
  RFC VARCHAR(13) NOT NULL,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Proveedor)
);


CREATE TABLE pedido_proveedores (
  ID_Pedido int IDENTITY(1,1) NOT NULL ,
  ID_Proveedor INT,
  ID_Sucursal INT,
  costo MONEY NOT NULL,
  fecha_entrega DATETIME NOT NULL,
  PRIMARY KEY (ID_Pedido),
  FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID_Proveedor),
  FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal)
);


CREATE TABLE DetallePedido (
  ID_DetallePedido int IDENTITY(1,1) NOT NULL ,
  ID_Pedido INT,
  ID_MP INT NOT NULL,
  ID_Proveedor INT,
  ID_Sucursal INT,
  costo MONEY NOT NULL,
  fecha_entrega DATETIME NOT NULL,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_DetallePedido),
  FOREIGN KEY (ID_Pedido) REFERENCES pedido_proveedores (ID_Pedido),
  FOREIGN KEY (ID_MP) REFERENCES MateriaPrima (ID_MP),
  FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID_Proveedor),
  FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal)
);


CREATE TABLE Clientes (
  ID_Cliente int IDENTITY(1,1) NOT NULL ,
  Nombre VARCHAR(40),
  ApellidoP VARCHAR(40),
  ApellidoM VARCHAR(40),
  Estado VARCHAR(40),
  Municipio VARCHAR(40),
  Colonia VARCHAR(40),
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Cliente)
);


CREATE TABLE Estado (
  ID_Estado int IDENTITY(1,1) NOT NULL ,
  Nombre VARCHAR(40),
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Estado)
);


CREATE TABLE Municipio (
  ID_Municipio int IDENTITY(1,1) NOT NULL ,
  Nombre VARCHAR(40),
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Municipio)
);


CREATE TABLE Colonia (
  ID_Colonia int IDENTITY(1,1) NOT NULL ,
  Nombre VARCHAR(40),
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Colonia)
);


CREATE TABLE Ventas (
  ID_Venta int IDENTITY(1,1) NOT NULL ,
  ID_Empleado INT,
  ID_Sucursal INT,
  Descripcion VARCHAR(60),
  Costo MONEY,
  IVA MONEY,
  ID_TipoPago INT,
  ID_Bancos INT,
  NoFactura INT,
  ID_Cliente INT,
  Fecha DATETIME NOT NULL,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Venta),
  FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado),
  FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal),
  FOREIGN KEY (ID_TipoPago) REFERENCES TipoPago (ID_TipoPago),
  FOREIGN KEY (ID_Bancos) REFERENCES Bancos (ID_Bancos),
  FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);


CREATE TABLE DetalleVenta (
  ID_DetalleV int IDENTITY(1,1) NOT NULL ,
  ID_Venta INT,
  ID_Producto INT,
  Costo MONEY,
  Fecha DATETIME,
  PRIMARY KEY (ID_DetalleV),
  FOREIGN KEY (ID_Venta) REFERENCES Ventas (ID_Venta),
  FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);


CREATE TABLE Empleados (
  ID_Empleado int IDENTITY(1,1) NOT NULL ,
  Nombre VARCHAR(40),
  Direccion VARCHAR(40),
  CURP VARCHAR(18),
  RFC VARCHAR(13),
  Fecha_Nac DATETIME,
  ID_Puesto INT,
  ID_Sucursal INT,
  Fecha_Entrada DATETIME,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Empleado),
  FOREIGN KEY (ID_Puesto) REFERENCES TipoPuesto (ID_Puesto),
  FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal)
);


CREATE TABLE TipoPuesto (
  ID_Puesto int IDENTITY(1,1) NOT NULL ,
  puesto VARCHAR(40),
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Puesto)
);


CREATE TABLE MateriaPrima (
  ID_MP int IDENTITY(1,1) NOT NULL ,
  ID_Proveedor INT,
  Descripcion VARCHAR(40),
  Tipo VARCHAR(40),
  FecCaducidad DATETIME NOT NULL,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_MP),
  FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID_Proveedor)
);


CREATE TABLE tipoMP (
  ID_TMP int IDENTITY(1,1) NOT NULL ,
  Tipo VARCHAR(40),
  Descripcion VARCHAR(40),
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_TMP)
);


CREATE TABLE TipoPago (
  ID_TipoPago int IDENTITY(1,1) NOT NULL ,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_TipoPago)
);


CREATE TABLE Bancos (
  ID_Bancos int IDENTITY(1,1) NOT NULL ,
  Nombre VARCHAR(40),
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Bancos)
);


CREATE TABLE Productos (
  ID_Producto int IDENTITY(1,1) NOT NULL ,
  Fecha_Alta DATETIME NOT NULL,
  Fecha_Baja DATETIME,
  PRIMARY KEY (ID_Producto)
);
