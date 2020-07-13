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
					
					Category cat = new Category(id, name, rootId);
					
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
	
	
}
