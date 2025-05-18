package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
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
import dao.QuizDAO;
import dao.Chapter_CourseDao;
import immutablebeans.ImmutableQuiz;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;

@WebServlet("/GetQuiz")
public class GetQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public GetQuiz() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// Verifica se l'utente è loggato
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		if (user == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
			return;
		}

		// Verifica i parametri richiesti
		String courseIdStr = request.getParameter("CourseId");
		String chapterIdStr = request.getParameter("ChapterId");
		if (courseIdStr == null || chapterIdStr == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
			return;
		}

		try {
			int courseId = Integer.parseInt(courseIdStr);
			int chapterId = Integer.parseInt(chapterIdStr);
			
			QuizDAO quizDao = new QuizDAO(connection);
			List<ImmutableQuiz> questions = quizDao.quiz_by_chapter_and_course(courseId, chapterId);
			
			if (questions == null || questions.isEmpty()) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "No quiz found for this chapter");
				return;
			}

			// Recupero se il capitolo è finale
			int isFinal = 0;
			String query = "SELECT is_final FROM chapter WHERE course = ? AND chapter = ?";
			try (java.sql.PreparedStatement pstatement = connection.prepareStatement(query)) {
				pstatement.setInt(1, courseId);
				pstatement.setInt(2, chapterId);
				try (java.sql.ResultSet result = pstatement.executeQuery()) {
					if (result.next()) {
						isFinal = result.getInt("is_final");
					}
				}
			}

			// Randomizza l'ordine delle domande
			Collections.shuffle(questions);

			// Capitolo 1: accesso sempre consentito
			if (chapterId > 1) {
				int previousChapterStatus = quizDao.quiz_passed(user.getId(), courseId, chapterId - 1);
				if (previousChapterStatus != 2) {
					String redirectUrl = request.getContextPath() + "/ChapterController?CourseId=" + courseId + "&errorMessage=" + java.net.URLEncoder.encode("Devi prima superare il quiz del capitolo precedente per accedere a questo quiz.", "UTF-8");
					response.sendRedirect(redirectUrl);
					return;
				}
			}

			request.setAttribute("quiz", questions);
			request.setAttribute("is_final", isFinal);
			request.getRequestDispatcher("/WEB-INF/jsp/quiz.jsp").forward(request, response);

		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course or chapter ID");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
		}
	}

	public void destroy() {
		try {
			if (connection != null && !connection.isClosed()) {
				ConnectionHandler.closeConnection(connection);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
