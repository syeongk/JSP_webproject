<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="../stylesheet/styles.css">
<link rel="stylesheet" href="../stylesheet/checkPasswd.css">
<meta charset="UTF-8">
<title>CodeOn - 마이페이지</title>
</head>
<body>
	<script type="text/javascript">
	window.addEventListener('load', function() {
		document.getElementById("checkPasswd").focus();
	});
	</script>
	<%
		if (session.getAttribute("id") == null){
			response.sendRedirect("../home/home.jsp");
		}
	%>


	<%@ include file="/../header/header.jsp"%>
	<div class="container mypage-container">
		<div class="my-infos-box">
			<form action="../checkPasswd.member" method="POST" class="my-infos">

				<h2 class="mypage-title">회원정보</h2>

				<div class="my-info" style="width:250px">
					<div class="check-passwd-in">
						<div class="check-passwd-div">
							<input type="password" name="passwd" id="checkPasswd" class="check-passwd-input"
								placeholder="비밀번호">
						</div>
					</div>
				</div>
				
				<input type="submit" class="check-passwd-button" style="width:250px" value="확인">
			</form>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>