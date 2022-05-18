<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.1">
<script src="https://kit.fontawesome.com/42c64699fb.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
 	<section class="login">
        <div class="container">
            <div class="col-6">
                <h3>LOGIN</h3>
                <form action="login.lo" class="form-horizatal" method="post">
                    <div class="form-group">
                        <input name="id" type="text" placeholder="아이디 (920907v)" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input name="pw" type="password" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~14자리)"  class="form-control" required maxlength="14">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="로그인" class="form-control">
                    </div>
                    <div class="form-group">
                        <a href="sel_login.jsp" class="form-control">회원가입</a>
                    </div>
                </form>
                <div>
                    <a href="#">이메일 아이디 찾기</a> | <a href="#">패스워드 찾기</a>
                </div>
                <div>
                    <span>SNS 간편 로그인</span>
                </div>
                <div>
                    <a href="" class="form-control">네이버 아이디로 로그인</a>
                    <a href="" class="form-control">카카오 아이디로 로그인</a>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>