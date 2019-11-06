<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  Date nowTime = new Date();
  SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>    
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
      <h2>로그인</h2>
      <h5>      	
      	<p><%= sf.format(nowTime) %>
      <!--  	      	     
      	<p>
      	<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
      	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
      	<c:out value = "${today}" />
      	-->
      </h5>
      
      <c:set value="${loginMsg}" var="msg" />
      <c:if test="${msg != null}"> ${msg} </c:if>
            
      <form action="loginProc.do" method ="post">
      <fieldset>
      <p><label>아이디</label>
      <input type="text" name="id" maxlenght="15" size="13" required>
      </p>
      
      <p><label>비밀번호</label>
      <input type="text" name="pw" maxlenght="20" size="13" required>
      </p>      
      </fieldset>
      <p> <input type="submit" value="로그인"></p>
      </form>
            
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
    