package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sound.midi.Soundbank;

import beans.Chapter;
import beans.Course;
import immutablebeans.ImmutableChapter;
import immutablebeans.ImmutableCourse;

/**
 * DAO class for managing chapters and courses
 */
public class Chapter_CourseDao {
	private Connection connection;

	public Chapter_CourseDao(Connection connection) {
		this.connection = connection;
	}

	/**
	 * Search for the list of courses followed by a user
	 * 
	 * @param userId the user ID
	 * @return list of courses followed by the user
	 * @throws SQLException if a database error occurs
	 */
	public List<ImmutableCourse> getCoursesByUserId(int userId) throws SQLException {
		List<ImmutableCourse> courses = new ArrayList<ImmutableCourse>();
		String query = "SELECT DISTINCT idcourses,name,description FROM courses join iscrizioni ON iscrizioni.idCourse = courses.idcourses where id_User = ? ORDER BY idcourses ASC";

		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, userId);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					Course course = new Course();
					course.setIdCourse(result.getInt("idcourses"));
					course.setName(result.getString("name"));
					course.setDescription(result.getString("description"));
					courses.add(course);
				}
			}
		}
		return courses;
	}

	/**
	 * Search for the list of courses not followed by a user
	 * 
	 * @param userId the user ID
	 * @return list of courses not followed by the user
	 * @throws SQLException if a database error occurs
	 */
	public List<ImmutableCourse> getCoursesNotFollowedByUserId(int userId) throws SQLException {
		List<ImmutableCourse> courses = new ArrayList<ImmutableCourse>();
		String query = "SELECT * FROM courses where idcourses NOT IN (select distinct idCourse from iscrizioni where id_User = ?) ORDER BY idcourses ASC";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, userId);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					Course course = new Course();
					course.setIdCourse(result.getInt("idcourses"));
					course.setName(result.getString("name"));
					course.setDescription(result.getString("description"));
					courses.add(course);
				}
			}
		}
		return courses;
	}

	/**
	 * Get all chapters
	 * 
	 * @return list of all chapters
	 * @throws SQLException if a database error occurs
	 */
	public List<ImmutableChapter> getAllChapters() throws SQLException {
		List<ImmutableChapter> chapters = new ArrayList<ImmutableChapter>();

		String query = "SELECT * from chapter";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					Chapter chapter = new Chapter();
					chapter.setIdChapter(result.getInt("chapter"));
					chapter.setIdCourse(result.getInt("course"));
					chapter.setName(result.getString("name"));
					chapter.setVideo(result.getString("video"));
					chapters.add(chapter);
				}
			}
		}
		return chapters;
	}

	/**
	 * Get all chapters of a course
	 * 
	 * @param courseId the course ID
	 * @return list of chapters for the course
	 * @throws SQLException if a database error occurs
	 */
	public List<ImmutableChapter> getChaptersByCourseId(int courseId) throws SQLException {
		List<ImmutableChapter> chapters = new ArrayList<ImmutableChapter>();

		String query = "SELECT * from chapter WHERE course = ? ORDER BY chapter ASC";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, courseId);

			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					Chapter chapter = new Chapter();
					chapter.setIdChapter(result.getInt("chapter"));
					chapter.setIdCourse(result.getInt("course"));
					chapter.setName(result.getString("name"));
					chapter.setVideo(result.getString("video"));
					chapter.setDescription(result.getString("description"));
					chapter.setIsFinal(result.getInt("is_final"));
					chapters.add(chapter);
				}
			}
		}
		return chapters;
	}

	/**
	 * Get the maximum course ID
	 * 
	 * @return the maximum course ID
	 * @throws SQLException if a database error occurs
	 */
	public int getMaxCourseId() throws SQLException {
		String query = "SELECT MAX(idcourses) as idcourses from courses";
		int i = 0;
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {

			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					i = result.getInt("idcourses") + 1;
				}
			}
		}
		return i; 
	}

	/**
	 * Get the maximum chapter ID for a course
	 * 
	 * @param courseId the course ID
	 * @return the maximum chapter ID for the course
	 * @throws SQLException if a database error occurs
	 */
	public int getMaxChapterIdByCourseId(int courseId) throws SQLException {
		String query = "SELECT MAX(chapter) as idchapter from chapter where course = ?";
		int i = 0;
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, courseId);
			try (ResultSet result = pstatement.executeQuery();) {
				if (result.next()) {
					i = result.getInt("idchapter");
				}
			}
		}
		// Se non ci sono capitoli, il prossimo id deve essere 1
		if (i == 0) {
			return 1;
		} else {
			return i + 1;
		}
	}

	/**
	 * Get chapter IDs for a course
	 * 
	 * @param courseId the course ID
	 * @return list of chapter IDs for the course
	 * @throws SQLException if a database error occurs
	 */
	public List<Integer> getChapterIdsByCourseId(int courseId) throws SQLException {
		List<Integer> chapters = new ArrayList<Integer>();
		String query = "SELECT * from chapter WHERE course = ? ";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, courseId);

			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					int chapter = result.getInt("chapter");
					chapters.add(chapter);
				}
			}
		}
		return chapters;
	}

	/**
	 * Get course name by ID
	 * 
	 * @param courseId the course ID
	 * @return the course with the specified ID
	 * @throws SQLException if a database error occurs
	 */
	public ImmutableCourse getCourseById(int courseId) throws SQLException {
		Course c = new Course();
		String query = "SELECT * from courses WHERE idcourses = ? ";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, courseId);

			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					c.setIdCourse(result.getInt("idcourses"));
					c.setName(result.getString("name"));
					c.setDescription(result.getString("description"));
				}
			}
		}
		return c;
	}

	/**
	 * Subscribe a user to a chapter of a course
	 * 
	 * @param courseId the course ID
	 * @param userId the user ID
	 * @param chapterId the chapter ID
	 * @throws SQLException if a database error occurs
	 */
	public void subscribeUserToChapter(int courseId, int userId, int chapterId) throws SQLException {
		String query = "INSERT INTO iscrizioni (idCourse, id_User, idChapter, passed) VALUES (?,?,?,0);\n";

		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, courseId);
			pstatement.setInt(2, userId);
			pstatement.setInt(3, chapterId);
			pstatement.executeUpdate();
		}
	}

	/**
	 * Insert a chapter in a course
	 * 
	 * @param courseId the course ID
	 * @param chapterId the chapter ID
	 * @param name the chapter name
	 * @param video the video URL
	 * @param isFinal whether this is a final chapter
	 * @param description the chapter description
	 * @throws SQLException if a database error occurs
	 */
	public void insertChapter(int courseId, int chapterId, String name, String video, boolean isFinal, String description)
			throws SQLException {
		String query = "INSERT INTO chapter (course, chapter, name, video, is_final, description) VALUES (?,?,?,?,0,?)";
		String query2 = "INSERT INTO chapter (course, chapter, name, is_final,description) VALUES (?,?,?,1,?)";

		if (isFinal) {
			try (PreparedStatement pstatement = connection.prepareStatement(query2);) {
				pstatement.setInt(1, courseId);
				pstatement.setInt(2, chapterId);
				pstatement.setString(3, name);
				pstatement.setString(4, description);
				pstatement.executeUpdate();
			}
		} else {
			try (PreparedStatement pstatement = connection.prepareStatement(query);) {
				pstatement.setInt(1, courseId);
				pstatement.setInt(2, chapterId);
				pstatement.setString(3, name);
				pstatement.setString(4, video);
				pstatement.setString(5, description);
				pstatement.executeUpdate();
			}
		}
	}

	/**
	 * 
	 * @param id
	 * @return the name of a courses called by the id
	 * @throws SQLException
	 */
	public ImmutableCourse course_name(int id) throws SQLException {
		Course c = new Course();
		String query = "SELECT * from courses WHERE idcourses = ? ";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, id);

			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					c.setName(result.getString("name"));
				}
			}
		}
		return c;
	}

	/**
	 * Insert a new course
	 * 
	 * @param courseId the course ID
	 * @param name the course name
	 * @param description the course description
	 * @throws SQLException if a database error occurs
	 */
	public void insertCourse(int courseId, String name, String description) throws SQLException {
		String query = "INSERT INTO courses (idcourses, name, description) VALUES (?,?,?);\n";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, courseId);
			pstatement.setString(2, name);
			pstatement.setString(3, description);
			pstatement.executeUpdate();
		}
	}

	/**
	 * return a list of quiz passed to verify
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<ImmutableCourse> exam_passed(int id_user) throws SQLException {
		List<ImmutableCourse> courses_passed = new ArrayList<>();
		String query = "SELECT c.idcourses, c.name, c.description FROM courses c WHERE NOT EXISTS ("
			+ "SELECT 1 FROM chapter ch "
			+ "LEFT JOIN iscrizioni i ON i.idCourse = ch.course AND i.idChapter = ch.chapter AND i.id_User = ? "
			+ "WHERE ch.course = c.idcourses AND ((ch.is_final = 0 AND (i.passed IS NULL OR i.passed <> 2)) "
			+ "OR (ch.is_final = 1 AND (i.passed IS NULL OR i.passed <> 2)))"
			+ ")";
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, id_user);
			try (ResultSet result = pstatement.executeQuery()) {
				while (result.next()) {
					Course course = new Course();
					course.setIdCourse(result.getInt("idcourses"));
					course.setName(result.getString("name"));
					course.setDescription(result.getString("description"));
					courses_passed.add(course);
				}
			}
		}
		return courses_passed;
	}

	public List<ImmutableCourse> getCoursesNotSubscribedByUserId(int userId) throws SQLException {
		String query = "SELECT DISTINCT c.idcourses, c.name, c.description " +
					  "FROM courses c " +
					  "WHERE c.idcourses NOT IN " +
					  "(SELECT DISTINCT i.idCourse FROM iscrizioni i WHERE i.id_User = ?)";
		
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, userId);
			try (ResultSet result = pstatement.executeQuery()) {
				List<ImmutableCourse> courses = new ArrayList<>();
				while (result.next()) {
					Course course = new Course();
					course.setIdCourse(result.getInt("idcourses"));
					course.setName(result.getString("name"));
					course.setDescription(result.getString("description"));
					courses.add(course);
				}
				return courses;
			}
		}
	}

	public boolean isUserSubscribed(int userId, int courseId) throws SQLException {
		String query = "SELECT COUNT(*) as count FROM iscrizioni WHERE id_User = ? AND idCourse = ?";
		
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, userId);
			pstatement.setInt(2, courseId);
			try (ResultSet result = pstatement.executeQuery()) {
				if (result.next()) {
					return result.getInt("count") > 0;
				}
				return false;
			}
		}
	}

	public void subscribeUserToCourse(int userId, int courseId) throws SQLException {
		// Ottieni tutti i capitoli del corso
		List<Integer> chapterIds = getChapterIdsByCourseId(courseId);
		
		// Iscrivi lo studente a tutti i capitoli del corso
		for (Integer chapterId : chapterIds) {
			subscribeUserToChapter(courseId, userId, chapterId);
		}
	}

	/**
	 * Restituisce la lista di tutti i corsi
	 * @return lista di tutti i corsi
	 * @throws SQLException
	 */
	public List<ImmutableCourse> getAllCourses() throws SQLException {
		List<ImmutableCourse> courses = new ArrayList<>();
		String query = "SELECT idcourses, name, description FROM courses";
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			try (ResultSet result = pstatement.executeQuery()) {
				while (result.next()) {
					Course course = new Course();
					course.setIdCourse(result.getInt("idcourses"));
					course.setName(result.getString("name"));
					course.setDescription(result.getString("description"));
					courses.add(course);
				}
			}
		}
		return courses;
	}

	/**
	 * Recupera un capitolo dato courseId e chapterId
	 */
	public ImmutableChapter getChapterByCourseAndId(int courseId, int chapterId) throws SQLException {
		String query = "SELECT * FROM chapter WHERE course = ? AND chapter = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, courseId);
			pstatement.setInt(2, chapterId);
			try (ResultSet result = pstatement.executeQuery()) {
				if (result.next()) {
					Chapter chapter = new Chapter();
					chapter.setIdChapter(result.getInt("chapter"));
					chapter.setIdCourse(result.getInt("course"));
					chapter.setName(result.getString("name"));
					chapter.setVideo(result.getString("video"));
					chapter.setDescription(result.getString("description"));
					chapter.setIsFinal(result.getInt("is_final"));
					return chapter;
				}
			}
		}
		return null;
	}

}
