# Proyecto: 🍎 Análisis de Datos y Estrategia de Crecimiento: ***Startup "Sano y Fresco***"
Este proyecto aborda la problemática de caída de ventas de una startup de e-commerce de productos saludables. A través de un enfoque integral que combina SQL, Power BI y Machine Learning, se estableció una "verdad única" de datos para la toma de decisiones estratégicas y se desarrolló un motor de recomendaciones para aumentar el ticket medio.

## 🎯 Escenario de Negocio
La startup "Sano y Fresco" experimentó un crecimiento acelerado, pero enfrenta una pérdida de ventas significativa en el último año. El desafío principal era la falta de consenso en las métricas entre directores y la necesidad de optimizar la experiencia de compra mediante personalización.

## 🛠️ Stack Tecnológico
- **Análisis de Datos**: SQL (SQLite) para consultas complejas y segmentación.

- **Visualización**: Power BI para el desarrollo de un Dashboard interactivo.

- **Procesamiento**: Google Colab / Python para el análisis avanzado.

- **Algoritmos**: Market Basket Analysis (Reglas de Asociación).

## 📁 Datos Utilizados
Debido a políticas de privacidad y gestión de archivos pesados, los datasets originales no se encuentran en este repositorio. Sin embargo, se detalla a continuación la estructura empleada:

1. *Histórico de Ventas (tickets.csv)*

  Contiene el registro transaccional a nivel de pedido-producto:
  
  - Dimensiones principales: id_pedido, id_cliente, fecha, hora.
  
  - Métricas: precio_unitario, cantidad, precio_total.
  
  - Jerarquía: id_departamento, id_seccion, nombre_producto.

    <img width="1564" height="154" alt="image" src="https://github.com/user-attachments/assets/f52317ab-f27e-434e-8336-e67d6a494295" />

2. *Maestro de Secciones (secciones.csv)*

  Tabla de referencia para la categorización del catálogo:
  
  - Campos: id_seccion, nombre_seccion, imagen.

    <img width="563" height="92" alt="image" src="https://github.com/user-attachments/assets/1e71b362-694f-4905-98a4-d2ec5dce03a4" />

3. *Reglas de Asociación (reglas.csv)*

  Resultados del algoritmo Market Basket Analysis:
  
  - Variables IA: antecedente, consecuente, soporte, confianza, lift.

    <img width="1266" height="109" alt="image" src="https://github.com/user-attachments/assets/238602a0-9147-4b4a-ac21-0906ad02ca84" />

➡️➡️ Consultá el Diccionario de Datos [aquí](data/DATA_DICTIONARY.md)

## 📊 1. Diagnóstico Analítico (SQL)
Se utilizó el framework *Negocio → Pregunta → Consulta* para extraer insights críticos de la base de datos comercial:

- **Ventas y Tendencias**: Identificación de una caída del 82% en los ingresos mensuales a lo largo del año.
  
    <img width="786" height="482" alt="image" src="https://github.com/user-attachments/assets/1d78fdb2-9c65-46b0-a26e-86f720f01b19" />

- **Concentración de Riesgo**: Se detectó que el 93% de los ingresos dependen de un solo departamento (Dpto 4), evidenciando una falta de diversificación.
  
    <img width="1022" height="277" alt="image" src="https://github.com/user-attachments/assets/8dce2a75-eeda-4f86-9a59-39f0a971dd3f" />

- **Análisis de Productos**: El Top 10 de ventas está dominado por productos orgánicos (Bananas y Fresas), lo que permite identificar el perfil de consumo principal.
  
    <img width="950" height="527" alt="image" src="https://github.com/user-attachments/assets/86d6a366-d14d-4395-9491-bc1f2b0d6090" />

- **Métricas de Pedidos**: El valor promedio por pedido se situó en 19,34 €, estableciendo el punto de partida para las estrategias de upselling.
  
    <img width="326" height="128" alt="image" src="https://github.com/user-attachments/assets/044f38cf-01b1-4124-819f-8ca84556dc4b" />

## 📈 2. Cuadro de Mando de Ventas (Power BI)
Se diseñó un dashboard interactivo bajo un Documento de Requerimientos Funcionales para garantizar la alineación de objetivos:


https://github.com/user-attachments/assets/a169b082-125b-4334-b1cb-7f2ed7feeef5


  <img width="1568" height="849" alt="image" src="https://github.com/user-attachments/assets/0ca0f1d7-96bc-45d8-a7cd-d8d341c4685a" />

  <img width="1513" height="853" alt="image" src="https://github.com/user-attachments/assets/c79be381-c2a8-4d17-9256-026ee1916494" />

- **Botones de Navegación**: Permiten pivotar entre vistas.
  
    <img width="404" height="106" alt="image" src="https://github.com/user-attachments/assets/6c79137d-6c1f-48d3-9794-4d1db69fcc55" />

- **KPIs Globales**: Total de Ventas, Total de Clientes, Ticket Medio por Pedido y por Cliente.
 
    <img width="1648" height="203" alt="image" src="https://github.com/user-attachments/assets/33b77cd3-c2a8-4730-9596-823af1403e09" />

- **Análisis Temporal**: Evolución mensual de ingresos para detectar puntos de inflexión.
  
    <img width="879" height="266" alt="image" src="https://github.com/user-attachments/assets/b6b7e518-ede9-4a59-898c-87405f04ffda" />

- **Segmentación Avanzada**: Filtros dinámicos por Mes y Sección (Bebidas, Cremas, Frutas, Hierbas, etc.).
  
    <img width="1646" height="102" alt="image" src="https://github.com/user-attachments/assets/f3772f52-ce0d-4aff-b572-956a440dea13" />
  
    <img width="243" height="677" alt="image" src="https://github.com/user-attachments/assets/71aac6b5-80ca-440a-b804-954f67b00699" />

- **Visualización de Inventario**: Treemap de unidades vendidas para identificar rápidamente los productos estrella.
  
    <img width="1138" height="670" alt="image" src="https://github.com/user-attachments/assets/4274e030-ca89-4e08-8cd5-84cdfcb7d5b4" />

  
## 🤖 3. Optimización mediante IA (Market Basket Analysis)
Para revertir la tendencia de ventas, se implementó un algoritmo de Reglas de Asociación que analiza patrones consistentes de compra.

**Objetivo**: Crear un sistema de recomendaciones que sugiera productos complementarios en tiempo real.

**Impacto esperado**: Incrementar la cantidad de artículos por pedido y diversificar la compra hacia secciones con menor rotación.

  <img width="805" height="649" alt="image" src="https://github.com/user-attachments/assets/8fc2c691-9cd6-4eff-b66b-49e322ac6bf7" />

  <img width="911" height="551" alt="image" src="https://github.com/user-attachments/assets/809dde9c-44bb-4121-a3db-25d574f07fcf" />


### 📊 Métricas Clave del Algoritmo
Para garantizar la calidad de las recomendaciones de "Sano y Fresco", nos basamos en tres indicadores fundamentales:

- **Soporte (Support)**: Mide la popularidad de un conjunto de productos. Indica qué tan frecuente es que un artículo (o grupo de ellos) aparezca en el total de transacciones. Por ejemplo, un soporte de 0.07 para las "Bananas" significa que están presentes en el 7% de los tickets.

- **Confianza (Confidence)**: Mide la probabilidad de que un cliente compre el producto B dado que ya compró el producto A. Es vital para entender la fuerza de la asociación entre, por ejemplo, "Paltas" y "Limones".

- **Lift**: Es la métrica de "interés". Nos indica cuánto aumenta la probabilidad de venta del producto B cuando se incluye el A, en comparación con si se compraran de forma independiente. Un Lift > 1 indica una relación positiva fuerte, ideal para estrategias de cross-selling.


## 💪 Recomendaciones Estratégicas
- Diversificación: Impulsar los departamentos menos representados para reducir la dependencia del Dpto 4.

- Estrategia de Upselling: Utilizar los patrones del Market Basket Analysis para ofrecer "Combos Saludables" automáticos.

- Fidelización: Dado que la base de clientes es amplia pero de bajo valor unitario, implementar campañas de retención para aumentar la recurrencia.

-----

# 📂 Estructura del Repositorio
`/data`: Diccionario de datos y archivos base (Excel/SQL).

`/sql`: Consultas detalladas por eje temático.

`/dashboard`: Capturas y archivo .pbix del Cuadro de Mando.

`/notebooks`: Análisis en Python y algoritmo Market Basket.
