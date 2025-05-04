package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.*;

import beans.*;
import dao.*;
import immutablebeans.ImmutableUser;
import utils.*;

@WebServlet("/gotovideo")
@MultipartConfig
public class GoToVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;

	public GoToVideo() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		ImmutableUser user = (ImmutableUser) session.getAttribute("user");
		request.setAttribute("CourseId", request.getParameter("CourseId"));
		request.setAttribute("ChapterId", request.getParameter("ChapterId"));
		request.setAttribute("namec", request.getParameter("coursename"));
		request.setAttribute("video", request.getParameter("video"));
		request.setAttribute("charaname", request.getParameter("charaname"));
		request.getRequestDispatcher("/WEB-INF/jsp/video.jsp").forward(request, response);

	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
