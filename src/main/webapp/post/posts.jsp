<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.PostList"%>
<%@ page import="dto.Post"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/posts.css">
<title>CodeOn - 게시판</title>
</head>

<%

String category = request.getParameter("category");

String id = (String) session.getAttribute("id");
if (id == null) {
%>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var createpost = document.getElementById("createpost");
		var loginBackground = document.getElementById("login-background");
		var loginModal = document.getElementById("loginModal");

		createpost.addEventListener("click", function() {
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
} else {
%>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var createpost = document.getElementById("createpost");
		var urlParams = new URLSearchParams(window.location.search);
		var url = "create_post.jsp";
		createpost.addEventListener("click", function() {
			window.location.href = url;
		});
	});
</script>
<%
}
%>

<script>
	function search() {
		var regsearch = /.{2,}/;
		var searchInput = document.getElementById("search-input");
		if (!regsearch.test(searchInput.value)) {
			alert("2글자 이상으로 검색해주세요");
			return false;
		}
		var urlParams = new URLSearchParams(window.location.search);
		var category = urlParams.get('category');
		
		var url = "posts.jsp?search=" + searchInput.value
		if (category != null)
			url = url + "&category=" + category;
		var replaceurl = url.replace(/\\/g, "");
		window.location.href = replaceurl;
	}
	function searchOnEnter(event) {
		if (event.keyCode === 13) {
			search();
		}
	}
</script>

<body>
	<%@ include file="/../header/header.jsp"%>
	<div class="container table-container">
		<div style="width: 63%; margin-top: 100px">
			<div class="board-top">
				<h3 style="padding-left: 10px; color: #5fc703">
					<%
					if (category == null) {
					%>
					모든 게시글
					<%
					} else if (category.equals("free")) {
					%>
					자유게시판
					<%
					} else if (category.equals("question")) {
					%>
					질문게시판
					<%
					}
					%>
				</h3>
				<div class="createpost-div">
					<input type="button" id="createpost" class="createpost" value="글쓰기">
				</div>
			</div>
		</div>
		<div class="noticeBoard">
			<div class="board-table">
				<!------------------------------------------------------------------------------------>
				<p style="height: 10px; margin: 0px"></p>
				<%
				String search = request.getParameter("search");
				
				final int pagePost = 10;

				Post[] posts = null;
				PostList postlist = new PostList();
				int pageNum = 1;
				
				if (!postlist.existPost(search, category)) {
				%>
				<div class="table-row"
					style="display: flex; justify-content: center; align-items: center">
					<p>게시물이 없습니다.</p>
				</div>
				<%
				} else {
				postlist = new PostList();
				posts = postlist.getPostList(search, category);

				if (request.getParameter("page") != null){
					if (Integer.parseInt(request.getParameter("page")) > ((posts.length - 1) / pagePost) + 1){
						response.sendRedirect("posts.jsp");
					}
				}
				
				if (request.getParameter("page") == null)
					pageNum = 1;
				else
					pageNum = Integer.parseInt(request.getParameter("page"));

				if (posts != null) {
					for (int i = (pageNum - 1) * pagePost; i < (pageNum - 1) * pagePost + pagePost; i++) {
						if (i >= posts.length)
					break;
				%>
				<div class="table-row">
					<div class="table-col article">
						<a href="post.jsp?postId=<%=posts[i].getPostID()%>"
							class="board-article"><%=posts[i].getPostTitle()%></a>
					</div>
					<div class="table-col name">
						<a class="board-name"><%=posts[i].getUserId()%></a>
					</div>
					<div class="table-col date">
						<p class="board-date"><%=posts[i].getPostDate()%></p>
					</div>
				</div>
				<%
				}

				}
				}
				%>
				<p style="height: 10px; margin: 0px"></p>
				<!------------------------------------------------------------------------------------>
			</div>
		</div>

		<div style="display: flex; justify-content: center; margin-top:15px">
			<%
			if (posts != null){
			if (pageNum != 1){
			%>
			<a href="posts.jsp?page=<%=pageNum-1%><%if (category != null) {%>&category=<%=category%><%}%><%if (search != null) {%>&search=<%=search%><%}%>" style="margin: 0px 5px; color:#5fc703"><</a>
			<%}for (int i = ((pageNum-1)/10)*10 + 1; i <= ((pageNum-1)/10)*10 + 10; i++) {
				if (i > ((pageNum-1)/10)*10 + 10)
					break;
				if (i > ((posts.length - 1) / pagePost) + 1)
					break;
			%>
			<a href="posts.jsp?page=<%=i%><%if (category != null) {%>&category=<%=category%><%}%><%if (search != null) {%>&search=<%=search%><%}%>" style="margin: 0px 5px; color:#5fc703"><%=i%></a>
			<%
			}
			if (pageNum != ((posts.length - 1) / pagePost) + 1){
			%>
			<a href="posts.jsp?page=<%=pageNum+1%><%if (category != null) {%>&category=<%=category%><%}%><%if (search != null) {%>&search=<%=search%><%}%>" style="margin: 0px 5px; color:#5fc703">></a>
			<%
			}
			}
			%>
		</div>


		<div class="search-div">
			<input type="text" id="search-input" class="search-input"
				placeholder="검색어를 입력해주세요" onkeydown="searchOnEnter(event)">
			<input type="button" class="search-button" value="검색"
				onclick="search()">
		</div>

	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>