package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import BEAN.Category;

public class CategoryDAO {

	// lay tat ca danh muc
	public static ArrayList<Category> getAllCategories(HttpServletRequest request, Connection conn){
		ArrayList<Category> listCategories = new ArrayList<>();
		
		// cau truy van
		String sql = "SELECT * FROM danh_muc";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			//thuc thi cau truy van -> luu vao RS
			ResultSet rs = ptmt.executeQuery();
			
			//duyet danh sach trong RS roi dua vao listCategories
			if (rs.isBeforeFirst())
			{
				while (rs.next())
				{
					int id = rs.getInt("id_dm"); // id danh mục
					String name = rs.getString("ten_dm"); // tên danh mục
					int rootId = rs.getInt("danh_muc_goc"); // id danh mục gốc (danh mục cha)
					int quantity = getQuantityById(request, conn, id); // số lượng sản phẩm thuộc danh mục này
					
					Category cat = new Category(id, name, rootId, quantity);
					
					listCategories.add(cat);
				}
				rs.close(); // đóng đói tượng resultset
			}
			else 
			{
				request.setAttribute("errMsg","Không có danh mục nào trong csdl");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listCategories;
	}
	
	// lay tat ca danh muc level 1 (danh muc co id danh_muc_goc = 0)
	public static ArrayList<Category> getAllCategoriesLV1(HttpServletRequest request, Connection conn){
		ArrayList<Category> listCategories = new ArrayList<>();
		
		// cau truy van select cac danh muc LV1
		String sql = "SELECT * FROM danh_muc WHERE danh_muc_goc = 0";
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			//thuc thi cau truy van -> luu vao RS
			ResultSet rs = ptmt.executeQuery();
			
			//duyet danh sach trong RS roi dua vao listCategories
			if (rs.isBeforeFirst())
			{
				while (rs.next())
				{
					int id = rs.getInt("id_dm"); // id danh mục
					String name = rs.getString("ten_dm"); // tên danh mục
					int rootId = rs.getInt("danh_muc_goc"); // id danh mục gốc (danh mục cha)
					
					Category cat = new Category(id, name, rootId);
					
					listCategories.add(cat);
				}
				rs.close(); // đóng đói tượng resultset
			}
			else 
			{
				request.setAttribute("getCatLV1ErrMsg","Lỗi truy xuất danh mục LV1");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listCategories;
	}
	
	// lay tat ca danh muc level 2 co id danh muc goc la 'categoryLv1'
	public static ArrayList<Category> getAllCategoriesLV2(HttpServletRequest request, Connection conn, int categoryLv1){
		ArrayList<Category> listCategories = new ArrayList<>();
		
		// cau truy van select cac danh muc LV2
		String sql = "SELECT * FROM danh_muc WHERE danh_muc_goc = " + categoryLv1;
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			//thuc thi cau truy van -> luu vao RS
			ResultSet rs = ptmt.executeQuery();
			
			//duyet danh sach trong RS roi dua vao listCategories
			if (rs.isBeforeFirst())
			{
				while (rs.next())
				{
					int id = rs.getInt("id_dm"); // id danh mục
					String name = rs.getString("ten_dm"); // tên danh mục
					int rootId = rs.getInt("danh_muc_goc"); // id danh mục gốc (danh mục cha)
					
					Category cat = new Category(id, name, rootId);
					
					listCategories.add(cat);
				}
				rs.close(); // đóng đói tượng resultset
			}
			else 
			{
				request.setAttribute("getCatLV1ErrMsg","Lỗi truy xuất danh mục LV1");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listCategories;
	}
	
	// get category's name by id
	public static Category getCategoryById(HttpServletRequest request, Connection conn, int catId) {
		Category cat = new Category();
		
		String sql = "SELECT * FROM danh_muc WHERE id_dm = " + catId;
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ResultSet rs = ptmt.executeQuery();
			
			if(rs.isBeforeFirst()) {

				while(rs.next()) {
				
					cat.setId(catId);
					cat.setName(rs.getString("ten_dm"));
					cat.setRootId(rs.getInt("danh_muc_goc"));
				}
			}
			
			rs.close();
			
		} catch (SQLException e) {
			
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return cat;
	}

	// get category's quantity by id
	public static int getQuantityById(HttpServletRequest request, Connection conn, int catId) {
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS so_luong FROM san_pham s WHERE s.id_dm = ? OR s.id_dm IN (SELECT d.id_dm FROM danh_muc d WHERE d.danh_muc_goc = ?)";
		
		PreparedStatement ptmt;
		try {
			ptmt = conn.prepareStatement(sql);
			
			// set gia tri tham so cho cau truy van sql
			ptmt.setInt(1, catId);
			ptmt.setInt(2, catId);
			
			ResultSet rs = ptmt.executeQuery();
			
			if (rs.isBeforeFirst())
			{
				
				while(rs.next()) {
					
					result = rs.getInt("so_luong");
				}

				rs.close(); // đóng đối tượng resultset
			}
			
		} catch (SQLException e) {
			// send error message to caller
			request.setAttribute("errMsg", e.getMessage());
		}
		
		return result;
		
	}
}
