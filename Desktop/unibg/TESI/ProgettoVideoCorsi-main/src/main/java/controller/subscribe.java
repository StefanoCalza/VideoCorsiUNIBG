package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

import beans.*;
import dao.Chapter_CourseDao;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.TransactionManager;

@WebServlet("/Iscriviti")
public class subscribe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public subscribe() {
		super();
	}

	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();

		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		
		if (user == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
			return;
		}

		String courseIdStr = request.getParameter("CourseId");
		if (courseIdStr == null || courseIdStr.trim().isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course ID is required");
			return;
		}

		Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
		List<Integer> chapters;
		
		try {
			TransactionManager.beginTransaction(connection);
			
			int courseId = Integer.parseInt(courseIdStr);
			chapters = chapterDao.getChapterIdsByCourseId(courseId);
			
			if (chapters == null || chapters.isEmpty()) {
				TransactionManager.rollbackTransaction(connection);
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "No chapters found for this course");
				return;
			}
			
			// subscribe the user to every chapter of a course
			for (Integer chapterId : chapters) {
				chapterDao.subscribeUserToChapter(courseId, user.getId(), chapterId);
			}
			
			TransactionManager.commitTransaction(connection);
			
			request.setAttribute("chapter", chapters);
			request.getRequestDispatcher("GetChapters2").forward(request, response);
			
		} catch (NumberFormatException e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course ID format");
			return;
		} catch (SQLException e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
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
