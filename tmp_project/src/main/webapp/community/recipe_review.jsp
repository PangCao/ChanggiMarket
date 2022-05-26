<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Boardlist" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.3">
<script src="https://kit.fontawesome.com/42c64699fb.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<%
	ArrayList<Boardlist> al = (ArrayList<Boardlist>)request.getAttribute("review_list");
	String cupage = request.getParameter("page");
%>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="re_review">
        <div>
            <img src="../resources/images/main02.jpg" alt="">
        </div>
        <div class="container">
            <h5><small>MAKE IT</small></h5>
            <h3>Recipe</h3>
            <div class="row">
                <div class="col-6">
                    <h4>컬리에서 구매한 신선한 재료로 만든 나만의 레시피를 공유해보세요.</h4>
                    <h5>레시피를 자랑하고 사은품도 받아가세요!</h5>
                </div>
                <div class="col-6">
                    <img src="../resources/images/main01.jpg" alt="">
                </div>
            </div>
            <div>
                <input type="text" class="form-control col-4" placeholder="검색어를 입력해주세요.">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <div class="row">
            <%
            	for(int i = 0; i < al.size(); i++) {
            		Boardlist bl = al.get(i);
            %>
                <div class="col-3">
                    <div>
                        <a href="review_view.bo?id=<%=bl.getId()%>&page=<%=cupage%>&category=나만의 레시피"><img src="../resources/images/<%=bl.getImg()[0] %>" alt="" class="col-12"></a>
                        <div>
                            <a href="#"><i class="fa-solid fa-heart"></i><span> LIKE <%=bl.getLike() %></span></a>
                        </div>
                    </div>
                    <a href="review_view.bo?id=<%=bl.getId()%>&page=<%=cupage%>&category=나만의 레시피">
                        <h5><%= bl.getTitle() %></h5>
                        <p>작성자 : <%=bl.getWriter() %></p>
                    </a>
                </div>
            <%
            	}
            %>
            </div>
            <div>
                <a href="./board_write.jsp?category=나만의 레시피" class="btn btn-secondary col-2">글쓰기</a>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>