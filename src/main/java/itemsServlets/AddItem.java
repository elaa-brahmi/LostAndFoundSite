package itemsServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Item;
import model.ItemStatus;
import model.ItemType;
import model.MatchedStatus;
import java.io.IOException;
import java.time.LocalDate;
import services.ItemDao;
import services.cloudinary.CloudinaryServices;
import services.notificationDao.NotificationDao;

import java.util.List;

@WebServlet(name="addItem",urlPatterns="/addItem")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB threshold
        maxFileSize = 1024 * 1024 * 10,      // 10MB max file size
        maxRequestSize = 1024 * 1024 * 50    // 50MB max request size
)
public class AddItem extends HttpServlet {
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
        session=request.getSession();
        Integer userId= (Integer) session.getAttribute("userId");
        Item item=new Item(name,description,category,location,imageUrl, ItemType.valueOf(type.toUpperCase()),LocalDate.parse(date), ItemStatus.PENDING,userId, MatchedStatus.PENDING);
        int id=ItemDao.create(item);
        item.setId(id);
            if(type.equals("found")){
                System.out.println("new item added of type found");
                List<Item> lostItems = ItemDao.getLostItems();
                NotificationDao.checkMatches(lostItems,item);
            }
            else{
                System.out.println("new item added of type not found");
                List<Item> foundItems=ItemDao.getFoundItems();
                NotificationDao.checkMatches(foundItems,item);

            }

                getServletContext().getRequestDispatcher("/MyPosts.jsp").forward(request,response);
            }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
