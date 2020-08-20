package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/delete-product")
public class DeleteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId = Integer.parseInt(request.getParameter("product_id"));
		
		try {
			Connection conn = DBConnection.createConnection();
			
			boolean isDeleted = ProductDAO.setAsDeleted(request, conn, productId);
			
			if(isDeleted) {
				response.sendRedirect(request.getHeader("referer"));
				return;
			}
			else {
				request.setAttribute("errMsg", "Cannot delete product");
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
				return;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
			return;
		}
	}

}
