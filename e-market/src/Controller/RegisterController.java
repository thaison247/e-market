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

import BEAN.User;
import DAO.RegisterDAO;
import DB.DBConnection;
import HELPER.BCrypt;


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("Views/register.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("UTF-8");
		}
		
		// lấy thông tin đăng nhập từ form 
		String input_email = request.getParameter("input_email");
		String input_name = request.getParameter("input_name");
		String input_password = request.getParameter("input_password");
		String input_address = request.getParameter("input_address");
		String input_phone = request.getParameter("input_phone");
		
		// sử dụng Bcrypt để mã hoá password
		BCrypt bCrypt = new BCrypt();
		String encodedPassword = bCrypt.hashpw(input_password, bCrypt.gensalt()); // password đã được mã hoá
		
		Connection conn = null;
		boolean checkExistedEmail = false; // biến ktra email đã tồn tại?
		
		try {
			conn = DBConnection.createConnection();// mở kết nối database
			
			checkExistedEmail = RegisterDAO.isExistedEmail(request, conn, input_email);
			
			// nếu email đã tồn tại
			if (checkExistedEmail) {
				conn.close();  // đóng kết nối database
				request.setAttribute("registerMsg", "Email is used by another account!");
				RequestDispatcher rd = request.getRequestDispatcher("Views/register.jsp");
				rd.forward(request, response);
			}
			// nếu email chưa tồn tại
			else {
				User user = new User();
				user.setName(input_name);
				user.setAddress(input_address);
				user.setPhone(input_phone);
				user.setEmail(input_email);
				user.setPassword(encodedPassword);
				
				boolean check = RegisterDAO.insertUser(conn, user); // thêm user vào database, true: thêm thành công
				conn.close(); // đóng kết nối database
				
				if(check) {
					request.setAttribute("registerMsg", "Register Successfully!");
					RequestDispatcher rd = request.getRequestDispatcher("Views/register.jsp");
					rd.forward(request, response);
				}
				else {
					request.setAttribute("registerMsg", "Register Fail!");
					RequestDispatcher rd = request.getRequestDispatcher("Views/register.jsp");
					rd.forward(request, response);
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
