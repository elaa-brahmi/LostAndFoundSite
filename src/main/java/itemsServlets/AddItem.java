package itemsServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import services.BDConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import services.cloudinary.CloudinaryServices;
import java.util.logging.Logger;

@WebServlet(name="addItem",urlPatterns="/addItem")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB threshold
        maxFileSize = 1024 * 1024 * 10,      // 10MB max file size
        maxRequestSize = 1024 * 1024 * 50    // 50MB max request size
)
public class AddItem extends HttpServlet {
    Connection con;
    HttpSession session;
    CloudinaryServices cloudinary=new CloudinaryServices();



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description=request.getParameter("description");
        String category=request.getParameter("category");
        String location=request.getParameter("location");
        String date=request.getParameter("date");
        String type=request.getParameter("type");
        Part imagePart = request.getPart("image"); // Input name="image" in form
        // Upload to Cloudinary and get URL

            String imageUrl = cloudinary.uploadToCloudinary(imagePart);
            System.out.println(imageUrl);

      try{
             con= BDConnection.getConnection();
            PreparedStatement ps=con.prepareStatement("insert into item(name,description,category,location,image,datefound,status,type,userid) values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,description);
            ps.setString(3,category);
            ps.setString(4,location);
            ps.setString(5,imageUrl);
            LocalDate localDate = LocalDate.parse(date);
            ps.setDate(6,Date.valueOf(localDate));
            ps.setString(7,"PENDING");
            ps.setString(8,type.toUpperCase());
            session=request.getSession();
            Integer userId= (Integer) session.getAttribute("userId");
            System.out.println(userId);
            ps.setInt(9,userId);
            int rows=ps.executeUpdate();
            if(rows>0){
                System.out.println("item added");
                getServletContext().getRequestDispatcher("/MyPosts.jsp").forward(request,response);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
