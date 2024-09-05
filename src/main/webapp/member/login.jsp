<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="../stylesheet/login.css">
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
<div id="login-background" class="login-background modal"></div>
		
	<div id="loginModal" class="login-modal modal">
		<div class="login-out">
			<div class="login-in">
				
				<form action="../Login.member" id="login-member" method="post" class="login-form">
				
					<span id="login-close" class="close" style="left:10">&times;</span>
					<h3>로그인</h3>
					
					<p style="height:60px"></p>
					
					<div class="login-id-div input-div">
						<input type="text" id="login-input-id" maxlength="20" name="id" class="input id" placeholder="아이디" onkeydown="loginOnEnter(event)">
			   		</div>
					<div class="login-passwd-div input-div" id="login-passwd-div">
						<input type="password" id="login-input-passwd" maxlength="20" name="passwd" class="input passwd" placeholder="비밀번호" onkeydown="loginOnEnter(event)">
			     	</div>
			     	
			     	<div style="height:80px">
			     		<p id="login-id-error" class="errorMessage" style="height:0px">아이디를 입력해주세요.</p>
			     		<p id="login-passwd-error" class="errorMessage" style="height:0px">비밀번호를 입력해주세요.</p>
			     	</div>
			     	
			     	<p style="display:flex; justify-content:space-around"> <input type="button" value="로그인" onclick="loginAttempt()" class="login-button">
				</form>		 
			</div>
		</div>
	</div>
</body>
</html>