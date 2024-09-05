<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 삭제 처리</title>
</head>
<body>
	<%@ include file ="../connection/connection.jsp" %>
	<%
	   String lecId = request.getParameter("lecId");
	   PreparedStatement pstmt = null;
	
	   try {
		   
	       String sql = "DELETE FROM lecture WHERE lecId=?";
	       pstmt = conn.prepareStatement(sql);
	       pstmt.setInt(1, Integer.parseInt(lecId));
	       int count = pstmt.executeUpdate();
	
	       if (count > 0) {
	       	System.out.println("강의가 삭제되었습니다.");
	       }
	       else {
	       	System.out.println("삭제할 강의가 없습니다.");
	       }
	
	   } catch (SQLException e) {
	       out.println("데이터베이스 오류: " + e.getMessage());
	   } finally {
	       if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	       if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	   }
	   
	   response.sendRedirect("administration.jsp?edit=delete");
	%>
</body>
</html>
