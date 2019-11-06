package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import common.DB;
import dto.Member;

public class MemberDao {
	Connection dbconn = DB.getConnect();
	PreparedStatement pstmt = null;
	
	public boolean addMember(Member m) {
		
		boolean rs = false;
		
		String sql = "INSERT INTO member(id, pw, name, gender, hobby)" 
	              + " VALUES ( '" 
	              + m.getId() + "', '" + m.getPw() + "', '" + m.getName() +"','" 
	              + m.getGender() +"', '" + m.getHobby() + "')";	
	
		try {
			pstmt = dbconn.prepareStatement(sql);
			Integer result = pstmt.executeUpdate(sql);
			rs = (result == 1); 
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {			
			try {
				if(pstmt != null) pstmt.close();
				if(dbconn != null) dbconn.close();
			} catch (SQLException e) {					
				e.printStackTrace();
			}			
		}
				
		return rs;
	}
	
	
	public ArrayList<Member> getMemList() {
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rs = null;
		
		String sql = "select * from member order by wdate desc";
		
		try {
			pstmt = dbconn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String gender = rs.getString("gender");
				String hobby = rs.getString("hobby");
				String wdate = rs.getString("wdate");
				
				Member dto = new Member(id, pw, name, gender, hobby, wdate);				
				list.add(dto);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {			
			try {
				if(pstmt != null) pstmt.close();
				if(dbconn != null) dbconn.close();
			} catch (SQLException e) {					
				e.printStackTrace();
			}			
		}
		
		return list;
	}
	
	public Member getMemById(String id) {
		Member dto = new Member();
		ResultSet rs = null;
		
		String sql = "SELECT id, pw, name, hobby  "  
	             + ", decode(gender, 'M','남자','F','여자') AS gender" 
	             + ", TO_CHAR(NVL(wDate,'1999/01/01'), 'YYYY\"년\"mm\"월\"dd\"일\"') AS wDate"
			     + " FROM member WHERE id ='" + id + "'";
		
		try {
			pstmt = dbconn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {		
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String gender = rs.getString("gender");
				String hobby = rs.getString("hobby");
				String wdate = rs.getString("wdate");
				
				dto = new Member(id, pw, name, gender, hobby, wdate);								
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {			
			try {
				if(pstmt != null) pstmt.close();
				if(dbconn != null) dbconn.close();
			} catch (SQLException e) {					
				e.printStackTrace();
			}			
		}
		
		return dto;
	}
	
	public Map<String, String> loginMember(String id, String pw){
		
		Map<String, String> map = new HashMap<String, String>();
		
		ResultSet result = null;
		
		String sql = "SELECT pw, name FROM member " 
	              +  "WHERE id= '" + id + "'";
						
		
		try {
			pstmt = dbconn.prepareStatement(sql);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				//패스워드 비교				
				if(pw.equals(result.getString("pw"))) {
					map.put("login", "ok");
					map.put("name", result.getString("name"));
				} else {
					map.put("login", "pwFail");
				}				
			} else {
				map.put("login", "fail");
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(dbconn != null) dbconn.close();
			} catch (SQLException e) {					
				e.printStackTrace();
			}	
		}
		
		return map;
	}
	
}
