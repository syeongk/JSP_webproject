<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberList" %>
<%@ page import="dto.Member" %>

<html>
<head>
<link rel="stylesheet" href="../stylesheet/mypage.css">
<link rel="stylesheet" href="../stylesheet/styles.css">
<script src="../mypage.js"></script>
<meta charset="UTF-8">
<title>CodeOn - 마이페이지</title>
</head>
<body>

	<%
	
	if (session.getAttribute("id") == null){
		response.sendRedirect("../home/home.jsp");
	}
	
	String id = (String) session.getAttribute("id");


	String db_id = null;
	String db_passwd = null;
	String db_name = null;
	String db_phone = null;
	String db_email = null;

	MemberList memberlist = new MemberList();
	Member member = new Member();
	
	member = memberlist.getMember(id);
		
	db_id = member.getMemberId();
	db_passwd = member.getMemberPasswd();
	db_name = member.getMemberName();
	db_phone = member.getMemberPhone();
	db_email = member.getMemberEmail();

	%>

	<%@ include file="/../header/header.jsp"%>
	<div class="mypage-container container">
		<div class="my-infos-box">
			<div class="my-infos">

				<h2 class="mypage-title">회원정보</h2>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">ID</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-id-div">
							<input type="text" id="my-id-input" value="<%=db_id%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">이름</p>
					</div>

					<div class="my-info-in value">
						<div class="my-info-div" id="my-name-div">
							<input type="text" id="my-name-input" value="<%=db_name%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">연락처</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-phone-div">
							<input type="text" id="my-phone-input" value="<%=db_phone%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>

				<div class="my-info">
					<div class="my-info-in">
						<p class="my-p">이메일</p>
					</div>
					<div class="my-info-in value">
						<div class="my-info-div" id="my-email-div">
							<input type="text" id="my-email-input" value="<%=db_email%>"
								class="my-info-input" disabled>
						</div>
					</div>
				</div>
				<h3></h3>
				<div class="buttons-div">
					<a href="checkPasswd.jsp" class="change-info-button" style="width:100%">회원 정보 수정</a>
					<input type="button" class="remove-member-button" value="회원 탈퇴" onclick="removeMember()">
				</div>
				<h5></h5>
			</div>
		</div>
	</div>
	<%@ include file="/../footer/footer.jsp"%>
</body>
</html>