<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/tmp_project/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/tmp_project/resources/css/style.css?ver=1.3">
<script src="https://kit.fontawesome.com/42c64699fb.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <section class="main">
        <div>
            <div>
                <input type="radio" name="slide" id="slide1" checked>
                <input type="radio" name="slide" id="slide2">
                <input type="radio" name="slide" id="slide3">
                <div>
                    <div>
                        <h3>Say thanks to the image author</h3>
                        <p>Crediting isn’t required, but linking back is greatly appreciated and<br>
                        allows image authors to gain exposure. You can use the following text</p>
                        <a href="#" class="btn btn-primary">button</a>
                    </div>
                    <div>
                        <label class="left" for="slide3"><i class="fa-solid fa-angle-left"></i></label>
                        <label class="right" for="slide2"><i class="fa-solid fa-angle-right"></i></label>
                    </div>
                </div>
                <div>
                    <div>
                        <h3>Say thanks to the image author</h3>
                        <p>Crediting isn’t required, but linking back is greatly appreciated and<br>
                        allows image authors to gain exposure. You can use the following text</p>
                        <a href="#" class="btn btn-primary">button</a>
                    </div>
                    <div>
                        <label class="left" for="slide1"><i class="fa-solid fa-angle-left"></i></label>
                        <label class="right" for="slide3"><i class="fa-solid fa-angle-right"></i></label>
                    </div>
                </div>
                <div>
                    <div>
                        <h3>Say thanks to the image author</h3>
                        <p>Crediting isn’t required, but linking back is greatly appreciated and<br>
                        allows image authors to gain exposure. You can use the following text</p>
                        <a href="#" class="btn btn-primary">button</a>
                    </div>
                    <div>
                        <label class="left" for="slide2"><i class="fa-solid fa-angle-left"></i></label>
                        <label class="right" for="slide1"><i class="fa-solid fa-angle-right"></i></label>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <section class="main2">
        <div class="container">
            <h2>Recommended Recipe</h2>
            <div>
                <input type="radio" name="slide2" id="sl1" checked>
                <div>
                    <label for="sl3" class="left"><i class="fa-solid fa-angle-left"></i></label>
                    <label for="sl2" class="right"><i class="fa-solid fa-angle-right"></i></label>
                </div>
                <input type="radio" name="slide2" id="sl2">
                <div>
                    <label for="sl1" class="left"><i class="fa-solid fa-angle-left"></i></label>
                    <label for="sl3" class="right"><i class="fa-solid fa-angle-right"></i></label>
                </div>
                <input type="radio" name="slide2" id="sl3">
                <div>
                    <label for="sl2" class="left"><i class="fa-solid fa-angle-left"></i></label>
                    <label for="sl1" class="right"><i class="fa-solid fa-angle-right"></i></label>
                </div>
                <div class="col-4 t">
                    <div>
                        <img src="resources/images/main04.jpg" alt="">
                    </div>
                    <div>
                        <div>
                        </div>
                    </div>
                    <div class="col-12">
                        <h4>Recipe</h4>
                        <p>Noto Sans KR is unmodulated</p>
                    </div>
                </div>
                <div class="col-4 t">
                    <div>
                        <img src="resources/images/main05.jpg" alt="">
                    </div>
                    <div>
                        <div>
                        </div>     
                    </div>
                    <div class="col-12">
                        <h4>Recipe</h4>
                        <p>Noto Sans KR is unmodulated</p>
                    </div>
                </div>
                <div class="col-4 t">
                    <div>
                        <img src="resources/images/main06.jpg" alt="">
                    </div>
                    <div>
                        <div>
                        </div> 
                    </div>
                    <div class="col-12">
                        <h4>Recipe</h4>
                        <p>Noto Sans KR is unmodulated</p>
                    </div>
                </div>
                <div class="col-4 t">
                    <div>
                        <img src="resources/images/main04.jpg" alt="">
                    </div>
                    <div>
                        <div>
                        </div>         
                    </div>
                    <div class="col-12">
                        <h4>Recipe</h4>
                        <p>Noto Sans KR is unmodulated</p>
                    </div>
                </div>
                <div class="col-4 t">
                    <div>
                        <img src="resources/images/main05.jpg" alt="">
                    </div>
                    <div>
                        <div>
                        </div>         
                    </div>
                    <div class="col-12">
                        <h4>Recipe</h4>
                        <p>Noto Sans KR is unmodulated</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>