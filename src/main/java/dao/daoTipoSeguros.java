package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import entidades.TipoSeguros;


public class daoTipoSeguros {
	
		private String host = "jdbc:mysql://localhost:3306/";
		private String user = "root";
		private String pass = "root";
		private String dbName = "segurosGroup";
		
		public void listarTipoSeguros() {
		    
		    Connection cn = null;

		    try {
		        cn = DriverManager.getConnection(host + dbName, user, pass);
		        String query = "SELECT descripcion FROM tiposeguros";
		        Statement st = cn.createStatement();
		        ResultSet rs = st.executeQuery(query);

		        while (rs.next()) {
		            TipoSeguros tS = new TipoSeguros();
		            tS.setDescripcion("descripcion");
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } 
		    
		}
}
