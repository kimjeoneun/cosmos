<%@ page import = "java.sql.*" %>
<%
//1. 오라클 db접속
Class.forName("oracle.jdbc.driver.OracleDriver");  
String url = "jdbc:oracle:thin:@localhost:1521:mydb";
Connection conn = DriverManager.getConnection(url, "madang", "1234");
Statement stmt = conn.createStatement();
%>