package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import BEAN.User;

public class UserDAO {
	
	public static boolean isExistedEmail(HttpServletRequest request, Connection conn, String email) {
		
		// câu truy vấn kiểm tra email có tồn tại trong csdl chưa
		String sql = "SELECT COUNT(*) AS number FROM nguoi_dung WHERE email = " + "'" + email + "'";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			//thuc thi cau truy van -> luu vao RS
			ResultSet rs = ptmt.executeQuery();
			
			if (rs.isBeforeFirst())
			{
				int count = 0;
				
				while (rs.next())
				{
					count = rs.getInt("number"); // lấy kết quả từ câu truy vấn
				}
				
				rs.close(); // đóng đối tượng resultset
				
				if (count == 1) return true; // email đã được dùng để đăng ký 1 tk khác
				return false;
			}
			else 
			{
				request.setAttribute("registerDaoMsg","Lỗi kiểm tra email tồn tại");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static User getUserById(HttpServletRequest request, Connection conn, int userId) {
		User user = new User();
		
		String sql = "SELECT id_nd, ten_nd, email FROM nguoi_dung WHERE id_nd = " + userId;
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					int id = rs.getInt("id_nd");
					String name = rs.getString("ten_nd");
					String email = rs.getString("email");
					
					user.setEmail(email);
					user.setId(id);
					user.setName(name);
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
	
		
	public static String getPassword(HttpServletRequest request, Connection conn, String email) {
		
		String password = null; // kết quả
		
		String sql = "SELECT password FROM nguoi_dung WHERE email = " + "'" + email + "'";
		
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sql);
			
			//thực thi câu truy vấn
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {
				
				while(rs.next()) {
					password = rs.getString("password");
				}
				
				rs.close();
			}
			else {
				request.setAttribute("getPasswordErrMsg","Lỗi truy vấn password");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return password;
	}
	
	
	public static User getUserByEmail(HttpServletRequest request, Connection conn, String email) {
		
		User user = new User();
		
		String sql = "SELECT * FROM nguoi_dung WHERE email = " + "'" + email + "'";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					int id = rs.getInt("id_nd");
					String name = rs.getString("ten_nd");

					user.setEmail(email);
					user.setId(id);
					user.setName(name);
				}
				
				rs.close();
			}
			else {
				request.setAttribute("getUserErrMsg", "Lỗi truy vấn User");
			}
			
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("getUserErrMsg", e.getMessage());
		}
		
		return user;
	}
}
