package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDAO;
import DB.DBConnection;
import HELPER.BCrypt;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("Views/login.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// lấy thông tin đăng nhập từ form 
		String email = request.getParameter("input_email");
		String rawPassword = request.getParameter("input_password"); // password nguoi dung nhap vao form Login
		
		Connection conn = null;
		boolean checkPassword = false; 
		
		try {
			// mở kết nối DB
			conn = DBConnection.createConnection();
			
			// kiểm tra mail có tồn tại trong DB hay không
			boolean isExistedEmail = LoginDAO.isExistedEmail(request, conn, email);
			
			if(isExistedEmail) { // 
				String hashedPassword = LoginDAO.getPassword(request, conn, email); // lay hashed password trong DB (password dung)
				checkPassword = BCrypt.checkpw(rawPassword, hashedPassword); // so sanh 2 password bang Bcrypt
				request.setAttribute("loginMsg", "Login Successfully!");
			}
			else {
				request.setAttribute("loginMsg", "Login Fail!");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(checkPassword);
		RequestDispatcher rd = request.getRequestDispatcher("Views/login.jsp");
		rd.forward(request, response);
	}

}
