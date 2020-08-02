package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;


@WebServlet("/ProductDetail")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get product id
		String productIdStr = request.getParameter("product_id");
		int productId = Integer.parseInt(productIdStr);
		
		try {
			Connection conn = DBConnection.createConnection();
			
			Product prd = ProductDAO.getProductById(request, conn, productId);
			
			request.setAttribute("product", prd);
			RequestDispatcher rd = request.getRequestDispatcher("Views/product_details.jsp");
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
