package common;
import java.sql.*;


public class DB {
	final static String driver = "oracle.jdbc.driver.OracleDriver";
	final static String url = "jdbc:oracle:thin:@localhost:1521:mydb";
	final static String user = "madang";
	final static String pw = "1234";					
	
	public static Connection getConnect() {
		Connection conn = null;
		try {
			Class.forName(driver);			
			conn = DriverManager.getConnection(url, user, pw);														
		} catch (ClassNotFoundException e) {			
			System.out.println("jdbc driver 로딩 실패");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패");
		}
		
		return conn;
	}			
}
