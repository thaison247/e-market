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


@WebServlet("/HomeForward")
public class HomeForward extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public HomeForward() {
    	super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			// tạo kết nối database
			Connection conn = DBConnection.createConnection();
			
			// lay danh sach Category vao listCategories
			ArrayList<Category> listCategories = CategoryDAO.getAllCategories(request, conn);
			
			// set attribute để truyền dữ liệu đi
			request.setAttribute("listCategories", listCategories);
			
			// đóng kết nối database
			conn.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// chuyển tới trang HOME
		RequestDispatcher rd = request.getRequestDispatcher("Views/home.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
