package BEAN;

public class WishlistProduct {
	private int productId;
	private int userId;
	
	public WishlistProduct() {

	}
	
	public WishlistProduct(int productId, int userId) {
		super();
		this.productId = productId;
		this.userId = userId;
	}
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}
