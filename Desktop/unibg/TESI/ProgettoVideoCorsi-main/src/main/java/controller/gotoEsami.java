package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.apache.commons.lang3.*;

import beans.*;
import dao.*;
import immutablebeans.ImmutableUser;
import utils.*;

@WebServlet("/goEsami")
@MultipartConfig
public class gotoEsami extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public gotoEsami() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		request.setAttribute("me", user);

		if (user != null && user.getRole() == 1) {
			QuizDAO quizDao = new QuizDAO(connection);
			Chapter_CourseDao courseDao = new Chapter_CourseDao(connection);
			UserDAO userDao = new UserDAO(connection);
			java.util.List<immutablebeans.ImmutableU_C> u_c = new java.util.ArrayList<>();
			java.util.List<java.util.Map<String, Object>> userchapterWithNames = new java.util.ArrayList<>();
			try {
				u_c = quizDao.quiz_to_verify();
				if (u_c == null) {
					request.setAttribute("userchapter", null);
				} else {
					for (immutablebeans.ImmutableU_C item : u_c) {
						java.util.Map<String, Object> map = new java.util.HashMap<>();
						map.put("idcourse", item.getIdcourse());
						map.put("iduser", item.getIduser());
						map.put("idchapter", item.getIdchapter());
						// Ottieni nome corso
						String nomeCorso = "";
						try { nomeCorso = courseDao.getCourseById(item.getIdcourse()).getName(); } catch(Exception e) {}
						map.put("nomecorso", nomeCorso);
						// Ottieni nome utente
						String nomeUtente = "";
						try { nomeUtente = userDao.getUsernameById(item.getIduser()); } catch(Exception e) {}
						map.put("nomeutente", nomeUtente);
						userchapterWithNames.add(map);
					}
					request.setAttribute("userchapter", userchapterWithNames);
				}
			} catch (Exception e) {
				request.setAttribute("userchapter", null);
			}
		} 

		request.getRequestDispatcher("/WEB-INF/jsp/esami.jsp").forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
