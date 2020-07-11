package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import BEAN.Category;
import BEAN.User;

public class RegisterDAO {
	
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
				request.setAttribute("errMsg","Không có danh mục nào trong csdl");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static boolean insertUser(Connection conn, User user) {
		
		String sql = "INSERT INTO nguoi_dung(ten_nd, dia_chi, sdt, email, password) VALUES(?,?,?,?,?)";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			String name = user.getName();
			String address = user.getAddress();
			String phone = user.getPhone();
			String email = user.getEmail();
			String password = user.getPassword();
			
			ptmt.setString(1, name);
			ptmt.setString(2, address);
			ptmt.setString(3, phone);
			ptmt.setString(4, email);
			ptmt.setString(5, password);
			
			int check = ptmt.executeUpdate();
			
			if(check > 0) {
				return true;
			}
			return false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
}
