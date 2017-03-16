<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id='arregloDest' scope='application' class='java.util.ArrayList' />  

<html>
  <head>
    <title> Listado destinos </title>
  </head>

  <body bgcolor="#B7FFB7">
 <table border="5" width="50%" bordercolor="#00AE00" height="50" bgcolor="#B6F4AA">
  <tr>
   <td>
    <p align="center"><b>
    <font face="Tahoma" size="4"> Listado de excursiones para el destino : (aca va el destino) </font></b>
   </td>
  </tr>
 </table> <br>

  <table border="2" width="50%" bordercolor="#00AE00" height="50" bgcolor="#B6F4AA">
   <tr>
    <td><b> Autor </b></td>
    <td><b> Mensaje </b></td>
   </tr>
   <c:forEach items="${arregloDest}" var="i" >
    <tr>
     <td> ${i.codigo} </td>
     <td> ${i.destino} </td>
    </tr>
   </c:forEach>     
  
 </table>

 <p><a href='inicio.jsp'>Volver a inicio</a></p>
  
  </body>
</html>