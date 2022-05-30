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
                    <img src="" alt="" style="border: 1px solid black; width: 100%; height: 500px;" id="preview">
                    <input type="file" class="form-control mt-3" onchange="addimg(this)">
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
                    <table class="table col-12" id="filed">
                        <tr class="row text-center">
                            <th class="col-3">상품명</th>
                            <th class="col-3">갯수</th>
                            <th class="col-3">상품가격</th>
                            <th class="col-3"></th>
                        </tr>
                        <tr class="row text-center" id="pre_set" style="display: none;">
                            <td class="f_name">
                            	<input type="hidden" class="f_name_in">
                            </td>
                            <td class="f_unit">
                            	<input type="number" value="1" min="0" name="f_unit">
                            	<input type="hidden" class="f_unit_in" value="1">
                            </td>
                            <td class="f_price">
                            	<input type="hidden" class="f_price_in">
                            </td>
                            <input type="hidden" name="f_name_in">
                            <td class="f_del"><input type="button" class="btn btn-danger" id="f_delete" value="삭제" onclick="remove_input(this)"></td>
                        </tr>
                    </table>
                    <div class="row">
                        <p class="col-6 text-center"><b>합계</b></p>
                        <p class="col-6 text-right"><b>7000원</b></p>
                    </div>
                    <div class="row d-flex align-items-center form-group justify-content-end">
                        <input type="text" class="col-6 form-control" id="foodsearch">
                        <input type="button" class="btn btn-success ml-2 col-2" value="검색" onclick="food_search()">
                    </div>
                </div>
                <div class="col-12 mt-3">
                    <p><i class="fa-solid fa-book-open"></i>&nbsp;&nbsp;레시피 설명</p>
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
<script type="text/javascript">
	var reader = new FileReader();
	function addimg(input) {
		if (input.files && input.files[0]) {
		   	
		    reader.onload = function(e) {
		    	document.getElementById('preview').src = e.target.result;
		    };
		    	reader.readAsDataURL(input.files[0]);
		  	} else {
			document.getElementById('preview').src = "";
		}
	}
	function food_search() {
		var popupwidth = 800;
		var popupheight = 500;
		var popx = (window.screen.width / 2) - (popupwidth / 2);
		var popy = (window.screen.height / 2) - (popupheight / 2);
		window.open("foodsearch.re?search="+document.getElementById('foodsearch').value ,"searchPop","status=no, width="+popupwidth+", height="+popupheight+",left="+popx+",top="+popy);
	}
	function remove_input(obj) {
		document.getElementById('filed').removeChild(obj.parentNode);
	}
</script>
</html>