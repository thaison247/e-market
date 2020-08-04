package BEAN;

import java.sql.Date;

public class PersonalProduct extends Product{
	
	public PersonalProduct(int id, String name, Date date, int price, String shortDesc, String detailDesc, boolean isSold, int categoryId, int sellerId) {
		super(id, name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
	}
	
	public PersonalProduct(String name, Date date, int price, String shortDesc, String detailDesc, boolean isSold,
			int categoryId, int sellerId) {
		super(name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
	}
	
	public PersonalProduct(String name, Date date, int price, String shortDesc, String detailDesc, int categoryId,
			int sellerId) {
		super(name, date, price, shortDesc, detailDesc, categoryId, sellerId);
	}
	
	public PersonalProduct() {
		super();
	}
}
