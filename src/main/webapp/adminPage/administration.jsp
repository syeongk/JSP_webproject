<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 관리 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script>

	function deleteLecture(lecId) {
		if (confirm("해당 강의를 삭제합니다.") == true) {
			location.href = "deleteLec.jsp?lecId=" + lecId;
			alert('삭제되었습니다.');
		} else {
			return;
		}
	}
	
</script>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >

	<%@ include file ="../connection/connection.jsp" %>

	<%

	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try {
		String sql = "SELECT lecId, lecName, teacherName, lecPrice FROM lecture";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		%>
	
	<div class="container mt-5">
		<div class="text-end">
            <a href="?language=ko" style="text-decoration:none;" >한국어</a> | <a href="?language=en" style="text-decoration:none;" >English &nbsp; </a>
        </div>
		<div class="d-flex justify-content-between align-items-center mb-3">
			<h1 style="font-weight: bold;" class="display-4 mb-2"><fmt:message key="administration"/></h1>
			<a href="addLec.jsp" class="btn btn-light btn-lg" role="button"><fmt:message key="addLec"/></a>
		</div>
	<table class="table table-bordered mt-5">
	    <thead>
	        <tr>
	            <th><fmt:message key="lecId"/></th>
	            <th><fmt:message key="lecName"/></th>
	            <th><fmt:message key="teacherName"/></th>
	            <th><fmt:message key="lecPrice"/></th>
	            <th><fmt:message key="update"/></th>
	            <th><fmt:message key="delete"/></th>
	        </tr>
	    </thead>
	    <tbody>
		<%
			while (rs.next()) {
			    int lecId = rs.getInt("lecId");
			    String lecName = rs.getString("lecName");
			    String teacherName = rs.getString("teacherName");
			    int lecPrice = rs.getInt("lecPrice");
		%>
	<tr>
	    <td><%=lecId%></td>
		<td><%=lecName%></td>
		<td><%=teacherName%></td>
		<td><%=lecPrice%></td>
		<td><a class="btn btn-primary btn-sm" href="updateLec.jsp?lecId=<%=lecId%>"><fmt:message key="update"/></a></td>
		<td><a class="btn btn-danger btn-sm" href="#" onclick="event.preventDefault(); deleteLecture('<%=lecId%>');"><fmt:message key="delete"/></a></td>
	</tr>
	<%
	}
	%>
	    </tbody>
	</table>
	<%
	} catch (SQLException e) {
	    out.println("lecture 테이블 호출 실패");
	    out.println(e.getMessage());
	} finally {
	    if (rs != null) rs.close();
	    if (pstmt != null) pstmt.close();
	    if (conn != null) conn.close();
	}
	%>
	</div>
</fmt:bundle>
</body>
</html>