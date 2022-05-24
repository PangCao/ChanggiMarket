<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Boardlist"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.2">
<script src="https://kit.fontawesome.com/42c64699fb.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<%
	ArrayList<Boardlist> al = (ArrayList<Boardlist>)request.getAttribute("notice");
	int cupage = 1;
	if (request.getParameter("page") != null) {
		cupage = Integer.valueOf(request.getParameter("page"));
	}
	int min = (cupage-1)*10;
	int max = cupage*10;
	int totalpage = 0;
	if (request.getAttribute("totalpage") != null){
		totalpage = (Integer)request.getAttribute("totalpage");
	}
	if (max > totalpage) {
		max = totalpage;
	}
	if (cupage == 1) {
%>
	<style type="text/css">
		body > .notice > div:nth-of-type(2) > div:nth-of-type(3) > p > a.pagenum:nth-of-type(<%=cupage%>){
    		color: red;
		}
	</style>
<%
	}
	else {
%>
	<style type="text/css">
		body > .notice > div:nth-of-type(2) > div:nth-of-type(3) > p > a.pagenum:nth-of-type(<%=cupage+1%>){
    		color: red;
		}
	</style>
<%
	}
%>


<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="notice">
        <div>
            <img src="../resources/images/main01.jpg" alt="">
        </div>
        <div class="container">
            <div>
                <h3>공지사항</h3>
                <p><i class="fa-solid fa-house"></i>&nbsp;HOME > 커뮤니티 > 공지사항</p>
            </div>
            <table class="table text-center">
                <tr>
                    <th class="col-1">번호</th>
                    <th class="col-5">제목</th>
                    <th class="col-2">작성자</th>
                    <th class="col-2">작성일</th>
                    <th class="col-2">조회수</th>
                </tr>
                <%
                	for (int i = min; i < max; i++) {
                		Boardlist bl = al.get(i);
                %>
                	<tr>
                		<td><%=bl.getId()%></td>
                		<td><a href="notice_view.bo?id=<%=bl.getId()%>"><%=bl.getTitle() %></a></td>
                		<td><%=bl.getWriter()%></td>
                		<td><%=bl.getDate()%></td>
                		<td><%=bl.getHit()%></td>
                	</tr>
                <%
                	}
                %>
            </table>
            <div>
                <a href="./board_write.jsp?category=notice" class="btn btn-secondary col-2">글쓰기</a>
                <form action="" method="post" class="col-4">
                    <input type="text" placeholder="검색어를 입력해주세요." class="form-control">
                    <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>
            </div>
            <div class="col-12">
                <%
            		if (cupage == 1){
            	%>
                <p><b>&lt;</b>
                <%
            		}
            		else {
           		%>
   		                 <p><a href="notice.bo?page=<%=cupage-1%>"><b>&lt;</b></a>
           		
           		<%
            			}
                	int pagenum = (totalpage/10)+1;
                	for (int a = 0; a < pagenum; a++) {
                %>
                 	<a href="notice.bo?page=<%=a+1%>" class="pagenum"><%=a+1%></a>
               	<%
                	}
                	if (pagenum == cupage) { 
               	%>
               		<b>&gt;</b></p>
               	<%
                	}
                	else {
               	%>
                <a href="notice.bo?page=<%=cupage+1%>" class="pagenum"><b>&gt;</b></a></p>
                <%
                	}
                %>
            	</div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>