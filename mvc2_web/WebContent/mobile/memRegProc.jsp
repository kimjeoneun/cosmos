<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "error.jsp" %>    
    
<%@ include file="../dbconn.jsp" %>   
<%@ page import="org.json.simple.*" %> 
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
String wdate = formatter.format(new java.util.Date());

String post = "12345";
String addr = request.getParameter("major");
String addr2 = request.getParameter("email");
//String addr3 = request.getParameter("addr3");


String sql = "insert into member(id, pw, name, gender, addr, wdate, post, addr2) " + 
              "values ('" + id  + "','" + pw + "','" + name + "','" + 
               gender + "','" + addr + "','" +  wdate + "','" + 
              post + "','" +  addr2 + "')";

//out.println(sql);

int res = stmt.executeUpdate(sql);

response.setContentType("application/json");
JSONObject obj = new JSONObject();
boolean flag=false;

if(res > 0) flag=true; 		    

obj.put("success", flag);	   			
response.getWriter().write(obj.toString());

%>

<%@ include file="../dbClose.jsp" %>    