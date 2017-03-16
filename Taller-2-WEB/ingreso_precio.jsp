<%@page pageEncoding="Cp1252" contentType="text/html; charset=Cp1252" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Cp1252"/>
<title>EXCURSIONES POR RANGO DE PRECIOS</title>
</head>
<body>
	<form action='Servlet_Precio' method='POST'>
     	<p> Rango entre: <input type='text' name='precio1' size=30> </p>
     	<p> hasta: <input type='text' name='precio2' size=30> </p>
     	<p> <input type='submit' value='CONSULTAR'> </p>
	</form>
</body>
</html>
