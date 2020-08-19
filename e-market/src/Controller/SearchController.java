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

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// search text
		String inputText = request.getParameter("input_text");
		String [] words = inputText.split(" ");
		String text = "+" + String.join("+", words); // convert input_text string from 'A B' to '+A+B' (For full-text search MySql query) 
		
		Connection conn;
		try {
			// open DB connection
			conn = DBConnection.createConnection();
			
			// GET PRODUCTS (RESULT)
			List<Product> listProducts = ProductDAO.findProducts(request, conn, text);
			
			// send data to view
			request.setAttribute("inputText", inputText);
			request.setAttribute("listProducts", listProducts);
			RequestDispatcher rd = request.getRequestDispatcher("Views/search_result.jsp");
			rd.forward(request, response);
			return;
			
		} catch (ClassNotFoundException e) {
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
