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

@WebServlet("/delete-from-wishlist")
public class DeleteFromWishlistContrller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteFromWishlistContrller() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("product_id"));
		int userId = Integer.parseInt(request.getParameter("user_id"));
		
		WishlistProduct prd = new WishlistProduct(productId, userId);
		
		try {
			Connection conn = DBConnection.createConnection();
			
			boolean isDeleted = WishlistDAO.removeProduct(request, conn, prd);
			
			if(isDeleted) {
				response.sendRedirect("wishlist");
				return;
			}
			else {
				request.setAttribute("errMsg", "Cannot delete product from Wishlist");
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
				return;
			}
			
		} catch (ClassNotFoundException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
			return;
		}
	}

}
