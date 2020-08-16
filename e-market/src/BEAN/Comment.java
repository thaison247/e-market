package BEAN;

import java.sql.Timestamp;

public class Comment {
	private int id;
	private Timestamp time;
	private String content;
	private int rootId;
	private int productId;
	private User user;
	
	public Comment() {
		
	}
	
	public Comment(int id, Timestamp time, String content, int rootId, int productId, User user) {
		super();
		this.id = id;
		this.time = time;
		this.content = content;
		this.rootId = rootId;
		this.productId = productId;
		this.user = user;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRootId() {
		return rootId;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
