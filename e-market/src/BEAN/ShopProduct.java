package BEAN;

import java.sql.Date;

public class ShopProduct extends Product{
	private int shopId;

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	
	public ShopProduct(String name, Date date, int price, String shortDesc, String detailDesc, boolean isSold,
			int categoryId, int sellerId) {
		super(name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
	}

	public ShopProduct(String name, Date date, int price, String shortDesc, String detailDesc, boolean isSold,
			int categoryId, int sellerId, int shopId) {
		super(name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
		this.shopId = shopId;
	}
	
	public ShopProduct(int id, String name, Date date, int price, String shortDesc, String detailDesc, boolean isSold,
			int categoryId, int sellerId, int shopId) {
		super(id, name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
		this.shopId = shopId;
	}
}
