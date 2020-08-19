package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Comment;
import BEAN.User;
import DAO.CommentDAO;
import DAO.UserDAO;
import DB.DBConnection;


@WebServlet("/comment")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CommentController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get request params from Comment Form
		int userId = Integer.parseInt(request.getParameter("user_id"));
		int rootId = Integer.parseInt(request.getParameter("root_id"));
		int productId = Integer.parseInt(request.getParameter("product_id"));
		String content = request.getParameter("content");
		
		System.out.println(userId + " " + rootId + " " + productId + content);
		
		Connection conn;
		try {
			// open connection to database
			conn = DBConnection.createConnection(); 
			
			// get user
			User user = UserDAO.getUserById(request, conn, userId);
			
			// get current time
			Timestamp now = new Timestamp(System.currentTimeMillis());

			// create Comment object
			Comment cmt = new Comment();
			cmt.setUser(user);
			cmt.setRootId(rootId);
			cmt.setProductId(productId);
			cmt.setTime(now);
			cmt.setContent(content);

			// insert comment to DB
			int check = CommentDAO.insertComment(request, conn, cmt);
			
			if(check == 0) {
				request.setAttribute("errMsg", "Cannot insert comment into DB");
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
				return;
			}
			else {
				response.sendRedirect("product-detail?product_id="+productId);
				return;
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
