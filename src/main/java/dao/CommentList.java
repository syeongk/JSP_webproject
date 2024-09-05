package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.DBConnection;
import dto.Comment;

public class CommentList {

	public CommentList() {
	
	}
	
	public String addComment(String postId, String userId, String comment) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int lastId = 0;
		int commentId = 0;
		
		String message = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sqlFind = "SELECT * FROM comment";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlFind);

			while (rs.next()) {
				lastId = rs.getInt("commentId");
			}

			commentId = ++lastId;

			String sql = "INSERT INTO comment VALUES('" + commentId + "','" + postId + "','" + userId + "','" + comment
					+ "');";

			stmt = conn.createStatement();
			stmt.executeUpdate(sql);

			message = "댓글을 등록했습니다.";
		} catch (SQLException e) {
			message = "댓글 등록에 실패했습니다.";
			e.printStackTrace();
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return message;
	}
	
	public boolean existComment(String postId) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM comment WHERE postId = '" + postId + "'";
			int i = 0;

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
	
	
	public Comment[] getCommentList(String postId) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		Comment[] comment = null;

		try {
			conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM comment WHERE postId = " + postId + ";";
			int row = 0;
			int i = 0;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row++;
			}

			comment = new Comment[row];

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				comment[i] = new Comment();
				comment[i].setCommentId(Integer.toString(rs.getInt("commentId")));
				comment[i].setPostId(rs.getString("postId"));
				comment[i].setUserId(rs.getString("userId"));
				comment[i].setComment(rs.getString("comment"));
				i++;
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

		return comment;
	}
	
}