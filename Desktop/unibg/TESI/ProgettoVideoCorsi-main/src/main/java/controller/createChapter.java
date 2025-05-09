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
			// Se manca isfinal, mostra solo la pagina di creazione capitolo/quiz/video
			String isFinalParam = request.getParameter("isfinal");
			if (isFinalParam == null) {
				request.setAttribute("id_course", request.getParameter("CourseId"));
				request.setAttribute("name_course", request.getParameter("name_course"));
				request.setAttribute("description_corse", request.getParameter("description_corse"));
				request.getRequestDispatcher("/WEB-INF/jsp/Create_chapter.jsp").forward(request, response);
				return;
			}

			TransactionManager.beginTransaction(connection);
			
			// Parse and validate course ID
			int courseId = Integer.parseInt(request.getParameter("CourseId"));
			int chapterId = courseDao.getMaxChapterIdByCourseId(courseId);
			boolean isFinal = Integer.parseInt(isFinalParam) == 1;
			
			// Insert chapter
			courseDao.insertChapter(courseId, chapterId, 
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
					chapterId
				);
			}
			
			TransactionManager.commitTransaction(connection);
			
			// Set attributes for the next page
			request.setAttribute("name_course", request.getParameter("name_course"));
			request.setAttribute("description_corse", request.getParameter("description_corse"));
			request.setAttribute("id_course", request.getParameter("CourseId"));

			// Forward a pagina di conferma
			request.getRequestDispatcher("/WEB-INF/jsp/confirm_add_chapter.jsp").forward(request, response);
			return;
			
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
