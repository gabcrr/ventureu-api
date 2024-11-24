package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public static Connection getConexao() {
		
		Connection conexao = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/ventureau_store";
			conexao = DriverManager.getConnection(url, "root", "12345");
			
		   
		}catch(SQLException ex) {
			System.out.print ("Erro ao abrir a conexao");
			throw new RuntimeException ("Erro ao abrir conexão", ex) ;
			
		}catch (Exception ex) {
			System.out.print ("Erro ao abrir a conexao");
			throw new RuntimeException ("Erro ao registrar driver JDBC", ex) ;
		}
		
		return conexao;
	}
}

