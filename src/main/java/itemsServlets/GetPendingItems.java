package itemsServlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;
import services.ItemDao;
import services.LocalDateAdapter;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name="pendingItems",urlPatterns = "/pendingItems")
public class GetPendingItems extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Item> items= ItemDao.getPendingItems();
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                    .create();
            String userDetails= gson.toJson(items);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Write the JSON to the response
            PrintWriter out = response.getWriter();
            out.print(userDetails);
            out.flush();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
