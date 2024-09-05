package dto;


public class Lecture{
	private String lecId;
	private String lecName;
	private String teacherName;
	private String lecDescription;
	private String lecCategory;
	private String lecLevel;
	private int lecPrice;
	private int lecReviewCount;
	private String image;
	private String video;
	
	public Lecture() {
		super();
	}
	
	public Lecture(String lecName, String teacherName, String lecDescription, String lecCategory, String lecLevel, int lecPrice, int lecReviewCount, String image, String video) {
		this.lecName = lecName;
		this.teacherName = teacherName;
		this.lecDescription = lecDescription;
		this.lecCategory = lecCategory;
		this.lecLevel = lecLevel;
		this.lecPrice = lecPrice;
		this.lecReviewCount = lecReviewCount;
		this.image = image;
		this.video = video;
		
	}

	public String getLecId() {
		return lecId;
	}

	public void setLecId(String lecId) {
		this.lecId = lecId;
	}

	public String getLecName() {
		return lecName;
	}

	public void setLecName(String lecName) {
		this.lecName = lecName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getLecDescription() {
		return lecDescription;
	}

	public void setLecDescription(String lecDescription) {
		this.lecDescription = lecDescription;
	}

	public String getLecCategory() {
		return lecCategory;
	}

	public void setLecCategory(String lecCategory) {
		this.lecCategory = lecCategory;
	}

	public String getLecLevel() {
		return lecLevel;
	}

	public void setLecLevel(String lecLevel) {
		this.lecLevel = lecLevel;
	}

	public int getLecPrice() {
		return lecPrice;
	}

	public void setLecPrice(int lecPrice) {
		this.lecPrice = lecPrice;
	}

	public int getLecReviewCount() {
		return lecReviewCount;
	}

	public void setLecReviewCount(int lecReviewCount) {
		this.lecReviewCount = lecReviewCount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}
}