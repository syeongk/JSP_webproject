<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeOn - 장바구니</title>
</head>
<body>
    <div>
        <%@ include file="../connection/connection.jsp" %>

        <%
        	int cart = 0;
            int lecId = Integer.parseInt(request.getParameter("lecId"));
            String user_id = (String) session.getAttribute("id");

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
            	
            	String check = "SELECT COUNT(*) FROM Payment WHERE userId = ? AND lecId = ?";
    			pstmt = conn.prepareStatement(check);
    			pstmt.setString(1, user_id);
    			pstmt.setInt(2, lecId);
    			rs = pstmt.executeQuery();
    			rs.next();
    			
    			int IsOrdered = rs.getInt(1);
    			
    			check = "SELECT * FROM cart WHERE userId = ? AND lecId = ?";
    			pstmt = conn.prepareStatement(check);
    			pstmt.setString(1, user_id);
    			pstmt.setInt(2, lecId);
    			rs = pstmt.executeQuery();

    			
    			int IsInCart = 0;
    			
    			
    			while(rs.next()){
    				IsInCart++;
    			}
    			
    			
    			if (IsOrdered==0 && IsInCart==0) {
    				
	                String sql = "INSERT INTO Cart (userId, lecId) VALUES (?, ?)";
	                pstmt = conn.prepareStatement(sql);
	                pstmt.setString(1, user_id); 
	                pstmt.setInt(2, lecId);
	
	                pstmt.executeUpdate();
	                cart = 1;
	                
    			} else if (IsInCart == 0){
    				session.setAttribute("message", "이미 구입한 강의입니다.");
    			} else if (IsOrdered == 0){
    				session.setAttribute("message", "이미 장바구니에 추가하였습니다.");
    			}


            } catch (SQLException e) {
                System.out.println("데이터 삽입 실패");
                System.out.println(e.getMessage());
            } finally {
                 if (pstmt != null) pstmt.close();
                 if (conn != null) conn.close();
             }
            
            response.sendRedirect("lec.jsp?lecId="+lecId+"&cart="+cart);
        %>
    </div>
</body>
</html>