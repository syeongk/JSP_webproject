<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../connection/connection.jsp"%>
	
	<%
		String user_id = (String) session.getAttribute("id");
		int lecId = Integer.parseInt(request.getParameter("lecId"));
		int lecReviewCount = Integer.parseInt(request.getParameter("lecReviewCount"));
		String review = request.getParameter("review");
		ResultSet rs = null;
		PreparedStatement pstmt = null;	
	
		try{
		
		    String check = "SELECT COUNT(*) from review where userId=? AND lecId=? ";
		    pstmt = conn.prepareStatement(check);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, lecId);
			rs = pstmt.executeQuery();
			rs.next();
			
			int IsAlreadyDone = rs.getInt(1);
			
			if (IsAlreadyDone == 0){
			
		    
		    String sql = "INSERT INTO review (userId, lecId, review) values (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, lecId);
			pstmt.setString(3, review);
		    pstmt.executeUpdate();
		    
		    lecReviewCount++;
		    
		    String sql2 = "UPDATE lecture SET lecReviewCount=? WHERE lecId=?";
		    pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, lecReviewCount);
			pstmt.setInt(2, lecId);
			pstmt.executeUpdate();
			
			}
			
			} catch (SQLException e) {
			    System.out.println(e.getMessage());
			} finally {
			     if (pstmt != null) pstmt.close();
			     if (conn != null) conn.close();
			 }
	
	response.sendRedirect("lec.jsp?lecId="+lecId);
	%>		
</body>
</html>