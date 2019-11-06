<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbconn.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

String sql = "SELECT count(*) cnt FROM member WHERE id='"+ id +"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
out.print(rs.getString("cnt"));
%>