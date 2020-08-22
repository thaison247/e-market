package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Category;
import BEAN.Product;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/category")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get catId and page number from parameter
		int catId = Integer.parseInt(request.getParameter("cat_id"));
		int pageNumber = 1; // the default case
		if(request.getParameter("page") != null) { // the case there is 'page' value in query parameters 
			pageNumber = Integer.parseInt(request.getParameter("page"));
		}
		
		// set current category id to request scope
		request.setAttribute("currCatId", catId);

		// pagination, get data, send data to jsp file
		try {
			Connection conn = DBConnection.createConnection();
			
			//PAGINATION: PHÂN TRANG
			int totalPrdsInCat = ProductDAO.getNumberOfPrdsInCat(request, conn, catId); // total number of products in a category
			int noPrdsPerPage = HELPER.ConstNumbers.prdsPerPage; // number of products per page 
			int noPages = totalPrdsInCat/noPrdsPerPage; // number of pages
			noPages = noPages==0 ? 1 : noPages; // number of pages
			if(totalPrdsInCat % noPrdsPerPage != 0) {
				noPages++;
			}
			if(pageNumber > noPages) pageNumber = noPages;
			
			// limit and offset used for sql query
			int limit = noPrdsPerPage;
			int offset = (pageNumber - 1) * noPrdsPerPage;
			
			// get list products
			List<Product> listProducts = ProductDAO.getProductsByCatId(request, conn, catId, limit, offset);
			
			// array number of pages
			ArrayList<Integer> pages = new ArrayList<>();
			for(int i = 1; i <= noPages; i++) {
				pages.add(i);
			}
			
			// category information
			Category cat = CategoryDAO.getCategoryById(request, conn, catId);
			
			// set data and send to jsp file to show
			request.setAttribute("currPageNumber", pageNumber); // current page number 
			request.setAttribute("pages", pages); // array pages' number
			request.setAttribute("listProducts", listProducts); // list products to show
			request.setAttribute("cat", cat); // category instance
			RequestDispatcher rd = request.getRequestDispatcher("Views/prds_in_cat.jsp");
			rd.forward(request, response);
			
		} catch (ClassNotFoundException e) {
			// send error message to view error.jsp
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/prds_in_cat.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
