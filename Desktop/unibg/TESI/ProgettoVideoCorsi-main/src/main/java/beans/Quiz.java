package beans;

import immutablebeans.ImmutableQuiz;

public class Quiz implements ImmutableQuiz{
	private int IdQuiz;
	private String Ids; //id string
	private String Question;
	private String First;
	private String Second;
	private String Third;
	private String Fourth;
	private int Risposta;
	private String Rispostas;

	private String Idcourse;

	private String Idchapter;
	
	public String getIdcourse() {
		return Idcourse;
	}
	public void setIdcourse(String idcourse) {
		this.Idcourse = idcourse;
	}
	public String getIdchapter() {
		return Idchapter;
	}
	public void setIdchapter(String idchapter) {
		this.Idchapter = idchapter;
	}
	public String getRispostas() {
		return Rispostas;
	}
	public void setRispostas(String rispostas) {
		Rispostas = rispostas;
	}
	public int getRisposta() {
		return Risposta;
	}
	public void setRisposta(int risposta) {
		Risposta = risposta;
		setRispostas(String.valueOf(risposta));
	}
	public int getIdQuiz() {
		return IdQuiz;
	}
	public void setIdQuiz(int idQuiz) {
		IdQuiz = idQuiz;
		setIds(String.valueOf(idQuiz));
		}
	
	public String getIds() {
		return Ids;
	}
	public void setIds(String ids) {
		Ids = ids;
	}
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String getFirst() {
		return First;
	}
	public void setFirst(String first) {
		First = first;
	}
	public String getSecond() {
		return Second;
	}
	public void setSecond(String second) {
		Second = second;
	}
	public String getThird() {
		return Third;
	}
	public void setThird(String third) {
		Third = third;
	}
	public String getFourth() {
		return Fourth;
	}
	public void setFourth(String fourth) {
		Fourth = fourth;
	}
	
	

	
	
	
	
	
}
