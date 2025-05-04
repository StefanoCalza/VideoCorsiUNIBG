package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Chapter_CourseDao;
import immutablebeans.ImmutableChapter;
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.Logger;
import utils.TransactionManager;

/**
 * Controller unificato per la gestione dei capitoli e dei corsi.
 * Gestisce sia il recupero dei corsi seguiti da un utente che i capitoli di un corso specifico.
 */
@WebServlet("/ChapterController")
public class ChapterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = null;

    public ChapterController() {
        super();
    }

    public void init() throws ServletException {
        connection = ConnectionHandler.getConnection(getServletContext());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ImmutableUser user = (ImmutableUser) session.getAttribute("user");

        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        String courseId = request.getParameter("CourseId");
        Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);

        try {
            if (courseId == null) {
                // Caso 1: Recupero corsi seguiti dall'utente
                handleUserCourses(request, response, user, chapterDao);
            } else {
                // Caso 2: Recupero capitoli di un corso specifico
                handleCourseChapters(request, response, courseId, chapterDao);
            }
        } catch (Exception e) {
            Logger.logError("Errore nel ChapterController", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                "Internal server error: " + e.getMessage());
        }
    }

    private void handleUserCourses(HttpServletRequest request, HttpServletResponse response,
            ImmutableUser user, Chapter_CourseDao chapterDao) 
            throws ServletException, IOException, SQLException {
        List<ImmutableCourse> courses = new ArrayList<>();
        
        try {
            TransactionManager.beginTransaction(connection);
            
            courses = chapterDao.getCoursesByUserId(user.getId());
            
            if (courses == null) {
                TransactionManager.rollbackTransaction(connection);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No courses found");
                return;
            }
            
            TransactionManager.commitTransaction(connection);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            throw e;
        }
        
        request.setAttribute("chapter", courses);
        request.getRequestDispatcher("/WEB-INF/jsp/courses.jsp").forward(request, response);
    }

    private void handleCourseChapters(HttpServletRequest request, HttpServletResponse response,
            String courseId, Chapter_CourseDao chapterDao) 
            throws ServletException, IOException, SQLException {
        List<ImmutableChapter> chapters = new ArrayList<>();
        ImmutableCourse course;
        
        try {
            TransactionManager.beginTransaction(connection);
            
            int courseIdInt = Integer.parseInt(courseId);
            chapters = chapterDao.getChaptersByCourseId(courseIdInt);
            
            if (chapters == null) {
                TransactionManager.rollbackTransaction(connection);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No chapters found");
                return;
            }
            
            course = chapterDao.getCourseById(courseIdInt);
            if (course == null) {
                TransactionManager.rollbackTransaction(connection);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course not found");
                return;
            }
            
            TransactionManager.commitTransaction(connection);
        } catch (NumberFormatException e) {
            TransactionManager.rollbackTransaction(connection);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course ID");
            return;
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            throw e;
        }
        
        request.setAttribute("namec", course.getName());
        request.setAttribute("chapter", chapters);
        request.getRequestDispatcher("/WEB-INF/jsp/chapters.jsp").forward(request, response);
    }

    public void destroy() {
        try {
            ConnectionHandler.closeConnection(connection);
        } catch (SQLException e) {
            Logger.logError("Errore nella chiusura della connessione", e);
        }
    }
} 