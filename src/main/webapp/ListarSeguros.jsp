<%@page import="entidades.TipoSeguros" %>
<%@page import="entidades.Seguros" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <a href="Inicio.jsp">Inicio</a>
	<a href="ServletSeguros">Agregar Seguros</a>
	<a href="ServletSeguros">Listar Seguros</a>
	
	<%
		// Cargo una nueva lista de clase TipoSeguro con la lista traida (tipoS) del servlet
		ArrayList<TipoSeguros> listaTipoSeguro = new ArrayList<TipoSeguros>();
		if(request.getAttribute("tipoS") != null){
			listaTipoSeguro = (ArrayList<TipoSeguros>)request.getAttribute("tipoS");
		}
		
		// Cargo una nueva lista de clase Seguro con la lista traida (seg) del servlet
		ArrayList<Seguros> listaSeguro = new ArrayList<Seguros>();
		if(request.getAttribute("seg") != null){
			listaSeguro = (ArrayList<Seguros>)request.getAttribute("seg");
		}
		
		// Cargo lista filtrada de Seguro con la lista traida (segFiltrados) del servlet
		ArrayList<Seguros> listaFiltrada = new ArrayList<Seguros>();
		if(request.getAttribute("segFiltrados") != null){
			listaFiltrada = (ArrayList<Seguros>)request.getAttribute("segFiltrados");
		}
		
		// Cargo bool para saber si el filtro se activo o no (lo inicializo en false para que empiece con un valor)
		boolean filtro = false;
		if(request.getAttribute("filtroBD") != null){
			filtro = (boolean)request.getAttribute("filtroBD");
		}
	
	%>
	
	<form action="" method="get">
	<input type="hidden" name="accion" value="listar">
	<h1>Tipo de seguro en la base de datos</h1>
	
	Busqueda por tipo de seguros:  
	<select name="tipoSeguros">
		<%
			if(listaTipoSeguro != null)
			for(TipoSeguros tipoS : listaTipoSeguro)
			{					
		%>
		<option value="<%= tipoS.getIdTipo() %>"><%= tipoS.getDescripcion() %></option>
		<%  } %>
		</select>
	<input type="submit" name="filtrar" value="Filtrar"> 
	</form>
	
<table border="1">
  <tr>
    <th>idSeguro</th><th>descripcion</th><th>idTipo</th><th>costoContratacion</th><th>costoAsegurado</th>
  </tr>
  <%
		// Lista completa
		if (listaSeguro != null && !filtro) {
    		for (Seguros seguro : listaSeguro) {
		%>
        <tr>
            <td><%= seguro.getIdSeguros() %></td>
            <td><%= seguro.getDescripcion() %></td>
            <td><%= seguro.getDescripcion() %></td>
            <td><%= seguro.getCostoContratacion() %></td>
            <td><%= seguro.getCostoAsegurado() %></td>
        </tr>
		<%
    		}
    	// Lista filtrada
		} else if (listaFiltrada != null && filtro) {
    		for (Seguros seguro : listaFiltrada) {
		%>
        <tr>
            <td><%= seguro.getIdSeguros() %></td>
            <td><%= seguro.getDescripcion() %></td>
            <td><%= seguro.getDescripcion() %></td>
            <td><%= seguro.getCostoContratacion() %></td>
            <td><%= seguro.getCostoAsegurado() %></td>
        </tr>
		<%
    		}
		}
		%>

</table>
</body>
</html>