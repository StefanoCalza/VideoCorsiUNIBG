package test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import dao.Chapter_CourseDao;
import dao.UserDAO;
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableUser;
import utils.TransactionManager;

class DBIntegrationTest {

    @Mock
    private Connection connection;
    
    private Chapter_CourseDao chapterDao;
    private UserDAO userDao;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        chapterDao = new Chapter_CourseDao(connection);
        userDao = new UserDAO(connection);
    }

    @Test
    void testUserCourseIntegration() throws SQLException {
        // Setup test data
        ImmutableUser user = new ImmutableUser(1, "testUser", 2);
        
        // Test user courses
        List<ImmutableCourse> courses = chapterDao.getCoursesByUserId(user.getId());
        assertNotNull(courses, "User courses should not be null");
        
        // Test courses not followed
        List<ImmutableCourse> notFollowedCourses = chapterDao.getCoursesNotFollowedByUserId(user.getId());
        assertNotNull(notFollowedCourses, "Not followed courses should not be null");
        
        // Verify no overlap between followed and not followed courses
        for (ImmutableCourse course : courses) {
            assertFalse(notFollowedCourses.contains(course), "Course should not be in both lists");
        }
    }

    @Test
    void testTransactionManagement() throws SQLException {
        try {
            TransactionManager.beginTransaction(connection);
            
            // Test course creation
            int courseId = chapterDao.getMaxCourseId();
            chapterDao.insertCourse(courseId, "Test Course", "Test Description");
            
            // Test chapter creation
            int chapterId = chapterDao.getMaxChapterIdByCourseId(courseId);
            chapterDao.insertChapter(courseId, chapterId, "Test Chapter", "test.mp4", false, "Test Description");
            
            // Test user subscription
            chapterDao.subscribeUserToChapter(courseId, 1, chapterId);
            
            TransactionManager.commitTransaction(connection);
        } catch (SQLException e) {
            TransactionManager.rollbackTransaction(connection);
            throw e;
        }
    }

    @Test
    void testErrorHandling() {
        // Test invalid course ID
        assertThrows(SQLException.class, () -> {
            chapterDao.getChaptersByCourseId(-1);
        });
        
        // Test invalid user ID
        assertThrows(SQLException.class, () -> {
            chapterDao.getCoursesByUserId(-1);
        });
        
        // Test invalid chapter subscription
        assertThrows(SQLException.class, () -> {
            chapterDao.subscribeUserToChapter(-1, -1, -1);
        });
    }
} 