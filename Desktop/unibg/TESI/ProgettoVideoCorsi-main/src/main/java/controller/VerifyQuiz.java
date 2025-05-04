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

		HttpSession session = request.getSession();

		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		QuizDAO quizDao = new QuizDAO(connection);
		// set verifyed the exam
		try {
			quizDao.setverifyed(Integer.parseInt(request.getParameter("UserId")),
					Integer.parseInt(request.getParameter("CourseId")),
					Integer.parseInt(request.getParameter("ChapterId")));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		List<ImmutableU_C> u_c = new ArrayList<ImmutableU_C>();
		// get the other quiz to verify and redirect to the homepage of the teacher
		try {
			u_c = quizDao.quiz_to_verify();
			if (u_c == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
				return;
			}
		} catch (NumberFormatException | NullPointerException | SQLException e) {
			// only for debugging e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "db error");
			return;
		}
		request.setAttribute("userchapter", u_c);
		request.getRequestDispatcher("homeDocente.jsp").forward(request, response);
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
