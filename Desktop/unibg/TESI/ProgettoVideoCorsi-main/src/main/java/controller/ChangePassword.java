package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

import org.apache.commons.lang3.*;

import dao.*;
import immutablebeans.ImmutableU_C;
import immutablebeans.ImmutableUser;
import utils.*;

/**
 * 
 * check the credential and autenticate the user
 *
 */
@WebServlet("/ChangePassword")
@MultipartConfig
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public ChangePassword() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		String currentPwd = request.getParameter("current_pwd");
		String newPwd = request.getParameter("new_pwd");
		String repeatPwd = request.getParameter("repeat_pwd");

		if (currentPwd == null || newPwd == null || repeatPwd == null || currentPwd.isEmpty() || newPwd.isEmpty() || repeatPwd.isEmpty()) {
			request.setAttribute("errorMsg", "Tutti i campi sono obbligatori.");
			request.getRequestDispatcher("/WEB-INF/jsp/changepassword.jsp").forward(request, response);
			return;
		}

		UserDAO userDao = new UserDAO(connection);
		try {
			// Verifica password attuale
			ImmutableUser check = userDao.checkCredentials(user.getUsername(), currentPwd);
			if (check == null) {
				request.setAttribute("errorMsg", "La password attuale non è corretta.");
				request.getRequestDispatcher("/WEB-INF/jsp/changepassword.jsp").forward(request, response);
				return;
			}
			// Verifica nuova password
			if (!newPwd.equals(repeatPwd)) {
				request.setAttribute("errorMsg", "Le nuove password non coincidono.");
				request.getRequestDispatcher("/WEB-INF/jsp/changepassword.jsp").forward(request, response);
				return;
			}
			// Aggiorna password
			userDao.changePass(user.getId(), newPwd);
			response.sendRedirect(request.getContextPath() + "/goProfile?success=1");
			return;
		} catch (SQLException e) {
			request.setAttribute("errorMsg", "Errore interno, riprova più tardi.");
			request.getRequestDispatcher("/WEB-INF/jsp/changepassword.jsp").forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
