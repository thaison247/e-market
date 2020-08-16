package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Category;
import BEAN.Comment;
import BEAN.User;

public class CommentDAO {

	public static List<Comment> getListCommentsByPrdId(HttpServletRequest request, Connection conn, int prdId){
		List<Comment> listComments = new ArrayList<>();
		
		String sql = "SELECT * FROM binh_luan b WHERE b.id_sp = " + prdId;
		
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			//thuc thi cau truy van -> luu vao RS
			ResultSet rs = ptmt.executeQuery();
			
			//duyet danh sach trong RS roi dua vao listComments
			if (rs.isBeforeFirst())
			{
				while (rs.next())
				{
					int id = rs.getInt("id_bl"); // id 
					Timestamp time = rs.getTimestamp("thoi_gian");
					String content = rs.getString("noi_dung");
					int rootId = 0;
					rootId = rs.getInt("binh_luan_goc");
					// get user
					int userId = rs.getInt("id_nd");
					User user = UserDAO.getUserById(request, conn, userId);
					//
					int productId = rs.getInt("id_sp");
					
					System.out.println("--------------" + rootId);
					System.out.println("--------------" + user.getName());
					
					// init comment instance
					Comment comment = new Comment(id, time, content, rootId, productId, user);
					
					listComments.add(comment);
				}
				
				rs.close(); // đóng đói tượng resultset
			}
			
			ptmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listComments;
	}
	
}
