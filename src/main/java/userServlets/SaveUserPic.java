package userServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import services.UserDao;
import services.cloudinary.CloudinaryServices;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="saveUserPic",urlPatterns = "/saveUserPic")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB threshold
        maxFileSize = 1024 * 1024 * 10,      // 10MB max file size
        maxRequestSize = 1024 * 1024 * 50    // 50MB max request size
)
public class SaveUserPic extends HttpServlet {
    HttpSession session;
    CloudinaryServices cloudinary=new CloudinaryServices();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Inside doPost saveUserPic");
        Part filePart = request.getPart("image");
        System.out.println(filePart);
        String imageUrl = cloudinary.uploadToCloudinary(filePart);
        session = request.getSession();
        Integer id=Integer.parseInt(session.getAttribute("userId").toString());
        try {
            UserDao.uploadPicture(imageUrl,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
