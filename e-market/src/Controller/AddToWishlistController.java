package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.WishlistProduct;
import DAO.WishlistDAO;
import DB.DBConnection;

@WebServlet("/add-to-wishlist")
public class AddToWishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddToWishlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("user_id"));
		int productId = Integer.parseInt(request.getParameter("product_id"));
		
		Connection conn;
		try {
			// open connection to database
			conn = DBConnection.createConnection(); 
			
			// create WishlistProduct object
			WishlistProduct prd = new WishlistProduct(productId, userId);

			// insert comment to DB
			int check = WishlistDAO.insertProduct(request, conn, prd);
			
			if(check == 0) {
				request.setAttribute("errMsg", "Cannot insert product into wishlist");
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
				return;
			}
			else {
				response.sendRedirect("product-detail?product_id="+productId);
				return;
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
