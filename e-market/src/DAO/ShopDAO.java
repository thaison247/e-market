package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

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
	
public static Map<Shop, String> getAllShops(HttpServletRequest request, Connection conn) throws SQLException{
		
		Map<Shop, String> allShops = new HashMap<>();
		
		String sql = "SELECT id_ch, ngay_tao, ten_ch, chu_ch, id_dm, ten_dm FROM cua_hang JOIN danh_muc USING(id_dm)";
		
		PreparedStatement ptmt = conn.prepareStatement(sql);
		
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.isBeforeFirst()) {
			
			while(rs.next()) {
				
				Shop shop = new Shop();
				
				shop.setId(rs.getInt("id_ch"));
				shop.setName(rs.getString("ten_ch"));
				shop.setBeginningDate(rs.getDate("ngay_tao"));
				shop.setOwner(rs.getInt("chu_ch"));
				shop.setCategoryId(rs.getInt("id_dm"));
				
				String categoryName = rs.getString("ten_dm");
				
				allShops.put(shop, categoryName);
			}
		}
		
		rs.close();
		ptmt.close();
		
		TreeMap<Shop, String> map = new TreeMap<>();
		map.putAll(allShops);
		
		return map;
	}
	
	public static int getShopId(HttpServletRequest request, Connection conn, int userId) throws SQLException {
		
		int shopId = 0;
		
		String sql = "SELECT id_ch FROM cua_hang WHERE chu_ch = " + userId;
		
		PreparedStatement ptmt = conn.prepareStatement(sql);
		
		ResultSet rs = ptmt.executeQuery();
		
		if(rs.isBeforeFirst()) {
			
			while(rs.next()) {
				
				shopId = rs.getInt(1);
			}
			
		}
		
		rs.close();
		
		ptmt.close();
		
		return shopId;
	}
	
	public static int getShopCatId(HttpServletRequest request, Connection conn, int userId) throws SQLException {
		int catId = 0;
		
		String sql = "SELECT id_dm FROM cua_hang WHERE chu_ch = "+userId;
		
		PreparedStatement ptmt = conn.prepareStatement(sql);
		
		ResultSet rs = ptmt.executeQuery();
		
		while(rs.next()) {
			catId = rs.getInt(1);
		}
		
		return catId;
		
	}

}
