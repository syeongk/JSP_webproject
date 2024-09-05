<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberList" %>
<%@ page import="dto.Member" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../stylesheet/styles.css">
<title>CodeOn - 마이페이지</title>
</head>
<body>
	<%
		MemberList memberlist = new MemberList();
		String message = memberlist.deleteMember((String)session.getAttribute("id"));
		session.invalidate();
		
		request.getSession().setAttribute("message", message);
		response.sendRedirect("../home/home.jsp");
	%>
</body>
</html>