<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeOn - 결제</title>
</head>
<body>
	<%@ include file ="../connection/connection.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");	
	
		String user_id = (String) session.getAttribute("id");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String paymentMethod = request.getParameter("paymentMethods");
		String price = request.getParameter("price");
		LocalDate now = LocalDate.now();
		String paymentDate = now.toString();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
		
			String sql1 = "SELECT lecId FROM Cart WHERE userId = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
		
		while (rs.next()) {
			
			int lecId = rs.getInt("lecId");
			
			String sql2 = "INSERT INTO Payment (name, email, phone, paymentMethod, paymentDate, userId, lecId) VALUES (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setString(4, paymentMethod);
			pstmt.setString(5, paymentDate);
			pstmt.setString(6, user_id);
			pstmt.setInt(7, lecId);
			
	        count = pstmt.executeUpdate();
	    	
	        if (count > 0) {
	            System.out.println("결제가 완료되었습니다.");
	        } else {
	            System.out.println("결제에 실패했습니다.");
	        }
	        
			String sql3 = "DELETE FROM CART WHERE userId = ? AND lecID = ? ";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, lecId);
			
	        pstmt.executeUpdate();
	        
	        System.out.println("장바구니에 있는 강의 삭제.");
		}
		
		
		
	    } catch (SQLException e) {
	        System.out.println("<script>alert('데이터베이스 오류: " + e.getMessage() + "'); location.href='lec_manage.jsp';</script>");
	    
	    } finally {
	    	if (rs != null) rs.close();
	        if (pstmt != null) pstmt.close();
	        if (conn != null) conn.close();
	    }
		if (count == 0){
			response.sendRedirect("payment_fail.jsp");
		}
		else{
			response.sendRedirect("payment_success.jsp");
		}
	%>      
	
</body>
</html>