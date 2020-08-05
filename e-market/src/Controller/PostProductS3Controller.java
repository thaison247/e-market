package Controller;

import java.io.File;
import java.io.FileOutputStream;
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
import org.apache.taglibs.standard.resources.Resources;
import org.omg.CORBA.IRObject;

import BEAN.Product;
import BEAN.User;

@WebServlet("/post-product-s3")
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

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		String filePath;
//		System.out.println("Current folder: " + (new File(".")).getCanonicalPath());
//		System.out.println("Real path: " + session.getServletContext().getResource("productimages"));
//		System.out.println(new File(".").getAbsolutePath());
//		filePath = session.getServletContext().getRealPath("productimages");
//		System.out.println("newwwwwwwww: " + this.getServletContext().getRealPath("/productimages"));
//		File f = new File(filePath);
//		File f = new File("productimages"+ File.separator + Integer.toString(productId));

		HttpSession session = request.getSession();
		
		/* KHÔNG GET ĐƯỢC ĐƯỜNG DẪN TƯƠNG DỐI CỦA PROJECT NÊN PHẢI DÙNG ĐƯỜNG DẪN TUYỆT ĐỐI :< */
		int productId = (int) session.getAttribute("productId");
		String filePath = "D:\\TKPM\\WebProject\\e-market\\e-market\\WebContent\\productimages" + File.separator + Integer.toString(productId);
		File f = new File(filePath); // TẠO FOLDER
		 
		// neu tao folder that bai: chuyen toi trang bao loi error.jsp
        if (!f.mkdirs()) {  
            request.setAttribute("errMsg", "Cannot create directory: " + filePath);
            RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
            rd.forward(request, response);
            return;
        } 
        
		if(ServletFileUpload.isMultipartContent(request)) {
			List<FileItem> multiparts;
			try {
				multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				int imgNumber = 1; // đặt số thứ tự của file ảnh từ 1, 2, ...
				for(FileItem item : multiparts) {
					int temp = imgNumber++;
					String fileName = Integer.toString(temp); // ten file anh: 1, 2, 3, 4,...
					
					//upload
					item.write(new File(filePath + File.separator + fileName + ".jpg"));
				}
				
				// upload ảnh thành công
				request.setAttribute("msg", "File uploaded successfully!");
				RequestDispatcher rd = request.getRequestDispatcher("Views/message.jsp");
				rd.forward(request, response);
				return;
				
			} catch (Exception e1) {
				request.setAttribute("errMsg", e1.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("Views/error.jsp");
				rd.forward(request, response);
			}
		}
		
	}

}
