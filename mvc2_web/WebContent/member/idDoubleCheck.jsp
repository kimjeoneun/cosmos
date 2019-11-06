<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복검사</title>
</head>
<script type="text/javascript">
  //부모창의 id값을 가져오기
  function pIdValue() {
	document.getElementById("userId").value = opener.document.memReg.id.value;  
  }
  
  //아이디 중복검사
  function idCheck(){
	  var id = document.getElementById("userId").value;
	  
	  if(!id) {
		  alert("아이디를 입력하세요.");
		  return false;		  
	  } else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
          alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
          return false;
      } else {    	 
           var param="id=" + id;             
           client = new XMLHttpRequest();                           
           client.onreadystatechange = callback;
           client.open("POST", "idCheckProc.jsp", true);    
           client.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
           client.send(param);
           alert(param);
      }
  }
  
  //서버에서 응답이 왔을때 처리
  //0 : open()메소드가호출 되지 않음
  //1 : open()호출되고, 아직 send 메소드 호출되지 않음
  //2 : send호출 states와 header는 도착하지 않은 상태
  //3 : 데이터 일부만 받은  상태  
  //4 : 데이터를 전부 받은 상태
  function callback(){	  
      if(client.readyState == 4 && client.status == 200 ) {     	      	 
          var result = client.responseText;
          if(result == 1){
              alert("사용할수없는 아이디입니다.");
              document.getElementById("cancelBtn").style.visibility='visible';
              document.getElementById("useBtn").style.visibility='hidden';
              document.getElementById("msg").innerHTML ="";
          } 
          else if(result == 0){ 
              document.getElementById("cancelBtn").style.visibility='hidden';
              document.getElementById("useBtn").style.visibility='visible';
              document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
          }
      }
  }
  
  function sendCheckValue(){
      // 중복체크 결과인 idCheck 값을 전달한다.
      opener.document.memReg.idDuplication.value ="idCheck";
      // 회원가입 화면의 ID입력란에 값을 전달
      opener.document.memReg.id.value = document.getElementById("userId").value;
      
      if (opener != null) {
          opener.chkForm = null;
          self.close();
      }    
  }    

</script>

<body onload="pIdValue()">
<div id="wrap">
  <br>
  <b><font size="4" color="gray">아이디 중복체크</font></b>
  <hr size="1" width = "460">
  <br>
  <div id="chk">
    <form id="checkForm">
      <input type="text" name="id" id="userId" >
      <input type="button" value="중복확인" onclick="idCheck()">
    </form>
    <div id="msg"></div>
    <br>
    <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
    <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
  </div>
</div>
</body>
</html>