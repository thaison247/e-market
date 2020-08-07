package BEAN;

public class Category {
	private int id;  // id danh mục
	private String name; // tên danh mục
	private int rootId; // id danh mục gốc (danh mục cha)
	private int quantity; // số lượng sản phẩm thuộc danh mục này
	
	public Category() {
		this.quantity = 0;
	}
	
	public Category(int id, String name, int rootId) {
		super();
		this.id = id;
		this.name = name;
		this.rootId = rootId;
	}
	
	public Category(int id, String name, int rootId, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.rootId = rootId;
		this.quantity = quantity;
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
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
