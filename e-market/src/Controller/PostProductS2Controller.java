package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Category;
import BEAN.PersonalProduct;
import BEAN.Product;
import BEAN.User;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;


@WebServlet("/post-product-s2")
public class PostProductS2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PostProductS2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// lay id cua DANH MUC LV1 nguoi dung vua chon 
		int categoryLv1 = Integer.parseInt(request.getParameter("category-lv1"));
		
		// lay tat ca DANH MUC LV2 (co id danh muc goc la 'categoryLv1')
		Connection conn;
		try {
			conn = DBConnection.createConnection();
			
			ArrayList<Category> listCategoriesLV2 = CategoryDAO.getAllCategoriesLV2(request, conn, categoryLv1);
			
			conn.close();
			
			request.setAttribute("listCategoriesLV2", listCategoriesLV2);
			RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step2.jsp");
			rd.forward(request, response);
			return;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// set char encoding UTF-8 de luu ky tu tieng Viet vao DB
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("UTF-8");
		}
		
		HttpSession session = request.getSession();
		
		// set cac truong lieu
		String name = request.getParameter("input_title"); // ten san pham
		int price = Integer.parseInt(request.getParameter("input_price")); // gia san pham
		int categoryId = Integer.parseInt(request.getParameter("input_category")); // id danh muc (lv2)
		String shortDesc = request.getParameter("input_shortDescription"); // mo ta ngan
		String detailDesc = request.getParameter("input_detailDescription"); // mo ta chi tiet
		boolean isSold = false; // tinh trang da ban: false
		User user = (User) session.getAttribute("user"); // nguoi dung da dang nhap vao he thong
		int sellerId = user.getId(); // id nguoi ban
		long millis=System.currentTimeMillis();  //lay thoi gian hien tai (milisecond)
	    java.sql.Date date=new java.sql.Date(millis); // ngay dang san pham
	    
	    // khoi tao doi tuong Product
		PersonalProduct prd = new PersonalProduct(name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
		
		System.out.println(prd.getName());
		System.out.println(prd.getPrice());
		System.out.println(prd.getCategoryId());
		
		// ghi xuong DB
		try {
			Connection conn = DBConnection.createConnection();
			
			int productId = ProductDAO.insertPersonalProduct(request, conn, prd);
			conn.close();
			
			if(productId > 0) {
				session.setAttribute("productId", productId); // gui productId de dat ten cho thu muc luu hinh anh cua san pham
				request.setAttribute("msg", "Insert product successfully!");
				
				// chuyen toi trang upload images
				RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step3.jsp");
				rd.forward(request, response);
				return;
			}
			else {
//				request.setAttribute("errMsg", "Insert product fail!");
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
				return;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
			return;
		}
		
	}

}
