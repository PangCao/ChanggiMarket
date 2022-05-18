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
	<section class="notice">
        <div>
            <img src="../resources/images/main01.jpg" alt="">
        </div>
        <div class="container">
            <div>
                <h3>공지사항</h3>
                <p><i class="fa-solid fa-house"></i>&nbsp;HOME > 커뮤니티 > 공지사항</p>
            </div>
            <table class="table text-center">
                <tr>
                    <th class="col-1">번호</th>
                    <th class="col-5">제목</th>
                    <th class="col-2">작성자</th>
                    <th class="col-2">작성일</th>
                    <th class="col-2">조회수</th>
                </tr>
                <tr>
                    <td>5</td>
                    <td><a href="notice_view.jsp">제목</a></td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><a href="notice_view.jsp">제목</a></td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><a href="notice_view.jsp">제목</a></td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><a href="notice_view.jsp">제목</a></td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="notice_view.jsp">제목</a></td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                </tr>
            </table>
            <div>
                <a href="./board_write.jsp" class="btn btn-secondary col-2">글쓰기</a>
                <form action="" method="post" class="col-4">
                    <input type="text" placeholder="검색어를 입력해주세요." class="form-control">
                    <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>
            </div>
            <div>
                <p><b>&lt;</b> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <b>&gt;</b></p>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>