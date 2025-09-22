package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import entidades.Seguros;

public class DaoSeguros {
	// Datos conexion
		private String host = "jdbc:mysql://localhost:3306/";
		private String user = "root";
		private String pass = "root";
		private String dbName = "segurosgroup";
		
		// Traer proximo ID
		public int ObtenerProximoId() {
			
			// IMPORTANTE
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			//
			
			int proximoId = 0;
			Connection cn = null;
			
			try {
				cn = DriverManager.getConnection(host+dbName, user, pass);
				Statement st = cn.createStatement();
				String query = "SELECT idSeguro FROM seguros ORDER BY idSeguro DESC LIMIT 1";
				ResultSet rs = st.executeQuery(query);
				if (rs.next()) {
					Seguros ultimoSeguro = new Seguros();
					ultimoSeguro.setIdSeguros(rs.getInt("idSeguro"));
					proximoId = ultimoSeguro.getIdSeguros();			
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return proximoId + 1;
		}
		
		

		public int agregarSeguro(Seguros seguro) {	
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			}
			catch (ClassNotFoundException e){
				e.printStackTrace();
			    return 0;
			}
			
			String query = "INSERT INTO seguros (descripcion, idTipo, costoContratacion, costoAsegurado) " + "VALUES (?, ?, ?, ?)";
			Connection cn =null;
			int filas = 0;
			
			try {
				cn = DriverManager.getConnection(host+dbName,user,pass);	
			    PreparedStatement prepst = cn.prepareStatement(query);
			    prepst.setString(1, seguro.getDescripcion());
			    prepst.setInt(2, seguro.getIdTipo());
			    prepst.setDouble(3, seguro.getCostoContratacion());
			    prepst.setDouble(4, seguro.getCostoAsegurado());
			    filas = prepst.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return filas;
		}
		
}


