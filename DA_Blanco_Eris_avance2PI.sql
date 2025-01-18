USE FastFood --Usar DB fast food


INSERT INTO Categorias (Nombre) VALUES -- Carga de datos de categorias
('Comida Rápida'), ('Postres'), ('Bebidas'),('Ensaladas'), ('Desayunos'), ('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

SELECT *
FROM Categorias;

INSERT INTO Productos (Nombre,CategoriaID, Precio) VALUES --Carga de datos de productos
	('Hamburguesa Deluxe', 1, 9.99),
	('Cheeseburguer', 1, 7.99),
	('Pizza Margarita', 10, 11.99),
	('Pizza Pepperoni', 10, 12.99),
	('Helado de Chocolate', 7, 2.99),
	('Helado de Vainilla', 7, 2.99),
	('Ensalada César', 4, 5.99),
	('Ensalada Griega', 4, 6.99),
	('Pastel de Zanahoria', 2, 3.99),
	('Brownie', 2, 2.99);

DELETE FROM Productos; -- Vaciar la tabla

SELECT *
FROM Productos;


-- Insertar datos en Sucursales
INSERT INTO Sucursales (Nombre, Direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Montaña', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');


SELECT *
FROM Sucursales;

-- Empleados

INSERT INTO Empleados (Nombre, Posicion, Departamento, SucursalID, Rol) VALUES
	('Jhon Doe','Gerente','Administración', 1,'Vendedor'),
	('Jane Smith','Subgerente','Ventas', 1,'Vendedor'),
	('Bill Jones','Cajero','Ventas', 1,'Vendedor'),
	('Alice Johnson','Cocinero','Cocina', 1,'Vendedor'),
	('Tom Brown','Barista','Cafetería', 1,'Vendedor'),
	('Emma Davis','Repartidor','Logística', 1,'Mensajero'),
	('Lucas Miler','Atención al cliente','Servicio', 1,'Vendedor'),
	('Olivia Garcia','Encargado de Turno','Administración', 1,'Vendedor'),
	('Ethan Martinez','Mesero','Restaurante', 1,'Vendedor'),
	('Sophia Rodriguez','Auxiliar de limpieza','Mantenimiento', 1,'Vendedor');

SELECT *
FROM Empleados;


ALTER TABLE Empleados
ALTER COLUMN SucursalID INT NOT NULL; -- alterar que acepte null a not null

-- Insertar datos en Clientes
INSERT INTO Clientes (Nombre, Direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

EXEC sp_rename 'Clientes.Direcion', 'Direccion', 'COLUMN'; -- cambiar el nombre de la columna que quedo mal escrito

SELECT * FROM Clientes;

-- Insertar datos en OrigenesOrden
INSERT INTO OrigenesOrden (Descripcion) VALUES
('En línea'), ('Presencial'), ('Teléfono'), ('Drive Thru'), ('App Móvil'),
('Redes Sociales'), ('Correo Electrónico'), ('Publicidad'), ('Recomendación'), ('Evento');

Select * from OrigenesOrden

-- Insertar datos en TiposPago
INSERT INTO TiposPago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');

Select * from TiposPago

-- Insertar datos en Mensajeros
INSERT INTO Mensajeros (Nombre, EsExterno) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

Select * from Mensajeros

-- Insertar datos en Ordenes
INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TipoPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(1, 6, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 7, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 8, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 9, 4, 4, 4, 4, 'Mañana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 10, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 11, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 12, 7, 7, 7, 2, 'Mañana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 13, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 14, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 15, 10, 10, 10, 5, 'Mañana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

Select * from Ordenes



-- Insertar datos en DetalleOrdenes
INSERT INTO DetallesOrdenes (OrdenID, ProductosID, Cantidad, Precio) VALUES
(3, 7, 3, 23.44),
(3, 8, 5, 45.14),
(3, 9, 4, 46.37),
(3, 10, 4, 42.34),
(3, 11, 1, 18.25),
(3, 12, 4, 20.08),
(3, 13, 2, 13.31),
(3, 14, 2, 20.96),
(3, 15, 4, 30.13),
(3, 16, 3, 38.34);

Select * from DetallesOrdenes


--UPDATE Y DELETE

--ACTUALIZACIONES DE EJEMPLO (UPDATE)

-- Aumentar el precio de todos los productos en la categoría 1
SELECT * FROM Categorias
UPDATE Productos SET Precio = Precio + 1 WHERE CategoriaID = 1;

SELECT * FROM Productos


-- Cambiar la posición de todos los empleados del departamento 'Cocina' a 'Chef'
UPDATE Empleados 
	SET Posicion = 'Chef' 
	WHERE Departamento = 'Cocina';

SELECT * FROM Empleados

-- Actualizar la dirección de una sucursal específica
UPDATE Sucursales SET Direccion = '1234 New Address St' WHERE SucursalID = 1;

SELECT * FROM Sucursales


--ELIMINACIONES DE EJEMPLO (DELETE)

/*1. Eliminar una orden específica
Imaginemos que quieres eliminar una orden específica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operación eliminaría la orden junto con sus detalles asociados 
(deberías asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).*/
SELECT * FROM Ordenes;
SELECT * FROM DetallesOrdenes;
DELETE FROM DetallesOrdenes WHERE OrdenID = 10;
DELETE FROM Ordenes WHERE OrdenID = 10;


/*2. Eliminar todos los productos de una categoría específica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podrías querer eliminar todos los productos asociados a esa categoría.*/

DELETE FROM Productos WHERE CategoriaID = 2;
--Antes de ejecutar este comando, deberías considerar si hay órdenes que incluyen estos productos y decidir cómo manejar esas referencias.

/*da error
Msg 547, Level 16, State 0, Line 164
The DELETE statement conflicted with the REFERENCE constraint "FK__DetallesO__Produ__52593CB8". The conflict occurred in database "FastFood", table "dbo.DetallesOrdenes", column 'ProductosId'.
The statement has been terminated. 
Por la clave foranea porque esta en otra tabla, se debe primero desactivar la clave foranea 
*/

-- Desactivar clave foranea
ALTER TABLE DetallesOrdenes
NOCHECK CONSTRAINT FK__DetallesO__Produ__52593CB8;
-- ahora si intentamos borrar
DELETE FROM Productos WHERE CategoriaID = 2;

-- Ahora se activa de nuevo la foranea

ALTER TABLE DetallesOrdenes
CHECK CONSTRAINT FK__DetallesO__Produ__52593CB8;

/*3. Eliminar empleados de una sucursal que cerró
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podrías necesitar eliminar a todos los empleados asociados con esa sucursal.*/
SELECT * FROM Empleados

DELETE FROM Empleados WHERE SucursalID = 10;


-- Pregunta: ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?
SELECT COUNT (DISTINCT OrdenID) AS Conteo
	FROM Ordenes;
	-- hay 9

--Pregunta: ¿Cuántos empleados existen en cada departamento?
SELECT TOP 4 * FROM Empleados; -- para no traer toda la tabla que puede tener millones de registros

SELECT Departamento, COUNT (DISTINCT EmpleadoID) AS Cantidad_Empleados
	FROM Empleados
	GROUP BY Departamento
	ORDER BY Cantidad_Empleados DESC;

--Pregunta: ¿Cuántos productos hay por código de categoría?
SELECT * FROM Productos
SELECT CategoriaID, COUNT(ProductosID) As Total_productos
	FROM Productos
	GROUP BY CategoriaId
	ORDER BY Total_productos DESC;


--Pregunta: ¿Cuántos clientes se han importado a la tabla de clientes?
SELECT COUNT(ClienteID) As Total_CLientes
	FROM Clientes;


--Pregunta: ¿Cuáles son las sucursales con un promedio de Facturación/Ingresos superior a 1000.00 
-- y que minimizan sus costos en base al promedio de kilómetros recorridos de todas de sus entregas gestionadas? 
--Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.

SELECT SucursalID, 
	CAST (AVG (TotalCompra)			AS DECIMAL(10,2)) AS Promedio_Facturacion, --casteado a dos decimales
	CAST (AVG (KilometrosRecorrer)	AS DECIMAL(10,2)) As Promedio_Kilometros --Format (AVG (KilometrosRecorrer), '0.00') As Promedio_Kilometros -- formateado con funcion format esto lo combierte a texto no es eficiente
	FROM Ordenes
	GROUP BY SucursalID
	HAVING AVG (TotalCompra) > 1000
	ORDER BY Promedio_Kilometros DESC;
