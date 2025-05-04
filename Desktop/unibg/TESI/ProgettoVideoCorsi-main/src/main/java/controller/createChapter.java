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
import javax.sound.midi.Soundbank;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

import beans.*;
import dao.Chapter_CourseDao;
import dao.QuizDAO;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.TransactionManager;

@WebServlet("/CreateChapter")
public class createChapter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public createChapter() {
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

		Chapter_CourseDao courseDao = new Chapter_CourseDao(connection);
		QuizDAO quizDao = new QuizDAO(connection);
		
		try {
			TransactionManager.beginTransaction(connection);
			
			// Parse and validate course ID
			int courseId = Integer.parseInt(request.getParameter("CourseId"));
			int maxChapterId = courseDao.getMaxChapterIdByCourseId(courseId);
			boolean isFinal = Integer.parseInt(request.getParameter("isfinal")) == 1;
			
			// Insert chapter
			courseDao.insertChapter(courseId, maxChapterId + 1, 
				request.getParameter("Chaptername"),
				request.getParameter("Video"), 
				isFinal, 
				request.getParameter("Chapterdescription"));
			
			// Insert quizzes
			int quizId = quizDao.maxquiz();
			for (int i = 1; i <= 4; i++) {
				quizDao.insert_quiz(
					quizId + (i-1),
					request.getParameter("d" + i),
					request.getParameter("r" + i + "1"),
					request.getParameter("r" + i + "2"),
					request.getParameter("r" + i + "3"),
					request.getParameter("r" + i + "4"),
					Integer.parseInt(request.getParameter("g" + i)),
					courseId,
					maxChapterId + 1
				);
			}
			
			TransactionManager.commitTransaction(connection);
			
			// Set attributes for the next page
			request.setAttribute("name_course", request.getParameter("name_course"));
			request.setAttribute("description_corse", request.getParameter("description_corse"));
			request.setAttribute("id_course", request.getParameter("CourseId"));
			
			// Forward to appropriate page
			if (!isFinal) {
				request.getRequestDispatcher("Create_chapter.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("homeDocente.jsp").forward(request, response);
			}
			
		} catch (NumberFormatException e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format in parameters");
			return;
		} catch (SQLException e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
			return;
		} catch (Exception e) {
			TransactionManager.rollbackTransaction(connection);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unexpected error: " + e.getMessage());
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
