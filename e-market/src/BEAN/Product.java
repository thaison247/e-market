package BEAN;

import java.sql.Date;

public class Product {
	private int id;
	private String name;
	private Date date;
	private int price;
	private String shortDesc;
	private String detailDesc;
	private boolean isSold;
	private int categoryId;
	private int sellerId;
	
	public Product(int id, String name, Date date, int price, String shortDesc, String detailDesc, boolean isSold,
			int categoryId, int sellerId) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
		this.price = price;
		this.shortDesc = shortDesc;
		this.detailDesc = detailDesc;
		this.isSold = isSold;
		this.categoryId = categoryId;
		this.sellerId = sellerId;
	}
	
	public Product(String name, Date date, int price, String shortDesc, String detailDesc, boolean isSold,
			int categoryId, int sellerId) {
		super();
		this.name = name;
		this.date = date;
		this.price = price;
		this.shortDesc = shortDesc;
		this.detailDesc = detailDesc;
		this.isSold = isSold;
		this.categoryId = categoryId;
		this.sellerId = sellerId;
	}
	
	public Product(String name, Date date, int price, String shortDesc, String detailDesc, int categoryId,
			int sellerId) {
		super();
		this.name = name;
		this.date = date;
		this.price = price;
		this.shortDesc = shortDesc;
		this.detailDesc = detailDesc;
		this.categoryId = categoryId;
		this.sellerId = sellerId;
		this.isSold = false;
	}
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getShortDesc() {
		return shortDesc;
	}
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}
	public String getDetailDesc() {
		return detailDesc;
	}
	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}
	public boolean isSold() {
		return isSold;
	}
	public void setSold(boolean isSold) {
		this.isSold = isSold;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	
	
}
