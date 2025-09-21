<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="Inicio.jsp" style="margin-right:20px;">Inicio</a>
	<a href="AgregarSeguro.jsp" style="margin-right:20px;">Agregar Seguros</a>
	<a href="">Listar Seguros</a>

	<h2>Agregar Seguros</h2>
		<form method="post" action="">
			<br/>
			Id seguro:
			<label style="margin-left:120px">
			<%  // donde se mostrara proximo ID %>
			</label>
			<br/><br/>
			Descripcion:
			<input type="text" name="txtDescripcion" style="margin-left:100px"></input>
			<br/><br/>
			Tipo de seguro:
			<select name="tipoSeguros" style="margin-left:80px">
			<%
				// Logica para el dropdown con foreach
			%>
			<option value="<%  %>"><% %></option>
			<% // llave de cierre foreach  %>
			</select>	
			<br/><br/>
			Costo contratacion:
			<input type="text" name="txtCostoCont" style="margin-left:57px"></input>
			<br/><br/>
			Costo máximo asegurado:
			<input type="text" name="txtCostoAseg" style="margin-left:16px"></input>
			<br/><br/><br/>
			<input type="submit" name="btnAceptar" value="Aceptar"></input> 
			<br/><br/>
			<label> <%  // donde se mostrara mensaje exito o error %> </label>
		</form>
</body>
</html>