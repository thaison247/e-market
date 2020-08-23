package Controller.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Shop;
import BEAN.ShopRegisterForm;
import DAO.ShopDAO;
import DAO.ShopRegistrationFormDAO;
import DB.DBConnection;

@WebServlet("/admin-shop-request")
public class AdminShopRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminShopRequestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			Connection conn = DBConnection.createConnection();
			
			// get open shop request (shop registration form) 
			Map<ShopRegisterForm, String> allForms = ShopRegistrationFormDAO.getAllForms(request, conn);
			
			request.setAttribute("allForms", allForms);
			RequestDispatcher rd = request.getRequestDispatcher("Views/Admin/shop_request.jsp");
			rd.forward(request, response);
			return;
			
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get params
		String shopName = request.getParameter("shop_name");
		int ownerId = Integer.parseInt(request.getParameter("owner_id"));
		int categoryId = Integer.parseInt(request.getParameter("category_id"));
		int frmId = Integer.parseInt(request.getParameter("frm_id"));
		
		// get date
		long millis=System.currentTimeMillis();  //lay thoi gian hien tai (milisecond)
	    java.sql.Date date=new java.sql.Date(millis); // ngay dang san pham
		
		// create shop instance
		Shop shop = new Shop();
		shop.setName(shopName);
		shop.setOwner(ownerId);
		shop.setCategoryId(categoryId);
		shop.setBeginningDate(date);
		
		Connection conn;
		try {
			conn = DBConnection.createConnection();
			
			ShopRegistrationFormDAO.acceptForm(request, conn, frmId);
			
			int check = ShopDAO.insertShop(request, conn, shop);
			
			if(check != 0){
				
				conn.close();
				
				response.sendRedirect("admin-shop-request");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

}
