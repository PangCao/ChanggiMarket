<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*" %>
<%@ page import="java.util.ArrayList" %>
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
	ArrayList<cartlist> al = (ArrayList<cartlist>)session.getAttribute("myCart");
	customer cu = (customer)session.getAttribute("user");
	if (al != null && al.size() > 0) {
%>
<script type="text/javascript">
	function cartdel() {
		if (confirm("장바구니의 상품을 모두 삭제하시겠습니까?")) {
			location.href= "cartdel.ca";
		}
	}
	function selectdel() {
		if (confirm("선택하신 상품을 삭제하시겠습니까?")){
			document.cartForm.action = "seldel.ca";
			document.cartForm.submit();
		}
	}
</script>
<%
	}
%>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="cart">
        <div class="container">
            <h3>장바구니</h3>
            <form action="order.ca" method="post" name="cartForm">
                <div>
                    <input type="button" value="전체 삭제" class="btn btn-success" onclick="cartdel()">
                    <input type="button" value="선택 삭제" class="btn btn-danger" onclick="selectdel()">
                </div>
                <table class="table text-center">
                    <tr>
                        <th></th>
                        <th class="col-2"></th>
                        <th>상품명</th>
                        <th>상세선택</th>
                        <th>합계</th>
                        <th>배송방법</th>
                    </tr>
                    
                    <%
                    	int totalsum = 0;
                    	if(al != null){
               		%>
                   		<input type="hidden" name="foodlen" id="foodlen" value="<%=al.size()%>">
               		<%
                    		for (int i = 0; i < al.size(); i++) {
                    			cartlist ca = al.get(i);
                    %>
                    	<tr>
                        <td class="align-middle"><input type="checkbox" name="foodid" checked value="<%=i%>"></td>
                        <td class="align-middle"><img src="../resources/images/<%=ca.getFilename() %>" alt="" class="col-12"></td>
                        <td class="align-middle"><%= ca.getFoodName() %></td>
                        <td class="align-middle">
                        <input type="hidden" name="foodimg<%=i %>" id="foodimg<%=i %>" value="<%= ca.getFilename()%>">
                        <input type="hidden" name="foodname<%=i %>" id="foodname<%=i %>" value="<%=ca.getFoodName()%>">
                            <ul>
                            <%
                            	int sum = 0;
                            	for (int j = 0; j < ca.getFoods().length; j++){
                            		sum += Integer.valueOf(ca.getFoodprice()[j]) *Integer.valueOf(ca.getFoodunit()[j]);
                            %>
                            	<input type="hidden" name="singfoodlen<%=i %>" id="singfoodlen<%=i %>" value="<%=ca.getFoods().length %>">
                            	<li><label for="a<%=i %><%=j %>" class="col-4"><%= ca.getFoods()[j] %></label><p class="col-4"><%=ca.getFoodprice()[j] %> 원</p><input type="number" value="<%=ca.getFoodunit()[j] %>" min="0" class="form-control col-3" id="f_num<%=i%><%=j%>" onclick="food_num<%=i%><%=j%>()"></li>
                            	<input type="hidden" value="<%= ca.getFoods()[j] %>" name="singfoodname<%=i %><%=j %>" id="singfoodname<%=i %><%=j %>">
                            	<input type="hidden" value="<%=ca.getFoodprice()[j] %>" name="foodprice<%=i %><%=j %>" id="foodprice<%=i %><%=j %>">
                            	<input type="hidden" value="<%=ca.getFoodunit()[j] %>" name="foodunit<%=i %><%=j %>" id="foodunit<%=i %><%=j %>">
                            	<script type="text/javascript">
									function food_num<%=i%><%=j%>() {
										var num = document.getElementById("f_num<%=i%><%=j%>").value;
										document.getElementById("foodunit<%=i%><%=j%>").value = num;
										var sum = Number(0);
										for (var k = 0; k < <%=ca.getFoods().length%>; k++) {
											let p = "foodprice<%=i%>"+k;
											let u = "foodunit<%=i%>"+k
											sum = sum + (Number(document.getElementById(p).value) * Number(document.getElementById(u).value));
										}
										document.getElementById("foodsum<%=i%>").value = sum;
										document.getElementById("foodsumview<%=i%>").innerHTML = sum + " 원";
										var total_price= Number(0);
										for (var c = 0; c < <%=al.size()%>; c++) {
											let s = "foodsum"+c;
											total_price = total_price + Number(document.getElementById(s).value);
										}
										document.getElementById("totalsum").value = total_price;
										document.getElementById("totalsum_view").innerHTML = total_price + " 원";
										if (total_price < 30000) {
											document.getElementById("shipprice").value = 3000;
											document.getElementById("shipprice_view").innerHTML = 3000 + " 원";
											document.getElementById("totalsum_ship").value = Number(3000) + Number(total_price);
											document.getElementById("totalsum_ship_view").innerHTML = Number(3000) + Number(total_price) + " 원";
										}
										else {
											document.getElementById("shipprice").value = 0;
											document.getElementById("shipprice_view").innerHTML = 0 + " 원";
											document.getElementById("totalsum_ship").value = Number(0) + Number(total_price);
											document.getElementById("totalsum_ship_view").innerHTML = Number(0) + Number(total_price) + " 원";
										}
										
									}
								</script>
                            <%
                            	}
                            	totalsum += sum;
                            %>
                            </ul>
                        </td>
                        <td class="align-middle" id="foodsumview<%=i%>"><%=sum %> 원</td>
                        <input type="hidden" value="<%=sum %>" id="foodsum<%=i%>">
                        <td class="align-middle"><a href="" class="btn btn-danger">배송방법</a></td>
                    </tr>
                    <% 
                    		}
                    	}
                    %>
                </table>
                <div>
                    <div class="col-5">
                        <p class="col-12"><i class="fa-solid fa-location-dot"></i> 배송지</p>
                        <hr>
                        <p class="col-12"><%=cu.getAddr() %></p>
                        <input type="hidden" value="<%=cu.getAddr() %>" name="cusaddr" id="cusaddr">
                        <div class="col-12">
                            <p>상품금액 <span id="totalsum_view"><%=totalsum%> 원</span></p>
                            <input type="hidden" value="<%=totalsum %>" id="totalsum" name="totalsum">
                            <p>상품할인금액 <span>0원</span></p>
                            <%
                            	int shipping = 0;
                            	if (totalsum < 30000) {
                            		shipping = 3000;
                            %>
                            <p>배송비 <span id="shipprice_view">3000원</span></p>
                            <input type="hidden" value="3000" id="shipprice" name="shipprice">
                            <%
                            	}
                            	else {
                            		shipping = 0;
                            %>
                           	<p>배송비 <span id="shipprice_view">0원</span></p>
                           	<input type="hidden" value="0" id="shipprice" name="shipprice">
                            <%
                            	}
                            %>
                            <hr>
                            <p>결제 예정 금액 <span id="totalsum_ship_view"><%=totalsum+shipping %>원</span></p>
                            <input type="hidden" value="<%=totalsum+shipping %>" id="totalsum_ship" name="totalsum_ship">
                        </div>
                        <input type="button" class="btn btn-secondary col-12" value="주문 하기" onclick="orderchk()">
                    </div>
                </div>
            </form>
        </div>
    </section>
    <script type="text/javascript">
    	function orderchk() {
    		if (document.getElementById('totalsum').value == 0) {
				alert("주문하실 상품이 존재하지 않습니다.");
				return;
    		}
    		else{
    			document.cartForm.submit();
    		}
    	}
    </script>
    <jsp:include page="/footer.jsp"/>
</body>
</html>