USE FastFood;
/* Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?*/

SELECT * FROM ordenes;
SELECT SUM(TotalCompra) AS Total_Ventas
	From Ordenes;

/*Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría? */
SELECT CategoriaId,
	CAST (AVG(Precio) AS DECIMAL (10,2)) AS Precio_Promedio

	FROM Productos
	GROUP BY CategoriaID
	ORDER BY Precio_Promedio DESC;
/*Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?*/
SELECT SucursalID,
	MIN (TotalCompra) AS Orden_minima,
	MAX (TotalCompra) AS Orden_maxima	

	FROM Ordenes
	GROUP BY SucursalID;

/*Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?*/
SELECT 
	MAX(KilometrosRecorrer) AS Maximo
	From Ordenes;

	/*Pregunta: ¿Cuál es la cantidad promedio de productos por orden?*/

SELECT OrdenId,
	CAST (AVG (Cantidad)AS DECIMAL(10,2)) AS Promedio_Productos

	From DetallesOrdenes
	Group By OrdenID;

/*Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?*/
SELECT TipoPagoID,
	SUM(TotalCompra) AS Total_Facturacion
FROM Ordenes
GROUP BY TipoPagoID
ORDER BY Total_Facturacion DESC;

/*Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?*/
-- USAMOS top 1 para que solo muestre el mas alto 
SELECT TOP 1 SucursalID,
	CAST (AVG(TotalCompra)AS DECIMAL(10,2)) AS Ingreso_Promedio
FROM Ordenes
Group By SucursalID
Order By Ingreso_Promedio DESC;

/*Pregunta: ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?*/
--OJO en el having no se puede usar el alias se debe usar el calculo siempre
SELECT SucursalID,
	SUM(TotalCompra) AS Venta
FROM Ordenes
Group By SucursalID
Having SUM(TotalCompra) > 1000
Order By Venta DESC;

/*Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?*/
SELECT CAST (AVG (TotalCompra)AS DECIMAL (10,2)) AS Ventas_Promedio,
	'Antes del 1ero de julio' AS Periodo -- Columna virtual
FROM Ordenes
WHERE FechaEntrega<'2023-07-01'--elimino el ;
UNION --se agrega esta palabra para unir las dos queris
SELECT CAST (AVG (TotalCompra)AS DECIMAL (10,2)) AS Ventas_Promedio,
	'Despues del 1ero de julio' AS Periodo -- Columna virtual
FROM Ordenes
WHERE FechaEntrega>'2023-07-01';

/*Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, 
cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?*/
SELECT HorarioVenta,
	COUNT (OrdenID) AS Cantidad_Ventas,
	CAST (AVG (TotalCompra)AS DECIMAL (10,2)) AS Ingreso_Promedio,
	MAX (TotalCOmpra) AS Venta_Maxima

FROM Ordenes
GROUP BY HorarioVenta
ORDER BY Cantidad_Ventas DESC;