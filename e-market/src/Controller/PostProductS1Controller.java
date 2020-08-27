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
import BEAN.NormalUser;
import DAO.CategoryDAO;
import DAO.ShopDAO;
import DB.DBConnection;


@WebServlet("/post-product-s1")
public class PostProductS1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PostProductS1Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String type = request.getParameter("type");
		
		try {
			Connection conn = DBConnection.createConnection();
			
			//get type of product (shop or personal)
			if(type.equals("shop") == true) { // if shop product =>  => SKIP STEP 1 
				
				NormalUser user = (NormalUser)session.getAttribute("user");
				
				// get category id of user's shop 
				int catId = ShopDAO.getShopCatId(request, conn, user.getId());
				
				// get list categories lv2
				ArrayList<Category> listCategoriesLV2 = CategoryDAO.getAllCategoriesLV2(request, conn, catId);

				conn.close();
				
				// go to STEP 2
				request.setAttribute("type", "shop");
				request.setAttribute("listCategoriesLV2", listCategoriesLV2);
				RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step2.jsp");
				rd.forward(request, response);
				return;
				
			}else { // if personal product => GO TO STEP 1
				request.setAttribute("type", "personal");

				// lay danh sach DANH MUC LEVEL 1 tu DB
				ArrayList<Category> listCategoriesLV1 = CategoryDAO.getAllCategoriesLV1(request, conn);

				// dong ket noi DB
				conn.close();
				
				// go to STEP 1
				request.setAttribute("listCategoriesLV1", listCategoriesLV1);
				RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step1.jsp");
				rd.forward(request, response);
				return;
			}
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step1.jsp");
			rd.forward(request, response);
			return;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
