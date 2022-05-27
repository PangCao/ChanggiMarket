<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.5">
<script src="https://kit.fontawesome.com/42c64699fb.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="a_product">
        <div class="container">
            <div class="row">
                <h3>상품 관리</h3>
                <p><i class="fa-solid fa-house"></i>&nbsp;HOME > 상품관리</p>
            </div>
            <div>
                <form action="" method="post" class="col-4">
                    <input type="text" placeholder="찾으실 상품을 입력해주세요" class="form-control">
                    <a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>
            </div>
            <form action="" method="post">
                <table class="table text-center">
                    <tr>
                        <th class="col-1">품번</th>
                        <th class="col-6">
                            <div class="row">
                                <select class="col-3 ml-2 form-control">
                                    <option value="" disabled selected style="display: none;">대분류</option>
                                    <option value="신선" >신선</option>
                                    <option value="가공" >가공</option>
                                    <option value="주류" >주류</option>
                                </select>
                                <select class="col-4 ml-2 mr-2 form-control">
                                    <option value="" disabled selected style="display: none;">중분류</option>
                                    <option value="양파" >양파</option>
                                    <option value="감자" >감자</option>
                                    <option value="양배추" >양배추</option>
                                </select>
                                <select class="col-4 form-control">
                                    <option value="" disabled selected style="display: none;">소분류</option>
                                    <option value="양파" >양파</option>
                                    <option value="감자" >감자</option>
                                    <option value="양배추" >양배추</option>
                                </select>
                            </div>
                        </th>
                        <th class="col-2">
                            <div class="row">
                                <input type="text" class="col-10 ml-1 form-control" placeholder="가격 입력">
                            </div>
                        </th>
                        <th class="col-2">
                            <div class="row">
                                <input type="text" class="col-10 form-control" placeholder="수량 입력">
                            </div>
                        </th>
                        <th class="col-1">
                            <input type="button" name="" id="" value="추가" class="btn btn-success">
                        </th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td class="row">
                            <span class="col-5">010101</span>
                            <span class="col-5">양파</span>
                        </td>
                        <td>4500원</td>
                        <td>300pcs</td>
                        <td>
                            <input type="button" value="삭제" class="btn btn-danger">
                        </td>
                    </tr><tr>
                        <td>1</td>
                        <td class="row">
                            <span class="col-5">010101</span>
                            <span class="col-5">양파</span>
                        </td>
                        <td>4500원</td>
                        <td>300pcs</td>
                        <td>
                            <input type="button" value="삭제" class="btn btn-danger">
                        </td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td class="row">
                            <span class="col-5">010101</span>
                            <span class="col-5">양파</span>
                        </td>
                        <td>4500원</td>
                        <td>300pcs</td>
                        <td>
                            <input type="button" value="삭제" class="btn btn-danger">
                        </td>
                    </tr>
                </table>
                <div class="col-12">
                    <input type="submit" value="등록" class="btn btn-secondary col-2">
                </div>
            </form>
            <div>
                <p><b>&lt;</b> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <b>&gt;</b></p>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>