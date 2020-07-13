package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Category;
import DAO.CategoryDAO;
import DB.DBConnection;


@WebServlet("/PostProductS2")
public class PostProductS2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PostProductS2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// lay id cua DANH MUC LV1 nguoi dung vua chon 
		System.out.println(request.getParameter("category-lv1"));
		int categoryLv1 = Integer.parseInt(request.getParameter("category-lv1"));
		
		// lay tat ca DANH MUC LV2 (co id danh muc goc la 'categoryLv1')
		Connection conn;
		try {
			conn = DBConnection.createConnection();
			
			ArrayList<Category> listCategoriesLV2 = CategoryDAO.getAllCategoriesLV2(request, conn, categoryLv1);
			
			conn.close();
			
			request.setAttribute("listCategoriesLV2", listCategoriesLV2);
			RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step2.jsp");
			rd.forward(request, response);
			return;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
