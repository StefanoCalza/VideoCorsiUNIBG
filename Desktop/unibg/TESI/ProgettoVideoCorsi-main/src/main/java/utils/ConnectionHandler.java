package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.UnavailableException;

import beans.User;

public class ConnectionHandler {
	private static ConnectionHandler sInstance  = null; 
	private static Connection connection = null; 
	
	private ConnectionHandler() {
	}
	
	public static ConnectionHandler getIstance() {
		if(sInstance == null)
			sInstance = new ConnectionHandler();
		
	
		return sInstance;
	}
	
	public static Connection getConnection(ServletContext context) throws UnavailableException {

		if(connection == null) {
			try {
			String driver = context.getInitParameter("dbDriver");
			String url = context.getInitParameter("dbUrl");
			String user = context.getInitParameter("dbUser");
			String password = context.getInitParameter("dbPassword");
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Can't load database driver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
		}
			
		}
		else {
		}
		
		return connection;
	}
	
	public static Connection getConnection() throws UnavailableException {
		return connection;
	}

	
	public static void closeConnection(Connection connection) throws SQLException {
		if (connection != null) {
			connection.close();
		}
	}
	
}
