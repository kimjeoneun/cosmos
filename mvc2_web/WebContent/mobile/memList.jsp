<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="dbconn.jsp" %>
<%@ page import="org.json.simple.*" %>
<%
String sql = "SELECT * FROM member";

ResultSet rs = stmt.executeQuery(sql);

response.setContentType("application/json");
JSONObject objList = new JSONObject();
JSONArray arrList = new JSONArray();

while(rs.next()) {   
	JSONObject obj = new JSONObject();
	obj.put("id", rs.getString("id"));
	obj.put("pw", rs.getString("pw"));
	obj.put("name", rs.getString("name"));
	obj.put("gender", rs.getString("gender"));
	arrList.add(obj);
}
   			
objList.put("memberList", arrList);
out.print(objList);
//response.getWriter().write(objList.toString());
%>
<%@ include file="dbClose.jsp" %>