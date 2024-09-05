<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeOn - 장바구니</title>
<link rel="stylesheet" type="text/css"
	href="resourse/css/bootstrap.min.css">
<link rel="stylesheet" href="../stylesheet/cart.css">
</head>
<body>
	<%@ include file="../connection/connection.jsp"%>
	<%@ include file="../header/header.jsp"%>

	<div class="container">

		<%
		String user_id = (String) session.getAttribute("id");

		if (user_id == null) {
			out.println("<div class='alert alert-warning'>로그인이 필요합니다.</div>");
			return;
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM lecture WHERE lecId IN (SELECT lecId FROM Cart WHERE userId = ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			if (!rs.isBeforeFirst()) {
		%>	
		<div class="empty-cart-div">
			<p class="empty-cart-p">장바구니가 비어있습니다.</p>
		</div>
		<%
			} else {
		%>

		<div class="cart">
			<div class="cart-content">
				<div class="cart-title">
					<label class="mb-0">장바구니 목록</label>
				</div>
				<div class="card-body">

					<%
					int sum = 0;
					while (rs.next()) {
						String lecName = rs.getString("lecName");
						int lecPrice = rs.getInt("lecPrice");
						String image = rs.getString("image");
						int lecId = rs.getInt("lecId");

						sum += lecPrice;
					%>

					<div class="lec-row">
						<img src="../resource/upload/<%=image%>"
							class="img-thumbnail me-3" style="width: 120px; height: auto;"
							alt="..."> 
						<a href="../lectures/lec.jsp?lecId=<%=lecId%>" class="lec-name" ><%=lecName%></a>
						<span style="font-weight: bold; font-size: 17px; min-width:10%; max-width:10%; color:black"><%=lecPrice%>원</span>
						<a href="deleteCart.jsp?lecId=<%=lecId%>" style="min-width:35px; color:#d75f5f">삭제</a>
					</div>
					<%
					}
					%>
				</div>
			</div>
			<div class="cart-pay">
				<div class="pay-price">
					<p style="margin-left:10px; font-weight:bold">총 결제금액</p>
					<p style="margin-right:10px; font-weight:bold"><%=sum%>원</p>
				</div>
				<a href="payment.jsp?sum=<%=sum%>"><button type="button" class="pay-button">결제하기</button></a>
			</div>
		</div>

		<%
		}
		} catch (SQLException e) {
		out.println("<div class='alert alert-danger'>데이터 조회 실패: " + e.getMessage() + "</div>");
		} finally {
		if (rs != null)
		try {
			rs.close();
		} catch (SQLException ignore) {
		}
		if (pstmt != null)
		try {
			pstmt.close();
		} catch (SQLException ignore) {
		}
		if (conn != null)
		try {
			conn.close();
		} catch (SQLException ignore) {
		}
		}
		%>

	</div>
	<%@ include file="../footer/footer.jsp"%>
</body>
</html>
