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

@WebServlet("/EliminaCapitolo")
public class EliminaCapitolo extends HttpServlet {
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
        String chapterIdStr = request.getParameter("ChapterId");
        if (courseIdStr == null || chapterIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri mancanti");
            return;
        }
        int courseId, chapterId;
        try {
            courseId = Integer.parseInt(courseIdStr);
            chapterId = Integer.parseInt(chapterIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri non validi");
            return;
        }
        Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
        QuizDAO quizDao = new QuizDAO(connection);
        try {
            TransactionManager.beginTransaction(connection);
            // Elimina tutte le risposte ai quiz di questo capitolo
            String deleteQuizRisposte = "DELETE FROM quiz_risposte WHERE id_course = ? AND id_chapter = ?";
            try (var ps = connection.prepareStatement(deleteQuizRisposte)) {
                ps.setInt(1, courseId);
                ps.setInt(2, chapterId);
                ps.executeUpdate();
            }
            // Elimina tutti i quiz del capitolo
            String deleteQuiz = "DELETE FROM quiz_provvisorio WHERE idcourse = ? AND idchapter = ?";
            try (var ps = connection.prepareStatement(deleteQuiz)) {
                ps.setInt(1, courseId);
                ps.setInt(2, chapterId);
                ps.executeUpdate();
            }
            // Elimina tutte le iscrizioni degli studenti a questo capitolo
            String deleteIscrizioni = "DELETE FROM iscrizioni WHERE idCourse = ? AND idChapter = ?";
            try (var ps = connection.prepareStatement(deleteIscrizioni)) {
                ps.setInt(1, courseId);
                ps.setInt(2, chapterId);
                ps.executeUpdate();
            }
            // Elimina il capitolo
            String deleteChapter = "DELETE FROM chapter WHERE course = ? AND chapter = ?";
            try (var ps = connection.prepareStatement(deleteChapter)) {
                ps.setInt(1, courseId);
                ps.setInt(2, chapterId);
                ps.executeUpdate();
            }
            TransactionManager.commitTransaction(connection);
            // Redirect con successo
            String redirectUrl = request.getContextPath() + "/GestisciCorso?CourseId=" + courseId + "&success=2";
            response.sendRedirect(redirectUrl);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            Logger.logError("Errore nell'eliminazione del capitolo o quiz", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nell'eliminazione del capitolo o quiz");
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