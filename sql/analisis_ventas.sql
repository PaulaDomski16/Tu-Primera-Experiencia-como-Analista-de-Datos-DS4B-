Consultas

¿Qué datos contiene la tabla a analizar?

SELECT*
From tickets
LIMIT 100;

![image.png](attachment:840a847f-fcde-471e-8e35-cf59042a2676:image.png)

que es lo que vemos? los nombres de los campos. Importante, vemos que el pedido 1, por ejemplo, aparece 3 veces, porque la tabla esta definida a nivel de pedido producto, entonces en el pedido 1 se pidieron 3 productos diferentes, en diferentes cantidades y el precio_total es el precio por unidad vendida x cantidad de ese producto. si queremos saber el total de la venta tendremos que sumar los 3 pedidos 1.

**VENTAS Y TENDENCIA**

1. **Visión General de Ventas Totales**
    
    **Pregunta 1:** ¿Cuál es el **ingreso total** generado por el negocio?
    
    SELECT SUM(precio_total) AS ingreso_total
    FROM tickets;
    
    ![image.png](attachment:3e73e183-5abc-4699-903a-12717ce3cb89:image.png)
    
2. **Tendencias de Ventas en el Tiempo**
    
    **Pregunta 2:** ¿Cómo ha sido la **tendencia de ingresos mensuales**?
    
    SELECT strftime('%Y-%m', fecha) AS mes, SUM(precio_total) AS ingreso_mensual
    
    FROM tickets
    
    GROUP BY mes
    
    ORDER BY mes;
    
    #('%Y-%m', fecha) → Output;input → como quiero que me de los datos, que dato le ingreso
    
    ![image.png](attachment:f91e7e2f-0047-4ac8-831d-0d58b6b54c44:image.png)
    

**PRODUCTOS Y SECCIONES**

1. **Análisis por Departamento y Sección**
    
    **Pregunta 3:** ¿Cuál es el **rendimiento de cada departamento** en términos de ventas? (suma de ventas por departamento)
    
    SELECT id_departamento, SUM(precio_total) AS ventas_departamento
    
    FROM tickets
    
    GROUP BY id_departamento
    
    ORDER BY ventas_departamento DESC;
    
    ![image.png](attachment:2178e23f-b311-457b-bbaf-d3713830f633:image.png)
    
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
    
    ![image.png](attachment:8c4db684-fec7-4141-b3f4-2afdab417659:image.png)
    
    **Pregunta 6:** ¿Qué **10** **productos generan más ingresos**?
    
    SELECT nombre_producto, SUM(precio_total) AS ingreso_producto
    
    FROM tickets
    
    GROUP BY nombre_producto
    
    ORDER BY ingreso_producto DESC
    
    LIMIT 10;
    
    ![image.png](attachment:3f49b6f9-e9e4-4ed5-8855-710f9e8c2b1f:image.png)
    

**CLIENTES Y PEDIDOS**

1. **Comportamiento de los Clientes**
    
    **Pregunta 7:** ¿Quiénes son los **20 clientes que más compran** en términos de ingresos? (TOP N)
    
    SELECT id_cliente, SUM(precio_total) AS ingreso_cliente
    
    FROM tickets
    
    GROUP BY id_cliente
    
    ORDER BY ingreso_cliente DESC
    
    LIMIT 20;
    
    ![image.png](attachment:e51c0a27-1a20-461e-bf97-fe66978ca408:image.png)
    
    **Pregunta 8:** ¿Cuál es la **compra media por cliente**? Sacar el promedio. Ojo que la tabla esta a nivel pedido x producto, no nivel cliente. la Media por cliente, NO ES CADA CLIENTE, es un concepto mas bien global. Por eso hacemos la consulta en dos “partes” un FROM (SELECT id_cliente… ) para que sume el total de ventas de cada cliente y los agrupe por cliente y un segundo SELECT AVG para la media del total de las compras clientes.
    
    SELECT AVG(compra_total_cliente) AS compra_media_por_cliente
    
    FROM (
    
    SELECT id_cliente, SUM(precio_total) AS compra_total_cliente
    
    FROM tickets
    
    GROUP BY id_cliente 
    
    ) subconsulta; #Esta subconsulta genera una tabla intermedia que no se muestra.
    
    ![image.png](attachment:2d5a3f12-08ea-4884-9903-2c53171cd842:image.png)
    
2. **Análisis de Pedidos**
    
    **Pregunta 9:** ¿Cuántos **pedidos totales** se han realizado?
    
    como la tabla esta a nivel pedido x producto, debemos diferenciar la cantidad de pedidos, ya que un pedido puede estar repetido varias veces si se compraron varios productos distintos. 
    
    SELECT COUNT(DISTINCT id_pedido) AS total_pedidos
    
    FROM tickets;
    
    ![image.png](attachment:7afef12e-f147-46ea-9078-420c3c0c093c:image.png)
    
    **Pregunta 10:** ¿Cuál es el **valor promedio por pedido**?
    
    SELECT AVG(total_pedido) AS valor_promedio_pedido
    
    FROM (
    
    SELECT id_pedido, SUM(precio_total) AS total_pedido
    
    FROM tickets
    
    GROUP BY id_pedido
    
    ) subconsulta;
    ![image.png](attachment:87cd4485-6d01-4d83-9455-6893cd3213ef:image.png)