package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import BEAN.Category;
import BEAN.Product;

public class ProductDAO {
	
	public static int insertProduct(HttpServletRequest request, Connection conn, Product prd){
		
		int check = 0; // biến luưu id của product  khi đc insert vào DB
		
		String sql = "INSERT INTO san_pham(ten_sp, ngay_dang, gia_sp, mo_ta, is_sold, id_dm, nguoi_ban, mo_ta_ngan) VALUES(?,?,?,?,?,?,?,?)";
		
		try {
			
			PreparedStatement ptmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
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
			
			if(check == 0) {
				throw new SQLException("Cannot insert product");
			}
			else {
				ResultSet rs = ptmt.getGeneratedKeys();
				if (rs.next()) {
				  int newId = rs.getInt(1);
				  return newId;				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return check;
		
	}
	
	public static Product getProductById(HttpServletRequest request, Connection conn, int productId) {
		
		Product prd = new Product();
		
		String sql = "SELECT * FROM san_pham WHERE id_sp = " + productId;
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			//thuc thi cau truy van -> luu vao RS
			ResultSet rs = ptmt.executeQuery();
			
			//duyet danh sach trong RS roi dua vao listCategories
			if (rs.isBeforeFirst())
			{
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

					prd.setId(id);
					prd.setName(name);
					prd.setDate(date);
					prd.setPrice(price);
					prd.setShortDesc(shortDesc);
					prd.setDetailDesc(detailDesc);
					prd.setSold(isSold);
					prd.setCategoryId(categoryId);
					prd.setSellerId(sellerId);
				}
				System.out.println(prd.getName());
				rs.close(); // đóng đói tượng resultset
			}
			// xảy ra lỗi
			else 
			{
				request.setAttribute("errMsg","không có sản phẩm");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return prd;
	}
}
