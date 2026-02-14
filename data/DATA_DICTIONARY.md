# Diccionario de Datos
Detalle técnico:

## 📊 Tabla: tickets.csv (Hechos de Ventas)
Es la tabla principal que contiene el histórico de transacciones de "Sano y Fresco".

`id_pedido`: Identificador único de la transacción (puede repetirse por cada producto en el mismo ticket).

`id_cliente`: Código de identificación del comprador.

`fecha` / `hora`: Momento exacto en que se realizó la compra.

`id_departamento` / `id_seccion`: Clasificación jerárquica de la categoría del producto.

`id_producto` / `nombre_producto`: Identificador y descripción comercial del artículo.

`precio_unitario`: Costo por una unidad del producto.

`cantidad`: Número de unidades adquiridas en ese pedido.

`precio_total`: Monto final de la línea (precio_unitario × cantidad).

## 🛒 Tabla: reglas.csv (Insights de IA)
Contiene los resultados del algoritmo Market Basket Analysis para el sistema de recomendaciones.

`antecedente`: Producto que el cliente ya tiene en el carrito (Producto A).

`consecuente`: Producto que se recomienda comprar (Producto B).

`soporte_a`: Frecuencia con la que aparece el antecedente en el total de ventas.

`confianza`: Probabilidad de que se compre el consecuente dado que se tiene el antecedente.

`lift`: Fuerza de la asociación; si es > 1, la recomendación es estadísticamente significativa.

`id_producto_a` / `id_seccion_a` / `id_departamento_a`: Metadatos técnicos del producto antecedente para facilitar el filtrado.

## 📁 Tabla: secciones.csv (Maestro de Categorías)
Tabla de referencia para enriquecer las visualizaciones del Dashboard.

`id_seccion`: Código único de la sección (conecta con tickets y reglas).

`nombre_seccion`: Descripción amigable (ej. Bebidas, Frutas, Lácteos).

`imagen`: Enlace o ruta al recurso visual para la interfaz gráfica del recomendador.
