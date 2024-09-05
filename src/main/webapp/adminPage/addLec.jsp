<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="addLec" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script type="text/javascript">
	function check() {
        var form = document.getElementById("addLec");
        
        
        if (form.lecName.value=="" || form.teacherName.value=="" || form.videoName.value=="" || form.lecCategory.value=="" || form.lecLevel.value=="" || form.lecPrice.value=="") {
        	alert("입력하지 않은 값이 있습니다.");
            return false;
        
        } else if (form.lecName.value.length < 5) {
            alert("강의명은 5글자 이상입니다.");
            form.lecName.select();
            return false;
        } else if (isNaN(form.lecPrice.value)){
            alert("가격은 숫자로만 입력해야 합니다.");
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
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >

    <div class="container mt-5">
        <div class="text-end">
            <a href="?language=ko" style="text-decoration:none;" >한국어</a> | <a href="?language=en" style="text-decoration:none;" >English &nbsp; </a>
        </div>
        <div class="card-body">
        	<h1 style="font-weight: bold;" class="display-4 mb-2"><fmt:message key="addLec"/></h1>
            <br><br>
            <form id="addLec" name="addLec" action="<c:url value='addLec_process.jsp' />" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="lecName" class="form-label"><fmt:message key="addLec"/></label>
                    <input type="text" class="form-control" id="lecName" name="lecName" placeholder="<fmt:message key='addLec' />" maxlength="50">
                </div>
                <div class="mb-3">
                    <label for="teacherName" class="form-label"><fmt:message key="teacherName"/></label>
                    <input type="text" class="form-control" id="teacherName" name="teacherName" placeholder="<fmt:message key='teacherName' />" maxlength="10">
                </div>
                <div class="mb-3">
                    <label for="imageName" class="form-label"><fmt:message key="image"/></label>
                    <input type="file" class="form-control" id="imageName" name="imageName">
                </div>
                <div class="mb-3">
                    <label for="videoName" class="form-label"><fmt:message key="video"/></label>
                    <input type="file" class="form-control" id="videoName" name="videoName">
                </div>
                
                <!-- 카테고리 선택 -->
                <div class="mb-3">
                    <label for="lecCategory" class="form-label"><fmt:message key="lecCategory"/></label>
                    <select class="form-select" id="lecCategory" name="lecCategory">
                        <option disabled hidden selected><fmt:message key="selectCategory"/></option>
                        <optgroup label="<fmt:message key='programming' />">
                            <option value="프론트엔드"><fmt:message key="frontend" /></option>
                            <option value="백엔드"><fmt:message key="backend" /></option>
                            <option value="앱 개발"><fmt:message key="appDevelopment" /></option>
                            <option value="데이터베이스"><fmt:message key="database" /></option>
                            <option value="개발도구"><fmt:message key="devTools" /></option>
                        </optgroup>
                        <optgroup label="<fmt:message key='gameDevelopment' />">
                            <option value="게임 프로그래밍"><fmt:message key="gameProgramming" /></option>
                            <option value="게임 기획"><fmt:message key="gamePlanning" /></option>
                            <option value="게임 그래픽"><fmt:message key="gameGraphics" /></option>
                        </optgroup>
                        <optgroup label="<fmt:message key='aiBigData' />">
                            <option value="데이터 분석"><fmt:message key="dataAnalysis" /></option>
                            <option value="컴퓨터 비전"><fmt:message key="computerVision" /></option>
                            <option value="자연어 처리"><fmt:message key="nlp" /></option>
                        </optgroup>
                        <optgroup label="<fmt:message key='securityNetwork' />">
                            <option value="보안"><fmt:message key="security" /></option>
                            <option value="네트워크"><fmt:message key="network" /></option>
                            <option value="시스템"><fmt:message key="system" /></option>
                            <option value="클라우드"><fmt:message key="cloud" /></option>
                        </optgroup>
                    </select>
                </div>

                <!-- 단계 선택 -->
                <div class="mb-3">
                    <label for="lecLevel" class="form-label"><fmt:message key="lecLevel"/></label>
                    <select class="form-select" id="lecLevel" name="lecLevel">
                        <option disabled hidden selected><fmt:message key="selectLevel"/></option>
                        <option value="초급"><fmt:message key="basic"/></option>
                        <option value="중급"><fmt:message key="intermediate"/></option>
                        <option value="고급"><fmt:message key="advanced"/></option>
                    </select>
                </div>
                
                <!-- 가격선택 -->
                <div class="mb-3">
                    <label for="lecPrice" class="form-label"><fmt:message key="lecPrice"/></label>
                    <input type="text" class="form-control" id="lecPrice" name="lecPrice" placeholder="<fmt:message key='lecPrice' />" maxlength="10">
                </div>
                
                <!-- 강의 설명 -->
                <div class="mb-3">
                    <label for="lecDescription" class="form-label"><fmt:message key="lecDescription"/></label>
                    <textarea class="form-control" id="lecDescription" name="lecDescription" rows="3" placeholder="<fmt:message key='lecDescription' />" maxlength="150"></textarea>
                </div>
                
                <div class="d-flex justify-content-end mb-3">
                    <button type="button" class="btn btn-light btn-lg" onclick="check()"><fmt:message key="add"/></button>
                </div>
            </form>
        </div>
    </div>
</fmt:bundle>
</body>
</html>
