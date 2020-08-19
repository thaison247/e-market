package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import BEAN.NormalUser;

public class NormalUserDAO extends UserDAO{

	public static NormalUser getUserById(HttpServletRequest request, Connection conn, int userId) {
		NormalUser user = new NormalUser();
		
		String sql = "SELECT id_nd, ten_nd, email, dia_chi, sdt FROM nguoi_dung INNER JOIN nguoidung_thongthuong USING (id_nd) WHERE id_nd = " + userId;
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					int id = rs.getInt("id_nd");
					String name = rs.getString("ten_nd");
					String email = rs.getString("email");
					String address = rs.getString("dia_chi");
					String phone = rs.getString("sdt");

					
					user.setEmail(email);
					user.setId(id);
					user.setName(name);
					user.setAddress(address);
					user.setPhone(phone);
				}
				
				rs.close();
			}
			
			ptmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return user;
	}

	public static int insertUser(HttpServletRequest request, Connection conn, NormalUser user) {
		
		int userId = 0; // comment id after inserted into Comment Table in DB
		
		int check = 0;
		
		try {
			// INSERT INTO nguoi_dung TABLE
			String sql1 = "INSERT INTO nguoi_dung(ten_nd, email, password) VALUES(?,?,?)";
			
			PreparedStatement ptmt = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
			
			ptmt.setString(1, user.getName());
			ptmt.setString(2, user.getEmail());
			ptmt.setString(3, user.getPassword());
			
			check = ptmt.executeUpdate();
			
			
			if(check == 0) {
				throw new SQLException("Cannot insert user");
			}
			else {
				
				ResultSet rs = ptmt.getGeneratedKeys();
				if (rs.next()) {
				  userId = rs.getInt(1); // get this user id after inserted into DB		
				}
				ptmt.close();
			}
			
			// INSERT INTO nguoidung_thongthuong TABLE
			String sql2 = "INSERT INTO nguoi_dung(id_nd, dia_chi, sdt) VALUES(?,?,?)";
			PreparedStatement ptmt2 = conn.prepareStatement(sql2);
			
			ptmt2.setInt(1, userId);
			ptmt2.setString(2, user.getAddress());
			ptmt2.setString(3, user.getPhone());
			
			check = ptmt2.executeUpdate();
			
			if(check == 0) {
				throw new SQLException("Cannot insert normal user");
			}

		} catch (SQLException e) {

			request.setAttribute("errMsg", e.getMessage());
		}
		
		return userId;
	}
	
	public static NormalUser getUserByEmail(HttpServletRequest request, Connection conn, String email) {
		
		NormalUser user = new NormalUser();
		
		String sql = "SELECT * FROM nguoi_dung INNER JOIN nguoidung_thongthuong USING (id_nd) WHERE email = " + "'" + email + "'";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					int id = rs.getInt("id_nd");
					String name = rs.getString("ten_nd");
					String address = rs.getString("dia_chi");
					String phone = rs.getString("sdt");

					user.setEmail(email);
					user.setId(id);
					user.setName(name);
					user.setAddress(address);
					user.setPhone(phone);
				}
				
				rs.close();
			}
			else {
				request.setAttribute("getUserErrMsg", "Lỗi truy vấn User");
			}
			
			ptmt.close();
		} catch (SQLException e) {

			request.setAttribute("errMsg", e.getMessage());
		}
		
		return user;
	}
	
}
