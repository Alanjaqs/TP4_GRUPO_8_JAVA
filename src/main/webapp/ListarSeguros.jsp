<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <a href="">Inicio</a>
	<a href="">Agregar Seguros</a>
	<a href="">Listar Seguros</a>
	
	<form action="" method="get">
	<input type="hidden" name="accion" value="listar">
	<h1>Tipo de seguro en la base de datos</h1>
	
	Busqueda por tipo de seguros:  
	<select name="tipoSeguro">
   
    </select>
	<input type="submit" name="filtrar" value="Filtrar"> 
	</form>
	
<table border="1">
  <tr>
    <th>idSeguro</th><th>descripcion</th><th>idTipo</th><th>costoContratacion</th><th>costoAsegurado</th>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>

</table>
</body>
</html>