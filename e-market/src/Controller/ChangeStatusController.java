package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/change-status")
public class ChangeStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeStatusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("product_id"));
		
		boolean status = true;
		
		try {
			Connection conn = DBConnection.createConnection();
			
			boolean isUpdated = ProductDAO.updateStatus(request, conn, status, productId);
			
			if(isUpdated) {
				response.sendRedirect(request.getHeader("referer"));
				return;
			}
			
		} catch (ClassNotFoundException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
			return;
		}
		
	}

}
