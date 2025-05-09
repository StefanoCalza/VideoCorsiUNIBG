package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.management.relation.RelationTypeSupport;

import beans.User;
import immutablebeans.ImmutableQuiz;
import immutablebeans.ImmutableUser;

public class UserDAO {
	private Connection con;

	public UserDAO(Connection connection) {
		this.con = connection;
	}

	public ImmutableUser checkCredentials(String usrn, String pwd) throws SQLException {
		System.out.println("UserDAO.checkCredentials - username: " + usrn + ", password: " + pwd);
		String query = "SELECT  * FROM \"user\"  WHERE username = ? AND password =?";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			pstatement.setString(1, usrn);
			pstatement.setString(2, pwd);
			try (ResultSet result = pstatement.executeQuery();) {
				if (!result.isBeforeFirst()) {
					System.out.println("Nessun utente trovato con queste credenziali");
					return null;
				}
				else { 
					result.next();
					System.out.println("Utente trovato con ID: " + result.getInt("id"));
					User user = new User(
						result.getInt("id"),
						result.getString("username"),
						result.getInt("role"),
						result.getString("nome"),
						result.getString("cognome"),
						result.getString("email"),
						result.getString("skillscard")
					);
					return user;
				}
			}
		}
	}
	
	/**
	 * change the password of a specific user
	 * @param id
	 * @param psw
	 * @throws SQLException
	 */
	public void changePass(int id, String psw) throws SQLException {
		String query = "UPDATE \"user\" SET password = ? where id = ? ;";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			pstatement.setString(1, psw);
			pstatement.setInt(2, id);
			pstatement.executeUpdate();

		}

	}
	
	public String getUsernameById(int id) throws SQLException {
		String username = null;
		String query = "SELECT username FROM \"user\" WHERE id = ?";
		try (PreparedStatement pstatement = con.prepareStatement(query)) {
			pstatement.setInt(1, id);
			try (ResultSet result = pstatement.executeQuery()) {
				if (result.next()) {
					username = result.getString("username");
				}
			}
		}
		return username;
	}
}
