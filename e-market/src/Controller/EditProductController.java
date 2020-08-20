package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Category;
import BEAN.Product;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/edit-product")
public class EditProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int prdId = Integer.parseInt(request.getParameter("product_id"));
		
		try {
			Connection conn = DBConnection.createConnection();
			
			// lấy dữ liệu của sản phẩm từ DB
			Product prd = ProductDAO.getProductById(request, conn, prdId);
			
			// lấy các danh mục nằm trong cùng 1 danh mục cha của sản phẩm (danh sách danh mục cấp 2 trong danh mục cấp 1)
			int categoryLv1 = CategoryDAO.getRootId(request, conn, prd.getCategoryId());
			ArrayList<Category> listCategoriesLV2 = CategoryDAO.getAllCategoriesLV2(request, conn, categoryLv1);
			
			request.setAttribute("product", prd);
			request.setAttribute("listCategoriesLV2", listCategoriesLV2);
			RequestDispatcher rd = request.getRequestDispatcher("Views/edit_product.jsp");
			rd.forward(request, response);
			
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// set char encoding UTF-8 de luu ky tu tieng Viet vao DB
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("UTF-8");
		}
		
		// set cac truong lieu
		int id = Integer.parseInt(request.getParameter("product_id"));
		String name = request.getParameter("input_title"); // ten san pham
		int price = Integer.parseInt(request.getParameter("input_price")); // gia san pham
		int categoryId = Integer.parseInt(request.getParameter("input_category")); // id danh muc (lv2)
		String shortDesc = request.getParameter("input_shortDescription"); // mo ta ngan
		String detailDesc = request.getParameter("input_detailDescription"); // mo ta chi tiet
	    
	    // khoi tao doi tuong Product
		Product prd = new Product();
		prd.setId(id);
		prd.setCategoryId(categoryId);
		prd.setName(name);
		prd.setPrice(price);
		prd.setShortDesc(shortDesc);
		prd.setDetailDesc(detailDesc);
		
		try {
			Connection conn = DBConnection.createConnection();
			
			boolean isUpdated = ProductDAO.updateProduct(request, conn, prd);
			
			if(isUpdated) {
				response.sendRedirect("product-detail?product_id="+id);
				return;
			}
			
			else {
				request.setAttribute("errMsg", "Update product fail!");
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
				return;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
			return;
		}
	}

}
