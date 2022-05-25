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
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("userid");
	String category = request.getParameter("category");
	String sub_title = "";
	if (category.equals("공지사항")) {
		sub_title = "NOTICE";
	}
	else if (category.equals("게시판")) {
		sub_title = "BULLETIN";
	}
%>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="bo_write">
        <div class="container">
            <h5><small><%=sub_title %></small></h5>
            <h3><%=category%></h3>
            <p>* 필수 입력 사항</p>
            <hr>
            <form action="" method="post" enctype="multipart/form-data" name="boardForm">
                <div class="form-group row">
                    <label class="col-2">작성자 <span>*</span></label>
                    <div class="col-10">
                        <input type="text" name="id" id="id" value="<%= id %>" class="form-control" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-2">제목 <span>*</span></label>
                    <div class="col-10">
                        <input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요.">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-2">내용 <span>*</span></label>
                    <div class="col-10">
                        <textarea name="contents" id="contents" cols="30" rows="10" class="form-control" placeholder="내용을 입력해주세요." style="resize: none;"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-2">첨부파일&nbsp;<input type="button" id="filepulsbnt" value="+" class="btn btn-success ml-3" onclick="fileplus()"></label>
                    <div class="col-10 row">
                        <input type="hidden" name="file1" id="file1" class="form-control col-6 mb-2" onchange="filecnt1()"> <input type="hidden" id="filechk1" value="X" class="btn btn-danger ml-3 mb-2" disabled onclick="filecan1()">
                        <input type="hidden" name="file2" id="file2" class="form-control col-6 mb-2" onchange="filecnt2()"><input type="hidden" id="filechk2" value="X" class="btn btn-danger ml-3 mb-2" disabled onclick="filecan2()">
                        <input type="hidden" name="file3" id="file3" class="form-control col-6 mb-2" onchange="filecnt3()"><input type="hidden" id="filechk3" value="X" class="btn btn-danger ml-3 mb-2" disabled onclick="filecan3()">
                        <input type="hidden" name="file4" id="file4" class="form-control col-6 mb-2" onchange="filecnt4()"><input type="hidden" id="filechk4" value="X" class="btn btn-danger ml-3 mb-2" disabled onclick="filecan4()">
                        <input type="hidden" name="file5" id="file5" class="form-control col-6 mb-2" onchange="filecnt5()"><input type="hidden" id="filechk5" value="X" class="btn btn-danger ml-3 mb-2" disabled onclick="filecan5()">
                        <p class="col-12">10MB 이하의 이미지만 등록 가능합니다.(최대 5개)</p>
                        <div id="preview"></div>
                    </div>
                </div>
                <hr>
                <div>
                    <input type="button" value="작성완료" class="btn btn-secondary col-2" onclick="subwrite()">
                    <a href="#" class="btn btn-danger col-2">취소</a>
                </div>
            </form>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
<%
	if(id == null){
%>
<script type="text/javascript">
	function subwrite() {
		alert("로그인을 하신 후 이용해주세요");
		location.href="../login/login.jsp";
	}
</script>
<%
	}
	else if (category.equals("공지사항")){
%>
<script type="text/javascript">
	function subwrite() {
		document.boardForm.action = "notice_write.bo";
		document.boardForm.submit();
	}
</script>
<%
	}
	else if (category.equals("게시판")){
%>
<script type="text/javascript">
	function subwrite() {
		document.boardForm.action = "bulletin_write.bo";
		document.boardForm.submit();
	}
</script>
<%
	}
%>
<script type="text/javascript">
	function fileplus() {
		document.getElementById('file1').setAttribute("type","file");
		document.getElementById('filechk1').setAttribute("type","button");
		document.getElementById('filechk1').disabled = false;
	}
	function filecnt1() {
		if (document.getElementById('file1').value != ""){
			document.getElementById('file2').setAttribute("type","file");
			document.getElementById('filechk2').setAttribute("type","button");
			document.getElementById('filechk1').disabled = false;
		}
	}
	function filecan1() {
		document.getElementById('file1').value = "";
		document.getElementById('file1').setAttribute("type","hidden");
		document.getElementById('filechk1').setAttribute("type","hidden");
		document.getElementById('filechk1').disabled = true;
	}
	
	function filecnt2() {
		if (document.getElementById('file2').value != ""){
			document.getElementById('file3').setAttribute("type","file");
			document.getElementById('filechk3').setAttribute("type","button");
			document.getElementById('filechk2').disabled = false;
		}
	}
	function filecan2() {
		document.getElementById('file2').value = "";
		document.getElementById('file2').setAttribute("type","hidden");
		document.getElementById('filechk2').setAttribute("type","hidden");
		document.getElementById('filechk2').disabled = true;
	}
	
	function filecnt3() {
		if (document.getElementById('file3').value != ""){
			document.getElementById('file4').setAttribute("type","file");
			document.getElementById('filechk4').setAttribute("type","button");
			document.getElementById('filechk3').disabled = false;
		}
	}
	function filecan3() {
		document.getElementById('file3').value = "";
		document.getElementById('file3').setAttribute("type","hidden");
		document.getElementById('filechk3').setAttribute("type","hidden");
		document.getElementById('filechk3').disabled = true;
	}
	
	function filecnt4() {
		if (document.getElementById('file4').value != ""){
			document.getElementById('file5').setAttribute("type","file");
			document.getElementById('filechk5').setAttribute("type","button");
			document.getElementById('filechk4').disabled = false;
		}
	}
	function filecan4() {
		document.getElementById('file4').value = "";
		document.getElementById('file4').setAttribute("type","hidden");
		document.getElementById('filechk4').setAttribute("type","hidden");
		document.getElementById('filechk4').disabled = true;
	}
	function filecnt5() {
		if (document.getElementById('file4').value != ""){
			document.getElementById('filechk5').disabled = false;
		}
	}
	function filecan5() {
		document.getElementById('file5').value = "";
		document.getElementById('file5').setAttribute("type","hidden");
		document.getElementById('filechk5').setAttribute("type","hidden");
		document.getElementById('filechk5').disabled = false;

	}
</script>
</html>