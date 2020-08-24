package Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import BEAN.Category;
import DAO.CategoryDAO;
import DB.DBConnection;

@WebServlet("/admin-category-add")
public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminAddCatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Connection conn = DBConnection.createConnection();
			
			// get all categories
			List<Category> listCategoriesLv1 = CategoryDAO.getAllCategoriesLV1(request, conn);
			
			conn.close();

			request.setAttribute("listCategoriesLv1", listCategoriesLv1);
			RequestDispatcher rd = request.getRequestDispatcher("Views/Admin/add_cat.jsp");
			rd.forward(request, response);
			return;
			
		} catch (ClassNotFoundException | SQLException e) {

			request.setAttribute("errMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn;
		try {
			conn = DBConnection.createConnection();
			
			int incomingId = CategoryDAO.incomingCatId(request, conn);
			
			String fileName = "cat" + incomingId;
			
			// get params 
			List<FileItem> multiparts;
			multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			Iterator<FileItem> iter = multiparts.iterator();
			
			List<String> params = new ArrayList<>();
			
			while (iter.hasNext()) {
			    FileItem item = iter.next();

			    if (item.isFormField()) {
			    	
			    	params.add(item.getString());
			    	System.out.println("param : " + item.getString());
			    } else {
			    	
			    	String filePath = "D:\\TKPM\\WebProject\\e-market\\e-market\\WebContent\\img";
			    	
			    	//upload
					item.write(new File(filePath + File.separator + fileName + ".jpg"));
			    }
			}
			
			Category cat = new Category();
			cat.setName(params.get(0));
			cat.setRootId(Integer.parseInt(params.get(1)));
			
			int catId = CategoryDAO.insertCategory(request, conn, cat);
			
			System.out.println("cat Id: " + catId);
			
			if(catId != 0) {
				response.sendRedirect("admin-category");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
