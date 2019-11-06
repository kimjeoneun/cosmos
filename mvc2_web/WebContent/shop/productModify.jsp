<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>

	<div class="container">
	<c:set value="${newProduct}" var="dto" />	 
		<form name="newProduct" action="productModifyProc.me" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control" value="${dto.id}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control"  value="${dto.name}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control"  value="${dto.unitPrice}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control">${dto.description}</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control"  value="${dto.manufacturer}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value="${dto.category}" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control" value="${dto.unitsInStock}" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"
					<c:if test="${fn:contains(dto.condition, 'New')}"> checked</c:if> 
					> 신규 제품 
					<input type="radio" name="condition" value="Old" 
					<c:if test="${fn:contains(dto.condition, 'Old')}"> checked</c:if>
					> 중고 제품 
					<input type="radio" name="condition" value="Refurbished"
					<c:if test="${fn:contains(dto.condition, 'Refurbished')}"> checked</c:if>
					 > 재생 제품
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="수정" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>
