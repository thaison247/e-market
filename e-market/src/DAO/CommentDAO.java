package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Comment;
import BEAN.User;

public class CommentDAO {
	
	public static int insertComment(HttpServletRequest request, Connection conn, Comment cmt) {
		int cmtId = 0; // comment id after inserted into Comment Table in DB
		
		int check = 0;
		
		try {
			
			String sql;
			PreparedStatement ptmt;
			
			if(cmt.getRootId() == 0) { // if this comment is a primary (root) comment
				sql = "INSERT INTO binh_luan(thoi_gian, noi_dung, id_nd, id_sp) VALUES(?,?,?,?)";
				
				ptmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				
				ptmt.setTimestamp(1, cmt.getTime());
				ptmt.setString(2, cmt.getContent());
				ptmt.setInt(3, cmt.getUser().getId());
				ptmt.setInt(4, cmt.getProductId());
				
				
				
				check = ptmt.executeUpdate();
			}
			else { // if this comment is a reply of a primary (root) comment
				sql = "INSERT INTO binh_luan(thoi_gian, noi_dung, binh_luan_goc, id_nd, id_sp) VALUES(?,?,?,?,?)";
				
				ptmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				
				ptmt.setTimestamp(1, cmt.getTime());
				ptmt.setString(2, cmt.getContent());
				ptmt.setInt(3, cmt.getRootId());
				ptmt.setInt(4, cmt.getUser().getId());
				ptmt.setInt(5, cmt.getProductId());
				
				check = ptmt.executeUpdate();
			}
			
			
			if(check == 0) {
				throw new SQLException("Cannot insert comment");
			}
			else {
				
				ResultSet rs = ptmt.getGeneratedKeys();
				if (rs.next()) {
				  cmtId = rs.getInt(1); // get this Comment id after inserted into DB		
				}
				
				ptmt.close();
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
		return cmtId;
	}
	

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
					
					// init comment instance
					Comment comment = new Comment(id, time, content, rootId, productId, user);
					
					listComments.add(comment);
				}
				
				rs.close(); // 
			}
			
			ptmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listComments;
	}
	
}
