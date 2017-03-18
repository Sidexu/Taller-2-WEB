<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id='arregloPrec' scope='application' class='java.util.ArrayList' />  
<jsp:useBean id='datosPrec' scope='application' class='java.lang.String' />  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Excursiones del diablo</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

  </head>
  <body>
  	<div class="row" style="background: #EEF2FC; margin-left: auto;">
  	
  		<h1> Excursiones del Diablo</h1>
  
  	</div>
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    
    
    <div class="row">
  		<div class="col-md-4"></div>	
  			<ul class="nav nav-tabs" style="background: #EEF2FC;">
			  <li >
			    <a href='inicio.jsp'>Home</a>
			  </li>
			  <li class="active"><a href='ingreso_precio.jsp'>Excursiones por precio</a></li>
			  <li ><a href='ingreso_dest.jsp'>Excursiones por destino</a></li>
			  
			</ul>
  	</div>
	<div class="row">
  		<div class="col-md-6 col-md-offset-3">
  			<br>  			
  			<table class="table table-hover">
  			<tr>
			   <td>
			    <p align="center"><b>
			    <font face="Tahoma" size="4"> Listado de excursiones por rango de precios: ${datosPrec} </font></b>
			   </td>
			  </tr>
			 </table> <br>
			
			  <table class="table table-hover">
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
	
  		</div>
  	</div>
	
  </body>
</html>






