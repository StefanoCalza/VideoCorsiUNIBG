package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
import dao.Chapter_CourseDao;
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
			Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);

			// Verifica se il corso è già completato dallo studente
			boolean isCoursePassed = false;
			List<immutablebeans.ImmutableCourse> passedCourses = chapterDao.exam_passed(user.getId());
			for (immutablebeans.ImmutableCourse c : passedCourses) {
				if (c.getIdCourse() == courseId) {
					isCoursePassed = true;
					break;
				}
			}

			List<ImmutableQuiz> questions = quizDao.quiz_by_chapter_and_course(courseId, chapterId);
			if (questions == null || questions.isEmpty()) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "No quiz found for this chapter");
				return;
			}

			// Recupero se il capitolo è finale
			int isFinal = 0;
			String query = "SELECT is_final FROM chapter WHERE course = ? AND chapter = ?";
			try (PreparedStatement pstatement = connection.prepareStatement(query)) {
				pstatement.setInt(1, courseId);
				pstatement.setInt(2, chapterId);
				try (ResultSet result = pstatement.executeQuery()) {
					if (result.next()) {
						isFinal = result.getInt("is_final");
					}
				}
			}

			// Lista per risposte sbagliate
			List<Map<String, Object>> wrongAnswers = new ArrayList<>();

			int right = 0;
			for (ImmutableQuiz quiz : questions) {
				String answer = request.getParameter(quiz.getIds());
				int rispostaData = (answer != null) ? Integer.parseInt(answer) : -1;
				// Salva la risposta data solo se quiz finale e il corso NON è già completato
				if (isFinal == 1 && !isCoursePassed) {
					quizDao.saveQuizAnswer(user.getId(), courseId, chapterId, quiz.getIdQuiz(), rispostaData);
				}
				if (rispostaData == quiz.getRisposta()) {
					right++;
				} else {
					Map<String, Object> wrong = new HashMap<>();
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

			float score = (float) right / questions.size();
			if (!isCoursePassed) {
				if (score >= 0.75) {
					if (isFinal == 1) {
						quizDao.setpassed(user.getId(), courseId, chapterId); // in attesa di convalida docente
					} else {
						quizDao.setverifyed(user.getId(), courseId, chapterId); // direttamente superato
					}
				} else {
					quizDao.setnotpassed(user.getId(), courseId, chapterId); // non passato
				}
			}

			request.setAttribute("right", right);
			request.setAttribute("total", questions.size());
			request.setAttribute("score", score);
			request.setAttribute("wrongAnswers", wrongAnswers);
			request.setAttribute("is_final", isFinal);
			request.setAttribute("isCoursePassed", isCoursePassed);
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
