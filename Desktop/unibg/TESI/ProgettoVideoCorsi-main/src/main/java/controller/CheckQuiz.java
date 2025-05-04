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
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		QuizDAO quizDao = new QuizDAO(connection);
		List<ImmutableQuiz> reply = new ArrayList<ImmutableQuiz>();
		// get the list of quiz desired
		try {

			reply = quizDao.quiz_by_chapter_and_course(Integer.parseInt(request.getParameter("CourseId")),
					Integer.parseInt(request.getParameter("ChapterId")));
			if (reply == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
				return;
			}
		} catch (NumberFormatException | NullPointerException | SQLException e) {
			// only for debugging e.printStackTrace();

			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "db error");
			return;
		}
		// check the number of right results
		int right = 0;
		for (ImmutableQuiz quiz : reply) {
			if (quiz.getRisposta() == Integer.parseInt(request.getParameter(quiz.getIds()))) {
				right++;
			}
		}
		// check if has passed the test
		if (((float) right / reply.size()) >= 0.75) {
			try {
				quizDao.setpassed(user.getId(), Integer.parseInt(request.getParameter("CourseId")),
						Integer.parseInt(request.getParameter("ChapterId")));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
		}
		request.setAttribute("right", right);
		request.getRequestDispatcher("WEB-INF/risultato.jsp").forward(request, response);

	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
