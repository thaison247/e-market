package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Product;
import BEAN.WishlistProduct;

public class WishlistDAO {
	
	
	public static int insertProduct(HttpServletRequest request, Connection conn, WishlistProduct prd) {
		
		int check = 0;
		
		String sql = "INSERT INTO danhsach_quantam(id_nd, id_sp) VALUES(?,?)";
		
		try {
			
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ptmt.setInt(1, prd.getUserId());
			ptmt.setInt(2, prd.getProductId());
			
			check = ptmt.executeUpdate();
			
			if(check == 0) {
				throw new SQLException("Cannot insert product into wishlist");
			}

			ptmt.close();
			
		} catch (SQLException e) {

			request.setAttribute("errMsg", e.getMessage());
		}
		
		return check;
	}
	
	public static int removeProduct(HttpServletRequest request, Connection conn, int prdId) {
		
		int check = 0;
		
		String sql = "DELETE FROM danhsach_quantam WHERE id_sp = " + prdId;
		
		try {
			
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			check = ptmt.executeUpdate();
			
			if(check == 0) {
				throw new SQLException("Cannot delete product from wishlist");
			}

			ptmt.close();
			
		} catch (SQLException e) {

			request.setAttribute("errMsg", e.getMessage());
		}
		
		return check;
	}
	
	public static boolean isExisted(HttpServletRequest request, Connection conn, WishlistProduct prd) {
		
		
		String sql = "SELECT COUNT(*) AS number FROM danhsach_quantam WHERE id_sp = " + prd.getProductId() + " AND id_nd = " + prd.getUserId();

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
				
				if (count == 1) return true; // 
				return false;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	

	public static List<Product> getWishlistByUserId(HttpServletRequest request, Connection conn, int userId){
		
		List<Product> listProducts = new ArrayList<>();
		
		
		
		return listProducts;
		
	}
	
}
