<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="topnav">
  <a href="index.jsp">Home</a>  
  <a href="memReg.do">회원등록</a>
  <a href="memList.do">회원목록</a>
  <a href="welcome.me">쇼핑몰</a>
    
  <c:set value="${sessName}" var="seName" />  
  <c:if test="${seName != null }">
	  <a href="logOut.do" style="float:right">LogOut</a>
	  <font color="white" style="float:right; padding:12px;">
	  ${seName} 님 환영합니다.
	  </font>
  </c:if>
  
  <c:if test="${seName == null }">
  	<a href="login.do" style="float:right">Login</a>
  </c:if>
  
</div>