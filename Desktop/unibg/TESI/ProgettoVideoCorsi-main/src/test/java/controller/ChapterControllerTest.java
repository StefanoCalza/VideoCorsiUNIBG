package controller;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import beans.Course;
import beans.Chapter;
import dao.Chapter_CourseDao;
import immutablebeans.ImmutableUser;
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableChapter;

class ChapterControllerTest {

    @Mock
    private HttpServletRequest request;
    
    @Mock
    private HttpServletResponse response;
    
    @Mock
    private HttpSession session;
    
    @Mock
    private ServletContext context;
    
    @Mock
    private RequestDispatcher dispatcher;
    
    @Mock
    private Connection connection;
    
    @Mock
    private Chapter_CourseDao chapterDao;
    
    private ChapterController controller;
    
    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        controller = new ChapterController();
        
        // Setup basic mocks
        when(request.getSession()).thenReturn(session);
        when(request.getServletContext()).thenReturn(context);
        when(request.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        
        // Setup user mock
        ImmutableUser user = new ImmutableUser(1, "testUser", 2);
        when(session.getAttribute("user")).thenReturn(user);
    }
    
    @Test
    void testGetUserCourses() throws ServletException, IOException, SQLException {
        // Setup test data
        List<ImmutableCourse> courses = new ArrayList<>();
        Course course = new Course();
        course.setIdCourse(1);
        course.setName("Test Course");
        courses.add(course);
        
        // Setup mock behavior
        when(chapterDao.getCoursesByUserId(1)).thenReturn(courses);
        
        // Execute test
        controller.doGet(request, response);
        
        // Verify
        verify(request).setAttribute("courses", courses);
        verify(request).getRequestDispatcher("/WEB-INF/jsp/courses.jsp");
        verify(dispatcher).forward(request, response);
    }
    
    @Test
    void testGetCourseChapters() throws ServletException, IOException, SQLException {
        // Setup test data
        List<ImmutableChapter> chapters = new ArrayList<>();
        Chapter chapter = new Chapter();
        chapter.setIdChapter(1);
        chapter.setName("Test Chapter");
        chapters.add(chapter);
        
        Course course = new Course();
        course.setName("Test Course");
        
        // Setup mock behavior
        when(request.getParameter("courseId")).thenReturn("1");
        when(chapterDao.getChaptersByCourseId(1)).thenReturn(chapters);
        when(chapterDao.getCourseById(1)).thenReturn(course);
        
        // Execute test
        controller.doGet(request, response);
        
        // Verify
        verify(request).setAttribute("chapters", chapters);
        verify(request).setAttribute("courseName", course.getName());
        verify(request).getRequestDispatcher("/WEB-INF/jsp/chapters.jsp");
        verify(dispatcher).forward(request, response);
    }
    
    @Test
    void testUnauthorizedAccess() throws ServletException, IOException {
        // Setup mock behavior
        when(session.getAttribute("user")).thenReturn(null);
        
        // Execute test
        controller.doGet(request, response);
        
        // Verify
        verify(response).sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
    }
    
    @Test
    void testInvalidCourseId() throws ServletException, IOException, SQLException {
        // Setup mock behavior
        when(request.getParameter("courseId")).thenReturn("invalid");
        
        // Execute test
        controller.doGet(request, response);
        
        // Verify
        verify(response).sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course ID");
    }
    
    @Test
    void testDatabaseError() throws ServletException, IOException, SQLException {
        // Setup mock behavior
        when(chapterDao.getCoursesByUserId(anyInt())).thenThrow(new SQLException("Database error"));
        
        // Execute test
        controller.doGet(request, response);
        
        // Verify
        verify(response).sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
    }
} 