package itemsServlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
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
import java.util.ArrayList;
import java.util.List;

public class FilterByStatus extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        try {
            List<Item> items = ItemDao.filterItems(status);
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                    .create();
            String json = gson.toJson(items);
            System.out.println("items json: "+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
