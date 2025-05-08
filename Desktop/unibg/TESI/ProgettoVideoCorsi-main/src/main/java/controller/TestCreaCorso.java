package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.Chapter_CourseDao;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.TransactionManager;

@WebServlet("/testcreacorso")
public class TestCreaCorso extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = null;

    public TestCreaCorso() {
        super();
    }

    public void init() throws ServletException {
        ServletContext servletContext = getServletContext();
        connection = ConnectionHandler.getConnection(getServletContext());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        ImmutableUser user = (ImmutableUser) session.getAttribute("user");
        Chapter_CourseDao courseDao = new Chapter_CourseDao(connection);
        int maxCourseId;
        try {
            System.out.println("[TestCreaCorso] Parametri ricevuti: Coursename='" + request.getParameter("Coursename") + "', Coursedescription='" + request.getParameter("Coursedescription") + "'");
            TransactionManager.beginTransaction(connection);
            maxCourseId = courseDao.getMaxCourseId();
            System.out.println("[TestCreaCorso] maxCourseId attuale: " + maxCourseId);
            //insert the new course
            courseDao.insertCourse(maxCourseId + 1, request.getParameter("Coursename"), request.getParameter("Coursedescription"));
            System.out.println("[TestCreaCorso] Corso inserito con id: " + (maxCourseId + 1));
            TransactionManager.commitTransaction(connection);
            // Redirect invece di forward
            String redirectUrl = request.getContextPath() + "/CreateChapter?id_course=" + (maxCourseId + 1)
                + "&name_course=" + java.net.URLEncoder.encode(request.getParameter("Coursename"), "UTF-8")
                + "&description_corse=" + java.net.URLEncoder.encode(request.getParameter("Coursedescription"), "UTF-8");
            response.sendRedirect(redirectUrl);
            return;
        } catch (SQLException e) {
            System.out.println("[TestCreaCorso] Errore SQL: " + e.getMessage());
            TransactionManager.rollbackTransaction(connection);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
            return;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void destroy() {
        try {
            ConnectionHandler.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 