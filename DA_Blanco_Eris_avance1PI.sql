--crear una base de datos nueva--
CREATE DATABASE FastFood
ON 
( NAME = 'FastFoodDB_Data', --guarda los datos--
  FILENAME = 'C:\SQL_DB\FastFoodDB_Data.mdf',
  SIZE = 50MB,
  MAXSIZE = 1GB,
  FILEGROWTH = 5MB )
LOG ON
( NAME = 'Carrera_BD_Log',
  FILENAME = 'C:\SQL_DB\FastFoodDB_Log.ldf', --guarda las operaciones de las consultas, todo lo que ocurre--
  SIZE = 25MB,
  MAXSIZE = 256MB,
  FILEGROWTH = 5MB );

USE FastFood; --usar base de datos fastfood
--creamos la primera tabla
CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(200) NOT NULL
);

CREATE TABLE Productos(
	ProductosID INT PRIMARY KEY IDENTITY, --clave primaria
	Nombre VARCHAR(200) NOT NULL,
	CategoriaID INT,
	Precio DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID) --clave foranea
);

CREATE TABLE Sucursales(
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(200) NOT NULL,
	Direccion VARCHAR(200)
);

CREATE TABLE Empleados(
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(200) NOT NULL,
	Posicion VARCHAR(200),
	Departamento VARCHAR(200),
	SucursalID INT,
	Rol VARCHAR (50), --vendedor, mensajero
	FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID)
);

--tabla de clientes
CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(200) NOT NULL,
	Direcion VARCHAR(255)	
);

CREATE TABLE OrigenesOrden(
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE TiposPago(
	TipoPagoID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE Mensajeros(
	MensajeroID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(200) NOT NULL,
	EsExterno BIT Not Null
);


--Ordenes

CREATE TABLE Ordenes(
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID	INT,
	EmpleadoID	INT,
	SucursalID	INT,
	MensajeroID INT,
	TipoPagoID	INT,
	OrigenID	INT,
	HorarioVenta VARCHAR (20),
	TotalCompra DECIMAL (10,2) NOT NULL,
	KilometrosRecorrer DECIMAL (10,2),
	FechaDespacho DATETIME,
	FechaEntrega DATETIME,
	FechaOrdenTomada DATETIME,
	FechaOrdenLista DATETIME,
	FOREIGN KEY (ClienteID)		REFERENCES Clientes (ClienteID),
	FOREIGN KEY (EmpleadoID)	REFERENCES Empleados (EmpleadoID),
	FOREIGN KEY (SucursalID)	REFERENCES Sucursales (SucursalID),
	FOREIGN KEY (MensajeroID)	REFERENCES Mensajeros (MensajeroID),
	FOREIGN KEY (TipoPagoID)	REFERENCES TiposPago (TipoPagoID),
	FOREIGN KEY (OrigenID)		REFERENCES OrigenesOrden (OrigenID)
);


CREATE TABLE DetallesOrdenes(
	OrdenId		INT,
	ProductosId INT,
	Cantidad	INT,
	Precio		DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (OrdenID, ProductosID),--Primary key compuesta asi se crea
	FOREIGN KEY (OrdenId)		REFERENCES Ordenes (OrdenId),
	FOREIGN KEY (ProductosId)	REFERENCES Productos (ProductosId)

);



