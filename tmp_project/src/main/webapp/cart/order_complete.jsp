<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/tmp_project/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/tmp_project/resources/css/style.css?ver=1.4">
<style type="text/css">
	body > .o_complete {
		min-height : 80vh;
		width: 100vw;
	}
	body > .o_complete > .container {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		min-height: 80vh;
		text-align: center;
	}
	body > .o_complete > .container > h1{
		color : #28b421;
		margin-bottom : 30px;
	}
</style>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<section class="o_complete">
		<div class="container">
			<h1>결제가 완료되었습니다.</h1>
			<p>주문을 확인 후<br> 고객님의 소중한 상품을 안전하게 배송하겠습니다.</p>
			<p>이용해주셔서 감사합니다.</p>
		</div>
	</section>
	<jsp:include page="/footer.jsp"/>
</body>
<script type="text/javascript">
	setTimeout(function(){location.href='/tmp_project/index.jsp';},3000);
</script>
</html>