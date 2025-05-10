package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.Chapter_CourseDao;
import immutablebeans.ImmutableChapter;
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.Logger;
import utils.TransactionManager;

@WebServlet("/ChaptersDocente")
public class ChaptersDocente extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = null;

    public void init() throws ServletException {
        connection = ConnectionHandler.getConnection(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            List<ImmutableChapter> chapters = chapterDao.getChaptersByCourseId(courseId);
            ImmutableCourse course = chapterDao.getCourseById(courseId);
            TransactionManager.commitTransaction(connection);
            request.setAttribute("chapters", chapters);
            request.setAttribute("course", course);
            request.getRequestDispatcher("/WEB-INF/jsp/chapters_docente.jsp").forward(request, response);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            Logger.logError("Errore nel caricamento dei capitoli per docente", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel caricamento dei capitoli");
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