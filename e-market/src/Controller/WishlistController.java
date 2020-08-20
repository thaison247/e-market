package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.NormalUser;
import BEAN.Product;
import DAO.WishlistDAO;
import DB.DBConnection;

@WebServlet("/wishlist")
public class WishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WishlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		NormalUser user = (NormalUser)session.getAttribute("user");
		
		try {
			Connection conn = DBConnection.createConnection();
			
			List<Product> listProducts = WishlistDAO.getWishlistByUserId(request, conn, user.getId());
			
			request.setAttribute("listProducts", listProducts);
			RequestDispatcher rd = request.getRequestDispatcher("Views/wishlist.jsp");
			rd.forward(request, response);
			
		} catch (ClassNotFoundException e) {

			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
