package FILTER;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import BEAN.Category;
import DAO.CategoryDAO;
import DB.DBConnection;

@WebFilter(urlPatterns = {"/", "/*"})
public class AccessFilter implements Filter {

    public AccessFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// xử lý request đến
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		if(session.getAttribute("allCategories") == null) {
			
			try {
				// tạo kết nối database
				Connection conn = DBConnection.createConnection();
				// lay danh sach Category vao allCategories
				ArrayList<Category> allCategories = CategoryDAO.getAllCategories(req, conn);
				
				// set attribute để truyền dữ liệu đi
				session.setAttribute("allCategories", allCategories);
				
				// đóng kết nối database
				conn.close();
				
			} catch (ClassNotFoundException | SQLException e) {
				// thông báo lỗi ở trang error
				req.setAttribute("errMsg", e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("Views/error.jsp");
				rd.forward(req, response);
			}
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
