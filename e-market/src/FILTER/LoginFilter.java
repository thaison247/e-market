package FILTER;

import java.io.IOException;
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

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = {"/PostProductS1", "/Profile"})
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// xử lý request đến
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		if(null == session.getAttribute("isAuthenticated")) {
			
			if(req.getRequestURI().contains("PostProduct")) {
				session.setAttribute("from", "/e-market/PostProductS1");
			}
			else if(req.getRequestURI().contains("Profile")) {
				session.setAttribute("from", "/e-market/Profile");
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("Views/login.jsp");
			rd.forward(request, response);
			return;
		}
		else {

			// pass the request along the filter chain
			chain.doFilter(request, response);
		}

		// xử lý response
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
