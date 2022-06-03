<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Boardlist" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.23">
<script src="https://kit.fontawesome.com/42c64699fb.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Boardlist bl = (Boardlist)request.getAttribute("viewInfo");
	String userid = (String)session.getAttribute("userid");
	String writer = bl.getWriter();
 	int cupage = Integer.valueOf(request.getParameter("page"));
 	int id = Integer.valueOf(request.getParameter("id"));
 	int next = id - 1;
 	int totalpage = (Integer)request.getAttribute("totalpage");
 	String category = request.getParameter("category");
 	String sub_title = "";
	if (category.equals("notice")) {
		category = "공지사항";
	}
	else if (category.equals("bulletin")) {
		category = "게시판";
	}
	if (category.equals("공지사항")) {
		sub_title = "NOTICE";
	}
	else if (category.equals("게시판")) {
		sub_title = "BULLETIN";
	}
	else if (category.equals("1:1 문의")) {
		sub_title = "고객센터";
	}
%>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="bo_view">
        <div class="container">
            <h5><small><%=sub_title %></small></h5>
            <h3><%=category %></h3>
            <hr>
            <h3><%=bl.getTitle() %></h3>
            <hr>
            <div>
                <div class="row">
                    <p><i class="fa-solid fa-pen"></i>&nbsp;<%=bl.getWriter() %></p>
                    <p><i class="fa-solid fa-eye"></i>&nbsp; <%=bl.getHit() %></p>
                </div>
                <div>
                    <p><%=bl.getDate() %></p>
                </div>
            </div>
            <p style="white-space: normal;">
            <%	if (!category.equals("1:1 문의")){
	            	for (int i = 0; i < bl.getImg().length; i++){
	            		if (!(bl.getImg()[i].equals("")) && bl.getImg()[i] != null){
            %>
            	<img alt="" src="../resources/images/<%=bl.getImg()[i]%>" style="width:300px; height: 300px;">
            <%
	            		}
	            	}
	            }
			%>
            <%=bl.getContent() %></p>
            <hr>
            <p><i class="fa-solid fa-comment"></i>&nbsp; 0</p>
            <div>
                <p>로그인한 회원만 댓글 등록이 가능합니다.</p>
            </div>
            <div>
            	<%
            		if (next == 0) {
            	%>
                <a class="btn btn-secondary col-2" onclick="nonext()">다음글</a>
                <%
            		}
            		else{
            			if (category.equals("공지사항")){
                %>
                <a href="notice_view.bo?id=<%=next%>&page=<%=cupage%>&category=<%=category %>" class="btn btn-secondary col-2">다음글</a>
                <%
            			}
            			else if (category.equals("게시판")){
            	%>
            	<a href="bulletin_view.bo?id=<%=next%>&page=<%=cupage%>&category=<%=category %>" class="btn btn-secondary col-2">다음글</a>
            	<%
            			}
            			else if (category.equals("1:1 문의")){
            				
            	%>
            	<a href="one_view.bo?id=<%=next%>&page=<%=cupage%>&category=<%=category %>" class="btn btn-secondary col-2">다음글</a>
            	<%
            			}
            			else {
        		%>
   				<a href="review_view.bo?id=<%=next%>&page=<%=cupage%>&category=<%=category %>" class="btn btn-secondary col-2">다음글</a>
        		<%
            			}
            		
            		}
            		if(category.equals("공지사항")){
                %>
                <a href="./notice.bo?page=<%=cupage %>&category=<%=category %>" class="btn btn-success col-2">목록</a>
                <%
            		}
            		else if (category.equals("게시판")){
                %>
                <a href="./bulletin.bo?page=<%=cupage %>&category=<%=category %>" class="btn btn-success col-2">목록</a>
                <%
            		}
            		else if (category.equals("1:1 문의")){
                %>
                <a href="./one_qna.bo?page=<%=cupage %>&category=<%=category %>" class="btn btn-success col-2">목록</a>
                <%
            		}
            		else {
                %>
                <a href="./review.bo?page=<%=cupage %>&category=<%=category %>" class="btn btn-success col-2">목록</a>
                <%
            		}
            		if (userid.equals(writer)){
                %>
                <input type="button" onclick="delnoview()" class="btn btn-danger col-2" value="삭제">
                <%
            		}
                %>
                
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
<script type="text/javascript">
	function delnoview() {
		if (confirm("게시물을 삭제하시겠습니까?")){
			location.href="delnoview.bo?id=<%=bl.getId()%>&page=<%=cupage %>&category=<%=category %>";
		}
	}
	function nonext() {
		alert("현재 페이지가 마지막 페이지 입니다.");
	}
</script>
</html>