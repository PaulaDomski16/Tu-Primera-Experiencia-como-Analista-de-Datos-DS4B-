#Consultas

## ¿Qué datos contiene la tabla a analizar?

SELECT*
From tickets
LIMIT 100;

### que es lo que vemos? los nombres de los campos. 
    Importante, vemos que el pedido 1, por ejemplo, aparece 3 veces, porque la tabla esta definida a nivel de pedido producto, entonces en el pedido 1 se pidieron 3 productos diferentes, en diferentes cantidades y el precio_total es el precio por unidad vendida x cantidad de ese producto. si queremos saber el total de la venta tendremos que sumar los 3 pedidos 1.

**VENTAS Y TENDENCIA**

1. **Visión General de Ventas Totales**
    
    **Pregunta 1:** ¿Cuál es el **ingreso total** generado por el negocio?
    
    SELECT SUM(precio_total) AS ingreso_total
    FROM tickets;
    
    
2. **Tendencias de Ventas en el Tiempo**
    
    **Pregunta 2:** ¿Cómo ha sido la **tendencia de ingresos mensuales**?
    
    SELECT strftime('%Y-%m', fecha) AS mes, SUM(precio_total) AS ingreso_mensual
    
    FROM tickets
    
    GROUP BY mes
    
    ORDER BY mes;
    
    #('%Y-%m', fecha) → Output;input → como quiero que me de los datos, que dato le ingreso
    
   

**PRODUCTOS Y SECCIONES**

1. **Análisis por Departamento y Sección**
    
    **Pregunta 3:** ¿Cuál es el **rendimiento de cada departamento** en términos de ventas? (suma de ventas por departamento)
    
    SELECT id_departamento, SUM(precio_total) AS ventas_departamento
    
    FROM tickets
    
    GROUP BY id_departamento
    
    ORDER BY ventas_departamento DESC;
    
    
    **Pregunta 4:** ¿Cómo se **distribuyen las ventas entre las diferentes secciones**?
    
    SELECT id_seccion, SUM(precio_total) AS ventas_seccion
    
    FROM tickets
    
    GROUP BY id_seccion
    
    ORDER BY ventas_seccion DESC;
    
    ![image.png](attachment:f97d89f1-baf8-4acf-b87a-dbd888440d5c:image.png)
    
2. **Análisis de Productos**
    
    **Pregunta 5:** ¿Cuáles son los **10 productos más vendidos** en **cantidad**? (pregunta de tipo TOP N) en unidades!!!
    
    SELECT nombre_producto, SUM(cantidad) AS total_vendido
    
    FROM tickets
    
    GROUP BY nombre_producto
    
    ORDER BY total_vendido DESC
    
    LIMIT 10;
    
    
    **Pregunta 6:** ¿Qué **10** **productos generan más ingresos**?
    
    SELECT nombre_producto, SUM(precio_total) AS ingreso_producto
    
    FROM tickets
    
    GROUP BY nombre_producto
    
    ORDER BY ingreso_producto DESC
    
    LIMIT 10;
    
    

**CLIENTES Y PEDIDOS**

1. **Comportamiento de los Clientes**
    
    **Pregunta 7:** ¿Quiénes son los **20 clientes que más compran** en términos de ingresos? (TOP N)
    
    SELECT id_cliente, SUM(precio_total) AS ingreso_cliente
    
    FROM tickets
    
    GROUP BY id_cliente
    
    ORDER BY ingreso_cliente DESC
    
    LIMIT 20;
    
    
    **Pregunta 8:** ¿Cuál es la **compra media por cliente**? Sacar el promedio. Ojo que la tabla esta a nivel pedido x producto, no nivel cliente. la Media por cliente, NO ES CADA CLIENTE, es un concepto mas bien global. Por eso hacemos la consulta en dos “partes” un FROM (SELECT id_cliente… ) para que sume el total de ventas de cada cliente y los agrupe por cliente y un segundo SELECT AVG para la media del total de las compras clientes.
    
    SELECT AVG(compra_total_cliente) AS compra_media_por_cliente
    
    FROM (
    
    SELECT id_cliente, SUM(precio_total) AS compra_total_cliente
    
    FROM tickets
    
    GROUP BY id_cliente 
    
    ) subconsulta; #Esta subconsulta genera una tabla intermedia que no se muestra.
    
   
    
2. **Análisis de Pedidos**
    
    **Pregunta 9:** ¿Cuántos **pedidos totales** se han realizado?
    
    como la tabla esta a nivel pedido x producto, debemos diferenciar la cantidad de pedidos, ya que un pedido puede estar repetido varias veces si se compraron varios productos distintos. 
    
    SELECT COUNT(DISTINCT id_pedido) AS total_pedidos
    
    FROM tickets;
    

    
    **Pregunta 10:** ¿Cuál es el **valor promedio por pedido**?
    
    SELECT AVG(total_pedido) AS valor_promedio_pedido
    
    FROM (
    
    SELECT id_pedido, SUM(precio_total) AS total_pedido
    
    FROM tickets
    
    GROUP BY id_pedido
    
    ) subconsulta;
   
