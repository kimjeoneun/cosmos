<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>    
<%@ include file="/member/dbconn.jsp" %>
<%@ page import="org.json.simple.*" %>
<%
String userid = request.getParameter("id");
String password = request.getParameter("pw");

userid = "jjoy";
password = "1";

String sql = "SELECT * FROM member WHERE id = '" + userid + "'";

ResultSet rs = stmt.executeQuery(sql);

response.setContentType("application/json");
JSONObject obj = new JSONObject();

boolean flag=false;

while(rs.next()) {   
   if(password.equals(rs.getString("pw"))) {
	   flag=true;
	   break;
   }  
}

obj.put("success", flag);	   			
response.getWriter().write(obj.toString());

%>
<%@ include file="/member/dbconn.jsp"" %>