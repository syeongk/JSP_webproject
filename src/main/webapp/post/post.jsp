<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.PostList"%>
<%@ page import="dto.Post"%>
<%@ page import="dao.CommentList"%>
<%@ page import="dto.Comment"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/post.css">
<link rel="stylesheet" href="../stylesheet/comment.css">
<title>CodeOn - 게시판</title>
</head>
<body>
	<%
		String postId = request.getParameter("postId");
		Post post = new Post();
		PostList postlist = new PostList();
		post = postlist.getPost(postId);
	%>

	<%if (session.getAttribute("id") == null) { %>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		var commentOn = document.getElementById("commentOn");
		var loginBackground = document.getElementById("login-background");
		var loginModal = document.getElementById("loginModal");

		commentOn.addEventListener("click", function() {
			loginBackground.style.display = "block";
			loginModal.style.display = "block";
			setTimeout(function() {
				loginBackground.style.opacity = "1";
				loginModal.style.opacity = "1";
			}, 10)
			document.getElementById("login-input-id").focus();
		});
	});
	</script>
	<%
	}
	%>
	<%@ include file="/../header/header.jsp"%>
	
	<div class="container table_container" style="height: 90%">
		<div class="post-title-div">
			<h3 class="post-title"><%=post.getPostTitle() %></h3>
		</div>
		<div id="post-div" class="post-div">
			<textarea id="post-textarea" name="postContent" class="post-textarea" maxlength="10000" disabled><%=post.getPostContent() %></textarea>
		</div>
		
		<div class="comment-div">
		<%
		Comment[] comments = null;
		CommentList commentlist = new CommentList();
		
		if (!commentlist.existComment(postId)){
			%>
			<div class="no-comment">댓글이 없습니다.</div>
			<%
		}
		else{
			commentlist = new CommentList();
			comments = commentlist.getCommentList(postId);
			
			if (comments != null){
				for (int i = 0; i < comments.length; i++){
					%>
					<div class="comment-row <%if (i+1 == comments.length){%>last<%}%>">
						<p class="comment-userId"><%=comments[i].getUserId() %></p>
						<p class="comment-comment"><%=comments[i].getComment() %></p>
					</div>
					<%
				}
			}
		}
		%>
			
		</div>
		
		<form action="../commentOn.comment?postId=<%=post.getPostID() %>" id="comment-on-form" class="comment-on-form" method="POST">
			<textarea id="comment-textarea" class="comment-textarea" name="comment-textarea" placeholder=<%if(!(session.getAttribute("id") == null)){%>"내용을 입력해주세요"<%} else {%>"로그인 후 이용 가능합니다." <%} if(session.getAttribute("id") == null){%>disabled<%}%>></textarea>
			<input type="button" id="commentOn" class="comment-button" value="등록"  <%if(!(session.getAttribute("id") == null)){%>onclick="onComment()"<%}%>>
		</form>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
<script src="../post.js"></script>
</body>
</html>