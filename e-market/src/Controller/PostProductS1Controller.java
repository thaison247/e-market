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


@WebServlet("/post-product-s1")
public class PostProductS1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PostProductS1Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = null;
		try {
			conn = DBConnection.createConnection();
			
			// lay danh sach DANH MUC LEVEL 1 tu DB
			ArrayList<Category> listCategoriesLV1 = CategoryDAO.getAllCategoriesLV1(request, conn);

			// dong ket noi DB
			conn.close();
			
			request.setAttribute("listCategoriesLV1", listCategoriesLV1);
			RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step1.jsp");
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
