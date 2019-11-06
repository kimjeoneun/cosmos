<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet"  href = "css/myStyle.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
</head>

<script type="text/javascript">
  function checkForm() {
	  if(document.getElementById("gender1").checked != true 
	     && document.getElementById("gender2").checked != true)
	  {	  
	  	alert("성별을 체크해 주세요");
	  	return false;
	  }	 
	  
	  if(document.memReg.idDuplication.value != "idCheck"){
		  alert("아이디 중복체크를 해주세요.");
		  return false;
	  }
	  
	  document.memReg.submit();
  }
  
  function idCheck(){
	  window.open("member/idDoubleCheck.jsp", "chkFrom", "width=500, height=300, resizable=no, scrollbars=no");
  }
  
  function inputIdChk(){
	  document.memReg.idDuplication.value = "idUncheck";
  }
  
</script>

<body>

<%@ include file="../title.jsp" %>

<%@ include file="../menu.jsp" %>

<div id ="result"></div>

<div class="row">    
    <div class="card">
      <h2>회원가입</h2>
      <h5>2019년 6월 18일(화)</h5>
      
      <form name="memReg" method="post" action="memRegProc.do" >
      <fieldset>
        <label>아이디</label>
        <input type="text" name="id" size="20" maxlength="20" placeholder="아이디" onkeydown="inputIdChk()">
        <button type="button" onclick="idCheck()">중복검사</button>
        <input type="hidden" name="idDuplication" value="idUncheck">
        <br>
      
   		<label>비밀번호</label>
        <input type = "password" name="pw" size="20" maxlength="20"><br>
   		
   		<label> 이름</label>
        <input type="text" name="name" size="20" maxlength="20"><br>                           

                 
        <label>성별</label>
        <input type="radio" name="gender" value="M" id="gender1"> 남자
        <input type="radio" name="gender" value="F" id="gender2"> 여자 <br>
        
               
        <label>취미</label>
        <input type="checkbox" name="hobby" value="등산"> 등산
        <input type="checkbox" name="hobby" value="음악"> 음악
        <input type="checkbox" name="hobby" value="테니스"> 테니스 <br>
        
 <!--        
        <label>국적</label>
        <select name="nation" size="4" multiple>    
          <option value="-1" selected>국적을 선택하세요</option>     
		  <option value="ko">Korea</option>
		  <option value="ch">China</option>
		  <option value="jp">Japan</option>		  
		</select><br>    
		
		<label>이메일</label>
		<input type="text" name="eid">@
		<input type="text" name="domain" id="domain">
		<select name="selEmail" id="sel" onchange="inputDomain()">
			<option value="">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="daume.net">daum.net</option>
			<option value="naver.com">gmail.com</option>
		</select>		
		<br>
				
		<label>주소</label>			
		<div style="padding-left:100px;"> 
		<%@ include file="jusoSearch.jsp" %>
		</div>
		
		<label>자기소개</label>
		<textarea name="intro" rows="5" cols="100"></textarea><br>
 -->		
		<input type="button" value="회원등록" onclick="checkForm()">
	 </fieldset>	 	   
	 </form>	                      
    </div>   
</div>  

<%@ include file="../footer.jsp" %>

</body>
</html>
    