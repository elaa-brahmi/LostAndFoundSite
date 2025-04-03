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
import java.util.Map;

@WebServlet(name="allItems",urlPatterns = "/allItems")
public class GetAllItems extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int page = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int pageSize = Integer.parseInt(request.getParameter("pageSize") != null ? request.getParameter("pageSize") : "6");
        String categoryS = request.getParameter("category") != null ? request.getParameter("category") : "";
        String locationS = request.getParameter("location") != null ? request.getParameter("location") : "";
        System.out.println("category selected " +categoryS);
        System.out.println("location selected " +locationS);


        try( Connection con = BDConnection.getConnection()){
          
        
        // Build the base query
        String baseQuery = "SELECT COUNT(*) AS total FROM item WHERE status = 'ACCEPTED'";
        String filterQuery = "";
        
        // Add filters if category or location are provided
        if (!categoryS.isEmpty()) {
            filterQuery += " AND category = ?";
        }
        if (!locationS.isEmpty()) {
            filterQuery += " AND location = ?";
        }
        
        // Query to get the total number of items
        try (PreparedStatement countPs = con.prepareStatement(baseQuery + filterQuery)) {
        int paramIndex = 1;
        if (!categoryS.isEmpty()) {
            countPs.setString(paramIndex++, categoryS);}
            if (!locationS.isEmpty()) {
                countPs.setString(paramIndex, locationS);
            }
            try (ResultSet countRs = countPs.executeQuery()) {
            countRs.next();
            int totalItems = countRs.getInt("total");
            int totalPages = (int) Math.ceil((double) totalItems / pageSize);
            
               // Query to get the items with pagination
               String itemQuery = "SELECT * FROM item WHERE status = 'ACCEPTED'" + filterQuery + " ORDER BY datefound LIMIT ? OFFSET ?";
               try (PreparedStatement ps = con.prepareStatement(itemQuery)) {
            paramIndex = 1;
            if (!categoryS.isEmpty()) {
                ps.setString(paramIndex++, categoryS);
            }
            if (!locationS.isEmpty()) {
                ps.setString(paramIndex++, locationS);
            }
            ps.setInt(paramIndex++, pageSize);
            ps.setInt(paramIndex, (page - 1) * pageSize);
        



            try (ResultSet rs = ps.executeQuery()) {
            ArrayList<Item> items=new ArrayList<>();
            while(rs.next()){
                Integer id=rs.getInt("id");
                String name=rs.getString("name");
                String description=rs.getString("description");
                String category=rs.getString("category");
                String location=rs.getString("location");
                String image=rs.getString("image");
                LocalDate date= rs.getDate("datefound").toLocalDate();
                String type=rs.getString("type");
                Integer userid=rs.getInt("userid");
                String status=rs.getString("status");
                Item item=new Item(id,name,description,category,location,image,date, ItemStatus.valueOf(status), userid, ItemType.valueOf(type));
                items.add(item);
            }

            // Create a response object with items and pagination metadata
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("itemsServlets", items);
            responseData.put("totalItems", totalItems);
            responseData.put("currentPage", page);
            responseData.put("totalPages", totalPages);
            // Convert list to JSON
            // Create a Gson instance with the custom LocalDate adapter
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                    .create();
            String json = gson.toJson(responseData);

            // Set the response content type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Write the JSON to the response
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        }}}}}
         catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Database error\"}");
        }

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
