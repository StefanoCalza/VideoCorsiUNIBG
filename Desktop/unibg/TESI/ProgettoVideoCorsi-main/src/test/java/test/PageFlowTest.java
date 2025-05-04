package test;

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

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import beans.Course;
import controller.ChapterController;
import controller.CheckLogin;
import controller.GetCourse;
import dao.Chapter_CourseDao;
import dao.UserDAO;
import immutablebeans.ImmutableUser;
import immutablebeans.ImmutableCourse;
import utils.ConnectionHandler;
import utils.Logger;
import utils.TransactionManager;

public class PageFlowTest {
    private Connection connection;
    private UserDAO userDao;

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
    private Connection connectionMock;
    
    @Mock
    private Chapter_CourseDao chapterDao;
    
    private ChapterController chapterController;
    private CheckLogin checkLogin;
    private GetCourse getCourse;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        connection = ConnectionHandler.getConnection(null);
        userDao = new UserDAO(connection);
        
        // Setup controllers
        chapterController = new ChapterController();
        checkLogin = new CheckLogin();
        getCourse = new GetCourse();
        
        // Setup basic mocks
        when(request.getSession()).thenReturn(session);
        when(request.getServletContext()).thenReturn(context);
        when(request.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        
        // Setup user mock
        ImmutableUser user = new ImmutableUser(1, "testUser", 2);
        when(session.getAttribute("user")).thenReturn(user);
        
        Logger.logInfo("Test setup completed");
    }

    @AfterEach
    public void tearDown() throws Exception {
        if (connection != null) {
            connection.close();
        }
        Logger.logInfo("Test cleanup completed");
    }

    @Test
    public void testLoginFlow() throws ServletException, IOException {
        // Setup test data
        when(request.getParameter("username")).thenReturn("testUser");
        when(request.getParameter("password")).thenReturn("testPass");
        
        // Execute test
        checkLogin.doPost(request, response);
        
        // Verify
        verify(request).getRequestDispatcher("GetCourse");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void testGetCoursesFlow() throws ServletException, IOException, SQLException {
        // Setup test data
        List<ImmutableCourse> courses = new ArrayList<>();
        Course course = new Course();
        course.setIdCourse(1);
        course.setName("Test Course");
        courses.add(course);
        
        // Setup mock behavior
        when(chapterDao.getCoursesByUserId(1)).thenReturn(courses);
        
        // Execute test
        getCourse.doPost(request, response);
        
        // Verify
        verify(request).setAttribute("chapter", courses);
        verify(request).getRequestDispatcher("/WEB-INF/jsp/courses.jsp");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void testGetChaptersFlow() throws ServletException, IOException, SQLException {
        // Setup test data
        String courseId = "1";
        when(request.getParameter("courseId")).thenReturn(courseId);
        
        // Execute test
        chapterController.doGet(request, response);
        
        // Verify
        verify(request).getRequestDispatcher("/WEB-INF/jsp/chapters.jsp");
        verify(dispatcher).forward(request, response);
    }

    @Test
    public void testUnauthorizedAccess() throws ServletException, IOException {
        // Setup mock behavior
        when(session.getAttribute("user")).thenReturn(null);
        
        // Execute test
        chapterController.doGet(request, response);
        
        // Verify
        verify(response).sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
    }
} 