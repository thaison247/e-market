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

import BEAN.Category;
import DAO.CategoryDAO;
import DB.DBConnection;

@WebServlet("/admin-category")
public class AdminCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Connection conn = DBConnection.createConnection();
			
			// get all categories
			Map<Category, String> listCategories = CategoryDAO.listCategoryWithRootName(request, conn);
			
			conn.close();
			
			request.setAttribute("listCategories", listCategories);
			RequestDispatcher rd = request.getRequestDispatcher("Views/Admin/category.jsp");
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
