package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Category;
import BEAN.NormalUser;
import BEAN.Shop;
import BEAN.ShopProduct;
import BEAN.ShopRegisterForm;
import BEAN.User;
import DAO.CategoryDAO;
import DAO.NormalUserDAO;
import DAO.ProductDAO;
import DAO.ShopDAO;
import DAO.ShopRegistrationFormDAO;
import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/shop")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userId;
		if(request.getParameter("user_id")==null) {
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			userId=user.getId();
		}
		else {
			userId = Integer.parseInt(request.getParameter("user_id"));
		}
		
		
		Connection conn;
		try {
			conn = DBConnection.createConnection();
			
			if(UserDAO.isShopOwner(request, conn, userId)) {  // if user is owning a shop
				
				request.setAttribute("existedShop", true);
				
				// GET USER
				NormalUser user = NormalUserDAO.getUserById(request, conn, userId);
				
				// get shop information
				Shop shop = ShopDAO.getShopByUserId(request, conn, userId);
				
				// get list product in shop
				List<ShopProduct> listProducts = ProductDAO.getShopProductsByUserId(request, conn, userId);
				
				// send data to view
				request.setAttribute("user", user);
				request.setAttribute("shop", shop);
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("Views/shop.jsp");
				rd.forward(request, response);
				return;
			}
			else { // if user is not owning a shop
				
				// GET USER
				NormalUser user = NormalUserDAO.getUserById(request, conn, userId);
				
				if(UserDAO.isWaitingAdminAcceptance(request, conn, userId)) {// if user is waiting for admin acceptance
					
					request.setAttribute("isWaiting", true);
					
					// get form information
					ShopRegisterForm frm = ShopRegistrationFormDAO.getFormByUserId(request, conn, user.getId());
					
					request.setAttribute("frm", frm);
					
				}
				else {
					
					request.setAttribute("isWaiting", false);
				}

				// get list category lv 1
				List<Category> listCategoriesLv1 = CategoryDAO.getAllCategoriesLV1(request, conn);
				request.setAttribute("listCategoriesLv1", listCategoriesLv1);
				
				request.setAttribute("user", user);
				request.setAttribute("existedShop", false);
				RequestDispatcher rd = request.getRequestDispatcher("Views/shop.jsp");
				rd.forward(request, response);
				return;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get params
		int ownerId = Integer.parseInt(request.getParameter("owner_id"));
		String name = request.getParameter("shop_name");
		int categoryId = Integer.parseInt(request.getParameter("category_id"));
		
		// get date
		long millis=System.currentTimeMillis();  //lay thoi gian hien tai (milisecond)
	    java.sql.Date date=new java.sql.Date(millis); // ngay dang san pham
	    // create Shop registration form
	    ShopRegisterForm frm = new ShopRegisterForm();
	    frm.setName(name);
	    frm.setCategoryId(categoryId);
	    frm.setOwnerId(ownerId);
	    frm.setDate(date);
	    frm.setAccepted(false);
	    
	    //write down to database
	    Connection conn;
		try {
			conn = DBConnection.createConnection();
			
			int check = ShopRegistrationFormDAO.insertForm(request, conn, frm);
			
			if(check != 0){
				
				// GET USER
				NormalUser user = NormalUserDAO.getUserById(request, conn, ownerId);
				
				
				request.setAttribute("isWaiting", true);
				
				// get form information
				ShopRegisterForm form = ShopRegistrationFormDAO.getFormByUserId(request, conn, user.getId());
				
				request.setAttribute("frm", form);
				// get list category lv 1
				List<Category> listCategoriesLv1 = CategoryDAO.getAllCategoriesLV1(request, conn);
				request.setAttribute("listCategoriesLv1", listCategoriesLv1);
				
				request.setAttribute("user", user);
				request.setAttribute("existedShop", false);
				
				RequestDispatcher rd = request.getRequestDispatcher("Views/shop.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("errMsg", "Insert form fail");
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

}
