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
import dao.QuizDAO;
import immutablebeans.ImmutableQuiz;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;

@WebServlet("/CheckQuiz")
public class CheckQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public CheckQuiz() {
		super();
	}

	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();

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

			// Controlla le risposte
			int right = 0;
			for (ImmutableQuiz quiz : questions) {
				String answer = request.getParameter(quiz.getIds());
				if (answer != null && Integer.parseInt(answer) == quiz.getRisposta()) {
					right++;
				}
			}

			// Verifica se ha superato il test (75% o più di risposte corrette)
			if (((float) right / questions.size()) >= 0.75) {
				quizDao.setpassed(user.getId(), courseId, chapterId);
			}

			request.setAttribute("right", right);
			request.setAttribute("total", questions.size());
			request.getRequestDispatcher("/WEB-INF/jsp/risultato.jsp").forward(request, response);

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
