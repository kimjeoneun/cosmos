<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>    
<%@ include file="../dbconn.jsp" %>
<%@ page import="org.json.simple.*" %>

<%
String userid = request.getParameter("id");

//안드로이드로 전달
//out.println(userid);

//userid = "ican2";

String sql = "SELECT id FROM member WHERE id = '" + userid + "'";
ResultSet rs = stmt.executeQuery(sql);
//out.println(sql);

response.setContentType("application/json");
JSONObject obj = new JSONObject();

boolean flag=true;
while(rs.next()) {		
	if(userid.equals(rs.getString("id"))) flag=false; 		    
}

obj.put("success", flag);	   			
response.getWriter().write(obj.toString());

%>
<%@ include file="../dbClose.jsp" %>    