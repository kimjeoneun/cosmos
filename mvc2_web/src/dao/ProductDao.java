package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DB;
import dto.Product;

public class ProductDao {
		
	Connection conn = DB.getConnect();		
	PreparedStatement pstmt = null;
	
	public boolean addProduct(Product p){
		boolean result = false;
		
		String sql = "insert into product values ('"
				+ p.getId() + "','" + p.getName() + "', "
				+ p.getUnitPrice() + ",'" + p.getDescription() + "','"
				+ p.getCategory() + "','" + p.getManufacturer() + "',"
				+ p.getUnitsInStock() + ",'" + p.getCondition() + "',' ')";
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			int rs = pstmt.executeUpdate();
			result = (rs == 1);			
		} catch (SQLException e) {
			e.printStackTrace();
		}						
		return result;
	}
	
	public Product getProductId(String id){
		Product p = new Product();			
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = '" + id + "'";
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {				
				p.setId(rs.getString(1));
				p.setName(rs.getString(2));
				p.setUnitPrice(rs.getInt(3));
				p.setDescription(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setManufacturer(rs.getString(6));
				p.setUnitsInStock(rs.getInt(7));
				p.setCondition(rs.getString(8));
								
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return p;
	}
	
	public List<Product> getList() {
		List<Product> list = new ArrayList<Product>();
		ResultSet rs = null;
		
		String sql = "select * from product";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product p = new Product();				
				p.setId(rs.getString(1));
				p.setName(rs.getString(2));
				p.setUnitPrice(rs.getInt(3));
				p.setDescription(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setManufacturer(rs.getString(6));
				p.setUnitsInStock(rs.getInt(7));
				p.setCondition(rs.getString(8));
				
				list.add(p);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return list;
	}
	
	public List<Product> searchProduct(String searchName) {
		List<Product> list = new ArrayList<Product>();
		ResultSet rs = null;
		
		String sql = "select * from product "  
				   + " where p_name like '%" + searchName + "%'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product p = new Product();				
				p.setId(rs.getString(1));
				p.setName(rs.getString(2));
				p.setUnitPrice(rs.getInt(3));
				p.setDescription(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setManufacturer(rs.getString(6));
				p.setUnitsInStock(rs.getInt(7));
				p.setCondition(rs.getString(8));
				
				list.add(p);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return list;
	}
	
	public boolean modifyProduct(Product p){
		boolean result = false;
		
		String sql = "update product set "
				+ "p_name = '" + p.getName() + "', "
				+ "P_UNITPRICE = " + p.getUnitPrice() + ", "
				+ "P_DESCRIPTION = '" + p.getDescription() + "', "
				+ "P_CATEGORY = '" + p.getCategory() + "', "
				+ "P_MANUFACTURER = '" + p.getManufacturer() + "', "
				+ "P_UNITSINSTOCK = " + p.getUnitsInStock() + ", "
				+ "P_CONDITION = '" + p.getCondition() + "'"				
				+ " WHERE p_id = '" + p.getId() + "'" ;
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			int rs = pstmt.executeUpdate();
			result = (rs == 1);			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) pstmt.close();
			} catch (SQLException e) {			
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public boolean delProduct(String id){
		
		boolean result = false;
		
		String sql = "delete from product where p_id = '" + id + "'";
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			int rs = pstmt.executeUpdate();
			result = (rs == 1);			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return result;
	}
}
