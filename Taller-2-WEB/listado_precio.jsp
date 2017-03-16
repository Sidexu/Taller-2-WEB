<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id='arregloPrec' scope='application' class='java.util.ArrayList' />  

<html>
  <head>
    <title> Listado de excursiones por rango de precios </title>
  </head>

  <body bgcolor="#B7FFB7">
 <table border="5" width="50%" bordercolor="#00AE00" height="50" bgcolor="#B6F4AA">
  <tr>
   <td>
    <p align="center"><b>
    <font face="Tahoma" size="4"> Listado de excursiones por rango de precios : (aca va el destino) </font></b>
   </td>
  </tr>
 </table> <br>

  <table border="2" width="50%" bordercolor="#00AE00" height="50" bgcolor="#B6F4AA">
   <tr>
    <td><b> Codigo </b></td>
    <td><b> Destino </b></td>
    <td><b> Hora Partida </b></td>
    <td><b> Hora Regreso </b></td>
    <td><b> Precio base </b></td>
    <td><b> Cantidad disponible </b></td>
   </tr>
   <c:forEach items="${arregloPrec}" var="i" >
    <tr>
     <td> ${i.codigo} </td>
     <td> ${i.destino} </td>
     <td> ${i.hr_partida.getHora()}:${i.hr_partida.getMin()} </td>
     <td> ${i.hr_regreso.getHora()}:${i.hr_regreso.getMin()} </td>
     <td> ${i.precioBase} </td>
     <td> ${i.cant_disponibles} </td>
    </tr>
   </c:forEach>     
  
 </table>

 <p><a href='inicio.jsp'>Volver a inicio</a></p>
  
  </body>
</html>