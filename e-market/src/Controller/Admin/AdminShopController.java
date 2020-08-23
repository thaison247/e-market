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
import DAO.ShopDAO;
import DB.DBConnection;

@WebServlet("/admin-shop")
public class AdminShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn;
		try {
			conn = DBConnection.createConnection();

			// get all shop
			Map<Shop, String> allShops = ShopDAO.getAllShops(request, conn);
			
			request.setAttribute("allShops", allShops);
			RequestDispatcher rd = request.getRequestDispatcher("Views/Admin/shop.jsp");
			rd.forward(request, response);
			return;
			
		} catch (ClassNotFoundException | SQLException e) {
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
