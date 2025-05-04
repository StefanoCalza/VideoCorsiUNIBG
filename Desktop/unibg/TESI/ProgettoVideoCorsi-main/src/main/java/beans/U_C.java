package beans;

import immutablebeans.ImmutableU_C;

public class U_C implements ImmutableU_C{

	private int Iduser;

	private int Idchapter;
	private int Idcourse;
	
	
	public int getIdcourse() {
		return Idcourse;
	}
	public void setIdcourse(int idcourse) {
		this.Idcourse = idcourse;
	}
	public int getIdchapter() {
		return Idchapter;
	}
	public void setIdchapter(int idchapter) {
		this.Idchapter = idchapter;
	}
	public int getIduser() {
		return Iduser;
	}
	public void setIduser(int iduser) {
		Iduser = iduser;
	}
	
	
	
	
	
	
}
