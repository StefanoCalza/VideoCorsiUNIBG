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

@WebServlet("/goProfile")
@MultipartConfig
public class goProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public goProfile() {
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
			request.getRequestDispatcher("WEB-INF/jsp/profilo_docente.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("WEB-INF/jsp/profilo.jsp").forward(request, response);
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
