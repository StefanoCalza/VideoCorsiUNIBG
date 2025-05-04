package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;


import beans.*;
import dao.Chapter_CourseDao;
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;

@WebServlet("/GetPassedExam")
public class GetPassedExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public GetPassedExam() {
		super();
	}

	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();

		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		try {
			HttpSession session = request.getSession();
			ImmutableUser user = (ImmutableUser) session.getAttribute("user");
			
			if (user == null) {
				System.out.println("User not found in session");
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not authenticated");
				return;
			}
			
			System.out.println("Processing request for user ID: " + user.getId());
			System.out.println("User name: " + user.getName());
			
			// Verifica che la connessione sia valida
			if (connection == null || connection.isClosed()) {
				System.out.println("Database connection is not valid, reinitializing...");
				connection = ConnectionHandler.getConnection(getServletContext());
			}
			
			Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
			List<ImmutableCourse> courses = new ArrayList<ImmutableCourse>();
			
			try {
				courses = chapterDao.exam_passed(user.getId());
				System.out.println("Retrieved " + courses.size() + " passed courses");
				
				request.setAttribute("passed", courses);
				request.getRequestDispatcher("/WEB-INF/jsp/passed_exam.jsp").forward(request, response);
			}
			catch (SQLException e) {
				System.out.println("Error retrieving passed courses: " + e.getMessage());
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Database error: " + e.getMessage());
				return;
			}
		} catch (Exception e) {
			System.out.println("Unexpected error: " + e.getMessage());
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
			return;
		}
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
