<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.customer" %>
<!DOCTYPE html>
<html>
<head>
<%	
	String name = "";
	int point = 0;
	String c_class = "";
	float dis = 0;
	if (session.getAttribute("user") != null){
		customer cu = (customer)session.getAttribute("user");
		name = cu.getName();
		point = cu.getPoint();
		c_class = cu.getC_class();
	}
	if (c_class.equals("BRONZE")) {
		dis = 1.0f;
	}
	else if (c_class.equals("SILVER")) {
		dis = 3.0f;
	}
	else if (c_class.equals("GOLD")) {
		dis = 5.0f;
	}
%>
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
    <section class="mypage">
        <div>
            <div class="container">
                <h3>마이페이지</h3>
                <div>
                    <div>
                        <i class="fa-solid fa-user"></i>
                        <p>안녕하세요. <%=name %>님</p>
                        <p><%=c_class %> 등급 | <%=dis%>%적립</p>
                    </div>
                    <div>
                        <h5>적립금 &gt;</h5>
                        <h5 class="hh"><%=point %>원</h5>
                        <p>소멸 예정 : 0원</p>
                    </div>
                    <div>
                        <h5>쿠폰 &gt;</h5>
                        <h5 class="hh">0개</h5>
                    </div>
                    <div>
                        <h5>장바구니 &gt;</h5>
                        <h5 class="hh">0개</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-3">
	                <div>
	                    <img src="../resources/images/logo_green.png" width="35%">
                    </div>
                    <ul>
                        <a href="#"><li>주문 내역 <span>&gt;</span></li></a>
                        <a href="#"><li>찜한 상품<span>&gt;</span></li></a>
                        <a href="#"><li>배송지 관리<span>&gt;</span></li></a>
                        <a href="#"><li>상품 후기<span>&gt;</span></li></a>
                        <a href="#"><li>상품 문의<span>&gt;</span></li></a>
                        <a href="#"><li>적립금<span>&gt;</span></li></a>
                        <a href="#"><li>쿠폰<span>&gt;</span></li></a>
                        <a href="#"><li>개인정보 수정<span>&gt;</span></li></a>
                    </ul>
                </div>
                <div class="col-9">
                    <div>
                        <h5>주문내역 <small>지난 1년 간의 주문 내역 조회가 가능합니다.</small></h5>
                        <select name="" id="" class="col-3 form-control">
                            <option value="" selected>전체기간</option>
                            <option value="">1개월</option>
                            <option value="">3개월</option>
                            <option value="">6개월</option>
                        </select>
                    </div>
                    <hr>
                    <div>
                        <p>주문 내역이 없습니다.</p>
                    </div>
                    <hr>
                    <div>
                        <a href="../community/one_qna.jsp" class="btn btn-secondary">1:1 문의하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>