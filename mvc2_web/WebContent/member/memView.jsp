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
      <h2>회원상세정보</h2>
      <h5>Title description, Dec 7, 2017</h5>            		      
 		
 	  <c:set value="${member_dto}" var="dto" />	 		
		<fieldset>
        <label>아이디</label>
        ${dto.id}
        <br>        
      
   		<label>비밀번호</label>
   		${dto.pw}
       <br>
   		
   		<label> 이름</label>
   		${dto.name}
       <br>                           
                 
        <label>성별</label>        
        ${dto.gender}
		<br>        
               
        <label>취미</label>
        ${dto.hobby}
        <br>
        
        <label>등록일자</label>
        ${dto.wdate}
       <br>
		</fieldset> 
		          
    <table>
    	<tr>
    	  <td>
    	    <form method="post" action="memModify.do">
            <input type="hidden" name="id" value="${dto.id}">  	  
            <input type="submit" value="수정">
            </form>       	
    	  </td>
    	  <td>    	 
            <button type="button" onclick="location.href='memDel.do?id=${dto.id}'">삭제</button>	  
    	  </td>
    	</tr>
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