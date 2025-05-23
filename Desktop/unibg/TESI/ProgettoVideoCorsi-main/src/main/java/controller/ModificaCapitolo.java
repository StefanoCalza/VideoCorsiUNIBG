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
import immutablebeans.ImmutableChapter;
import immutablebeans.ImmutableQuiz;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.Logger;
import utils.TransactionManager;

@WebServlet("/ModificaCapitolo")
public class ModificaCapitolo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = null;

    public void init() throws ServletException {
        connection = ConnectionHandler.getConnection(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            ImmutableChapter chapter = chapterDao.getChapterByCourseAndId(courseId, chapterId);
            java.util.List<ImmutableQuiz> quizList = quizDao.quiz_by_chapter_and_course(courseId, chapterId);
            TransactionManager.commitTransaction(connection);
            request.setAttribute("chapter", chapter);
            request.setAttribute("CourseId", courseId);
            request.setAttribute("quizList", quizList);
            request.getRequestDispatcher("/WEB-INF/jsp/modifica_capitolo.jsp").forward(request, response);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            Logger.logError("Errore nel caricamento del capitolo per modifica", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel caricamento del capitolo");
        }
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
        String name = request.getParameter("Chaptername");
        String description = request.getParameter("Chapterdescription");
        String video = request.getParameter("Chaptervideo");
        String isFinalStr = request.getParameter("isFinal");
        if (courseIdStr == null || chapterIdStr == null || name == null || description == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri mancanti");
            return;
        }
        int courseId, chapterId;
        boolean isFinal = false;
        try {
            courseId = Integer.parseInt(courseIdStr);
            chapterId = Integer.parseInt(chapterIdStr);
            isFinal = (isFinalStr != null && (isFinalStr.equals("1") || isFinalStr.equalsIgnoreCase("on")));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri non validi");
            return;
        }
        Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
        QuizDAO quizDao = new QuizDAO(connection);
        try {
            TransactionManager.beginTransaction(connection);
            chapterDao.updateChapter(courseId, chapterId, name, video, isFinal, description);
            // Aggiorna quiz
            java.util.List<ImmutableQuiz> quizList = quizDao.quiz_by_chapter_and_course(courseId, chapterId);
            for (ImmutableQuiz quiz : quizList) {
                int idQuiz = quiz.getIdQuiz();
                String domanda = request.getParameter("quiz_question_" + idQuiz);
                String a = request.getParameter("quiz_a_" + idQuiz);
                String b = request.getParameter("quiz_b_" + idQuiz);
                String c = request.getParameter("quiz_c_" + idQuiz);
                String d = request.getParameter("quiz_d_" + idQuiz);
                String rispostaStr = request.getParameter("quiz_correct_" + idQuiz);
                int risposta = 1;
                try { risposta = Integer.parseInt(rispostaStr); } catch(Exception e) {}
                quizDao.updateQuiz(idQuiz, domanda, a, b, c, d, risposta);
            }
            TransactionManager.commitTransaction(connection);
            // Redirect alla pagina di gestione corso con messaggio di successo
            String redirectUrl = request.getContextPath() + "/GestisciCorso?CourseId=" + courseId + "&success=1";
            response.sendRedirect(redirectUrl);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            Logger.logError("Errore nella modifica del capitolo o quiz", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nella modifica del capitolo o quiz");
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