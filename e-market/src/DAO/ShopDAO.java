package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
}
