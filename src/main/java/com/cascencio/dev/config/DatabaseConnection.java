package com.cascencio.dev.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

//    private static final String URL = "jdbc:postgresql://localhost:5432/db_ventas";
//    private static final String USUARIO = "postgres";
//    private static final String CONTRASENA = "admin";

   private static final String URL = "jdbc:postgresql://castor.db.elephantsql.com/ywcipoog";
   private static final String USUARIO = "ywcipoog";
   private static final String CONTRASENA = "8UzDUQ4IRAvRgzAWoe77cnpUjbZO1y-H";

	private DatabaseConnection() {}
	
	public static Connection obtenerConexion() throws SQLException {
        Connection conexion = null;
        
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException e) {
            System.out.println("Error al cargar el controlador de la base de datos.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos.");
            e.printStackTrace();
        }
        
        return conexion;
	}
}
