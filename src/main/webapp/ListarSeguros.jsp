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
	<a href="servletSeguros">Agregar Seguros</a>
	<a href="servletSeguros">Listar Seguros</a>
	
	<%
		// Cargo una nueva lista de clase TipoSeguro con la lista traida (tipoS) del servlet
		ArrayList<TipoSeguro> listaTipoSeguro = new ArrayList<TipoSeguro>();
		if(request.getAttribute("tipoS") != null){
			listaTipoSeguro = (ArrayList<TipoSeguro>)request.getAttribute("tipoS");
		}
		
		// Cargo una nueva lista de clase Seguro con la lista traida (seg) del servlet
		ArrayList<Seguro> listaSeguro = new ArrayList<Seguro>();
		if(request.getAttribute("seg") != null){
			listaSeguro = (ArrayList<Seguro>)request.getAttribute("seg");
		}
		
		// Cargo lista filtrada de Seguro con la lista traida (segFiltrados) del servlet
		ArrayList<Seguro> listaFiltrada = new ArrayList<Seguro>();
		if(request.getAttribute("segFiltrados") != null){
			listaFiltrada = (ArrayList<Seguro>)request.getAttribute("segFiltrados");
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
			for(TipoSeguro tipoS : listaTipoSeguro)
			{					
		%>
		<option value="<%= tipoS.getId() %>"><%= tipoS.getDescripcion() %></option>
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
    		for (Seguro seguro : listaSeguro) {
		%>
        <tr>
            <td><%= seguro.getId() %></td>
            <td><%= seguro.getDescripcion() %></td>
            <td><%= seguro.getTipoDescripcion() %></td>
            <td><%= seguro.getCostoContratacion() %></td>
            <td><%= seguro.getCostoAsegurado() %></td>
        </tr>
		<%
    		}
    	// Lista filtrada
		} else if (listaFiltrada != null && filtro) {
    		for (Seguro seguro : listaFiltrada) {
		%>
        <tr>
            <td><%= seguro.getId() %></td>
            <td><%= seguro.getDescripcion() %></td>
            <td><%= seguro.getTipoDescripcion() %></td>
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