<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5 ">
    <div class="row justify-content-center">
        <div class="col-md-6 ">
            <h4 class="text-center mb-4">로그인</h4>
            <form name="loginForm" action="j_security_check" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">아이디</label>
                    <input type="text" class="form-control" name="j_username" required>
                </div>
                <div class="mb-3">
                    <label for="passwd" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="j_password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">전송</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
