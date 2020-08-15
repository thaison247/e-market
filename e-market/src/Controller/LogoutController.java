package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// xoá session.user
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("isAuthenticated");
		
		// lấy origin_url: vị trí mà người dùng gửi request logout
		String from = request.getParameter("from");

		if(from.contains("profile")) from = "/e-market";

		request.setAttribute("from", from);

		// chuyển về trang trước đó
		response.sendRedirect(from);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
