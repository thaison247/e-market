package BEAN;

public class Category {
	private int categoryId;  // id danh mục
	private String categoryName; // tên danh mục
	private int rootCategoryId; // id danh mục gốc (danh mục cha)
	
	public Category(int categoryId, String categoryName, int rootCategoryId) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.rootCategoryId = rootCategoryId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getRootCategoryId() {
		return rootCategoryId;
	}

	public void setRootCategoryId(int rootCategoryId) {
		this.rootCategoryId = rootCategoryId;
	}

}
