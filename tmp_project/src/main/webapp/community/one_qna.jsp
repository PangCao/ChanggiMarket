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
	<section class="qna">
        <div>
            <img src="../resources/images/main01.jpg" alt="">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <div>
                        <img src="../resources/images/logo_green.png" alt="" style="width: 35%;">
                    </div>
                    <ul>
                        <a href="./faq.jsp"><li>자주하는 질문 <span>&gt;</span></li></a>
                        <a href="./one_qna.jsp"><li>1:1 문의<span>&gt;</span></li></a>
                    </ul>
                </div>
                <div class="col-9">
                    <div>
                        <h3>1:1 문의</h3>
                        <p><i class="fa-solid fa-house"></i>&nbsp;HOME > 커뮤니티 > 고객센터 > 1:1 문의</p>
                    </div>
                    <table class="table text-center">
                        <tr>
                            <th class="col-2">문의 날짜</th>
                            <th class="col-2">카테고리</th>
                            <th class="col-4">제목</th>
                            <th class="col-2">작성자</th>
                            <th class="col-2">문의상태</th>
                        </tr>
                        <tr>
                            <td>22/05/11</td>
                            <td>상품교환</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>처리중</td>
                        </tr>
                        <tr>
                            <td>22/05/11</td>
                            <td>상품교환</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>처리중</td>
                        </tr>
                        <tr>
                            <td>22/05/11</td>
                            <td>상품교환</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>처리중</td>
                        </tr>
                    </table>
                    <div>
                        <a href="./board_write.jsp" class="btn btn-secondary col-3" >글쓰기</a>
                    </div>
                    <div>
                        <p><b>&lt;</b> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <b>&gt;</b></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>