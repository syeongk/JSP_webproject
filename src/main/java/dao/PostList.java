package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Post;
import database.DBConnection;

public class PostList {

	public PostList(){
	
	}

	public String addPost(Post post) throws SQLException, ClassNotFoundException {
		Statement stmt = null;
		Connection conn = null;
		String result = null;

		try {
			String sql = "INSERT INTO post (postTitle, postContent, userId, postDate, category) VALUES('" + post.getPostTitle()
					+ "','" + post.getPostContent() + "','" + post.getUserId() + "','" + post.getPostDate() + "','" + post.getCategory() + "');";

			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);

			result = "게시물을 등록했습니다.";

		} catch (SQLException e) {
			result = "게시물 등록에 실패했습니다.";
			e.printStackTrace();
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public Post getPost(String postId) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		Post post = new Post();

		try {
			String sql = "SELECT * FROM post WHERE postId = '" + postId + "';";
			
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				post = new Post();
				post.setPostID(Integer.toString(rs.getInt("postId")));
				post.setPostTitle(rs.getString("postTitle"));
				post.setPostContent(rs.getString("postContent"));
				post.setUserId(rs.getString("userId"));
				post.setPostDate(rs.getString("postDate"));
			} else {
				post = null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return post;
	}

	public boolean existPost(String search, String category) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM post;";
		
		try {
			conn = DBConnection.getConnection();
			
			if(search != null) {
				if (category != null)
					sql = "SELECT * FROM post WHERE postTitle LIKE '%" + search + "%' AND category = '" + category + "';";
				else
					sql = "SELECT * FROM post WHERE postTitle LIKE '%" + search + "%';";
			}
			else if (category != null)
				sql = "SELECT * FROM post WHERE category = '" + category + "';";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next())
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return false;
	}

	public Post[] getPostList(String search, String category) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		Post[] post = null;
			
		String sql = "SELECT * FROM post";
			
		try {
			conn = DBConnection.getConnection();
			
			if(search != null) {
				if (category != null)
					sql = "SELECT * FROM post WHERE postTitle LIKE '%" + search + "%' AND category = '" + category + "';";
				else
					sql = "SELECT * FROM post WHERE postTitle LIKE '%" + search + "%';";
			}
			else if (category != null)
				sql = "SELECT * FROM post WHERE category = '" + category + "';";
			
			int row = 0;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row++;
			}

			post = new Post[row];

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row--;
				post[row] = new Post();
				post[row].setPostID(Integer.toString(rs.getInt("postId")));
				post[row].setPostTitle(rs.getString("postTitle"));
				post[row].setPostContent(rs.getString("postContent"));
				post[row].setUserId(rs.getString("userId"));
				post[row].setPostDate(rs.getString("postDate"));
				post[row].setViews(rs.getInt("views"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}

		return post;
	}
	
	public void increaseView(String postId) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DBConnection.getConnection();
			
			String sql = "UPDATE post SET views = views + 1 WHERE postId = '" + postId + "';";

			stmt = conn.createStatement();
			stmt.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public Post[] sortPost(Post[] post) {
		if (post.length > 1) {
			for (int i = 0; i < post.length - 1; i++) {
				for (int j = i + 1; j < post.length; j++) {
					if (post[i].getViews() < post[j].getViews()) {
						Post tmp = post[i];
						post[i] = post[j];
						post[j] = tmp;
					}
				}
			}
		}

		return post;
	}
}