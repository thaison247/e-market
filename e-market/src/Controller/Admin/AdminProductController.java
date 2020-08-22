package Controller.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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

@WebServlet("/admin-product")
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNumber = 1; // the default case
		if(request.getParameter("page") != null) { // the case there is 'page' value in query parameters 
			pageNumber = Integer.parseInt(request.getParameter("page"));
		}
		
		if (pageNumber < 1) pageNumber = 1;
		
		Connection conn = null;
		try {
			conn = DBConnection.createConnection();
			
			//PAGINATION: PHÂN TRANG
			int totalPrds = ProductDAO.getNumberOfPrds(request, conn); // total number of products
			int noPrdsPerPage = HELPER.ConstNumbers.prdsPerPage; // number of products per page 
			int noPages = totalPrds/noPrdsPerPage; // number of pages
			noPages = noPages==0 ? 1 : noPages; // number of pages
			if(totalPrds % noPrdsPerPage != 0) {
				noPages++;
			}
			if(pageNumber > noPages) pageNumber = noPages;
			
			
			// limit and offset used for sql query
			int limit = noPrdsPerPage;
			int offset = (pageNumber - 1) * noPrdsPerPage;
			
			// get list users
			List<Product> listProducts = ProductDAO.getProducts(request, conn, limit, offset);
			
			// array number of pages
			ArrayList<Integer> pages = new ArrayList<>();
			for(int i = 1; i <= noPages; i++) {
				pages.add(i);
			}
			
			System.out.println("pages array: " + pages.size());
			System.out.println("no pages: " + noPages);
			System.out.println("curr: " + pageNumber);
			
			conn.close();
			
			int from = offset + 1;
			int to = from + listProducts.size() - 1;
			
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			request.setAttribute("total", totalPrds);
			request.setAttribute("currPageNumber", pageNumber); // current page number 
			request.setAttribute("pages", pages); // array pages' number
			request.setAttribute("numberOfPages", noPages); // number of pages
			request.setAttribute("listProducts", listProducts);
			RequestDispatcher rd = request.getRequestDispatcher("Views/Admin/product.jsp");
			rd.forward(request, response);
			
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
