package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import BEAN.Admin;

public class AdminDAO extends UserDAO{

	public static boolean checkAdminAccountByEmail(HttpServletRequest request, Connection conn, String email) throws SQLException {

		String sql = "SELECT COUNT(*) FROM nguoi_dung JOIN admin USING (id_nd) WHERE email = ?";
		
		PreparedStatement ptmt = conn.prepareStatement(sql);
		
		ptmt.setString(1, email);
		
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.isBeforeFirst()) {
			
			while(rs.next()) {
				
				int count = rs.getInt(1);
				
				if(count == 1) return true;
				return false;
			}
		}
		
		return false;
	}
	
	public static Admin getAdminByEmail(HttpServletRequest request, Connection conn, String email) throws SQLException {
		
		Admin ad = new Admin();
		
		String sql = "SELECT * FROM nguoi_dung JOIN admin USING (id_nd) WHERE email = ?";
		
		PreparedStatement ptmt = conn.prepareStatement(sql);
		
		ptmt.setString(1, email);
		
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.isBeforeFirst()) {
			while(rs.next()) {
				int id = rs.getInt("id_nd");
				String name = rs.getString("ten_nd");
				String staffId = rs.getString("ma_nhan_vien");
				
				ad.setEmail(email);
				ad.setId(id);
				ad.setName(name);
				ad.setStaffId(staffId);
			}
			
			rs.close();
		}
		
		ptmt.close();
		
		return ad;
	}
	
}
