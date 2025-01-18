use FastFood

/*Listar todos los productos y sus categor�as  Pregunta: �C�mo puedo obtener una lista de todos los productos junto con sus categor�as?*/
SELECT P.Nombre As Producto, C.Nombre As Categoria
FROM Productos P
LEFT JOIN Categorias C ON (P.CategoriaID = C.CategoriaID)



/*Obtener empleados y su sucursal asignada Pregunta: �C�mo puedo saber a qu� sucursal est� asignado cada empleado?*/

SELECT E.Nombre As Nombre_Empleado, S.Nombre As Sucursal
FROM Empleados E
LEFT JOIN Sucursales S ON (E.SucursalID = S.SucursalID)


/*Identificar productos sin categor�a asignada Pregunta: �Existen productos que no tienen una categor�a asignada?*/
SELECT P.Nombre As Nombre_Producto, C.Nombre As Categoria
FROM Productos P
LEFT JOIN Categorias C ON (P.CategoriaID = C.CategoriaID)
WHERE C.CategoriaID IS NULL;



/*Detalle completo de �rdenes  Pregunta: �C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del cliente, Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�?*/

SELECT O.OrdenID As Orden_ID, C.Nombre As Nombre_CLiente, E.Nombre Empleado_Nombre, M.Nombre AS Mensajero_Nombre
FROM Ordenes AS O
LEFT JOIN Clientes C ON (O.ClienteID = C.ClienteID)
LEFT JOIN Empleados E ON (O.EmpleadoID = E.EmpleadoID)
LEFT JOIN Mensajeros M ON (O.MensajeroID = M.MensajeroID);
--si uso inner da igual
SELECT O.OrdenID As Orden_ID, C.Nombre As Nombre_CLiente, E.Nombre Empleado_Nombre, M.Nombre AS Mensajero_Nombre
FROM Ordenes AS O
INNER JOIN Clientes C ON (O.ClienteID = C.ClienteID)
INNER JOIN Empleados E ON (O.EmpleadoID = E.EmpleadoID)
INNER JOIN Mensajeros M ON (O.MensajeroID = M.MensajeroID);


/*Productos vendidos por sucursal  Pregunta: �Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?*/

SELECT S.Nombre AS Sucursal, C.Nombre AS Categoria_Producto, SUM(DO.Cantidad) AS Productos_Vendidos 
FROM Ordenes AS O
INNER JOIN DetallesOrdenes DO ON (O.OrdenID = DO.OrdenID)
INNER JOIN Productos P ON (DO.ProductosID = P.ProductosID)
INNER JOIN Categorias C ON (P.CategoriaID = C.CategoriaID)
INNER JOIN Sucursales S ON (O.SucursalID = S.SucursalID)
GROUP BY C.Nombre, S.Nombre
Order BY Productos_Vendidos DESC;


