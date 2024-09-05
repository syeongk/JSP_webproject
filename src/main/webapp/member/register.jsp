<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="../stylesheet/register.css">
	<title>회원가입</title>
</head> 

<body>
	<div id="regi-background" class="regi-background modal"></div>
		
	<div id="registerModal" class="register-modal modal">
		<div class="regi-out">
			<div class="regi-in">
				
			<form action="../Register.member" id="regi-member" method="post" class="regi-form">
<!-- 				<form action="../register/register_process.jsp" id="regi-member" method="post" class="regi-form"> -->
				
					<span id="registerClose" class="close" style="left:10">&times;</span>
					<h3>회원가입</h3>
					<div class="id-div input-div">
						<input type="text" id="regi-input-id" maxlength="12" name="id" class="input id" placeholder="아이디" onkeydown="registerOnEnter(event)">
					</div>
					<div id="regi_passwd-div" class="passwd-div input-div">
						<input type="password" id="regi_input_passwd" maxlength="40" name="passwd" class="input passwd" placeholder="비밀번호" onkeydown="registerOnEnter(event)">
					</div>
					
					<div id="regi-error1" style="height:50px; margin:0px">
						<p id="id-error" class="errorMessage">ID : 5~20자의 영문 소문자, 숫자만 사용 가능</p>
						<p id="passwd-error" class="errorMessage">비밀번호 : 최소 8자 이상, 영문자 및 숫자 포함</p>
					</div>
					
					<div class="name-div input-div">
						<input type="text" id="regi_input_name" maxlength="7" name="name" class="input regi_name" placeholder="이름" onkeydown="registerOnEnter(event)">
					</div>
					<div class="phone-div input-div">
						<input type="text" id="regi_input_phone" maxlength="11" name="phone" class="input phone" placeholder="전화번호" onkeydown="registerOnEnter(event)">
					</div>
					<div id="regi_email-div" class="email-div input-div">
						<input type="text" id="regi_input_email" maxlength="40" name="email" class="input email" placeholder="이메일" onkeydown="registerOnEnter(event)">
					</div>
					
					<div id="regi-error2" style="height:70px; margin:0px">
						<p id="name-error" class="errorMessage">이름 : 한글만 사용 가능</p>
						<p id="phone-error" class="errorMessage">연락처 입력을 확인해 주세요</p>
						<p id="email-error" class="errorMessage">이메일 입력을 확인해 주세요</p>
					</div>			
			
					<input type="button" value="가입하기" style="margin-top:12px" onclick="checkMember()" class="register_button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>