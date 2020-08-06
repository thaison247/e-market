package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.User;


@WebServlet("/profile")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		// lay thong tin user
		User user = (User)session.getAttribute("user");
		String userName = user.getName();
		String userPhone = user.getPhone();
		String userEmail = user.getEmail();
		String userAddress = user.getAddress();
		
		//set thong tin user gui qua view profile.jsp
		request.setAttribute("userName", userName);
		request.setAttribute("userPhone", userPhone);
		request.setAttribute("userEmail", userEmail);
		request.setAttribute("userAddress", userAddress);
		
		RequestDispatcher rd = request.getRequestDispatcher("Views/profile.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
