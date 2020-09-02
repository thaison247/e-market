package BEAN;

import java.sql.Date;

public class Shop implements Comparable<Shop> {
	private int id;
	private String name;
	private Date beginningDate;
	private int categoryId;
	private int ownerId;
	private boolean status;
	
	public Shop(){
		status = true;
	}
	
	public Shop(int id, String name, Date beginningDate, int categoryId, int owner, boolean status) {
		super();
		this.id = id;
		this.name = name;
		this.beginningDate = beginningDate;
		this.categoryId = categoryId;
		this.ownerId = owner;
		this.status = status;
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
	public Date getBeginningDate() {
		return beginningDate;
	}
	public void setBeginningDate(Date beginningDate) {
		this.beginningDate = beginningDate;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getOwner() {
		return ownerId;
	}
	public void setOwner(int owner) {
		this.ownerId = owner;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public int compareTo(Shop o) {
		if(this.id > o.id) return 1;
		if(this.id < o.id) return -1;
		return 0;
	}
	
	
	
}
