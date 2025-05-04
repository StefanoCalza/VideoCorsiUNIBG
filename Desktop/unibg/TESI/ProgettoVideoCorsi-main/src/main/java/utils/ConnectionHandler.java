package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.UnavailableException;

import beans.User;

public class ConnectionHandler {
	private static ConnectionHandler sInstance = null;
	private static Connection connection = null;
	
	private ConnectionHandler() {
	}
	
	public static ConnectionHandler getInstance() {
		if(sInstance == null)
			sInstance = new ConnectionHandler();
		return sInstance;
	}
	
	public static Connection getConnection(ServletContext context) throws UnavailableException {
		try {
			String driver = context.getInitParameter("dbDriver");
			String url = context.getInitParameter("dbUrl");
			String user = context.getInitParameter("dbUsername");
			String password = context.getInitParameter("dbPassword");
			
			System.out.println("Tentativo di connessione al database con:");
			System.out.println("URL: " + url);
			System.out.println("User: " + user);
			
			Class.forName(driver);
			Connection newConnection = DriverManager.getConnection(url, user, password);
			System.out.println("Connessione al database stabilita con successo");
			return newConnection;
		} catch (ClassNotFoundException e) {
			System.out.println("Errore nel caricamento del driver: " + e.getMessage());
			throw new UnavailableException("Can't load database driver");
		} catch (SQLException e) {
			System.out.println("Errore nella connessione al database: " + e.getMessage());
			throw new UnavailableException("Couldn't get db connection");
		}
	}
	
	public static void closeConnection(Connection connection) throws SQLException {
		if (connection != null && !connection.isClosed()) {
			connection.close();
			System.out.println("Connessione al database chiusa");
		}
	}
}
