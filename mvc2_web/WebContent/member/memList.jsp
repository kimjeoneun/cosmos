<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href = "css/myStyle.css">  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%@ include file="../title.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="row">  
  <div class="leftcolumn">
    <div class="card">
      <h2>회원목록</h2>
      <h5>Title description, Dec 7, 2017</h5>      
      	<table border="1" width="600" cellspacing="0">
		  <tr align="center">
		    <td>번호</td>
		    <td>아이디</td>
		    <td>비밀번호</td>
		    <td>이름</td>
		    <td>비고</td>
		  </tr>
		  
      <c:forEach items="${list}" var="dto">  
		  <tr align="center">
		    <td>num</td>
		    <td><a href="memView.do?id=${dto.id}">${dto.id}</a></td>
		    <td>${dto.pw}</td>
		    <td>${dto.name}</td>
		    <td></td>
		  </tr>
  	  </c:forEach>
  	  
      	</table>      
               
    </div>   
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h2>About Me</h2>
      <div class="fakeimg" style="height:100px;">Image</div>
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
    </div>
    <div class="card">
      <h3>Popular Post</h3>
      <div class="fakeimg"><p>Image</p></div>
      <div class="fakeimg"><p>Image</p></div>
      <div class="fakeimg"><p>Image</p></div>
    </div>
    <div class="card">
      <h3>Follow Me</h3>
      <p>Some text..</p>
    </div>
  </div>
</div>

<%@ include file="../footer.jsp" %>
	
</body>
</html>
    