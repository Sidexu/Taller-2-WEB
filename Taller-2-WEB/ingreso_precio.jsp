<%@page pageEncoding="Cp1252" contentType="text/html; charset=Cp1252" %>
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<div class="row" style="margin-left: 10px;">
  	
  		<h1> Excursiones del Diablo</h1>
  
  	</div>
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    
    
    <div class="row">
  		<div class="col-md-6 col-md-offset-3">
  			<ul class="nav nav-tabs">
			  <li >
			    <a href='inicio.jsp'>Home</a>
			  </li>
			  <li class="active"><a href='ingreso_precio.jsp'>Excursiones por precio</a></li>
			  <li><a href='ingreso_dest.jsp'>Excursiones por destino</a></li>
			  
			</ul>
  		</div>	
  	</div>
	<div class="row">
  		<div class="col-md-6 col-md-offset-3">
  			<br>
  			<h4>Excursiones por rango de precios</h4>
  			<br>  			
  			<form action='Servlet_Precio' method='POST'>
	  			<div class="form-group">
				  <label>Precio inicial : </label>
				  <input type="text" class="form-control" name='precio1'>
				</div>
				<div class="form-group">
				  <label>Precio final : </label>
				  <input type="text" class="form-control" name='precio2'>
				</div>
				<button type="submit" class="btn btn-default">CONSULTAR</button>
  			</form>
	
  		</div>
  	</div>
	
  </body>
</html>



