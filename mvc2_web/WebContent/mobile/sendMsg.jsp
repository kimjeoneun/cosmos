<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ page import="org.json.simple.*" %>
<%
String userid = request.getParameter("id");
String password = request.getParameter("pw");

//out.println(userid);
response.setContentType("application/json");
JSONObject objList = new JSONObject();  //{ }
JSONArray arrList = new JSONArray();    //[ ]

JSONObject obj = new JSONObject();  // { }

	obj.put("id", userid);
	obj.put("pw", password );
	obj.put("name","김정은" );
	obj.put("gender", "F" );
	arrList.add(obj);   
//[{"id": "joy", "pw" : "1234", "name" : "김정은", "gender" : "F"},
// {"id": "joy", "pw" : "1234", "name" : "김정은", "gender" : "F"}]
 		
objList.put("dataSet", arrList);  //{"dataSet" : [{}]}

out.print(objList);
//response.getWriter().write(objList.toString());
%>
