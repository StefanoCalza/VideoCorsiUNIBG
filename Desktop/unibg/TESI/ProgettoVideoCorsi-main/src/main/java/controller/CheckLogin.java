package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@WebServlet("/CheckLogin")
@MultipartConfig
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public CheckLogin() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usrn = null;
		String pwd = null;
		usrn = request.getParameter("username");
		byte[] bytesOfMessage = request.getParameter("pwd").getBytes("UTF-8");

		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] theMD5digest = md.digest(bytesOfMessage);
			StringBuilder sb = new StringBuilder();
	        for (byte b : theMD5digest) {
	            sb.append(String.format("%02x", b));
	        }
	        pwd = sb.toString();		
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}

		if (usrn == null || pwd == null || usrn.isEmpty() || pwd.isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().println("Credentials must be not null");
			return;
		}
		UserDAO userDao = new UserDAO(connection);
		ImmutableUser user;
		try {
			user = userDao.checkCredentials(usrn, pwd);
		} catch (SQLException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().println("Internal server error, retry later");
			return;
		}

		// check if the user is saved, then redirect to the homepage for every role
		if (user == null) {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.getWriter().println("Incorrect credentials");
		} else {
			request.getSession().setAttribute("user", user);
			request.setAttribute("me", user.getUsername());
			if (user.getRole() == 2) {
				request.getRequestDispatcher("GetCourse").forward(request, response);

			} else {
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
			}

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
