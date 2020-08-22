package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import BEAN.ShopRegisterForm;

public class ShopRegistrationFormDAO {
	public static int insertForm(HttpServletRequest request, Connection conn, ShopRegisterForm frm) throws SQLException {
		
		int newId = 0;
		
		String sql = "INSERT INTO phieu_dk(ten_ch, id_dm, id_nd, ngay_lap, is_accepted) VALUES(?, ?, ?, ?, ?)";
		
		PreparedStatement ptmt = conn.prepareStatement(sql,  Statement.RETURN_GENERATED_KEYS);
		
		ptmt.setString(1, frm.getName());
		ptmt.setInt(2, frm.getCategoryId());
		ptmt.setInt(3, frm.getOwnerId());
		ptmt.setDate(4, frm.getDate());
		ptmt.setBoolean(5,  frm.isAccepted());
		
		int check = ptmt.executeUpdate();
		
		
		if(check == 0) {
			throw new SQLException("Cannot insert registration form");
		}
		else {
			
			ResultSet rs = ptmt.getGeneratedKeys();
			if (rs.next()) {
			  newId = rs.getInt(1); // get this form id after inserted into DB		
			}
			ptmt.close();
		}
		
		return newId;
	}
	
	public static ShopRegisterForm getFormByUserId(HttpServletRequest request, Connection conn, int userId) throws SQLException {
		
		ShopRegisterForm frm = new ShopRegisterForm();
		
		String sql = "SELECT ten_ch, id_dm, ngay_lap FROM phieu_dk WHERE id_nd = " + userId;
		
		PreparedStatement ptmt = conn.prepareStatement(sql);
		
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.isBeforeFirst()) {
			while(rs.next()) {
				String name = rs.getString("ten_ch");
				int categoryId = rs.getInt("id_dm");
				Date date = rs.getDate("ngay_lap");
				
				frm.setName(name);
				frm.setCategoryId(categoryId);
				frm.setDate(date);
			}
		}
		
		rs.close();
		ptmt.close();
		
		return frm;
		
	}
}
