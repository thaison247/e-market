package DAO;

import java.sql.Connection;
import java.sql.Date;
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
	
	public static boolean removeProduct(HttpServletRequest request, Connection conn, WishlistProduct prd) {
		
		int check = 0;
		
		String sql = "DELETE FROM danhsach_quantam WHERE id_sp = " + prd.getProductId() + " AND id_nd = " + prd.getUserId();
		
		
		try {
			
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			check = ptmt.executeUpdate();
			
			if(check == 0) {
				return false;
			}

			ptmt.close();
			
		} catch (SQLException e) {

			request.setAttribute("errMsg", e.getMessage());
		}
		
		return true;
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
		
		String sql = "SELECT * FROM danhsach_quantam JOIN san_pham USING(id_sp) WHERE id_nd = " + userId;
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {
				
				while(rs.next()) {
					
					int id = rs.getInt("id_sp");
					String name = rs.getString("ten_sp");
					Date date = rs.getDate("ngay_dang");
					int price = rs.getInt("gia_sp");
					String shortDesc = rs.getString("mo_ta_ngan");
					String detailDesc = rs.getString("mo_ta");
					boolean isSold = rs.getBoolean("is_sold");
					int categoryId = rs.getInt("id_dm");
					int sellerId = rs.getInt("nguoi_ban");

					Product prd = new Product(id, name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
					listProducts.add(prd);
				}
				
				rs.close();
			}
			
		}catch(SQLException e){
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return listProducts;
	}
	
}
