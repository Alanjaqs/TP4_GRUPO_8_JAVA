package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.TipoSeguros;


public class DaoTipoSeguros {
	
		private String host = "jdbc:mysql://localhost:3306/";
		private String user = "root";
		private String pass = "root";
		private String dbName = "segurosGroup";
		
		public ArrayList<TipoSeguros> ObtenerTipoSeguros() {
		    
			ArrayList<TipoSeguros> lista = new ArrayList<>();
		    Connection cn = null;

		    try {
		        cn = DriverManager.getConnection(host + dbName, user, pass);
		        String query = "SELECT descripcion FROM tiposeguros";
		        Statement st = cn.createStatement();
		        ResultSet rs = st.executeQuery(query);

		        while (rs.next()) {
		            TipoSeguros tS = new TipoSeguros();
		            tS.setDescripcion(rs.getString("descripcion"));
		            lista.add(tS);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } 
		    
		    return lista;
		}
}
