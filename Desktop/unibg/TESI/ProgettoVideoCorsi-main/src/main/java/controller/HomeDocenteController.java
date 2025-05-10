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
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;
import utils.Logger;
import utils.TransactionManager;

@WebServlet("/HomeDocente")
public class HomeDocenteController extends HttpServlet {
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
        Chapter_CourseDao chapterDao = new Chapter_CourseDao(connection);
        try {
            TransactionManager.beginTransaction(connection);
            List<ImmutableCourse> allCourses = chapterDao.getAllCourses();
            TransactionManager.commitTransaction(connection);
            request.setAttribute("allCourses", allCourses);
            request.getRequestDispatcher("/WEB-INF/jsp/homeDocente.jsp").forward(request, response);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            Logger.logError("Errore nel caricamento dei corsi per docente", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel caricamento dei corsi");
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