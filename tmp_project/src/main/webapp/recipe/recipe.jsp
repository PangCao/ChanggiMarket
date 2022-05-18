<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.recipelist" %>
<%@ page import="dto.foodprice" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	recipelist rp = (recipelist)request.getAttribute("sel_recipe");
	ArrayList<foodprice> fp = (ArrayList<foodprice>)request.getAttribute("foodprice");

%>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.3">
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
	<section class="recipe">
        <div class="container">
            <p><i class="fa-solid fa-house"></i>&nbsp;HOME > 레시피 > <%= rp.getR_category()%></p>
            <hr>
            <div class="row">
                <div class="col-6">
                    <img src="../resources/images/<%=rp.getR_img() %>" alt="" class="col-12">
                </div>
                <div class="col-6">
                    <h3><%=rp.getR_name() %></h3>
                    <hr>
                    <h5><%=rp.getR_desc() %></h5>
                    <hr>
                    <div class="row">
                        <h5 class="col-4">배송비</h5>
                        <p class="col-8">3,000원 / 3만원 이상 구매 시 무료배송</p>
                    </div>
                    <form action="">
                        <table class="table">
                            <tr>
                                <th class="col-1"></th>
                                <th class="col-5">상품명</th>
                                <th class="col-2">갯수</th>
                                <th class="col-4 text-right">상품가격</th>
                            </tr>
                            <%
                            	String[] foods = rp.getR_product().split(",");
                            	String[] foodunit = rp.getR_unit().split(",");
                            	int sum_price = 0;
                            	for (int i = 0; i < foods.length; i++) {
                                	int fo_price = 0;                                	
                            		for (int j = 0; j < fp.size(); j++) {
                            			foodprice f_price = fp.get(j);
                            			if (foods[i].equals(f_price.getF_name())){
                            				fo_price = f_price.getF_price();
                            				sum_price += fo_price*Integer.parseInt(foodunit[i]);
                            				System.out.println(fo_price);
                            				break;
                            			}
                            		}
                            %>
                            <tr class="form-group">
                                <td><input type="checkbox" checked></td>
                                <td class="align-middle"><%=foods[i] %></td>
                                <td><input type="number" value="<%=foodunit[i]%>" min="1" class="form-control"></td>
                                <td class="align-middle text-right"><%=Integer.parseInt(foodunit[i])*fo_price %>원</td>
                            </tr>
                            <%
                            	}
                            %>
                            <tr class="ans">
                                <th colspan="2" class="text-center">총 합계 금액</th>
                                <th colspan="2" class="text-right"><%=sum_price %>원</th>
                            </tr>
                        </table>
                        <div class="form-group row">
                            <a href="#" class="btn btn-secondary col-5">장바구니 담기</a>
                            <a href="#" class="btn btn-danger col-5">바로 구매하기</a>
                        </div>
                    </form>
                </div>
            </div>
            <hr>
            <div>
                <h5>레시피 Tip</h5>
                <div>
                    <p><%=rp.getR_tip() %></p>

                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/footer.jsp"/>    
</body>
</html>