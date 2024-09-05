package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.DBConnection;
import dto.Lecture;

public class LectureList {

	public LectureList() {

	}

	public Lecture getLecture(String lecId) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		Lecture lecture = new Lecture();

		String sql = "SELECT * FROM lecture WHERE lecId = '" + lecId + "'";

		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				lecture.setLecId(Integer.toString(rs.getInt("lecId")));
				lecture.setLecName((rs.getString("lecName")));
				lecture.setTeacherName((rs.getString("teacherName")));
				lecture.setLecDescription((rs.getString("lecDescription")));
				lecture.setLecCategory((rs.getString("lecCategory")));
				lecture.setLecLevel((rs.getString("lecLevel")));
				lecture.setLecPrice((rs.getInt("lecPrice")));
				lecture.setLecReviewCount((rs.getInt("lecReviewCount")));
				lecture.setImage((rs.getString("image")));
				lecture.setVideo((rs.getString("video")));
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

		return lecture;
	}

	public Lecture[] getLectureList(String search, String category) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		Lecture[] lecture = null;

		String sql = "SELECT * FROM lecture";

		try {
			conn = DBConnection.getConnection();

			if (search != null) {
				sql = "SELECT * FROM lecture WHERE lecName LIKE '%" + search + "%';";
			} else if (category != null) {
				if (category.equals("프로그래밍")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('프론트엔드', '백엔드', '앱 개발', '데이터베이스', '개발도구')";
				} else if (category.equals("게임 개발")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('게임 프로그래밍', '게임 기획', '게임 그래픽')";
				} else if (category.equals("빅데이터/AI")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('데이터 분석', '컴퓨터 비전', '자연어 처리')";
				} else if (category.equals("보안/네트워크")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('보안', '네트워크', '클라우드', '시스템')";
				} else
					sql = "SELECT * FROM lecture WHERE lecCategory = '" + category + "';";
			}

			int row = 0;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row++;
			}

			lecture = new Lecture[row];

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row--;
				lecture[row] = new Lecture();
				lecture[row].setLecId(Integer.toString(rs.getInt("lecId")));
				lecture[row].setLecName((rs.getString("lecName")));
				lecture[row].setTeacherName((rs.getString("teacherName")));
				lecture[row].setLecDescription((rs.getString("lecDescription")));
				lecture[row].setLecCategory((rs.getString("lecCategory")));
				lecture[row].setLecLevel((rs.getString("lecLevel")));
				lecture[row].setLecPrice((rs.getInt("lecPrice")));
				lecture[row].setLecReviewCount((rs.getInt("lecReviewCount")));
				lecture[row].setImage((rs.getString("image")));
				lecture[row].setVideo((rs.getString("video")));
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

		return lecture;
	}

	public Lecture[] getMyLectureList(String userId) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		Lecture[] lecture = null;

		String sql = "SELECT * FROM Lecture WHERE lecId IN (SELECT lecId FROM Payment WHERE userId = '" + userId + "')";

		try {
			conn = DBConnection.getConnection();

			int row = 0;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row++;
			}

			if (row != 0) {
				lecture = new Lecture[row];

				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					row--;
					lecture[row] = new Lecture();
					lecture[row].setLecId(Integer.toString(rs.getInt("lecId")));
					lecture[row].setLecName((rs.getString("lecName")));
					lecture[row].setTeacherName((rs.getString("teacherName")));
					lecture[row].setLecDescription((rs.getString("lecDescription")));
					lecture[row].setLecCategory((rs.getString("lecCategory")));
					lecture[row].setLecLevel((rs.getString("lecLevel")));
					lecture[row].setLecPrice((rs.getInt("lecPrice")));
					lecture[row].setLecReviewCount((rs.getInt("lecReviewCount")));
					lecture[row].setImage((rs.getString("image")));
					lecture[row].setVideo((rs.getString("video")));
				}
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

		return lecture;
	}

}
