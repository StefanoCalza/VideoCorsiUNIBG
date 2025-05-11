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
import dao.QuizDAO;
import utils.ConnectionHandler;
import utils.Logger;
import utils.TransactionManager;
import immutablebeans.ImmutableUser;

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
        if (user == null || user.getRole() != 1) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Accesso non autorizzato");
            return;
        }
        String courseIdStr = request.getParameter("CourseId");
        if (courseIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametro CourseId mancante");
            return;
        }
        int courseId;
        try {
            courseId = Integer.parseInt(courseIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametro CourseId non valido");
            return;
        }
        Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
        QuizDAO quizDao = new QuizDAO(connection);
        try {
            TransactionManager.beginTransaction(connection);
            // Elimina tutte le risposte ai quiz di tutti i capitoli del corso
            String deleteQuizRisposte = "DELETE FROM quiz_risposte WHERE id_course = ?";
            try (var ps = connection.prepareStatement(deleteQuizRisposte)) {
                ps.setInt(1, courseId);
                ps.executeUpdate();
            }
            // Elimina tutti i quiz del corso
            String deleteQuiz = "DELETE FROM quiz_provvisorio WHERE idcourse = ?";
            try (var ps = connection.prepareStatement(deleteQuiz)) {
                ps.setInt(1, courseId);
                ps.executeUpdate();
            }
            // Elimina tutte le iscrizioni degli studenti a questo corso
            String deleteIscrizioni = "DELETE FROM iscrizioni WHERE idCourse = ?";
            try (var ps = connection.prepareStatement(deleteIscrizioni)) {
                ps.setInt(1, courseId);
                ps.executeUpdate();
            }
            // Elimina tutti i capitoli del corso
            String deleteChapters = "DELETE FROM chapter WHERE course = ?";
            try (var ps = connection.prepareStatement(deleteChapters)) {
                ps.setInt(1, courseId);
                ps.executeUpdate();
            }
            // Elimina il corso
            String deleteCourse = "DELETE FROM course WHERE idCourse = ?";
            try (var ps = connection.prepareStatement(deleteCourse)) {
                ps.setInt(1, courseId);
                ps.executeUpdate();
            }
            TransactionManager.commitTransaction(connection);
            // Redirect con successo
            String redirectUrl = request.getContextPath() + "/HomeDocente?success=2";
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
            Logger.logError("Errore nella chiusura della connessione", e);
        }
    }
} 