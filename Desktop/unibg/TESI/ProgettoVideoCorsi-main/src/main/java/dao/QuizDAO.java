package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import beans.Course;
import beans.Quiz;
import beans.U_C;
import immutablebeans.ImmutableCourse;
import immutablebeans.ImmutableQuiz;
import immutablebeans.ImmutableU_C;

public class QuizDAO {
	private Connection connection;

	public QuizDAO(Connection connection) {
		this.connection = connection;
	}



	/**
	 * 
	 * @param course
	 * @param chapter
	 * @return the list of quiz in a chapter
	 * @throws SQLException
	 */
	public List<ImmutableQuiz> quiz_by_chapter_and_course(int course, int chapter) throws SQLException {
		List<ImmutableQuiz> questions = new ArrayList<ImmutableQuiz>();
		String query = "SELECT * from quiz_provvisorio WHERE idcourse = ? AND idchapter = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {

			pstatement.setInt(1, course);
			pstatement.setInt(2, chapter);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					Quiz question = new Quiz();

					question.setIdQuiz(result.getInt("idquiz_provvisorio"));
					question.setQuestion(result.getString("domanda"));
					question.setFirst(result.getString("quesito1"));
					question.setSecond(result.getString("quesito2"));
					question.setThird(result.getString("quesito3"));
					question.setFourth(result.getString("quesito4"));
					question.setIdcourse(result.getString("idcourse"));
					question.setIdchapter(result.getString("idchapter"));
					question.setRisposta(result.getInt("risposta_corretta")); 
					questions.add(question);
				}
			}
		}
		return questions;
	}

	/**
	 *
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Integer> response() throws SQLException {
		List<Integer> reply = new ArrayList<Integer>();
	
		String query = "SELECT * from quiz_provvisorio";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {

				}
			}
		}
		return reply;
	}

	/**
	 * set an exam as passed
	 * 
	 * @param user
	 * @param course
	 * @param chapter
	 * @throws SQLException
	 */
	public void setpassed(int user, int course, int chapter) throws SQLException {
		String query = "UPDATE iscrizioni SET passed = 1 where id_User = ? and idCourse = ? and idChapter = ?;";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, user);
			pstatement.setInt(2, course);
			pstatement.setInt(3, chapter);
			pstatement.executeUpdate();

		}

	}

	/**
	 * set ad exam passed by the teacher
	 * 
	 * @param user
	 * @param course
	 * @param chapter
	 * @throws SQLException
	 */
	public void setverifyed(int user, int course, int chapter) throws SQLException {
		String query = "UPDATE iscrizioni SET passed = 2 where id_User = ? and idCourse = ? and idChapter = ?;";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, user);
			pstatement.setInt(2, course);
			pstatement.setInt(3, chapter);
			pstatement.executeUpdate();

		}

	}

	/**
	 * return a list of quiz passed to verify
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<ImmutableU_C> quiz_to_verify() throws SQLException {
		List<ImmutableU_C> user_questions = new ArrayList<ImmutableU_C>();

		String query = "SELECT * from iscrizioni where passed = 1 and id_User != 0 ";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					U_C u_c = new U_C();
					u_c.setIdchapter(result.getInt("idChapter"));
					u_c.setIdcourse(result.getInt("idCourse"));
					u_c.setIduser(result.getInt("id_User"));
					user_questions.add(u_c);
				}
			}
		}
		return user_questions;
	}
	
	
	
	/**
	 * return if the exam is passed or not
	 * @param user
	 * @param idcourse
	 * @param idchapter
	 * @return
	 * @throws SQLException
	 */
	public int quiz_passed(int user, int idcourse, int idchapter) throws SQLException {

		String query = "SELECT * from iscrizioni where id_User = ? and idCourse = ? and idChapter = ? ";
		int ret = 0;
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1,user);
			pstatement.setInt(2,idcourse);
			pstatement.setInt(3,idchapter);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
				ret = result.getInt("passed");
				}
			}
		}
		return ret;
	}

	/**
	 * 
	 * @return the max id+1 of the quiz
	 * @throws SQLException
	 */
	public int maxquiz() throws SQLException {
		String query = "SELECT MAX(idquiz_provvisorio) as id from quiz_provvisorio";
		int i = 0;
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					i = result.getInt("id");
				}
			}
		}
		return i + 1; 
	}

	/**
	 * insert a quiz into the db
	 * 
	 * @param idquiz
	 * @param domanda
	 * @param q1
	 * @param q2
	 * @param q3
	 * @param q4
	 * @param r
	 * @param idcourse
	 * @param idchapter
	 * @throws SQLException
	 */
	public void insert_quiz(int idquiz, String domanda, String q1, String q2, String q3, String q4, int r, int idcourse,
			int idchapter) throws SQLException {
		String query = "INSERT INTO quiz_provvisorio (idquiz_provvisorio, domanda, quesito1, quesito2, quesito3, quesito4, risposta_corretta, idcourse, idchapter) VALUES (?,?,?,?,?,?,?,?,?)";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {

			pstatement.setInt(1, idquiz);
			pstatement.setString(2, domanda);
			pstatement.setString(3, q1);
			pstatement.setString(4, q2);
			pstatement.setString(5, q3);
			pstatement.setString(6, q4);
			pstatement.setInt(7, r);
			pstatement.setInt(8, idcourse);
			pstatement.setInt(9, idchapter);
			pstatement.executeUpdate();
		}

	}

	/**
	 * set an exam as not passed
	 * 
	 * @param user
	 * @param course
	 * @param chapter
	 * @throws SQLException
	 */
	public void setnotpassed(int user, int course, int chapter) throws SQLException {
		String query = "UPDATE iscrizioni SET passed = 0 where id_User = ? and idCourse = ? and idChapter = ?;";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, user);
			pstatement.setInt(2, course);
			pstatement.setInt(3, chapter);
			pstatement.executeUpdate();
		}
	}

	/**
	 * Salva la risposta data dallo studente per una domanda del quiz
	 */
	public void saveQuizAnswer(int userId, int courseId, int chapterId, int quizId, int rispostaData) throws SQLException {
		String query = "INSERT INTO quiz_risposte (id_user, id_course, id_chapter, id_quiz, risposta_data) VALUES (?, ?, ?, ?, ?)";
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, userId);
			pstatement.setInt(2, courseId);
			pstatement.setInt(3, chapterId);
			pstatement.setInt(4, quizId);
			pstatement.setInt(5, rispostaData);
			pstatement.executeUpdate();
		}
	}

	/**
	 * Recupera tutte le risposte date da uno studente per un quiz di un capitolo
	 */
	public Map<Integer, Integer> getQuizAnswers(int userId, int courseId, int chapterId) throws SQLException {
		Map<Integer, Integer> answers = new HashMap<>();
		String query = "SELECT id_quiz, risposta_data FROM quiz_risposte WHERE id_user = ? AND id_course = ? AND id_chapter = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, userId);
			pstatement.setInt(2, courseId);
			pstatement.setInt(3, chapterId);
			try (ResultSet result = pstatement.executeQuery()) {
				while (result.next()) {
					answers.put(result.getInt("id_quiz"), result.getInt("risposta_data"));
				}
			}
		}
		return answers;
	}

	/**
	 * Cancella tutte le risposte date da uno studente per un quiz di un capitolo
	 */
	public void deleteQuizAnswers(int userId, int courseId, int chapterId) throws SQLException {
		String query = "DELETE FROM quiz_risposte WHERE id_user = ? AND id_course = ? AND id_chapter = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setInt(1, userId);
			pstatement.setInt(2, courseId);
			pstatement.setInt(3, chapterId);
			pstatement.executeUpdate();
		}
	}

	/**
	 * Aggiorna una domanda quiz esistente
	 * @param idquiz id della domanda
	 * @param domanda testo domanda
	 * @param q1 risposta 1
	 * @param q2 risposta 2
	 * @param q3 risposta 3
	 * @param q4 risposta 4
	 * @param r risposta corretta (1-4)
	 * @throws SQLException
	 */
	public void updateQuiz(int idquiz, String domanda, String q1, String q2, String q3, String q4, int r) throws SQLException {
		String query = "UPDATE quiz_provvisorio SET domanda = ?, quesito1 = ?, quesito2 = ?, quesito3 = ?, quesito4 = ?, risposta_corretta = ? WHERE idquiz_provvisorio = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query)) {
			pstatement.setString(1, domanda);
			pstatement.setString(2, q1);
			pstatement.setString(3, q2);
			pstatement.setString(4, q3);
			pstatement.setString(5, q4);
			pstatement.setInt(6, r);
			pstatement.setInt(7, idquiz);
			pstatement.executeUpdate();
		}
	}

}
