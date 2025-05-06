package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.UserDAO;
import dao.QuizDAO;
import immutablebeans.ImmutableUser;
import immutablebeans.ImmutableU_C;
import utils.ConnectionHandler;

/**
 * 
 * check the credential and autenticate the user
 *
 */
@WebServlet("/CheckLogin")
@MultipartConfig
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckLogin() {
		super();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		
		System.out.println("Tentativo di login con username: " + username + " e password: " + password);
		
		if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Credenziali mancanti");
			return;
		}

		Connection connection = null;
		try {
			connection = ConnectionHandler.getConnection(getServletContext());
			UserDAO userDao = new UserDAO(connection);
			ImmutableUser user = userDao.checkCredentials(username, password);
			
			if (user == null) {
				System.out.println("Login fallito per l'utente: " + username);
				request.setAttribute("errorMsg", "Username o password non validi");
				request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
				return;
			}
			
			System.out.println("Login riuscito per l'utente: " + username);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			if (user.getRole() == 1) {
				QuizDAO quizDao = new QuizDAO(connection);
				List<ImmutableU_C> u_c = new ArrayList<ImmutableU_C>();
				try {
					u_c = quizDao.quiz_to_verify();
					if (u_c == null) {
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
						return;
					}
				} catch (NumberFormatException | NullPointerException | SQLException e) {
					response.sendError(HttpServletResponse.SC_BAD_REQUEST, "db error");
					return;
				}
				request.setAttribute("userchapter", u_c);
				//request.getRequestDispatcher("homeDocente.jsp").forward(request, response);
				request.getRequestDispatcher("/WEB-INF/jsp/homeDocente.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("GetCourse").forward(request, response);
			}
			
		} catch (Exception e) {
			System.out.println("Errore durante il login: " + e.getMessage());
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore interno del server");
		} finally {
			try {
				ConnectionHandler.closeConnection(connection);
			} catch (SQLException e) {
				System.out.println("Errore durante la chiusura della connessione: " + e.getMessage());
			}
		}
	}
	

	/* 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		
		System.out.println("Tentativo di login con username: " + username + " e password: " + password);
		
		if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Credenziali mancanti");
			return;
		}

		Connection connection = null;
		try {
			connection = ConnectionHandler.getConnection(getServletContext());
			UserDAO userDao = new UserDAO(connection);
			ImmutableUser user = userDao.checkCredentials(username, password);
			
			//System.out.println(user.toString());
			if (user == null) {
				System.out.println("Login fallito per l'utente: " + username);
				request.setAttribute("errorMsg", "Username o password non validi");
				request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
				return;
			}
			
			//System.out.println("Login riuscito per l'utente: " + user.getUsername());
			
			HttpSession session = request.getSession();
			session.setAttribute("user", user);


			if (user.getRole() == 1) {
				//System.out.println("professore");
				QuizDAO quizDao = new QuizDAO(connection);
				List<ImmutableU_C> u_c = new ArrayList<ImmutableU_C>();
				try {
					u_c = quizDao.quiz_to_verify();
					if (u_c == null) {
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
						return;
					}
				} catch (NumberFormatException | NullPointerException | SQLException e) {
					response.sendError(HttpServletResponse.SC_BAD_REQUEST, "db error");
					return;
				}
				request.setAttribute("userchapter", u_c);
				request.getRequestDispatcher("/WEB-INF/jsp/homeDocente.jsp").forward(request, response);
				//response.sendRedirect(request.getContextPath() + "/homeDocente.jsp");

			} else if(user.getRole() == 2) {
				//System.out.println("studente");
				request.getRequestDispatcher("/WEB-INF/jsp/courses.jsp").forward(request, response);
				//response.sendRedirect(request.getContextPath() + "/courses.jsp");
			}
			else{
				throw new IOException("Ruolo inesistente");
			}
			
		} catch (Exception e) {
			System.out.println("Errore durante il login: " + e.getMessage());
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore interno del server");
		} finally {
			try {
				ConnectionHandler.closeConnection(connection);
			} catch (SQLException e) {
				System.out.println("Errore durante la chiusura della connessione: " + e.getMessage());
			}
		}
	}
	*/

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
