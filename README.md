![](https://www.incremental.solutions/App_Themes/Default/Images/Incremental.png)

## Bienvenido !
Nos encanta la idea de que desees formar parte de nuestro equipo de desarrollo.

Para ello hemos preparado un reto con el que podrás probar todas tus habilidades como desarrollador.

#### Tu misión, si decides aceptarla...
Uno de nuestros clientes desea contar con un dashboard para visualizar todos sus pedidos y poder planificarlos para llevar a cabo el empacado y envío de productos a sus clientes.

En el primer alcance es necesario construir dos pantallas/vistas de información:

## Pantalla de seguimiento de pedidos
Esta pantalla deberá mostrar un listado con el resumen de los pedidos existentes en un rango de fecha establecido y con la posibilidad de incluir algún criterio de búsqueda general.  

La siguiente imagen muestra un aproximado de cómo se espera el diseño para dicha pantalla: 
![](https://github.com/Jorge-delaRosa/RetoKodemia/blob/master/SeguimientoPedidos.png)

###### Consideraciones especiales 
- Esta pantalla deberá adaptarse a tres formatos: móvil, tablet y desktop.
- El primer renglón de visualización debería mostrar el conteo de registros incluidos en la vista. 
- Los renglones correspondientes a los pedidos deberán estar agrupados por fecha estimada de entrega, mostrando un renglón adicional al inicio de cada grupo indicando el grupo al que pertencen.
- El último renglón de cada grupo deberá mostrar el conteo de paquetes de los pedidos de dicho grupo.
- Si el pedido se encuentra en estatus de **pendiente** y por ende no cuenta con una fecha estimada de entrega, deberá agruparse en un grupo denominado **pendiente**.


## Pantalla de detalles del pedido
Esta pantalla deberá mostrar un formulario con los detalles del pedido agrupados por secciones e incluir algunas reglas especiales según los detalles del mismo.

La siguiente imagen muestra un aproximado de cómo se espera el diseño de dicha pantalla: 
![](https://github.com/Jorge-delaRosa/RetoKodemia/blob/master/DetallePedidos.png)

###### Consideraciones especiales 
- Al igual que la anterior, esta pantalla deberá adaptarse a tres formatos: móvil, tablet y desktop.
- Un pedido pendiente debe permitir establecer los siguientes campos:
  - El vehículo de distribución (NISSAN, CHEVROLET, TORTHON ó UBER).
  - El tipo de embarque a utilizar (GRANEL, CAJA ó TARIMA).
  - Tipo de dirección de envío (CLIENTE, TRANSPORTISTA ó MANUAL).
- Si se establece el Tipo de dirección de envío como **Transportista**:
  - La pantalla deberá habilitar el campo de transportista y permitir seleccionarlo de una lista, de lo contrario este campo no debe mostrarse en pantalla.
- Si el cliente cuenta con "Tipo de ubicación" **Local**:
  - El sistema deberá mostrar las opciones de entidad y delegación/municipio como campos de selección, de lo contrario estos dos campos no deberán mostrarse y se deberá incluir un campo abierto de dirección para el Estado/Municipio (DirLinea3).


## Consideraciones generales
Puedes construir el backend con la tecnología que desees.  La siguiente imagen muestra un modelo general de base de datos en el que te puedes basar para generar la fuente de información:
![](https://github.com/Jorge-delaRosa/RetoKodemia/blob/master/erd_Pedidos.png)

De igual forma como parte del material disponible para cumplir el reto te compartimos los siguientes scripts de base de datos:

 - [CREATE TABLES](https://github.com/Jorge-delaRosa/RetoKodemia/blob/master/00%20%5BPEDIDOS%5D%20CREATE%20TABLES.sql) Para crear las estructuras de información en un modelo de base de datos relacional. 
 - [INSERTS](https://github.com/Jorge-delaRosa/RetoKodemia/blob/master/01%20%5BPEDIDOS%5D%20INSERTS.sql) Para rellenar las estructuras con información de pruebas.
    
Estos *scripts*  fueron generados a partir de una base de datos SQL Server, pero sientete con la libertad de utilizar la fuente de datos que prefieras.

Con respecto al Frontend, estas pantallas fueron construidas utilizando [jQuery Mobile](https://demos.jquerymobile.com/1.4.5/), Si deseas puedes hacer uso de este componente, o utilizar otras librerías con las que te sientas más cómodo.

## ¿Qué es lo que buscamos, al revisar tú código?
1. Que tan creativ@ eres.
2. La calidad de tu código y mejores prácticas.
3. Principalmente tus skills como front end developer haciendo uso de HTML, CSS y JavaScript.
4. Funcionalidad.
5. Documentación.

Te deseamos lo mejor.

Compártenos tu repo (público / privado) de la nube de tu preferencia, compártelo al correo jorge@incremental.soutions.
