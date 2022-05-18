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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="bo_view">
        <div class="container">
            <h5><small>NOTICE</small></h5>
            <h3>공지사항</h3>
            <hr>
            <h3>공지사항 테스트</h3>
            <hr>
            <div>
                <div class="row">
                    <p><i class="fa-solid fa-pen"></i>&nbsp;핑풍퐁</p>
                    <p><i class="fa-solid fa-comment"></i>&nbsp; 0</p>
                </div>
                <div>
                    <p>2022-05-10</p>
                </div>
            </div>
            <div>
                 <img src="img/project-1.jpg" alt="" class="col-6">
            </div>
            <p>notice view test text notice view test textnotice view test textnotice view test textnotice view test text</p>
            <hr>
            <p><i class="fa-solid fa-comment"></i>&nbsp; 0</p>
            <div>
                <p>로그인한 회원만 댓글 등록이 가능합니다.</p>
            </div>
            <div>
                <a href="#" class="btn btn-secondary col-2">다음글</a>
                <a href="#" class="btn btn-success col-2">목록</a>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>