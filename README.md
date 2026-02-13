# Proyecto: 
# 🍎 Análisis de Datos y Estrategia de Crecimiento: Startup "Sano y Fresco"
Este proyecto aborda la problemática de caída de ventas de una startup de e-commerce de productos saludables. A través de un enfoque integral que combina SQL, Power BI y Machine Learning, se estableció una "verdad única" de datos para la toma de decisiones estratégicas y se desarrolló un motor de recomendaciones para aumentar el ticket medio.

## 🎯 Escenario de Negocio
La startup "Sano y Fresco" experimentó un crecimiento acelerado, pero enfrenta una pérdida de ventas significativa en el último año. El desafío principal era la falta de consenso en las métricas entre directores y la necesidad de optimizar la experiencia de compra mediante personalización.

## 🛠️ Stack Tecnológico
- **Análisis de Datos**: SQL (SQLite) para consultas complejas y segmentación.

- **Visualización**: Power BI para el desarrollo de un Dashboard interactivo.

- **Procesamiento**: Google Colab / Python para el análisis avanzado.

- **Algoritmos**: Market Basket Analysis (Reglas de Asociación).

## 📊 1. Diagnóstico Analítico (SQL)
Se utilizó el framework *Negocio → Pregunta → Consulta* para extraer insights críticos de la base de datos comercial:

- **Ventas y Tendencias**: Identificación de una caída del 82% en los ingresos mensuales a lo largo del año.

- **Concentración de Riesgo**: Se detectó que el 93% de los ingresos dependen de un solo departamento (Dpto 4), evidenciando una falta de diversificación.

- **Análisis de Productos**: El Top 10 de ventas está dominado por productos orgánicos (Bananas y Fresas), lo que permite identificar el perfil de consumo principal.

- **Métricas de Pedidos**: El valor promedio por pedido se situó en 19,34 €, estableciendo el punto de partida para las estrategias de upselling.

## 📈 2. Cuadro de Mando de Ventas (Power BI)
Se diseñó un dashboard interactivo bajo un Documento de Requerimientos Funcionales para garantizar la alineación de objetivos:

- **KPIs Globales**: Total de Ventas, Total de Clientes, Ticket Medio por Pedido y por Cliente.

- **Análisis Temporal**: Evolución mensual de ingresos para detectar puntos de inflexión.

- **Segmentación Avanzada**: Filtros dinámicos por Mes y Sección (Bebidas, Cremas, Frutas, Hierbas, etc.).

- **Visualización de Inventario**: Treemap de unidades vendidas para identificar rápidamente los productos estrella.

## 🤖 3. Optimización mediante IA (Market Basket Analysis)
Para revertir la tendencia de ventas, se implementó un algoritmo de Reglas de Asociación que analiza patrones consistentes de compra.

**Objetivo**: Crear un sistema de recomendaciones que sugiera productos complementarios en tiempo real.

**Impacto esperado**: Incrementar la cantidad de artículos por pedido y diversificar la compra hacia secciones con menor rotación.

### 📊 Métricas Clave del Algoritmo
Para garantizar la calidad de las recomendaciones de "Sano y Fresco", nos basamos en tres indicadores fundamentales:

- **Soporte (Support)**: Mide la popularidad de un conjunto de productos. Indica qué tan frecuente es que un artículo (o grupo de ellos) aparezca en el total de transacciones. Por ejemplo, un soporte de 0.07 para las "Bananas" significa que están presentes en el 7% de los tickets.

- **Confianza (Confidence)**: Mide la probabilidad de que un cliente compre el producto B dado que ya compró el producto A. Es vital para entender la fuerza de la asociación entre, por ejemplo, "Paltas" y "Limones".

- **Lift**: Es la métrica de "interés". Nos indica cuánto aumenta la probabilidad de venta del producto B cuando se incluye el A, en comparación con si se compraran de forma independiente. Un Lift > 1 indica una relación positiva fuerte, ideal para estrategias de cross-selling.

##💡 Recomendaciones Estratégicas
- Diversificación: Impulsar los departamentos menos representados para reducir la dependencia del Dpto 4.

- Estrategia de Upselling: Utilizar los patrones del Market Basket Analysis para ofrecer "Combos Saludables" automáticos.

- Fidelización: Dado que la base de clientes es amplia pero de bajo valor unitario, implementar campañas de retención para aumentar la recurrencia.

-----

# 📂 Estructura del Repositorio
`/data`: Diccionario de datos y archivos base (Excel/SQL).

`/sql`: Consultas detalladas por eje temático.

`/dashboard`: Capturas y archivo .pbix del Cuadro de Mando.

`/notebooks`: Análisis en Python y algoritmo Market Basket.
