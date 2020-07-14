package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import BEAN.Product;

public class ProductDAO {
	
	public static int insertProduct(HttpServletRequest request, Connection conn, Product prd) {
		
		int check = 0; // biến luưu id của product  khi đc insert vào DB
		
		String sql = "INSERT INTO san_pham(ten_sp, ngay_dang, gia_sp, mo_ta, is_sold, id_dm, nguoi_ban, mo_ta_ngan) VALUES(?,?,?,?,?,?,?,?)";
		
		try {
			
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			String name = prd.getName();
			Date date = prd.getDate();
			int price = prd.getPrice();
			String shortDesc = prd.getShortDesc();
			boolean isSold = prd.isSold();
			int categoryId = prd.getCategoryId();
			int sellerId = prd.getSellerId();
			String detailDesc = prd.getDetailDesc();
			
			
			ptmt.setString(1, name);
			ptmt.setDate(2, date);
			ptmt.setInt(3, price);
			ptmt.setString(4, detailDesc);
			ptmt.setBoolean(5, isSold);
			ptmt.setInt(6,  categoryId);
			ptmt.setInt(7, sellerId);
			ptmt.setString(8, shortDesc);
			
			check = ptmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("inserPrdDAOErrMsg", e.getMessage());
		}
		
		return check;
		
	}
	
}
