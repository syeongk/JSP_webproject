<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script type="text/javascript">

	function check() {
		var form = document.getElementById("updateLec");
		
		if (form.lecName.value=="" || form.teacherName.value=="" || form.videoName.value=="" || form.lecCategory.value=="" || form.lecLevel.value=="" || form.lecPrice.value=="") {
			alert("입력하지 않은 값이 있습니다.");
			return false;
		
		} else if (form.lecName.value.length < 5) {
			alert("강의명은 5글자 이상 입력해야 합니다. ");
			form.lecName.select();
			return false;
		} else if (isNaN(form.lecPrice.value)){
			alert("가격은 숫자로 입력해야 합니다.");
			form.lecPrice.select();
			return false;
		}
		else {
			form.submit();
		}
	}
</script>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>' />
<fmt:bundle basename="bundle.message" >

<%@ include file ="../connection/connection.jsp" %>

<%
	int lecId = Integer.parseInt(request.getParameter("lecId"));
	ResultSet rs = null;
   	PreparedStatement pstmt = null;
   
   	try {
       String sql = "SELECT * FROM lecture WHERE lecId=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, lecId);
       rs = pstmt.executeQuery();
       
       if (rs.next()) {
           String lecName = rs.getString("lecName");
           String teacherName = rs.getString("teacherName");
           String lecDescription = rs.getString("lecDescription");
           String lecCategory = rs.getString("lecCategory");
           String lecLevel = rs.getString("lecLevel");
           int lecPrice = rs.getInt("lecPrice");
           String image = rs.getString("image");
           String video = rs.getString("video");
%>

<div class="container mt-5">
    <div class="text-end">
        <a href="?lecId=<%=lecId %>&language=ko" style="text-decoration:none;" >한국어</a> | <a href="?lecId=<%=lecId %>&language=en" style="text-decoration:none;" >English &nbsp; </a>
    </div>
    <div class="card-body">
        <h1 style="font-weight: bold;" class="display-4 mb-2"><fmt:message key="updateLec"/></h1>
        <br><br>
        <form id="updateLec" name="updateLec" action="updateLec_process.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="lecId" value="<%= lecId %>">
            <div class="mb-3">
                <label for="lecName" class="form-label"><fmt:message key="lecName"/></label>
                <input type="text" class="form-control" id="lecName" name="lecName" placeholder="<fmt:message key='lecName' />" maxlength="50" value="<%= lecName %>">
            </div>
            <div class="mb-3">
                <label for="teacherName" class="form-label"><fmt:message key="teacherName"/></label>
                <input type="text" class="form-control" id="teacherName" name="teacherName" placeholder="<fmt:message key='teacherName' />" maxlength="10" value="<%= teacherName %>">
            </div>
            <div class="mb-3">
                <label for="imageName" class="form-label"><fmt:message key="image"/></label>
                <input type="file" class="form-control" id="imageName" name="imageName">
            </div>
            <div class="mb-3">
                <label for="videoName" class="form-label"><fmt:message key="video"/></label>
                <input type="file" class="form-control" id="videoName" name="videoName">
            </div>
            <div class="mb-3">
                <label for="lecCategory" class="form-label"><fmt:message key="lecCategory"/></label>
                <select class="form-select" id="lecCategory" name="lecCategory">
                    <option disabled hidden selected><fmt:message key="selectCategory"/></option>
                    <optgroup label="<fmt:message key='programming' />">
                        <option value="프론트엔드" <%= lecCategory.equals("프론트엔드") ? "selected" : "" %>><fmt:message key="frontend" /></option>
                        <option value="백엔드" <%= lecCategory.equals("백엔드") ? "selected" : "" %>><fmt:message key="backend" /></option>
                        <option value="앱 개발" <%= lecCategory.equals("앱 개발") ? "selected" : "" %>><fmt:message key="appDevelopment" /></option>
                        <option value="데이터베이스" <%= lecCategory.equals("데이터베이스") ? "selected" : "" %>><fmt:message key="database" /></option>
                        <option value="개발도구" <%= lecCategory.equals("개발도구") ? "selected" : "" %>><fmt:message key="devTools" /></option>
                    </optgroup>
                    <optgroup label="<fmt:message key='gameDevelopment' />">
                        <option value="게임 프로그래밍" <%= lecCategory.equals("게임 프로그래밍") ? "selected" : "" %>><fmt:message key="gameProgramming" /></option>
                        <option value="게임 기획" <%= lecCategory.equals("게임 기획") ? "selected" : "" %>><fmt:message key="gamePlanning" /></option>
                        <option value="게임 그래픽" <%= lecCategory.equals("게임 그래픽") ? "selected" : "" %>><fmt:message key="gameGraphics" /></option>
                    </optgroup>
                    <optgroup label="<fmt:message key='aiBigData' />">
                        <option value="데이터 분석" <%= lecCategory.equals("데이터 분석") ? "selected" : "" %>><fmt:message key="dataAnalysis" /></option>
                        <option value="컴퓨터 비전" <%= lecCategory.equals("컴퓨터 비전") ? "selected" : "" %>><fmt:message key="computerVision" /></option>
                        <option value="자연어 처리" <%= lecCategory.equals("자연어 처리") ? "selected" : "" %>><fmt:message key="nlp" /></option>
                    </optgroup>
                    <optgroup label="<fmt:message key='securityNetwork' />">
                        <option value="보안" <%= lecCategory.equals("보안") ? "selected" : "" %>><fmt:message key="security" /></option>
                        <option value="네트워크" <%= lecCategory.equals("네트워크") ? "selected" : "" %>><fmt:message key="network" /></option>
                        <option value="시스템" <%= lecCategory.equals("시스템") ? "selected" : "" %>><fmt:message key="system" /></option>
                        <option value="클라우드" <%= lecCategory.equals("클라우드") ? "selected" : "" %>><fmt:message key="cloud" /></option>
                    </optgroup>
                </select>
            </div>
            <div class="mb-3">
                <label for="lecLevel" class="form-label"><fmt:message key="lecLevel"/></label>
                <select class="form-select" id="lecLevel" name="lecLevel">
                    <option disabled hidden selected><fmt:message key="selectLevel"/></option>
                    <option value="초급" <%= lecLevel.equals("초급") ? "selected" : "" %>><fmt:message key="basic"/></option>
                    <option value="중급" <%= lecLevel.equals("중급") ? "selected" : "" %>><fmt:message key="intermediate"/></option>
                    <option value="고급" <%= lecLevel.equals("고급") ? "selected" : "" %>><fmt:message key="advanced"/></option>
                </select>
            </div>
            <div class="mb-3">
                <label for="lecPrice" class="form-label"><fmt:message key="lecPrice"/></label>
                <input type="text" class="form-control" id="lecPrice" name="lecPrice" placeholder="<fmt:message key='lecPrice' />" maxlength="10" value="<%= lecPrice %>">
            </div>
            <div class="mb-3">
                <label for="lecDescription" class="form-label"><fmt:message key="lecDescription"/></label>
                <textarea class="form-control" id="lecDescription" name="lecDescription" rows="3" placeholder="<fmt:message key='lecDescription' />" maxlength="150"><%= lecDescription %></textarea>
            </div>
            <div class="d-flex justify-content-end mb-3">
                <button type="button" class="btn btn-light btn-lg" onclick="check()"><fmt:message key="update"/></button>
            </div>
        </form>
    </div>
</div>
<%
       } else {
           out.println("해당 강의를 찾을 수 없습니다.");
       }
   } catch (SQLException e) {
       out.println("lecture 테이블 호출 실패");
       out.println(e.getMessage());
   } finally {
       if (rs != null) rs.close();
       if (pstmt != null) pstmt.close();
       if (conn != null) conn.close();
   }
%>
</fmt:bundle>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>