<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<link rel="stylesheet" href="../stylesheet/header.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/register.css">

<%
String header_name = (String) session.getAttribute("name");
String header_id = (String) session.getAttribute("id");
%>

<script>
	function clearText() {
		var inputs = document.getElementsByClassName("input");
		for (var i = 0; i < inputs.length; i++)
			inputs[i].value = "";
	}
</script>

<script type="text/javascript">
	
	window.onload = function(){
		
		loginModal();
		
		registerModal();
		
		messageAlert();
	}
	
	function messageAlert(){
		var message = '<%=session.getAttribute("message")%>';
		if (message != 'null'){
			setTimeout(function() {			// modal창을 띄우고 alert창이 뜨게 하기 위해 약간의 지연시간을 줌
				alert(message);
				}, 100);
		}	
		<%session.removeAttribute("message");%>
	}
	
	function registerModal(){
		var regi_modal_status = '<%=session.getAttribute("regi_modal_status")%>';
		if (regi_modal_status == "on"){
			document.getElementById("registerModal").style.display = "block";
			document.getElementById("regi-background").style.display = "block";
			document.getElementById("registerModal").classList.add("fadeIn");
			document.getElementById("regi-background").classList.add("fadeIn");
			document.getElementById("regi-input-id").focus();
		}
		<%session.removeAttribute("regi_modal_status");%>
	}
	
	function loginModal(){
		var login_modal_status = '<%=session.getAttribute("login_modal_status")%>';
				if (login_modal_status == "on") {
					document.getElementById("loginModal").style.display = "block";
					document.getElementById("login-background").style.display = "block";
					document.getElementById("loginModal").classList.add("fadeIn");
					document.getElementById("login-background").classList.add("fadeIn");
					document.getElementById("login-input-id").focus();
				}
		<%session.removeAttribute("login_modal_status");%>
	}
</script>

<script src="../login.js"></script>
<script src="../register.js"></script>
<script src="../dropdown.js"></script>

<header class="header">
<div class="header-box">
	<div class="header-container"
		style="height: 110px; display: flex; flex-direction: column">
		<div class="row" style="height:50px; display:block">
			<div class="col" style="margin-top: 10px">
				<a href="../home/home.jsp" class="home-button"> 
				<span>
					<img src="../images/codeOn.png" style="width:150px; height:40px">
				</span>
				</a>
				<div class="login-register"
					style="display: flex; justify-content: flex-end; width: 100%; height: 32px">

					<%
					if (header_name == null) {
					%>
					<button id="loginButton" class="header-button"
						onclick="clearText()">로그인</button>
					<jsp:include page="../member/login.jsp"></jsp:include>

					<button id="registerButton" class="header-button" style="border-left: 1px solid #bcdbac"
						onclick="clearText()">회원가입</button>
					<jsp:include page="../member/register.jsp"></jsp:include>
					<%
					} else {
					%>
					<a href="../cart/cart.jsp" class="link"
						style="font-size: 13px; padding: 0px 10px; margin: 8px 0px;">장바구니</a>
					<a href="../mypage/mylec.jsp" class="link"
						style="border-left: 1px solid #bcdbac">내 강의실</a>
					<a href="../mypage/mypage.jsp" class="link"
						style="border-left: 1px solid #bcdbac"><%=header_name%> 님</a>
					<a href="../member/logout_process.jsp" class="link"
						style="border-left: 1px solid #bcdbac">로그아웃</a>
					<%
					}
					%>
				</div>
			</div>
		</div>

		<div id="header_category" class="category">
			<div class="category-div">
				<a href="../lectures/lecs.jsp" class="category-link"> 전체 </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lecs.jsp?category=프로그래밍" class="category-link"> 프로그래밍 </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lecs.jsp?category=게임 개발" class="category-link"> 게임 개발 </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lecs.jsp?category=빅데이터/AI" class="category-link"> 빅데이터/AI </a>
			</div>
			<div class="category-div">
				<a href="../lectures/lecs.jsp?category=보안/네트워크" class="category-link"> 보안/네트워크 </a>
			</div>
			<div class="category-div">
				<a href="../post/posts.jsp" class="category-link">
					게시판 </a>
			</div>
			<div id="dropdownContent" class="dropdown-content">
				<div id="dropdown-category" class="dropdown-category">
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a href="../lectures/lecs.jsp?category=프론트엔드" id="dropdown-category-a" class="dropdown-category-a">프론트엔드</a> 
					<a href="../lectures/lecs.jsp?category=백엔드" id="dropdown-category-a" class="dropdown-category-a">백엔드</a>
					<a href="../lectures/lecs.jsp?category=앱 개발" id="dropdown-category-a" class="dropdown-category-a">앱 개발</a>
					<a href="../lectures/lecs.jsp?category=데이터베이스" id="dropdown-category-a" class="dropdown-category-a">데이터베이스</a>
					<a href="../lectures/lecs.jsp?category=개발 도구" id="dropdown-category-a" class="dropdown-category-a">개발 도구</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a href="../lectures/lecs.jsp?category=게임 프로그래밍" id="dropdown-category-a" class="dropdown-category-a">게임 프로그래밍</a>
					<a href="../lectures/lecs.jsp?category=게임 기획" id="dropdown-category-a" class="dropdown-category-a">게임 기획</a>
					<a href="../lectures/lecs.jsp?category=게임 그래픽" id="dropdown-category-a" class="dropdown-category-a">게임 그래픽</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a href="../lectures/lecs.jsp?category=데이터 분석" id="dropdown-category-a" class="dropdown-category-a">데이터 분석</a>
					<a href="../lectures/lecs.jsp?category=컴퓨터 비전" id="dropdown-category-a" class="dropdown-category-a">컴퓨터 비전</a>
					<a href="../lectures/lecs.jsp?category=자연어 처리" id="dropdown-category-a" class="dropdown-category-a">자연어 처리</a>
				</div>
				<div id="dropdown-category" class="dropdown-category">
					<a href="../lectures/lecs.jsp?category=보안" id="dropdown-category-a" class="dropdown-category-a">보안</a>
					<a href="../lectures/lecs.jsp?category=네트워크" id="dropdown-category-a" class="dropdown-category-a">네트워크</a>
					<a href="../lectures/lecs.jsp?category=시스템" id="dropdown-category-a" class="dropdown-category-a">시스템</a>
					<a href="../lectures/lecs.jsp?category=클라우드" id="dropdown-category-a" class="dropdown-category-a">클라우드</a>
				</div>
				<div id="dropdown-category" class="dropdown-category post-category">
					<a href="../post/posts.jsp?category=free" id="dropdown-category-a" class="dropdown-category-a">자유게시판</a>
					<a href="../post/posts.jsp?category=question" id="dropdown-category-a" class="dropdown-category-a">질문게시판</a>
				</div>
			</div>
		</div>
	</div>
</div>
</header>