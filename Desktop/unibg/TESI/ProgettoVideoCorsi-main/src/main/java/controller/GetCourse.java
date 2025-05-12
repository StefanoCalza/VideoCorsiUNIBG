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
import dao.QuizDAO;
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableU_C;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.TransactionManager;

@WebServlet("/GetCourse")
public class GetCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public GetCourse() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		// Salvo l'utente in sessione (già presente)
		// Redirect su GET per evitare ERR_CACHE_MISS
		response.sendRedirect(request.getContextPath() + "/GetCourse");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");

		if (user == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
			return;
		}

		Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
		List<ImmutableCourse> courses = new ArrayList<ImmutableCourse>();
		List<ImmutableCourse> coursesNotFollowed = new ArrayList<ImmutableCourse>();
		try {
			TransactionManager.beginTransaction(connection);
			courses = chapterDao.getCoursesByUserId(user.getId());
			coursesNotFollowed = chapterDao.getCoursesNotFollowedByUserId(user.getId());
			if (courses == null || coursesNotFollowed == null) {
				TransactionManager.rollbackTransaction(connection);
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
				return;
			}
			TransactionManager.commitTransaction(connection);
		} catch (SQLException e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
				"Database error: " + e.getMessage());
			return;
		} catch (Exception e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, 
				"Invalid request: " + e.getMessage());
			return;
		}

		if (user.getRole() == 2) {
			request.setAttribute("chapter", courses);
			request.setAttribute("coursesnotin", coursesNotFollowed);
			request.getRequestDispatcher("/WEB-INF/jsp/courses.jsp").forward(request, response);
		} else {
			QuizDAO quizDao = new QuizDAO(connection);
			List<ImmutableU_C> u_c = new ArrayList<ImmutableU_C>();
			request.setAttribute("chapter", courses);
			request.setAttribute("coursesnotin", coursesNotFollowed);
			try {
				TransactionManager.beginTransaction(connection);
				u_c = quizDao.quiz_to_verify();
				if (u_c == null) {
					TransactionManager.rollbackTransaction(connection);
					response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
					return;
				}
				TransactionManager.commitTransaction(connection);
			} catch (SQLException e) {
				TransactionManager.rollbackTransaction(connection);
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
					"Database error: " + e.getMessage());
				return;
			} catch (Exception e) {
				TransactionManager.rollbackTransaction(connection);
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, 
					"Invalid request: " + e.getMessage());
				return;
			}
			request.setAttribute("userchapter", u_c);
			request.getRequestDispatcher("/WEB-INF/jsp/homeDocente.jsp").forward(request, response);
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
