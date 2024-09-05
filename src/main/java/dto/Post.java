package dto;


public class Post{
	private String postID;
	private String userId;
	private String postTitle;
	private String postContent;
	private String postDate;
	private int views;
	private String category;
	
	public Post() {
		super();
	}
	
	public Post(String userId, String postTitle, String postContent, String postDate, int views, String category) {
		this.postID = null;
		this.userId = userId;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postDate = postDate;
		this.views = views;
		this.category = category;
	}

	public String getPostID() {
		return postID;
	}

	public void setPostID(String postID) {
		this.postID = postID;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	
	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}