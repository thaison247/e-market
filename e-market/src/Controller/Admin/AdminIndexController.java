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

import BEAN.NormalUser;
import DAO.NormalUserDAO;
import DB.DBConnection;

@WebServlet("/admin-user")
public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminIndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = null;
		try {
			conn = DBConnection.createConnection();
			
			// get list users
			List<NormalUser> listNormalUsers = NormalUserDAO.getListUsers(request, conn);
			
			conn.close();
			
			request.setAttribute("listUsers", listNormalUsers);
			RequestDispatcher rd = request.getRequestDispatcher("Views/Admin/user.jsp");
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
