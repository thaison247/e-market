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
import BEAN.PersonalProduct;
import BEAN.User;
import DAO.NormalUserDAO;
import DAO.ProductDAO;
import DAO.UserDAO;
import DB.DBConnection;


@WebServlet("/personal-products")
public class PersonalProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PersonalProductsController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		//get user in session
//		HttpSession session = request.getSession();
//		User user = (User)session.getAttribute("user");
		
		// get user id from request parameter
		int userId = Integer.parseInt(request.getParameter("user_id"));
		
		//get list personal products
		Connection conn;
		try {
			// open DB connection
			conn = DBConnection.createConnection();
			
			// GET USER
			User user = UserDAO.getUserById(request, conn, userId);
			
			// get products
			List<PersonalProduct> listProducts = ProductDAO.getProductsByUserId(request, conn, userId);
			
			// check if total number of user's personal product is more than 3 
			int totalPersonalPrd = NormalUserDAO.getTotalPersonalPrd(request, conn, user.getId());
			
			if(totalPersonalPrd >= 3) {
				request.setAttribute("overQuantity", true);
			}
			else {
				request.setAttribute("overQuantity", false);
			}
			
			// send data to view
			request.setAttribute("user", user);
			request.setAttribute("listProducts", listProducts);
			RequestDispatcher rd = request.getRequestDispatcher("Views/personal_product.jsp");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
