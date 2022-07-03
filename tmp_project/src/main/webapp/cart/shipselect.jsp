<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.marketDto" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b23fa9ea980f75e2aff0cab6c46496c0"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">

<%
	ArrayList<marketDto> marketlist = (ArrayList<marketDto>)request.getAttribute("marketlist");
	String num = request.getParameter("num");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="ship_sel">
		<div class="container">
		<div id="map" style="width:500px;height:400px;" class="mx-auto my-5"></div>
			<table class="table table-hover">
				<tr>
					<th class="col-2">상호명</th>
					<th class="col-8">주소</th>
					<th class="col-2">선택</th>
				</tr>
				<%
				if (marketlist != null){
					for(int i = 0; i < marketlist.size(); i++){
						marketDto dto = marketlist.get(i);
				%>
				<tr>
					<td><%=dto.getName() %></td>
					<td><%=dto.getAddr() %></td>
					<td><input type="button" value="선택" onclick="shipsel<%=i%>()" class="btn btn-danger"></td>
					<input type="hidden" value="<%=dto.getId()%>" id="s_id<%=i%>">
				</tr>
				<script type="text/javascript">
					function shipsel<%=i%>() {
						var id = document.getElementById('s_id<%=i%>');
						opener.document.getElementById('ship<%=num%>').innerHTML = '<%=dto.getName()%>';
						opener.document.getElementById('food_sel_id<%=num%>').value = '<%=dto.getId()%>';
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
<script>

	var container = document.getElementById('map');
	var options = {
		<%
			if (marketlist != null && marketlist.size() != 0) {
		%>
		center : new kakao.maps.LatLng(<%=marketlist.get(0).getX()%>, <%=marketlist.get(0).getY()%>),
		<%
			}
			else{
		%>
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		<%
			}
		%>
		level: 3
	};
	
	var map = new kakao.maps.Map(container, options);
	
	var positions = [
		<%
		if (marketlist != null) {
			for(int i = 0; i < marketlist.size(); i++) {
				marketDto dto = marketlist.get(i);
				if(i == marketlist.size()) {
		%>
    	{
        	content: '<div><%=dto.getName()%></div>', 
        	latlng: new kakao.maps.LatLng(<%=dto.getX()%>,<%=dto.getY()%>)
	    }
    	<%
				}
				else {
		%>
	  	{
        	content: '<div><%=dto.getName()%></div>', 
        	latlng: new kakao.maps.LatLng(<%=dto.getX()%>,<%=dto.getY()%>)
	    },
		<%
				}
			}
		}
    	%>
	];
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	}


</script>
</html>