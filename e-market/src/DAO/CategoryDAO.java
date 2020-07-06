package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import BEAN.Category;

public class CategoryDAO {

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
					int id = rs.getInt("id_dm");
					String name = rs.getString("ten_dm");

					Category cat = new Category(id, name);
					
					listCategories.add(cat);
				}
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
}