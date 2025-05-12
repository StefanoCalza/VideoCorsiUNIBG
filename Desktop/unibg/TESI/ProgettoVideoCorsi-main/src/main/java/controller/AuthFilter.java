package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter({
    "/WEB-INF/jsp/*",
    "/HomeDocente",
    "/GetCourse",
    "/goProfile",
    "/goEsami",
    "/GetPassedExam",
    "/VerifyQuiz",
    "/createChapter",
    "/createCourse",
    "/ModificaCapitolo",
    "/GestisciCorso",
    "/ChaptersDocente",
    "/ChapterController",
    "/CheckQuiz",
    "/subscribe",
    "/EliminaCorso",
    "/EliminaCapitolo"
})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Header anti-cache
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);

        HttpSession session = req.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        if (!loggedIn) {
            res.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
} 