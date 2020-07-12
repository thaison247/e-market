package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class LoginDAO {
	
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
				request.setAttribute("checkExistedMailErrMsg","Lỗi kiểm tra email tồn tại");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
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
}
