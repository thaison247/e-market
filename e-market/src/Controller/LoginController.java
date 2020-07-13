package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.User;
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

		// lấy origin_url: vị trí mà người dùng gửi request login
		request.setAttribute("from", request.getParameter("from"));
		
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
			
			// nếu mail tồn tại trong DB (có tài khoản đk bằng mail này)
			if(isExistedEmail) { 
				String hashedPassword = LoginDAO.getPassword(request, conn, email); // lay hashed password trong DB (password dung)
				checkPassword = BCrypt.checkpw(rawPassword, hashedPassword); // so sanh 2 password bang Bcrypt
				
				// nếu đăng nhập đúng password
				if(checkPassword) {
					
					// set giá trị cho session
					HttpSession session = request.getSession();
					session.setAttribute("authenticated", true);
					User user = new User();
					user = LoginDAO.getUser(request, conn, email); // get User tu DB
					session.setAttribute("user", user);
					
					// chuyển về trang trước đó
					response.sendRedirect(request.getParameter("from"));
					return;
				}
				
				// nếu đăng nhập sai password
				else {
					
					// đặt message thông báo ra ngoài
					request.setAttribute("loginErrMsg", "Mật khẩu không đúng!");
				}
			}
			
			// nếu không tồn tại mail trong DB
			else {
				
				// đặt message thông báo ra ngoài
				request.setAttribute("loginErrMsg", "Mail không tồn tại!");
			}
			
		} catch (ClassNotFoundException e) {
			// đặt message thông báo ra ngoài
			request.setAttribute("loginErrMsg", e.getMessage());
		}
		
		// chuyển vể trang login
		RequestDispatcher rd = request.getRequestDispatcher("Views/login.jsp");
		rd.forward(request, response);
	}

}