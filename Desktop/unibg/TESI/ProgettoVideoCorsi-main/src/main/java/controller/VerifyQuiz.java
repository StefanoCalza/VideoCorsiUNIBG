package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import immutablebeans.ImmutableU_C;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;

@WebServlet("/VerifyQuiz")
public class VerifyQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;
	// private TemplateEngine templateEngine;

	public VerifyQuiz() {
		super();
	}

	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();

		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Mostra la pagina di riepilogo risultati per la convalida docente
		String userIdStr = request.getParameter("UserId");
		String courseIdStr = request.getParameter("CourseId");
		String chapterIdStr = request.getParameter("ChapterId");
		if (userIdStr == null || courseIdStr == null || chapterIdStr == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
			return;
		}
		int userId = Integer.parseInt(userIdStr);
		int courseId = Integer.parseInt(courseIdStr);
		int chapterId = Integer.parseInt(chapterIdStr);
		QuizDAO quizDao = new QuizDAO(connection);
		try {
			List<immutablebeans.ImmutableQuiz> questions = quizDao.quiz_by_chapter_and_course(courseId, chapterId);
			Map<Integer, Integer> answers = quizDao.getQuizAnswers(userId, courseId, chapterId);
			int right = 0;
			int total = questions.size();
			List<java.util.Map<String, Object>> wrongAnswers = new java.util.ArrayList<>();
			for (immutablebeans.ImmutableQuiz quiz : questions) {
				int rispostaData = answers.getOrDefault(quiz.getIdQuiz(), -1);
				if (rispostaData == quiz.getRisposta()) {
					right++;
				} else {
					java.util.Map<String, Object> wrong = new java.util.HashMap<>();
					wrong.put("question", quiz.getQuestion());
					wrong.put("first", quiz.getFirst());
					wrong.put("second", quiz.getSecond());
					wrong.put("third", quiz.getThird());
					wrong.put("fourth", quiz.getFourth());
					wrong.put("correct", quiz.getRisposta());
					wrong.put("given", rispostaData);
					wrongAnswers.add(wrong);
				}
			}
			request.setAttribute("right", right);
			request.setAttribute("total", total);
			request.setAttribute("wrongAnswers", wrongAnswers);
			request.setAttribute("param", request.getParameterMap());
			request.getRequestDispatcher("/WEB-INF/jsp/risultato_docente.jsp").forward(request, response);
		} catch (Exception e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel caricamento risultati quiz");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Convalida il corso (passed=2) e reindirizza alla home docente
		String userIdStr = request.getParameter("UserId");
		String courseIdStr = request.getParameter("CourseId");
		String chapterIdStr = request.getParameter("ChapterId");
		if (userIdStr == null || courseIdStr == null || chapterIdStr == null) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
			return;
		}
		int userId = Integer.parseInt(userIdStr);
		int courseId = Integer.parseInt(courseIdStr);
		int chapterId = Integer.parseInt(chapterIdStr);
		QuizDAO quizDao = new QuizDAO(connection);
		try {
			quizDao.setverifyed(userId, courseId, chapterId);
		} catch (SQLException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nella convalida");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/goEsami?success=1");
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
