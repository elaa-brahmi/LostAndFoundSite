package itemsServlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;
import model.ItemStatus;
import model.ItemType;

import services.BDConnection;
import services.LocalDateAdapter;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet(name="UserItems" ,urlPatterns = "/UserItems")
public class GetItemsByUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, List<Item>> AllItems = new HashMap<>();
        AllItems.put("pending", new ArrayList<>());
        AllItems.put("accepted", new ArrayList<>());

        System.out.println("GET ALL ITEMS by user");
        try {
            Integer userId = Integer.parseInt(request.getParameter("userId"));
            System.out.println("User ID: " + userId);
 // Fetch items from the database
 fetchItemsByStatus(userId, "ACCEPTED", AllItems.get("accepted"));
 fetchItemsByStatus(userId, "PENDING", AllItems.get("pending"));

 System.out.println("Accepted items: " + AllItems.get("accepted"));
 System.out.println("Pending items: " + AllItems.get("pending"));

            // Convertir en JSON et envoyer la réponse
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                    .create();
            String json = gson.toJson(AllItems);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Database error\"}");
        }
    }
    private void fetchItemsByStatus(Integer userId, String status, List<Item> items) throws SQLException {
        String query = "SELECT * FROM item WHERE status = ? AND userid = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, status);
            ps.setInt(2, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    items.add(mapItem(rs));
                }
            }
        }
    }
    private Item mapItem(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        String category = rs.getString("category");
        String location = rs.getString("location");
        String image = rs.getString("image");
        LocalDate date = rs.getDate("datefound").toLocalDate();
        String type = rs.getString("type");
        Integer userid = rs.getInt("userid");
        String status = rs.getString("status");
        return new Item(id, name, description, category, location, image, date,
                ItemStatus.valueOf(status), userid, ItemType.valueOf(type));
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
