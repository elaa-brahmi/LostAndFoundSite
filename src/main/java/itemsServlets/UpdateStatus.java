package itemsServlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;
import model.ItemType;
import services.ItemDao;
import services.notificationDao.NotificationDao;
import java.io.IOException;
import java.util.List;

@WebServlet(name="updateStatusItems",urlPatterns = "/updateStatusItems")
public class UpdateStatus extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer itemid = Integer.parseInt(request.getParameter("itemid"));
        String status = request.getParameter("status");
        ItemDao.updateStatus(itemid, status);
        if(status.equals("accepted")){
            Item currentItem=ItemDao.getItem(itemid);
            if(currentItem.getType().equals(ItemType.FOUND)){
                System.out.println("new item added of type found");
                List<Item> lostItems = ItemDao.getLostItems();
                NotificationDao.checkMatches(lostItems,currentItem);
            }
            else{
                System.out.println("new item added of type not found");
                List<Item> foundItems=ItemDao.getFoundItems();
                NotificationDao.checkMatches(foundItems,currentItem);

            }

        }
        request.setAttribute("update_status", "item status updated successfully");
        request.getRequestDispatcher("/pages/tables.jsp").forward(request, response);

    }
}
