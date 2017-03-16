<%@page pageEncoding="Cp1252" contentType="text/html; charset=Cp1252" %>
<jsp:useBean id='msgError' scope='application' class='java.lang.String' />  

<html>
  <head>
    <title>Mensaje de error</title>
  </head>
  <body bgcolor="#FCF8C2">
	<table border="5" width="50%" bordercolor="#FF8A8A" height="50" bgcolor="#FEE3BC">
		<tr>
			<td>
				<p align="center"><b>
				<font face="Tahoma" size="4"> Error </font></b>
			</td>
		</tr>
	</table>
	<p><b> ${msgError} </b></p>
	<p><a href='inicio.jsp'>Volver al inicio</a></p>		
  </body>
</html>