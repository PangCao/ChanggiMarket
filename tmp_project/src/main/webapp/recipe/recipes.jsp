<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.recipelist" %>
<%@ page import="dto.foodprice" %>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<recipelist> rl = (ArrayList<recipelist>)request.getAttribute("food");
	ArrayList<foodprice> fp = (ArrayList<foodprice>)request.getAttribute("foodprice");
	String ct = request.getParameter("r_category");
	
	int cnt = 0;
	if(request.getAttribute("cnt")!=null){
		cnt = (Integer)request.getAttribute("cnt");
	}
%>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/style.css?ver=1.2">
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
	    <section class="recipes">
        <div class="container">
            <div>
                <div class="col-6">
                    <h3 class="col-3"><%=ct%></h3>
                    <a href="" class="btn btn-secondary col-4">레시피 등록</a>
                </div>
                <p><i class="fa-solid fa-house"></i>&nbsp;HOME > 레시피 > <%=ct %></p>
            </div>
            <hr>
            <div>
                <p>
                    <a href="#">신상품순</a> | <a href="#">판매량순</a> | <a href="#">낮은가격순</a> | <a href="#">높은가격순</a>
                </p>
                <form action="" method="post" class="col-4">
                    <input type="text" placeholder="검색어를 입력해주세요." class="form-control">
                    <a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>
            </div>
            <div class="row">
           	<%
				
           		for (int i = 0; i <rl.size(); i++) {
           			int price = 0;
           			recipelist rp = rl.get(i);           			
           			if(rp.getR_category().equals(ct)){
           				String[] foods = rp.getR_product().split(",");
           				String[] food_unit = rp.getR_unit().split(",");
           				for (int j = 0; j < foods.length; j++) {
           					for (int x = 0; x < fp.size(); x++) {
           						foodprice f_price = fp.get(x);           						
           						if (foods[j].equals(f_price.getF_name())){           							
           							price+= (f_price.getF_price()*Integer.parseInt(food_unit[j]));
           							break;
           						}
           					}
           				}
           	%>
           		<div class="col-3">
           			<div>
           				<a href="./recipe.re?id=<%=rp.getR_id()%>"><img src="../resources/images/<%=rp.getR_img() %>" alt="" class="col-12"></a>
                        <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>           				
           			</div>
           			<a href="./recipe.jsp?id=<%=rp.getR_id()%>">
	                    <h5><%=rp.getR_name()%></h5>
	                    <p>0% <small> <%=price %>원</small></p>
	                    <h5><%=price%>원</h5>
	                    <p><%=rp.getR_desc() %></p>
                    </a>
           		</div>
           	<%
           			}
           		}
           	%>
            </div>
            <div>
            	<%
            		int cupage = Integer.parseInt(request.getParameter("page"));
            		if (cupage == 1){
            	%>
                <p><b>&lt;</b>
                <%
            		}
            		else {
           		%>
   		                 <a href="./recipes.jsp?page=<%=cupage-1%>"><b>&gt;</b></a></p>
           		
           		<%
            			}
                	int pagenum = (cnt/20)+1;
                	for (int a = 0; a < pagenum; a++) {
                %>
                 	<a href="./recipes.jsp?page=<%=a+1%>"><%=a+1%></a>
               	<%
                	}
                	if (pagenum == cupage) { 
               	%>
               		<b>&gt;</b></p>
               	<%
                	}
                	else {
               	%>
                <a href="./recipes.jsp?page=<%=cupage+1%>"><b>&gt;</b></a></p>
                <%
                	}
                %>
            </div>
        </div>
        <input type="checkbox" id="recipe_menu">
        <div class="col-2">
            <label for="recipe_menu"><i class="fa-solid fa-angles-left"></i><br><i class="fa-solid fa-angles-right"></i></label>
            <ul><h3>카테고리</h3>
                <hr>
                <a href="./recipes.re?r_category=밥·죽&page=1"><li>밥 · 죽</li></a>
                <a href="./recipes.re?r_category=국·탕·찌개·전골&page=1"><li>국 · 탕 · 찌개 · 전골</li></a>
                <a href="./recipes.re?r_category=면&page=1"><li>면</li></a>
                <a href="./recipes.re?r_category=찜·조림&page=1"><li>찜 · 조림</li></a>
                <a href="./recipes.re?r_category=구이&page=1"><li>구이</li></a>
                <a href="./recipes.re?r_category=볶음&page=1"><li>볶음</li></a>
                <a href="./recipes.re?r_category=튀김&page=1"><li>튀김</li></a>
                <a href="./recipes.re?r_category=나물&page=1"><li>나물</li></a>
                <a href="./recipes.re?r_category=기타&page=1"><li>기타</li></a>
            </ul>
            <form action="" method="post">
                <h3>가격</h3>
                <hr>
                <div class="form-group">
                    <input type="checkbox" id="pricech1"><label for="pricech1">&nbsp;1만원 이하</label>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="pricech2"><label for="pricech2">&nbsp;1만원 ~ 5만원</label>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="pricech3"><label for="pricech3">&nbsp;5만원 ~ 10만원</label>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="pricech4"><label for="pricech4">&nbsp;10만원 이상</label>
                </div>
                <div class="form-group">
                    <input type="button" value="검색" class="btn btn-danger col-12">
                </div>
            </form>
        </div>
    </section>
	<jsp:include page="/footer.jsp"/>
</body>
</html>