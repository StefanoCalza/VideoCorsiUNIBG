package beans;

import immutablebeans.ImmutableChapter;

public class Chapter implements ImmutableChapter {
	private int idCourse;
	private int idChapter;
	private String name;
	private String description;
	private String video;

	public int getIdCourse() {
		return idCourse;
	}

	public void setIdCourse(int idCourse) {
		this.idCourse = idCourse;
	}

	public int getIdChapter() {
		return idChapter;
	}

	public void setIdChapter(int idChapter) {
		this.idChapter = idChapter;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
}
