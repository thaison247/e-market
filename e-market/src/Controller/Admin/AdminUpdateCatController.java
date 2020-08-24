package Controller.Admin;

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

import BEAN.Category;
import DAO.CategoryDAO;
import DB.DBConnection;

@WebServlet("/admin-category-update")
public class AdminUpdateCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminUpdateCatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get params 
		int catId = Integer.parseInt(request.getParameter("cat_id"));
		String catName = request.getParameter("cat_name");
		int rootId = Integer.parseInt(request.getParameter("root_id"));
		
		try {
			Connection conn = DBConnection.createConnection();
			
			// get all categories
			List<Category> listCategoriesLv1 = CategoryDAO.getAllCategoriesLV1(request, conn);
			
			conn.close();

			request.setAttribute("catId", catId);
			request.setAttribute("catName", catName);
			request.setAttribute("rootId", rootId);
			request.setAttribute("listCategoriesLv1", listCategoriesLv1);
			RequestDispatcher rd = request.getRequestDispatcher("Views/Admin/update_cat.jsp");
			rd.forward(request, response);
			return;
			
		} catch (ClassNotFoundException | SQLException e) {

			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get params 
		int catId = Integer.parseInt(request.getParameter("cat_id"));
		String catName = request.getParameter("cat_name");
		int rootId = Integer.parseInt(request.getParameter("root_id"));
		
		Category cat = new Category();
		cat.setId(catId);
		cat.setName(catName);
		cat.setRootId(rootId);
		
		try {
			Connection conn = DBConnection.createConnection();

			int check = CategoryDAO.updateCategory(request, conn, cat);
			
			if(check != 0) {
				response.sendRedirect("admin-category");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

}
