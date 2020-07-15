package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import BEAN.Product;
import BEAN.User;

@WebServlet("/PostProductS3")
public class PostProductS3Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostProductS3Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("Views/post_product_step3.jsp");
		rd.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		// tao folder luu hinh anh: ProductImages/<productId>/
		int productId = (int) session.getAttribute("productId");
		String filePath = "D:/ProductImages" + File.separator + Integer.toString(productId);
		
		File f = new File(filePath); 
		 
		// neu tao folder that bai: chuyen toi trang bao loi error.jsp
        if (!f.mkdirs()) {  
            request.setAttribute("errMsg", "Cannot create directory: " + filePath);
            RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
            rd.forward(request, response);
            return;
        } 
        
//		System.out.println("Current folder: " + (new File(".")).getCanonicalPath());
//		System.out.println("Real path: " + session.getServletContext().getResource("ProductImages"));
//		System.out.println(new File(".").getAbsolutePath());
//		filePath = session.getServletContext().getRealPath("ProductImages");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			List<FileItem> multiparts;
			try {
				multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				int imgNumber = 1; // stt cua file anh
				for(FileItem item : multiparts) {
					int temp = imgNumber++;
					String fileName = Integer.toString(temp); // ten file anh: 1, 2, 3, 4,...
					
					//upload
					item.write(new File(filePath + File.separator + fileName + ".jpg"));
					
				}
				
				//
				request.setAttribute("msg", "File uploaded successfully!");
				RequestDispatcher rd = request.getRequestDispatcher("Views/message.jsp");
				rd.forward(request, response);
				return;
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				request.setAttribute("errMsg", e1.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
			}
			
			
		}
		
	}

}
