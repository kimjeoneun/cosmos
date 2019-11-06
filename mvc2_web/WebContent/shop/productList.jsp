<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
		<div class="container">
		  <form method="post" action="searchName.me">
		    <input type="text" name="searchName" placeholder="상품이름을 입력하세요"  size="50" required />
		    <input type="submit" value="검색" />
		  </form>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			
			<c:forEach items="${list}" var="dto">
			<div class="col-md-4">
				<h3>${dto.name}</h3>
				<p>${dto.description}
				<p>${dto.unitPrice}원
				<p><a href="productView.me?id=${dto.id}"  class="btn btn-secondary" role="button">상세정보 &raquo;</a>
			</div>
			</c:forEach>
			
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
