package itemsServlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Item;
import model.ItemStatus;
import model.ItemType;
import services.ItemDao;
import services.cloudinary.CloudinaryServices;
import java.io.IOException;
import java.time.LocalDate;
@WebServlet(name="EditItem",urlPatterns = "/EditItem")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB threshold
        maxFileSize = 1024 * 1024 * 10,      // 10MB max file size
        maxRequestSize = 1024 * 1024 * 50    // 50MB max request size
)
public class EditItem extends HttpServlet {
    CloudinaryServices cloudinary=new CloudinaryServices();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("doPost edit item");
        request.getParameterMap().forEach((key, values) -> {
            System.out.println("Key: " + key + " | Value: " + String.join(", ", values));
        });
        Integer itemId= Integer.parseInt(request.getParameter("idItem"));
        String itemName=request.getParameter("itemName");
        String itemDescription=request.getParameter("description");
        String itemCategory=request.getParameter("category");
        String itemLocation=request.getParameter("location");
        String itemType=request.getParameter("type");
        System.out.println("itemType : "+itemType);
        String itemStatus=request.getParameter("status");
        String itemDate=request.getParameter("date");
        Part imagePart = request.getPart("image");
        String imageUrl = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            // Upload to Cloudinary and get URL
             imageUrl = cloudinary.uploadToCloudinary(imagePart);
            System.out.println("image url : "+imageUrl);
        }
        else{
            imageUrl=request.getParameter("currentImage");
        }
        Integer itemUserId=Integer.parseInt(request.getParameter("itemUserId"));

        Item item=new Item(itemId,itemName,itemDescription,itemCategory,itemLocation, LocalDate.parse(itemDate), ItemType.valueOf(itemType.toUpperCase()), ItemStatus.valueOf(itemStatus),imageUrl,itemUserId);
        ItemDao.updateItem(item);
        request.setAttribute("alert_update_item","item updated successfully");

        getServletContext().getRequestDispatcher("/MyPosts.jsp").forward(request, response);
    }
}
