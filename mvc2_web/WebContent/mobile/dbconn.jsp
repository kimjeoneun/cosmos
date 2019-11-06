<%@ page import="java.sql.*" %>
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url="jdbc:oracle:thin:@localhost:1521:mydb";
		
  Connection dbconn=DriverManager.getConnection(url, "madang", "1234");
  Statement stmt = dbconn.createStatement();
%>
  