package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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
import dao.QuizDAO;
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
		ServletContext servletContext = getServletContext();

		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");
		QuizDAO quizDao = new QuizDAO(connection);
		List<ImmutableQuiz> questions = new ArrayList<ImmutableQuiz>();
		// get the list of question in a specific chapter
		try {
			questions = quizDao.quiz_by_chapter_and_course(Integer.parseInt(request.getParameter("CourseId")),
					Integer.parseInt(request.getParameter("ChapterId")));
			if (questions == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
				return;
			}
		} catch (NumberFormatException | NullPointerException | SQLException e) {
			// only for debugging e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "db error");
			return;
		}
		
//		questions = quizDao.quiz_by_chapter_and_course(Integer.parseInt(request.getParameter("CourseId")),				Integer.parseInt(request.getParameter("ChapterId")));
		if(Integer.parseInt(request.getParameter("ChapterId")) >1){
			
			try {
				if(quizDao.quiz_passed(user.getId(), Integer.parseInt(request.getParameter("CourseId")),Integer.parseInt(request.getParameter("ChapterId"))-1)!=2){
					
					request.getRequestDispatcher("GetCourse").forward(request, response);
				}
				else {
					request.setAttribute("quiz", questions);
					request.getRequestDispatcher("WEB-INF/quiz.jsp").forward(request, response);
				}
				
			} catch (NumberFormatException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		else{
			request.setAttribute("quiz", questions);
			request.getRequestDispatcher("WEB-INF/quiz.jsp").forward(request, response);
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
