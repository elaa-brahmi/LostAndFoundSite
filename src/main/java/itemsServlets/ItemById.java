package itemsServlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Item;
import model.ItemStatus;
import model.ItemType;
import services.ItemDao;
import services.LocalDateAdapter;
import services.cloudinary.CloudinaryServices;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
@WebServlet(name="ItemById",urlPatterns = "/ItemById")
public class ItemById extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("item id to fetch "+id);
        Item item=ItemDao.getItem(Integer.parseInt(id));
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                .create();
        String userDetails= gson.toJson(item);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // Write the JSON to the response
        PrintWriter out = response.getWriter();
        out.print(userDetails);
        out.flush();

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
