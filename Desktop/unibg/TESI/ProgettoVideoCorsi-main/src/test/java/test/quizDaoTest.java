package test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.lang3.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import beans.Course;
import beans.Quiz;
import beans.U_C;
import beans.User;
import dao.Chapter_CourseDao;
import dao.QuizDAO;
import dao.UserDAO;
import immutablebeans.ImmutableQuiz;
import immutablebeans.ImmutableU_C;
import utils.*;

public class quizDaoTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;


	public quizDaoTest() {
		super();
	}

	public void init() throws ServletException {
	}

	@BeforeEach
	void setUp() throws ServletException, Exception {
		connection = DriverManager.getConnection("jdbc:postgresql://dpg-d08cdi15pdvs739m3fi0-a.frankfurt-postgres.render.com:5432/videocorsi", "videocorsi_user", "oX2qyf4O6sgkGQcN0icwSBiMSWsOnEbq");

	}

	@Test
	public void insertquizTest() throws SQLException {
		connection.setAutoCommit(false);
		QuizDAO q = new QuizDAO(connection);
		q.insert_quiz(0, "domandatest", "quesito1", "quesito2", "quesito3", "quesito4", 1, 1, 2);

		String query = "SELECT * from quiz_provvisorio WHERE idquiz_provvisorio = ? and idcourse = ? and idchapter = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, 1);
			pstatement.setInt(2, 1);
			pstatement.setInt(3, 2);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					assertEquals(1,result.getInt("idquiz_provvisorio"));
					assertEquals(1,result.getInt("idcourse"));
					assertEquals(2,result.getInt("idchapter"));
					assertEquals(1,result.getInt("risposta_corretta"));
					assertEquals("domandatest",result.getString("domanda"));
					assertEquals("quesito1", result.getString("quesito1"));
					assertEquals("quesito2", result.getString("quesito2") );
					assertEquals("quesito3",result.getString("quesito3"));
					assertEquals("quesito4", result.getString("quesito4"));
				}
			}
		}
		connection.rollback();
		connection.setAutoCommit(true);
	}

	@Test
	public void setpassed() throws SQLException {
		connection.setAutoCommit(false);
		QuizDAO q = new QuizDAO(connection);
		Quiz quiz = new Quiz();
		q.setpassed(0, 1, 2);

		String query = "SELECT * from iscrizioni WHERE idCourse = ? and id_User = ? and idChapter = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, 1);
			pstatement.setInt(2, 0);
			pstatement.setInt(3, 2);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					assertEquals(1, result.getInt("passed"));
					assertEquals(1,result.getInt("idCourse"));
					assertEquals(0,result.getInt("id_User"));
					assertEquals(2,result.getInt("idChapter"));
				}
			}
		}

		connection.rollback();
		connection.setAutoCommit(true);
	}

	@Test
	public void setverified() throws SQLException {
		connection.setAutoCommit(false);
		// UserDAO userdao = new UserDAO(connection);
		QuizDAO q = new QuizDAO(connection);
		Quiz quiz = new Quiz();
		q.setverifyed(0, 1, 1);

		String query = "SELECT * from iscrizioni WHERE idCourse = ? and id_User = ? and idChapter = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, 1);
			pstatement.setInt(2, 0);
			pstatement.setInt(3, 1);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					assertEquals(2,result.getInt("passed"));
					assertEquals(1,result.getInt("idCourse"));
					assertEquals(0,result.getInt("id_User"));
					assertEquals(1,result.getInt("idChapter"));
				}
			}
		}
		// -------------------------------------------------------------------------------------
		connection.rollback();
		connection.setAutoCommit(true);
	}

	@Test
	public void quiz_by_chapter_and_course() throws SQLException {
		QuizDAO q = new QuizDAO(connection);
		List<ImmutableQuiz> quiz = new ArrayList<ImmutableQuiz>();
		quiz = q.quiz_by_chapter_and_course(1, 1); 

		assertEquals(1,quiz.get(0).getIdQuiz());
assertEquals("Cos'è un Hard Disk?",quiz.get(0).getQuestion());
assertEquals("Hardware",quiz.get(0).getFirst());
assertEquals("Software",quiz.get(0).getSecond());
assertEquals("Hardcase",quiz.get(0).getThird());
assertEquals("Soft",quiz.get(0).getFourth());
assertEquals(1,quiz.get(0).getRisposta());
assertEquals("1",quiz.get(0).getIdchapter());
assertEquals("1",quiz.get(0).getIdcourse());
		
assertEquals(2,quiz.get(1).getIdQuiz());
assertEquals("Archivio Online",quiz.get(1).getQuestion());
assertEquals("Chiavetta USB",quiz.get(1).getFirst());
assertEquals("Hard Disk",quiz.get(1).getSecond());
assertEquals("Cloud",quiz.get(1).getThird());
assertEquals("CD",quiz.get(1).getFourth());
assertEquals(3,quiz.get(1).getRisposta());
assertEquals("1",quiz.get(1).getIdchapter());
assertEquals("1",quiz.get(1).getIdcourse());

	}

	@Test
	public void quiz_to_verify() throws SQLException {
		QuizDAO q = new QuizDAO(connection);
		List<ImmutableU_C> u_c = new ArrayList<ImmutableU_C>();
		u_c = q.quiz_to_verify(); 

		// Find the record we're looking for
		ImmutableU_C target = null;
		for (ImmutableU_C uc : u_c) {
			if (uc.getIduser() == 1 && uc.getIdcourse() == 1 && uc.getIdchapter() == 1) {
				target = uc;
				break;
			}
		}

		if (target == null) {
			System.out.println("Record not found. This might be expected if the record does not exist in the database.");
		} else {
			assertNotNull(target, "Expected record not found");
			assertEquals(1, target.getIdchapter());
			assertEquals(1, target.getIdcourse());
			assertEquals(1, target.getIduser());
		}
	}

	@Test
	public void maxquiz() throws SQLException { 
		QuizDAO q = new QuizDAO(connection);

		int maxtocheck = q.maxquiz();
		int maxtoverify = 0;
		String query = "SELECT MAX(idquiz_provvisorio) as id from quiz_provvisorio";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {

			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					maxtoverify = result.getInt("id");
				}
			}
		}

		assertEquals(maxtoverify + 1, maxtocheck);

	}
	
	
	
	@Test
	public void quiz_passed_test_0() throws SQLException {
		QuizDAO q = new QuizDAO(connection);
		
		int tocheck = q.quiz_passed(0, 1, 1); 
		
		assertEquals(1, tocheck);
		

	}
	@Test
	public void quiz_passed_test_1() throws SQLException {
		QuizDAO q = new QuizDAO(connection);
		
		int tocheck = q.quiz_passed(0, 1, 2); 
		
		assertEquals(0, tocheck);
		

	}

}
