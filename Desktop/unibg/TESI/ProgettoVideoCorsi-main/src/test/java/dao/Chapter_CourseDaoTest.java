package dao;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import beans.Chapter;
import beans.Course;
import immutablebeans.ImmutableChapter;
import immutablebeans.ImmutableCourse;

class Chapter_CourseDaoTest {

    @Mock
    private Connection connection;
    
    @Mock
    private PreparedStatement preparedStatement;
    
    @Mock
    private ResultSet resultSet;
    
    private Chapter_CourseDao dao;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        dao = new Chapter_CourseDao(connection);
    }

    @Test
    void testGetCoursesByUserId() throws SQLException {
        // Setup test data
        int userId = 1;
        List<ImmutableCourse> expectedCourses = new ArrayList<>();
        Course course = new Course();
        course.setIdCourse(1);
        course.setName("Test Course");
        course.setDescription("Test Description");
        expectedCourses.add(course);
        
        // Setup mock behavior
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true, false);
        when(resultSet.getInt("idcourses")).thenReturn(1);
        when(resultSet.getString("name")).thenReturn("Test Course");
        when(resultSet.getString("description")).thenReturn("Test Description");
        
        // Execute test
        List<ImmutableCourse> actualCourses = dao.getCoursesByUserId(userId);
        
        // Verify results
        assertEquals(expectedCourses.size(), actualCourses.size());
        assertEquals(expectedCourses.get(0).getIdCourse(), actualCourses.get(0).getIdCourse());
        assertEquals(expectedCourses.get(0).getName(), actualCourses.get(0).getName());
        assertEquals(expectedCourses.get(0).getDescription(), actualCourses.get(0).getDescription());
        
        // Verify mock interactions
        verify(preparedStatement).setInt(1, userId);
    }

    @Test
    void testGetChaptersByCourseId() throws SQLException {
        // Setup test data
        int courseId = 1;
        List<ImmutableChapter> expectedChapters = new ArrayList<>();
        Chapter chapter = new Chapter();
        chapter.setIdChapter(1);
        chapter.setIdCourse(1);
        chapter.setName("Test Chapter");
        chapter.setDescription("Test Description");
        chapter.setVideo("test.mp4");
        expectedChapters.add(chapter);
        
        // Setup mock behavior
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true, false);
        when(resultSet.getInt("chapter")).thenReturn(1);
        when(resultSet.getInt("course")).thenReturn(1);
        when(resultSet.getString("name")).thenReturn("Test Chapter");
        when(resultSet.getString("description")).thenReturn("Test Description");
        when(resultSet.getString("video")).thenReturn("test.mp4");
        
        // Execute test
        List<ImmutableChapter> actualChapters = dao.getChaptersByCourseId(courseId);
        
        // Verify results
        assertEquals(expectedChapters.size(), actualChapters.size());
        assertEquals(expectedChapters.get(0).getIdChapter(), actualChapters.get(0).getIdChapter());
        assertEquals(expectedChapters.get(0).getIdCourse(), actualChapters.get(0).getIdCourse());
        assertEquals(expectedChapters.get(0).getName(), actualChapters.get(0).getName());
        assertEquals(expectedChapters.get(0).getDescription(), actualChapters.get(0).getDescription());
        assertEquals(expectedChapters.get(0).getVideo(), actualChapters.get(0).getVideo());
        
        // Verify mock interactions
        verify(preparedStatement).setInt(1, courseId);
    }

    @Test
    void testGetCourseById() throws SQLException {
        // Setup test data
        int courseId = 1;
        Course expectedCourse = new Course();
        expectedCourse.setName("Test Course");
        
        // Setup mock behavior
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true, false);
        when(resultSet.getString("name")).thenReturn("Test Course");
        
        // Execute test
        ImmutableCourse actualCourse = dao.getCourseById(courseId);
        
        // Verify results
        assertEquals(expectedCourse.getName(), actualCourse.getName());
        
        // Verify mock interactions
        verify(preparedStatement).setInt(1, courseId);
    }

    @Test
    void testDatabaseError() throws SQLException {
        // Setup mock behavior
        when(connection.prepareStatement(anyString())).thenThrow(new SQLException("Database error"));
        
        // Execute test and verify exception
        assertThrows(SQLException.class, () -> {
            dao.getCoursesByUserId(1);
        });
    }
} 