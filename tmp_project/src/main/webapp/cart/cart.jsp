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
	<section class="cart">
        <div class="container">
            <h3>장바구니</h3>
            <form action="" method="post">
                <div>
                    <input type="button" value="전체 선택" class="btn btn-success">
                    <input type="button" value="선택 삭제" class="btn btn-danger">
                </div>
                <table class="table text-center">
                    <tr>
                        <th></th>
                        <th class="col-2"></th>
                        <th>상품명</th>
                        <th>상세선택</th>
                        <th>합계</th>
                        <th>배송방법</th>
                    </tr>
                    <tr>
                        <td class="align-middle"><input type="checkbox" checked></td>
                        <td class="align-middle"><img src="../resources/images/main06.jpg" alt="" class="col-12"></td>
                        <td class="align-middle">닭볶음탕</td>
                        <td class="align-middle">
                            <ul>
                                <li><input type="checkbox" id="a1" class="col-1" checked><label for="a1" class="col-4">감자</label><p class="col-4">1000원</p><input type="number" value="1" min="0" class="form-control col-2"></li>
                                <li><input type="checkbox" id="a2" class="col-1" checked><label for="a2" class="col-4">고구마</label><p class="col-4">1000원</p><input type="number" value="1" min="0" class="form-control col-2"></li>
                                <li><input type="checkbox" id="a3" class="col-1" checked><label for="a3" class="col-4">닭</label><p class="col-4">1000원</p><input type="number" value="1" min="0" class="form-control col-2"></li>
                                <li><input type="checkbox" id="a4" class="col-1" checked><label for="a4" class="col-4">양배추</label><p class="col-4">1000원</p><input type="number" value="1" min="0" class="form-control col-2"></li>
                            </ul>
                        </td>
                        <td class="align-middle">4000원</td>
                        <td class="align-middle"><a href="" class="btn btn-danger">배송방법</a></td>
                    </tr>
                </table>
                <div>
                    <div class="col-5">
                        <p class="col-12"><i class="fa-solid fa-location-dot"></i> 배송지</p>
                        <hr>
                        <p class="col-12">경남 창원시 의창구 팔용동 91-8</p>
                        <div class="col-12">
                            <p>상품금액 <span>4000원</span></p>
                            <p>상품할인금액 <span>0원</span></p>
                            <p>배송비 <span>3000원</span></p>
                            <hr>
                            <p>결제 예정 금액 <span>7000원</span></p>
                        </div>
                        <input type="button" class="btn btn-secondary col-12" value="주문 하기" >
                    </div>
                </div>
            </form>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>