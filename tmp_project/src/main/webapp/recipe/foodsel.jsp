<%@page import="dto.foodmanage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>재료 검색</title>
<%
	ArrayList<foodmanage> alf = (ArrayList<foodmanage>)request.getAttribute("foodlist");
%>
</head>
<body>
	<section class="fsel">
		<div class="container">
		<table class="table col-12">
			<tr>
				<th class="col-3">상품코드</th>
				<th class="col-3">상품명</th>
				<th class="col-3">가격</th>
				<th class="col-3"></th>
			</tr>
			<%
				if (alf != null) {
					for (int i = 0; i < alf.size(); i++) {
						foodmanage fm = alf.get(i);
			%>
			<tr>
				<td>
					<%= fm.getF_code() %>
					<input type="hidden" value="<%= fm.getF_code() %>" id="code<%=i%>" name="code<%=i%>">
				</td>
				<td>
					<%= fm.getF_name() %>
					<input type="hidden" value="<%= fm.getF_name() %>" id="name<%=i%>" name="name<%=i%>">
				</td>
				<td>
					<%= fm.getF_price() %>
					<input type="hidden" value="<%= fm.getF_price() %>" id="price<%=i%>" name="price<%=i%>">
				</td>
				<td><input type="button" value="선택" onclick="sel_create<%=i %>()" class="btn btn-success"></td>
			</tr>
			<script type="text/javascript">
				function sel_create<%=i%>(){
					var tr = opener.document.createElement('tr');
					tr.innerHTML = opener.document.getElementById('pre_set').innerHTML;
					opener.document.getElementById('filed').appendChild(tr);
					var f_name = opener.document.getElementsByClassName('f_name');
					var f_unit = opener.document.getElementsByClassName('f_unit');
					var f_price = opener.document.getElementsByClassName('f_price');
					opener.document.getElementsByClassName('f_name')[f_name.length - 1].innerHTML = document.getElementById("name<%=i%>").value;
					opener.document.getElementsByClassName('f_name_in')[f_name.length - 1].value = document.getElementById("name<%=i%>").value;
					opener.document.getElementsByClassName('f_price')[f_price.length - 1].innerHTML = document.getElementById('price<%=i%>').value;
					opener.document.getElementsByClassName('f_price_in')[f_price.length - 1].value = document.getElementById('price<%=i%>').value;
					window.close();
				}
			</script>
			<%
					}
				}
			%>
		</table>
		</div>
	</section>
</body>
</html>