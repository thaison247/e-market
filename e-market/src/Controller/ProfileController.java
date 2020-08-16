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
import javax.servlet.http.HttpSession;

import BEAN.User;
import DAO.UserDAO;
import DB.DBConnection;


@WebServlet("/profile")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		// get userId from request parameter
		int userId = Integer.parseInt(request.getParameter("user_id"));
		
		// get user
		User user = null;
		
		if(session.getAttribute("authenticated") != null) { // if user has been logging in
			user = (User)session.getAttribute("user");
			
			if(userId != user.getId()) { 
				Connection conn = null;
				try {
					conn = DBConnection.createConnection();

					//get user from DB
					user = UserDAO.getUserById(request, conn, userId);
					
					//close DB connection
					conn.close();
				} catch (ClassNotFoundException | SQLException e) {
					request.setAttribute("errMsg", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
					rd.forward(request, response);
					return;
				}
				
			}
		}
		else { // if user hasn't logged in yet
			Connection conn = null;
			try {
				conn = DBConnection.createConnection();

				//get user from DB
				user = UserDAO.getUserById(request, conn, userId);
				
				//close DB connection
				conn.close();
			} catch (ClassNotFoundException | SQLException e) {
				request.setAttribute("errMsg", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
				return;
			}
		}
		
		//set thong tin user gui qua view profile.jsp
		request.setAttribute("user", user);
		
		RequestDispatcher rd = request.getRequestDispatcher("Views/profile.jsp");
		rd.forward(request, response);
		return;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
