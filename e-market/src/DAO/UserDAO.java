package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import BEAN.User;

public class UserDAO {
	public static User getUserById(HttpServletRequest request, Connection conn, int userId) {
		
		User user = new User();
		
		String sql = "SELECT * FROM nguoi_dung WHERE id_nd = " + "'" + userId + "'";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					int id = rs.getInt("id_nd");
					String name = rs.getString("ten_nd");
					String address = rs.getString("dia_chi");
					String phone = rs.getString("sdt");
					String email = rs.getString("email");

					user.setAddress(address);
					user.setEmail(email);
					user.setId(id);
					user.setName(name);
					user.setPhone(phone);
				}
				
				rs.close();
			}
			else {
				request.setAttribute("errMsg", "Lỗi truy vấn User");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return user;
		
	}
}
