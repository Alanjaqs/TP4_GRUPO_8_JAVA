package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoTipoSeguros;
import entidades.TipoSeguros;
import dao.DaoSeguros;
import entidades.Seguros;

@WebServlet("/ServletSeguros")
public class ServletSeguros extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletSeguros() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Variable para identificar que debe hacer el servlet segun de que hyperlink venga
		String accion = request.getParameter("accion");
		if (accion == null) accion = "listar";
			    
		switch (accion) {
		// Pagina Agregar Seguro
			case "agregar": 
		        	
		    // Carga de label proximo ID
		    int proximoId;
		    DaoSeguros daoSeguro = new DaoSeguros();
		    proximoId = daoSeguro.ObtenerProximoId();       
		    request.setAttribute("proximoId", proximoId);
		    
		    //Carga DDL Seguros
		     DaoTipoSeguros tiposDao = new DaoTipoSeguros();
	         ArrayList<TipoSeguros> listaTipos = tiposDao.ObtenerTipoSeguros();
	         request.setAttribute("listaTipos", listaTipos);

		    request.getRequestDispatcher("/AgregarSeguro.jsp").forward(request, response);
		    return;
		 // Pagina Listar Seguros
	        case "listar":
		
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Carga de label proximo ID
    	int proximoId;
    	DaoSeguros daoSeguro = new DaoSeguros();
    	proximoId = daoSeguro.ObtenerProximoId();       
    	request.setAttribute("proximoId", proximoId);
		
		request.getRequestDispatcher("/AgregarSeguro.jsp").forward(request, response);
		
	}

}
