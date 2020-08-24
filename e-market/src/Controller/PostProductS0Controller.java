package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.NormalUser;
import DAO.NormalUserDAO;
import DB.DBConnection;

@WebServlet("/post-product-s0")
public class PostProductS0Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostProductS0Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			Connection conn = DBConnection.createConnection();
			
			HttpSession session = request.getSession();
			NormalUser user = (NormalUser)session.getAttribute("user");
			
			// check if total number of user's personal product is more than 3 
			int totalPersonalPrd = NormalUserDAO.getTotalPersonalPrd(request, conn, user.getId());
			
			if(totalPersonalPrd >= 3) {
				request.setAttribute("overQuantity", true);
			}
			else {
				request.setAttribute("overQuantity", false);
			}
			
			// check if user already have a shop or not?
			boolean isShopOwner = NormalUserDAO.isShopOwner(request, conn, user.getId());
			request.setAttribute("isShopOwner", isShopOwner);
			
			RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step0.jsp");
			rd.forward(request, response);
			return;
			
		} catch (ClassNotFoundException | SQLException e) {
			
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
