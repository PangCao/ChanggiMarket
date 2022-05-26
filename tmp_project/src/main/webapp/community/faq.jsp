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
	<section class="faq">
        <div>
            <img src="../resources/images/main02.jpg" alt="">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <div>
                        <img src="../resources/images/logo_green.png" alt="" style="width: 35%;">
                    </div>
                    <ul>
                        <a href="./faq.jsp"><li>자주하는 질문 <span>&gt;</span></li></a>
                        <a href="./one_qna.bo?page=1"><li>1:1 문의<span>&gt;</span></li></a>
                    </ul>
                </div>
                <div class="col-9">
	                <div>
		                <h3>자주하는 질문</h3>
		                <p><i class="fa-solid fa-house"></i>&nbsp;HOME > 커뮤니티 > 고객센터 > 자주하는 질문</p>
		            </div>
                    <div>
                        <label for="faq1" class="col-12">
                            <div>
                                <p><i class="fa-solid fa-q"></i>&nbsp;자주하는 질문입니다.</p>
                                <i class="fa-solid fa-angle-down"></i>
                            </div>
                        </label>
                        <input type="checkbox" id="faq1">
                        <div class="col-12">
                            <p><i class="fa-solid fa-a"></i>&nbsp;자주하는 질문의 답입니다.</p>
                        </div>
                    </div>
                    <div>
                        <label for="faq2" class="col-12">
                            <div>
                                <p><i class="fa-solid fa-q"></i>&nbsp;자주하는 질문입니다.</p>
                                <i class="fa-solid fa-angle-down"></i>
                            </div>
                        </label>
                        <input type="checkbox" id="faq2">
                        <div class="col-12">
                            <p><i class="fa-solid fa-a"></i>&nbsp;자주하는 질문의 답입니다.</p>
                        </div>
                    </div>
                    <div>
                        <label for="faq3" class="col-12">
                            <div>
                                <p><i class="fa-solid fa-q"></i>&nbsp;자주하는 질문입니다.</p>
                                <i class="fa-solid fa-angle-down"></i>
                            </div>
                        </label>
                        <input type="checkbox" id="faq3">
                        <div class="col-12">
                            <p><i class="fa-solid fa-a"></i>&nbsp;자주하는 질문의 답입니다.</p>
                        </div>
                    </div>
                    <div>
                        <label for="faq4" class="col-12">
                            <div>
                                <p><i class="fa-solid fa-q"></i>&nbsp;자주하는 질문입니다.</p>
                                <i class="fa-solid fa-angle-down"></i>
                            </div>
                        </label>
                        <input type="checkbox" id="faq4">
                        <div class="col-12">
                            <p><i class="fa-solid fa-a"></i>&nbsp;자주하는 질문의 답입니다.</p>
                        </div>
                    </div>
                    <div>
                        <label for="faq5" class="col-12">
                            <div>
                                <p><i class="fa-solid fa-q"></i>&nbsp;자주하는 질문입니다.</p>
                                <i class="fa-solid fa-angle-down"></i>
                            </div>
                        </label>
                        <input type="checkbox" id="faq5">
                        <div class="col-12">
                            <p><i class="fa-solid fa-a"></i>&nbsp;자주하는 질문의 답입니다.</p>
                        </div>
                    </div>
                    <div>
                        <label for="faq6" class="col-12">
                            <div>
                                <p><i class="fa-solid fa-q"></i>&nbsp;자주하는 질문입니다.</p>
                                <i class="fa-solid fa-angle-down"></i>
                            </div>
                        </label>
                        <input type="checkbox" id="faq6">
                        <div class="col-12">
                            <p><i class="fa-solid fa-a"></i>&nbsp;자주하는 질문의 답입니다.</p>
                        </div>
                    </div>
                    <div>
                        <form action="" method="post" class="col-5">
                            <input type="text" placeholder="검색어를 입력해주세요." class="form-control">
                            <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
                        </form>
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