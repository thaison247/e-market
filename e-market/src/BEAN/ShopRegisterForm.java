package BEAN;

import java.sql.Date;

public class ShopRegisterForm {
	private int id;
	private Date date;
	private String name;
	private int ownerId;
	private int categoryId;
	private boolean isAccepted;
	
	public ShopRegisterForm() {
		isAccepted = false;
	}
	
	public ShopRegisterForm(int id, Date date, String name, int owner, int categoryId, boolean isAccepted) {
		super();
		this.id = id;
		this.date = date;
		this.name = name;
		this.ownerId = owner;
		this.categoryId = categoryId;
		this.isAccepted = isAccepted;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int owner) {
		this.ownerId = owner;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public boolean isAccepted() {
		return isAccepted;
	}
	public void setAccepted(boolean isAccepted) {
		this.isAccepted = isAccepted;
	}
}
