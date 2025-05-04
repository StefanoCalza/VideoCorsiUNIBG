package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.Chapter_CourseDao;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.Logger;
import utils.TransactionManager;

@WebServlet("/SubscribeCourse")
public class SubscribeCourse extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = null;

    public SubscribeCourse() {
        super();
    }

    public void init() throws ServletException {
        connection = ConnectionHandler.getConnection(getServletContext());
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ImmutableUser user = (ImmutableUser) session.getAttribute("user");

        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        String courseId = request.getParameter("CourseId");
        if (courseId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course ID is required");
            return;
        }

        try {
            TransactionManager.beginTransaction(connection);
            
            Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
            int courseIdInt = Integer.parseInt(courseId);
            
            // Verifica se lo studente è già iscritto al corso
            if (chapterDao.isUserSubscribed(user.getId(), courseIdInt)) {
                TransactionManager.rollbackTransaction(connection);
                response.sendError(HttpServletResponse.SC_CONFLICT, "User already subscribed to this course");
                return;
            }
            
            // Iscrivi lo studente al corso
            chapterDao.subscribeUserToCourse(user.getId(), courseIdInt);
            
            TransactionManager.commitTransaction(connection);
            
            // Reindirizza alla pagina dei corsi
            response.sendRedirect(request.getContextPath() + "/ChapterController");
            
        } catch (NumberFormatException e) {
            TransactionManager.rollbackTransaction(connection);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course ID");
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            Logger.logError("Errore nell'iscrizione al corso", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                "Internal server error: " + e.getMessage());
        }
    }

    public void destroy() {
        try {
            ConnectionHandler.closeConnection(connection);
        } catch (SQLException e) {
            Logger.logError("Errore nella chiusura della connessione", e);
        }
    }
} 