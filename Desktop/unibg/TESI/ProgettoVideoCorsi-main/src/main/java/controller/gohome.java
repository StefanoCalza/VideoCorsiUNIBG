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

import org.apache.commons.lang3.*;

import beans.*;
import dao.*;
import immutablebeans.ImmutableU_C;
import immutablebeans.ImmutableUser;
import immutablebeans.ImmutableCourse;
import utils.*;

@WebServlet("/gohome")
@MultipartConfig
public class gohome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public gohome() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		if (user.getRole() == 1) {
			request.setAttribute("me", user.getUsername());
			request.getRequestDispatcher("GetCourse").forward(request, response);
		}
		else {
			QuizDAO quizDao = new QuizDAO(connection);
			Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
			List<ImmutableU_C> u_c = new ArrayList<ImmutableU_C>();
			List<ImmutableCourse> allCourses = new ArrayList<>();
			try {
				u_c = quizDao.quiz_to_verify();
				allCourses = chapterDao.getAllCourses();
				Logger.logInfo("DEBUG: Numero corsi caricati per docente = " + allCourses.size());
				if (u_c == null) {
					response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
					return;
				}
			} catch (NumberFormatException | NullPointerException | SQLException e) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "db error");
				return;
			}
			request.setAttribute("userchapter", u_c);
			request.setAttribute("allCourses", allCourses);
			request.getRequestDispatcher("homeDocente.jsp").forward(request, response);
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
