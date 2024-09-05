package dto;


public class Comment{
	private String commentId;
	private String postId;
	private String userId;
	private String comment;
	
	public Comment(){
		super();
	}
	
	public Comment(String commentId, String postId, String userId, String comment) {
		this.commentId = commentId;
		this.postId = postId;
		this.userId = userId;
		this.comment = comment;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
}