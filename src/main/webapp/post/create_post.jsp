<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/create_post.css">
<title>CodeOn - 게시판</title>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");
	String referer = request.getHeader("Referer");
	String category = request.getParameter("category");

	if (id == null){
		response.sendRedirect("../home/home.jsp");
	}
%>
	
	<script>
		function onPost(){
			var postForm = document.getElementById("post-form");
			var postCategory = document.getElementById("post-category");
			var postTitle = document.getElementById("post-title");
			var postTextarea = document.getElementById("post-textarea");
			
			if (postCategory.value == "none"){
				alert("카테고리를 지정해주세요");
				return false;
			}
			if (postTitle.value == ""){
				alert("제목을 입력해주세요");
				postTitle.select();
				return false;
			}
			else if (postTextarea.value == ""){
				alert("내용을 입력해주세요");
				postTextarea.select();
				return false;
			}
			else{
				postForm.submit();
			}
		}
	</script>
	<%@ include file="/../header/header.jsp"%>
	
	<div class="container table_container" style="height: 90%">
		<div class="createpost-title-div">
			<h3 class="createpost-title">게시물 작성</h3>
		</div>
		<form action="../createPost.post" method="post" id="post-form" class="createpost-form" onsubmit="return false;">
			<select id="post-category" name="postCategory" class="post-select">
				<option value="none" hidden>카테고리</option>
				<option value="free">자유게시판</option>
				<option value="question">질문게시판</option>
			</select>
			<input type="text" id="post-title" name="postTitle" class="post-title" maxlength="100" placeholder="제목을 입력해주세요">
			<textarea id="post-textarea" name="postContent" class="post-textarea" maxlength="10000" placeholder="내용을 입력해주세요"></textarea>
			<input type="button" class="createpost-button" value="등록하기" onclick="onPost()">
		</form>
	</div>
</body>
</html>
<%@ include file="/../footer/footer.jsp"%>