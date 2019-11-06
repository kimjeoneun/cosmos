<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href = "css/myStyle.css">  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<script type="text/javascript">
  function checkForm() {
	  if(document.getElementById("gender1").checked != true 
	     && document.getElementById("gender2").checked != true)
	  {	  
	  	alert("성별을 체크해 주세요");
	  	return false;
	  }	 
	  
	  document.memReg.submit();
  }

</script>

<body>

<%@ include file="../title.jsp" %>
<%@ include file="../menu.jsp" %>

<div class="row">  
  <div class="leftcolumn">
    <div class="card">
      <h2>회원상세정보</h2>
      <h5>Title description, Dec 7, 2017</h5>       
           	
	  <c:set value="${member_dto}" var="dto" />	 		      
      <form name="memReg" method="post" action="memModifyProc.do">
        <input type="hidden" name="id" value="${dto.id}"> 
		<fieldset>
        <label>아이디</label>
         ${dto.id}     
        <br>
      
   		<label>비밀번호</label>
        <input type = "password" name="pw" size="20" maxlength="20"  value="${dto.pw}">
        <br>
   		
   		<label> 이름</label>
        <input type="text" name="name" size="20" maxlength="20" value="${dto.name}">
        <br>                           
                
        <label>성별</label>
        <input type="radio" id="gender1" name="gender" value="M"   
        <c:if test="${dto.gender == '남자'}"> checked </c:if>
        > 남자
        <input type="radio" id="gender2" name="gender" value="F" 
        <c:if test="${dto.gender == '여자'}"> checked  </c:if>
        > 여자 <br>        
        
            
        <label>취미</label>
        
         
        <input type="checkbox" name="hobby" value="등산" 		
 		 <c:if test="${fn:contains(dto.hobby, '등산')}"> checked </c:if>
        > 등산
        <input type="checkbox" name="hobby" value="음악"
          <c:if test="${fn:contains(dto.hobby, '음악')}"> checked </c:if>
         > 음악
        <input type="checkbox" name="hobby" value="테니스"
          <c:if test="${fn:contains(dto.hobby, '테니스')}"> checked </c:if>
        > 테니스 <br>                
      
        
		</fieldset> 
		
		<input type="button" value="수정" onclick="checkForm()">
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

    