<%@page pageEncoding="Cp1252" contentType="text/html; charset=Cp1252" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=Cp1252"/>
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
			  <li ><a href='ingreso_precio.jsp'>Excursiones por precio</a></li>
			  <li class="active"><a href='ingreso_dest.jsp'>Excursiones por destino</a></li>
			  
			</ul>
  	</div>
	<div class="row">
  		<div class="col-md-6 col-md-offset-3">
  			<br>
  			<h4>Excursiones por destino</h4>
  			<br>  			
  			<form action='Servlet_Dest' method='POST'>
	  			<div class="form-group">
				  <label>Destino : </label>
				  <input type="text" class="form-control" name='destino'>
				</div>
				<button type="submit" class="btn btn-default">INGRESAR</button>
  			</form>
	
  		</div>
  	</div>
	
  </body>
</html>


