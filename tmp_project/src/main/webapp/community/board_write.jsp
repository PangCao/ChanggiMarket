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
<%
	String id = (String)session.getAttribute("userid");
%>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="bo_write">
        <div class="container">
            <h5><small>NOTICE</small></h5>
            <h3>공지사항</h3>
            <p>* 필수 입력 사항</p>
            <hr>
            <form action="" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <label class="col-2">작성자 <span>*</span></label>
                    <div class="col-10">
                        <input type="text" name="" id="" value="<%= id %>" class="form-control" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-2">제목 <span>*</span></label>
                    <div class="col-10">
                        <input type="text" name="" id="" class="form-control" placeholder="제목을 입력해주세요.">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-2">내용 <span>*</span></label>
                    <div class="col-10">
                        <textarea name="" id="" cols="30" rows="10" class="form-control" placeholder="내용을 입력해주세요." style="resize: none;"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-2">첨부파일</label>
                    <div class="col-10">
                        <input type="file" name="" id="" class="form-control col-6">
                        <p class="col-6">10MB 이하의 이미지만 등록 가능합니다.</p>
                    </div>
                </div>
                <hr>
                <div>
                    <input type="submit" name="" id="" value="작성완료" class="btn btn-secondary col-2">
                    <a href="#" class="btn btn-danger col-2">취소</a>
                </div>
            </form>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>