<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.4">
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
    <section class="recipe_add">
        <div class="container">
            <h3>레시피 등록</h3>
            <hr>
            <form action="" class="row" method="post" enctype="multipart/form-data">
                <div class="col-6">
                    <img src="" alt="" style="border: 1px solid black; width: 100%; height: 500px;">
                    <input type="file" class="form-control mt-3">
                </div>
                <div class="col-6">
                    <div class="row d-flex align-items-center form-group">
                        <label class="col-4">레시피 이름</label>
                        <input type="text" class="col-8 form-control">
                    </div>
                    <div class="row d-flex align-items-center form-group">
                        <label class="col-4">레시피 한줄 설명</label>
                        <input type="text" class="col-8 form-control">
                    </div>
                    <table class="table col-12">
                        <tr class="row text-center">
                            <th class="col-4">상품명</th>
                            <th class="col-4">갯수</th>
                            <th class="col-4">상품가격</th>
                        </tr>
                    </table>
                    <div class="row">
                        <p class="col-6 text-center"><b>합계</b></p>
                        <p class="col-6 text-right"><b>7000원</b></p>
                    </div>
                    <div class="row d-flex align-items-center form-group">
                        <input type="text" class="col-8 form-control mr-3">
                        <input type="button" class="btn btn-success ml-4 col-3" value="검색">
                    </div>
                </div>
                <div class="col-12 mt-3">
                    <p>&gt;&gt;&gt;&gt;레시피 설명</p>
                    <textarea name="" id="" rows="20" class="col-12 form-control" style="resize: none;" placeholder="나만의 레시피를 등록해주세요."></textarea>
                </div>
                <div class="col-12 d-flex justify-content-end mt-3">
                    <input type="submit" value="등록" class="btn btn-success col-2">
                </div>
            </form>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>