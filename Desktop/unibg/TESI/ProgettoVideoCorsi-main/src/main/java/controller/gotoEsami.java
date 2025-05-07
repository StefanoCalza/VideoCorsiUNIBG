package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.apache.commons.lang3.*;

import beans.*;
import dao.*;
import immutablebeans.ImmutableUser;
import utils.*;

@WebServlet("/goEsami")
@MultipartConfig
public class gotoEsami extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public gotoEsami() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		request.setAttribute("me", user);

		if (user != null && user.getRole() == 1) {
			QuizDAO quizDao = new QuizDAO(connection);
			java.util.List<immutablebeans.ImmutableU_C> u_c = new java.util.ArrayList<>();
			try {
				u_c = quizDao.quiz_to_verify();
				if (u_c == null) {
					request.setAttribute("userchapter", null);
				} else {
					request.setAttribute("userchapter", u_c);
				}
			} catch (Exception e) {
				request.setAttribute("userchapter", null);
			}
		} 

		request.getRequestDispatcher("/WEB-INF/jsp/esami.jsp").forward(request, response);
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
