package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import dao.Chapter_CourseDao;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.TransactionManager;

@WebServlet("/Createcourse")
public class createCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public createCourse() {
		super();
	}

	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		Chapter_CourseDao courseDao = new Chapter_CourseDao(connection);
		int maxCourseId;
		
		try {
			TransactionManager.beginTransaction(connection);
			maxCourseId = courseDao.getMaxCourseId();
			
			//insert the new course
			courseDao.insertCourse(maxCourseId + 1, request.getParameter("Coursename"), request.getParameter("Coursedescription"));
			TransactionManager.commitTransaction(connection);
			
			request.getRequestDispatcher("GetCourse").forward(request, response);
		} catch (SQLException e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
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
