package test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import beans.Chapter;
import beans.Course;
import dao.Chapter_CourseDao;
import immutablebeans.ImmutableChapter;
import immutablebeans.ImmutableCourse;

class ChapterDaoTest {

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
		
		// Setup basic mock behavior
		when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
		when(preparedStatement.executeQuery()).thenReturn(resultSet);
	}

	@Test
	void testGetCoursesByUserId() throws SQLException {
		// Setup test data
		when(resultSet.next()).thenReturn(true, false);
		when(resultSet.getInt("idcourses")).thenReturn(1);
		when(resultSet.getString("name")).thenReturn("Test Course");
		when(resultSet.getString("description")).thenReturn("Test Description");
		
		// Execute test
		List<ImmutableCourse> courses = dao.getCoursesByUserId(1);
		
		// Verify
		assertNotNull(courses);
		assertEquals(1, courses.size());
		assertEquals(1, courses.get(0).getIdCourse());
		assertEquals("Test Course", courses.get(0).getName());
		assertEquals("Test Description", courses.get(0).getDescription());
		
		verify(preparedStatement).setInt(1, 1);
	}

	@Test
	void testGetCoursesNotFollowedByUserId() throws SQLException {
		// Setup test data
		when(resultSet.next()).thenReturn(true, false);
		when(resultSet.getInt("idcourses")).thenReturn(1);
		when(resultSet.getString("name")).thenReturn("Test Course");
		when(resultSet.getString("description")).thenReturn("Test Description");
		
		// Execute test
		List<ImmutableCourse> courses = dao.getCoursesNotFollowedByUserId(1);
		
		// Verify
		assertNotNull(courses);
		assertEquals(1, courses.size());
		assertEquals(1, courses.get(0).getIdCourse());
		assertEquals("Test Course", courses.get(0).getName());
		assertEquals("Test Description", courses.get(0).getDescription());
		
		verify(preparedStatement).setInt(1, 1);
	}

	@Test
	void testGetAllChapters() throws SQLException {
		// Setup test data
		when(resultSet.next()).thenReturn(true, false);
		when(resultSet.getInt("chapter")).thenReturn(1);
		when(resultSet.getInt("course")).thenReturn(1);
		when(resultSet.getString("name")).thenReturn("Test Chapter");
		when(resultSet.getString("video")).thenReturn("test.mp4");
		
		// Execute test
		List<ImmutableChapter> chapters = dao.getAllChapters();
		
		// Verify
		assertNotNull(chapters);
		assertEquals(1, chapters.size());
		assertEquals(1, chapters.get(0).getIdChapter());
		assertEquals(1, chapters.get(0).getIdCourse());
		assertEquals("Test Chapter", chapters.get(0).getName());
		assertEquals("test.mp4", chapters.get(0).getVideo());
	}

	@Test
	void testGetChaptersByCourseId() throws SQLException {
		// Setup test data
		when(resultSet.next()).thenReturn(true, false);
		when(resultSet.getInt("chapter")).thenReturn(1);
		when(resultSet.getInt("course")).thenReturn(1);
		when(resultSet.getString("name")).thenReturn("Test Chapter");
		when(resultSet.getString("video")).thenReturn("test.mp4");
		when(resultSet.getString("description")).thenReturn("Test Description");
		
		// Execute test
		List<ImmutableChapter> chapters = dao.getChaptersByCourseId(1);
		
		// Verify
		assertNotNull(chapters);
		assertEquals(1, chapters.size());
		assertEquals(1, chapters.get(0).getIdChapter());
		assertEquals(1, chapters.get(0).getIdCourse());
		assertEquals("Test Chapter", chapters.get(0).getName());
		assertEquals("test.mp4", chapters.get(0).getVideo());
		assertEquals("Test Description", chapters.get(0).getDescription());
		
		verify(preparedStatement).setInt(1, 1);
	}

	@Test
	void testGetMaxCourseId() throws SQLException {
		// Setup test data
		when(resultSet.next()).thenReturn(true, false);
		when(resultSet.getInt("idcourses")).thenReturn(5);
		
		// Execute test
		int maxId = dao.getMaxCourseId();
		
		// Verify
		assertEquals(6, maxId); // Should return max + 1
	}

	@Test
	void testGetMaxChapterIdByCourseId() throws SQLException {
		// Setup test data
		when(resultSet.next()).thenReturn(true, false);
		when(resultSet.getInt("idchapter")).thenReturn(5);
		
		// Execute test
		int maxId = dao.getMaxChapterIdByCourseId(1);
		
		// Verify
		assertEquals(6, maxId); // Should return max + 1
		verify(preparedStatement).setInt(1, 1);
	}

	@Test
	void testGetChapterIdsByCourseId() throws SQLException {
		// Setup test data
		when(resultSet.next()).thenReturn(true, false);
		when(resultSet.getInt("chapter")).thenReturn(1);
		
		// Execute test
		List<Integer> chapterIds = dao.getChapterIdsByCourseId(1);
		
		// Verify
		assertNotNull(chapterIds);
		assertEquals(1, chapterIds.size());
		assertEquals(1, chapterIds.get(0));
		verify(preparedStatement).setInt(1, 1);
	}

	@Test
	void testSubscribeUserToChapter() throws SQLException {
		// Setup test data
		int courseId = 1;
		int userId = 1;
		int chapterId = 1;
		
		// Execute test
		dao.subscribeUserToChapter(courseId, userId, chapterId);
		
		// Verify
		verify(preparedStatement).setInt(1, courseId);
		verify(preparedStatement).setInt(2, userId);
		verify(preparedStatement).setInt(3, chapterId);
		verify(preparedStatement).executeUpdate();
	}

	@Test
	void testInsertChapter() throws SQLException {
		// Setup test data
		int courseId = 1;
		int chapterId = 1;
		String name = "Test Chapter";
		String video = "test.mp4";
		boolean isFinal = true;
		String description = "Test Description";
		
		// Execute test
		dao.insertChapter(courseId, chapterId, name, video, isFinal, description);
		
		// Verify
		verify(preparedStatement).setInt(1, courseId);
		verify(preparedStatement).setInt(2, chapterId);
		verify(preparedStatement).setString(3, name);
		verify(preparedStatement).setString(4, video);
		verify(preparedStatement).setBoolean(5, isFinal);
		verify(preparedStatement).setString(6, description);
		verify(preparedStatement).executeUpdate();
	}

	@Test
	void testInsertCourse() throws SQLException {
		// Setup test data
		int courseId = 1;
		String name = "Test Course";
		String description = "Test Description";
		
		// Execute test
		dao.insertCourse(courseId, name, description);
		
		// Verify
		verify(preparedStatement).setInt(1, courseId);
		verify(preparedStatement).setString(2, name);
		verify(preparedStatement).setString(3, description);
		verify(preparedStatement).executeUpdate();
	}
}
