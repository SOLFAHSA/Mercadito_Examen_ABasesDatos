
CREATE DATABASE Mercadito;
GO


USE Mercadito;
GO

-- Crear tabla Proveedores
CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(50)
);
GO

-- Crear tabla Productos
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Precio DECIMAL(10,2),
    Stock INT,
    Cantidad INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);
GO

-- Crear tabla Clientes
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Email VARCHAR(50),
    Telefono VARCHAR(20),
    Credito BIT
);
GO

-- Crear tabla Ventas
CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    ID_Cliente INT,
    Fecha DATE,
    Total DECIMAL(10,2),
    HoraAperturaCaja TIME,
    HoraCierreCaja TIME,
    MetodoPago VARCHAR(20),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);
GO

-- Crear tabla DetallesVenta
CREATE TABLE DetallesVenta (
    ID_DetalleVenta INT PRIMARY KEY,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    CantidadVendida INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
GO

-- Registramos la hora actual en la columna HoraAperturaCaja de la tabla Ventas
UPDATE Ventas
SET HoraAperturaCaja = GETDATE()
WHERE HoraAperturaCaja IS NULL;
GO

-- Registramos la hora actual en la columna HoraCierreCaja de la tabla Ventas
UPDATE Ventas
SET HoraCierreCaja = GETDATE()
WHERE HoraCierreCaja IS NULL;
GO

-- Inserción de registros en la tabla Proveedores
INSERT INTO Proveedores (ID_Proveedor, Nombre, Direccion, Telefono, Email)
VALUES 
  (1, 'Industria Bocadeli', 'SPS', '9865412', 'gerencia@bocadeli.com'),
  (2, 'Embotelladora de Sula', 'SPS', '3654125', 'consultas@esula.com'),
  (3, 'Cerveceria Hondureña', 'SPS', '3214562', 'sac@cerveceriahondureña.com'),
  (4, 'Gastro Productores', 'Villanueva', '8754621', 'gerencia@gastroproductores'),
  (5, 'Inversiones Morales', 'Cofradia', '9865423', 'pedidos@imorales.com'),
  (6, 'Female', 'Tegucigalpa', '6254321', 'gerencia@female.com'),
  (7, 'Soluciones SINGPAD', 'SPS', '4621535', 'pedidos@singpad.com'),
  (8, 'Arsha', 'SPS', '6845632', 'sac@arsha.com'),
  (9, 'Valdezpin', 'SPS', '3212523', 'consultas@valdezpin.com'),
  (10,'Proveedores Varios', 'SPS', '9999999', 'proveedor@hotmail.com');

-- Registros en la tabla Productos
INSERT INTO Productos (ID_Producto, Nombre, Precio, Stock, Cantidad, ID_Proveedor)
VALUES 
  (1, 'Coca Cola Lata', 10.99, 50, 50, 1),
  (2, 'Maseca 1 L.', 19.99, 100, 100, 1),
  (3, 'Lays Crema y Especie', 5.99, 80, 80, 2),
  (4, 'Pepsi 3 Litros', 8.50, 60, 60, 2),
  (5, 'Libra de Repollo', 12.75, 120, 120, 3),
  (6, 'Bolsa de Pampers', 9.99, 70, 70, 3),
  (7, 'Harina 1 L.', 15.25, 90, 90, 4),
  (8, 'Gatorade Rojo', 6.99, 40, 40, 4),
  (9, 'Carne de Res Asar', 11.50, 60, 60, 5),
  (10, 'Carne Molida 1 L.', 7.25, 100, 100, 5);

-- Registros en la tabla Clientes
INSERT INTO Clientes (ID_Cliente, Nombre, Apellido, Email, Telefono, Credito)
VALUES 
  (1, 'Juan Manuel', 'Padilla', 'juanm.padilla13@hotmail.com', '98641053', 1),
  (2, 'Consumidor', 'Final', 'mercadito@hotmail.com', '99999999',0),
  (3, 'Kevin Ivan', 'Cruz', 'kivan@gmail.com', '88456321', 1),
  (4, 'Julio', 'Pacheco', 'jpacheco@outlook.com', '98521345', 0),
  (5, 'Technology', 'Systems', 'technosystems@gmail.com', '25504200', 1),
  (6, 'Inversiones', 'Padilla', 'inversionespadilla@hotmail.com', '25413260', 0),
  (7, 'JMP', 'Soluctions', 'jmpsoluction@outlook.com', '3356412', 1),
  (8, 'Ceutec', '', 'ceutec@unitec.edu', '25413652', 0),
  (9, 'Elsy', 'Alas', 'elsy.alas@hotmail.com', '95122334', 1),
  (10, 'Adrian', 'Saavedra', 'a.saavedra@gmail.com', '98745632', 0);

  -- Registros en la tabla Ventas
INSERT INTO Ventas (ID_Venta, ID_Cliente, Fecha, Total, HoraAperturaCaja, HoraCierreCaja, MetodoPago)
VALUES 
  (1, 1, GETDATE(), 100.00, '09:00:00', '17:00:00', 'Efectivo'),
  (2, 2, GETDATE(), 50.00, '10:30:00', '18:00:00', 'Tarjeta'),
  (3, 3, GETDATE(), 75.00, '08:45:00', '16:30:00', 'Efectivo'),
  (4, 4, GETDATE(), 120.00, '09:15:00', '17:45:00', 'Efectivo'),
  (5, 5, GETDATE(), 200.00, '10:00:00', '18:30:00', 'Tarjeta'),
  (6, 6, GETDATE(), 80.00, '09:30:00', '17:15:00', 'Efectivo'),
  (7, 7, GETDATE(), 60.00, '10:45:00', '18:45:00', 'Tarjeta'),
  (8, 8, GETDATE(), 90.00, '09:45:00', '17:30:00', 'Efectivo'),
  (9, 9, GETDATE(), 150.00, '10:15:00', '18:15:00', 'Tarjeta'),
  (10, 10, GETDATE(), 180.00, '08:30:00', '16:45:00', 'Efectivo');

-- Registros en la tabla DetallesVenta
INSERT INTO DetallesVenta (ID_DetalleVenta, ID_Venta, ID_Producto, Cantidad, CantidadVendida, PrecioUnitario)
VALUES 
  (1, 1, 1, 2, 2, 10.99),
  (2, 1, 3, 1, 1, 5.99),
  (3, 2, 2, 3, 3, 19.99),
  (4, 3, 4, 4, 4, 8.50),
  (5, 4, 5, 2, 2, 12.75),
  (6, 4, 6, 1, 1, 9.99),
  (7, 5, 8, 5, 5, 6.99),
  (8, 5, 9, 2, 2, 11.50),
  (9, 6, 7, 3, 3, 15.25),
  (10, 7, 10, 1, 1, 7.25);
