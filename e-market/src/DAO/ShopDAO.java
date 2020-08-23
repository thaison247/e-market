package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import BEAN.Shop;

public class ShopDAO {
	
	public static Shop getShopByUserId(HttpServletRequest request, Connection conn, int userId) throws SQLException {
		
		Shop shop = new Shop();
		
		String sql = "SELECT * FROM cua_hang WHERE chu_ch = " + userId;
		
		PreparedStatement ptmt = conn.prepareStatement(sql);
		
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.isBeforeFirst()) {
			
			while(rs.next()) {
				
				shop.setId(rs.getInt("id_ch"));
				shop.setName(rs.getString("ten_ch"));
				shop.setBeginningDate(rs.getDate("ngay_tao"));
				shop.setOwner(rs.getInt("chu_ch"));
				shop.setCategoryId(rs.getInt("id_dm"));
				shop.setStatus(rs.getBoolean("tinhtrang"));
			}
			
		}
		
		rs.close();
		
		ptmt.close();
		
		return shop;
	}
	
	
	public static int insertShop(HttpServletRequest request, Connection conn, Shop shop) throws SQLException{
	
		int newId = 0;
		
		String sql = "INSERT INTO cua_hang(ten_ch, ngay_tao, chu_ch, id_dm) VALUES(?,?,?,?)";
		
		PreparedStatement ptmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		
		ptmt.setString(1, shop.getName());
		ptmt.setDate(2, shop.getBeginningDate());
		ptmt.setInt(3, shop.getOwner());
		ptmt.setInt(4, shop.getCategoryId());
		
		int check = ptmt.executeUpdate();
		
		if(check == 0) {
			throw new SQLException("Cannot insert comment");
		}
		else {
			
			ResultSet rs = ptmt.getGeneratedKeys();
			if (rs.next()) {
			  newId = rs.getInt(1); // get this shop id after inserted into DB		
			}
			ptmt.close();
			
		}
		
		return newId;		
	}
}
