<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.orderlist" %>
<!DOCTYPE html>
<html>
<head>
<%
	ArrayList<orderlist> alo = (ArrayList<orderlist>)request.getAttribute("orderlist");
	String name = "";
	if (session.getAttribute("seller") != null) {
		name = (String)session.getAttribute("seller");
	}
%>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.1">
<script src="https://kit.fontawesome.com/42c64699fb.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>ChangiFood-Seller Management</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="s_manage">
        <div>
            <div class="container">
            	<h3>점포 관리</h3>
            </div>
            <div class="container">
                <i class="fa-solid fa-user"></i>
                <h5>안녕하세요. <%=name %> 님</h5>
            </div>
        </div>
        <div class="container">
        	<div class="row">
            	<div class="col-3">
                	<div>
                    	<img src="../resources/images/logo_green.png" width="35%">
                    </div>
                    <ul>
                        <a href="#"><li>주문 내역<span>&gt;</span></li></a>
                        <a href="#"><li>점포 정보 수정<span>&gt;</span></li></a>
                    </ul>
                </div>
                <div class="col-9">
                    <div>
                        <h5>주문 내역</h5>
                        <input type="button" value="전체선택"  class="btn btn-danger">
                    </div>
                    <table class="table">
                        <tr>
                            <th></th>
                            <th>주문번호</th>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>배송지</th>
                            <th>접수상태</th>
                        </tr>
                        <%
                          	if(alo != null){
                          		for(int i = 0; i < alo.size(); i++) {
                          			orderlist ol = alo.get(i);
                          			String[] f_name = ol.getF_singname().split(",");
                          			String[] f_unit = ol.getF_singunit().split(",");
                        %>
                        <tr>
                            <td class="align-middle"><input type="checkbox" checked></td>
                            <td class="align-middle"><%=ol.getId() %></td>
                            <input type="hidden" value="<%=ol.getId() %>">
                            <td class="align-middle">
                            	<ul class="m-0">
                            		<%
                            			for(int j = 0; j < f_name.length; j++) {
                            		%>
                             			<li><%=f_name[j] %></li>
                            		<%
                            			}
                            		%>
                            	</ul>
                            </td>
                            <td class="align-middle">
                            	<ul class="m-0">
                            		<%
                            			for(int x = 0; x < f_unit.length; x++) {
                            		%>
                             			<li><%=f_unit[x] %> 개</li>
                            		<%
                            			}
                            		%>
                            	</ul>
                            </td>
                            <td class="align-middle"><%=ol.getAddr() %></td>
                            <%
                            	if (ol.isChk()) {
                            %>
                            <td class="align-middle">접수 완료</td>
                            <%
                            	}
                            	else {
                            %>
                            <td class="align-middle">접수 대기</td>
                            <%
                            	}
                            %>
                            <input type="hidden" value="<%=ol.isChk()%>">
                        </tr>
                        <%
                        		}
                          	}
                        %>
                        <tr>
                            <td rowspan="2" class="align-middle"><input type="checkbox"></td>
                            <td rowspan="2" class="align-middle">123123</td>
                            <td>감자 130g</td>
                            <td>1pcs</td>
                            <td rowspan="2" class="align-middle">경남 창원시 의창구 팔용동 91-8</td>
                        </tr>
                        <tr>
                            <td>고구마 130g</td>
                            <td>1pcs</td>
                        </tr>
                    </table>
                    <div>
                        <a href="" class="btn btn-secondary col-3">주문 접수</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>
</body>
</html>