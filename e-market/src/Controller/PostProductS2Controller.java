package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
import BEAN.Product;
import BEAN.User;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;


@WebServlet("/PostProductS2")
public class PostProductS2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PostProductS2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// lay id cua DANH MUC LV1 nguoi dung vua chon 
		System.out.println(request.getParameter("category-lv1"));
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

		HttpSession session = request.getSession();
		
		// set cac truong lieu tu
		String name = request.getParameter("input_title"); // ten san pham
		int price = Integer.parseInt(request.getParameter("input_price")); // gia san pham
		int categoryId = Integer.parseInt(request.getParameter("input_category")); // id danh muc (lv2)
		String shortDesc = request.getParameter("input_shortDescription"); // mo ta ngan
		String detailDesc = request.getParameter("input_detailDescription"); // mo ta chi tiet
		boolean isSold = false; // tinh trang da ban: false
		User user = (User) session.getAttribute("user"); // nguoi dung da dang nhap vao he thong
		int sellerId = user.getId(); // id nguoi ban
		//lay ngay hien tai
		long millis=System.currentTimeMillis();  
	    java.sql.Date date=new java.sql.Date(millis); 
	    System.out.println(date);
	    
	    // khoi tao doi tuong Product
		Product prd = new Product(name, date, price, shortDesc, detailDesc, isSold, categoryId, sellerId);
		
		// ghi xuong DB
		try {
			Connection conn = DBConnection.createConnection();
			
			int productId = ProductDAO.insertProduct(request, conn, prd);
			
			conn.close();
			
			if(productId > 0) {
				request.setAttribute("postPrdMsg", "Insert product successfully!");
				response.sendRedirect("PostProductS3");
				return;
			}
			else {
				request.setAttribute("postPrdErrMsg", "Insert product fail!");
				RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step2.jsp");
				rd.forward(request, response);
				return;
			}
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
