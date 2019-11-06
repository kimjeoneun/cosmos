<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<c:set value="${newProduct}" var="dto" />	 
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>${dto.name}</h3>
				<p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> ${dto.id}</span>
				<p><b>제조사</b> : ${dto.manufacturer}
				<p><b>분류</b> : ${dto.category}
				<p><b>재고 수</b> : ${dto.unitsInStock}
				<h4>${dto.unitPrice}원</h4>
				<p><a href="#" class="btn btn-info"> 상품 주문 &raquo;</a> <a href="productList.me" class="btn btn-secondary"> 상품 목록 &raquo;</a>
				<a href="productModify.me?id=${dto.id}" class="btn btn-secondary"> 상품 수정 &raquo;</a>
				<a href="productDel.me?id=${dto.id}" class="btn btn-secondary"> 상품 삭제 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
