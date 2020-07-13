package BEAN;

public class Category {
	private int id;  // id danh mục
	private String name; // tên danh mục
	private int rootId; // id danh mục gốc (danh mục cha)
	
	public Category(int id, String name, int rootId) {
		super();
		this.id = id;
		this.name = name;
		this.rootId = rootId;
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
	public int getRootId() {
		return rootId;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
}
