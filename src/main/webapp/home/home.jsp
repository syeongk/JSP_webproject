<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.PostList"%>
<%@ page import="dto.Post"%>
<%@ page import="dao.LectureList"%>
<%@ page import="dto.Lecture"%>


<html>
<head>
<link rel="stylesheet" href="../stylesheet/home.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<title>CodeOn - 코딩을 쉽게!</title>
</head>
<body>

	<script>
		function searchLec(event) {
			var regsearch = /.{2,}/;
			if (event.keyCode === 13) {
				if (!regsearch.test(searchInput.value)) {
					alert("2글자 이상으로 검색해주세요");
					return false;
				} else {
					window.location.href = "../lectures/lecs.jsp?search="
							+ searchInput.value;
				}
			}
		}
	</script>

	<%@ include file="../header/header.jsp"%>

	<div class="container">

		<div style="min-height: 125px"></div>

		<div class="searcharea">
			<a href="../home/home.jsp"> <img src="../images/On.png"
				style="width: 100px; height: 60px">
			</a>
			<div class="searchbox">
				<input id="searchInput" class="search" type="text"
					placeholder="검색어를 입력해 주세요." onkeydown="searchLec(event)">
			</div>
		</div>

		<div style="min-height: 125px"></div>

		<div class="box">
			<div class="lecture-box">
				<p class="home-box-title" style="height: 10%">최근 본 강의</p>

				<%
				Cookie[] cookies = request.getCookies();
				String lectureCookieValue = "";
				List<String> lectureList = new ArrayList<>();

				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if ("recentLectures".equals(cookie.getName())) {
					lectureCookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
					break;
						}
					}
				}

				if (lectureCookieValue != null && !lectureCookieValue.trim().isEmpty()) {
					String[] lectures = lectureCookieValue.split(",");
					lectureList.addAll(Arrays.asList(lectures));
				}

				String[] lecId = new String[lectureList.size()];

				for (int i = 0; i < lectureList.size(); i++) {
					lecId[i] = lectureList.get(i);
				}

				Lecture[] lectures = new Lecture[lectureList.size()];
				LectureList lecturelist = new LectureList();

				int recentLec = 0;
				
				if (lectureList.size() > 0) {
					for (int i = 0; i < lectureList.size(); i++) {
						lectures[i] = lecturelist.getLecture(lecId[i]);
						if (lectures[i].getLecName() != null) {
							recentLec++;
							if (i < 4) {
				%>
				<div class="recentLec">
					<a href="../lectures/lec.jsp?lecId=<%=lectures[i].getLecId()%>"
						class="recentLec-a"> <%=lectures[i].getLecName()%></a>
					<div class="badge-div">
						<span class="badge bg-primary"><%=lectures[i].getLecCategory()%></span>
						<span class="badge bg-secondary"><%=lectures[i].getLecLevel()%></span>
					</div>
				</div>
				<%
				} 			else {
				%>
				<div class="recentLec last">
					<a href="../lectures/lec.jsp?lecId=<%=lectures[i].getLecId()%>"
						class="recentLec-a"> <%=lectures[i].getLecName()%></a>
					<div class="badge-div">
						<span class="badge bg-primary"><%=lectures[i].getLecCategory()%></span>
						<span class="badge bg-secondary"><%=lectures[i].getLecLevel()%></span>
					</div>
				</div>
				<%
				}
				}
				}
				}
				
				if (recentLec == 0){
				%>
				<div class="noRecentLec">최근 본 강의가 없습니다.</div>
				<%
				}
				%>

			</div>
			<div class="post-box">
				<a href="../post/posts.jsp?category=free" class="home-box-title">자유게시판</a>

				<%
				Post[] posts = null;
				PostList postlist = new PostList();

				if (!postlist.existPost(null, "free")) {
				%>
				<div class="home-post-row-box" style="flex-grow: 1">
					<div class="home-post-row">
						<p style="flex-grow: 1; text-align: center; margin: 0px">게시물이
							없습니다.</p>
					</div>
				</div>
				<%
				} else {
				postlist = new PostList();
				posts = postlist.getPostList(null, "free");
				postlist.sortPost(posts);

				for (int i = 0; i < posts.length; i++) {
				%>
				<div class="home-post-row-box">
					<div class="home-post-row">
						<div class="home-post-col article">
							<a href="../post/post.jsp?postId=<%=posts[i].getPostID()%>"
								class="home-post-col-a"><%=posts[i].getPostTitle()%></a>
						</div>
						<p class="home-post-col userId"><%=posts[i].getUserId()%></p>
						<p class="home-post-col views"><%=posts[i].getViews()%>회
						</p>
					</div>
				</div>
				<%
				if (i == 4)
					break;
				}
				}
				%>


			</div>



			<div class="post-box">
				<a href="../post/posts.jsp?category=question" class="home-box-title">질문게시판</a>

				<%
				posts = null;
				postlist = new PostList();

				if (!postlist.existPost(null, "question")) {
				%>
				<div class="home-post-row-box" style="flex-grow: 1">
					<div class="home-post-row">
						<p style="flex-grow: 1; text-align: center; margin: 0px">게시물이
							없습니다.</p>
					</div>
				</div>
				<%
				} else {
				postlist = new PostList();
				posts = postlist.getPostList(null, "question");
				postlist.sortPost(posts);

				for (int i = 0; i < posts.length; i++) {
				%>
				<div class="home-post-row-box">
					<div class="home-post-row">
						<div class="home-post-col article">
							<a href="../post/post.jsp?postId=<%=posts[i].getPostID()%>"
								class="home-post-col-a"><%=posts[i].getPostTitle()%></a>
						</div>
						<p class="home-post-col userId"><%=posts[i].getUserId()%></p>
						<p class="home-post-col views"><%=posts[i].getViews()%>회
						</p>
					</div>
				</div>
				<%
				if (i == 4)
					break;
				}
				}
				%>

			</div>
		</div>
	</div>
	<p style="height: 100px"></p>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>