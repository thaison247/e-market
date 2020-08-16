package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import BEAN.PersonalProduct;
import BEAN.Product;

public class ProductDAO {
	
	public static int insertProduct(HttpServletRequest request, Connection conn, PersonalProduct prd) {
		
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
	};
	
	public static int insertPersonalProduct(HttpServletRequest request, Connection conn, PersonalProduct prd){
		
		int prdId = insertProduct(request, conn, prd);
		
		// insert id sản phẩm vào bảng sanpham_canhan
		String sql = "INSERT INTO sanpham_canhan(id_sp) VALUES(" + prdId + ")";
		
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sql);
			
			int check = 0;
			check = ptmt.executeUpdate();
			
			if(check == 0) {
				throw new SQLException("Cannot insert personal product");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return prdId;
		
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
	
	
	/*get relative products by category id*/
	public static List<Product> getRelativeProducts(HttpServletRequest request, Connection conn, int catId, int limit){
		List<Product> listProducts = new ArrayList<>();
		
		String sql = "SELECT * FROM san_pham WHERE id_dm = ? LIMIT ?";
		
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sql);
			
			// set gia tri ? cho cau truy van 
			ptmt.setInt(1, catId);
			ptmt.setInt(2, limit);
			
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

					Product prd = new Product(id, name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
					listProducts.add(prd);
				}
				
				rs.close(); // đóng đói tượng resultset
			}
			else {
				request.setAttribute("errMsg","không tìm thấy sản phẩm liên quan");
				System.out.println("không tìm thấy sản phẩm liên quan");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return listProducts;
	}
	
	/*get total number of products in a category by category id*/
	public static int getNumberOfPrdsInCat(HttpServletRequest request, Connection conn, int catId) {
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS count FROM san_pham s"
					+" WHERE s.id_dm = " + catId + " OR s.id_dm IN "
					+ "(SELECT d.id_dm FROM danh_muc d WHERE d.danh_muc_goc = " + catId + ")";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			//thuc thi cau truy van -> luu vao RS
			ResultSet rs = ptmt.executeQuery();
			
			//duyet danh sach trong RS roi dua vao listCategories
			if (rs.isBeforeFirst())
			{
				while(rs.next()) {
					result = rs.getInt("count");
				}

				rs.close(); // đóng đối tượng resultset
			}
			
		} catch (SQLException e) {
			// send error message to caller
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return result;
	}
	
	/*get products in a category by categoryId*/
	public static List<Product> getProductsByCatId(HttpServletRequest request, Connection conn, int catId, int limit, int offset){
		
		List<Product> listProducts= new ArrayList<>();
		
		String sql = "SELECT * FROM san_pham s WHERE s.id_dm = ? OR s.id_dm IN (SELECT d.id_dm FROM danh_muc d WHERE d.danh_muc_goc = ?) LIMIT ? OFFSET ?";
		
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sql);
			
			// set gia tri tham so cho cau truy van sql
			ptmt.setInt(1, catId);
			ptmt.setInt(2, catId);
			ptmt.setInt(3, limit);
			ptmt.setInt(4, offset);
			
			ResultSet rs = ptmt.executeQuery();
			
			if (rs.isBeforeFirst())
			{
				
				while(rs.next()) {
					
					Product prd = new Product();
					prd.setId(rs.getInt("id_sp"));
					prd.setName(rs.getString("ten_sp"));
					prd.setDate(rs.getDate("ngay_dang"));
					prd.setPrice(rs.getInt("gia_sp"));
					prd.setShortDesc(rs.getString("mo_ta_ngan"));
					prd.setDetailDesc(rs.getString("mo_ta"));
					prd.setSold(rs.getBoolean("is_sold"));
					prd.setCategoryId(rs.getInt("id_dm"));
					prd.setSellerId(rs.getInt("nguoi_ban"));
					
					// add this to listProducts
					listProducts.add(prd);
				}

				rs.close(); // đóng đối tượng resultset
			}
			
		} catch (SQLException e) {
			// send error message to caller
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return listProducts;
	}
	
	/* get personal products uploaded by one user by userId */
	public static List<PersonalProduct> getProductsByUserId(HttpServletRequest request, Connection conn, int userId){
		List<PersonalProduct> listProducts = new ArrayList<>();
		
		String sql = "SELECT * FROM san_pham s WHERE s.nguoi_ban = " + userId;
		
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

					PersonalProduct prd = new PersonalProduct(id, name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
					listProducts.add(prd);
				}
				
				rs.close();
			}
			else {
//				request.setAttribute("errMsg","không tìm thấy sản phẩm liên quan");
			}
			
		}catch(SQLException e){
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return listProducts;
	}
	
	/* get personal products uploaded by one user by userId */
//	public static List<ShopProduct> getProductsByShopId(HttpServletRequest request, Connection conn, int shopId){
//		List<ShopProduct> listProducts = new ArrayList<>();
//		
//		return listProducts;
//	}
}
