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

@WebServlet("/EliminaCorso")
public class EliminaCorso extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = null;

    public void init() throws ServletException {
        connection = ConnectionHandler.getConnection(getServletContext());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ImmutableUser user = (ImmutableUser) session.getAttribute("user");
        if (user == null || user.getRole() != 1) { // Solo docente
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Accesso non autorizzato");
            return;
        }
        String courseIdStr = request.getParameter("CourseId");
        if (courseIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "CourseId mancante");
            return;
        }
        int courseId;
        try {
            courseId = Integer.parseInt(courseIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "CourseId non valido");
            return;
        }
        Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
        try {
            TransactionManager.beginTransaction(connection);
            chapterDao.deleteCourseAndDependencies(courseId);
            TransactionManager.commitTransaction(connection);
            // Redirect con successo
            String redirectUrl = request.getContextPath() + "/HomeDocente?success=3";
            response.sendRedirect(redirectUrl);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            Logger.logError("Errore nell'eliminazione del corso", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nell'eliminazione del corso");
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