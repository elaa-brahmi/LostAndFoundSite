package services;

import model.Item;
import model.ItemStatus;
import model.ItemType;
import model.MatchedStatus;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class ItemDao {

    private static final Logger logger =Logger.getLogger(UserDao.class.getName());
    public ItemDao() {}
    public static void create(Item item) {
        String query = "INSERT INTO item(name, description, category, location, image, datefound, status, type, userid, match_status) " +
                   "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        ps.setString(1, item.getName());
        ps.setString(2, item.getDescription());
        ps.setString(3, item.getCategory());
        ps.setString(4, item.getLocation());
        ps.setString(5, item.getImage());
        ps.setDate(6, Date.valueOf(item.getDatefound()));
        ps.setString(7, "PENDING");
        ps.setString(8, item.getType().toString());
        ps.setInt(9, item.getUserId());
        ps.setString(10, item.getMatchedStatus().toString().toLowerCase());

        int rows = ps.executeUpdate();
        if (rows > 0) {
            System.out.println("Item created successfully");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }


    }
    public static Item getItem(int id) {
        String query = "SELECT * FROM item WHERE id=?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Item i = new Item();
                    i.setId(rs.getInt("id"));
                    i.setName(rs.getString("name"));
                    i.setDescription(rs.getString("description"));
                    i.setCategory(rs.getString("category"));
                    i.setLocation(rs.getString("location"));
                    i.setStatus(ItemStatus.valueOf(rs.getString("status")));
                    i.setType(ItemType.valueOf(rs.getString("type")));
                    i.setDatefound(rs.getDate("datefound").toLocalDate());
                    i.setImage(rs.getString("image"));
                    i.setUserId(rs.getInt("userid"));
                    i.setMatchedStatus(MatchedStatus.valueOf(rs.getString("match_status").toUpperCase()));
                    return i;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void updateItem(Item item) {
        String query = "UPDATE item SET name = ?, description = ?, category = ?, location = ?, image = ?, datefound = ?, type = ?, userid = ?, status = ? WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setString(1, item.getName());
            ps.setString(2, item.getDescription());
            ps.setString(3, item.getCategory());
            ps.setString(4, item.getLocation());
            ps.setString(5, item.getImage());
            ps.setDate(6, Date.valueOf(item.getDatefound()));
            ps.setString(7, item.getType().toString());
            ps.setInt(8, item.getUserId());
            ps.setString(9, item.getStatus().toString());
            ps.setInt(10, item.getId());
    
            int rows=ps.executeUpdate();
            if(rows>0) {
                System.out.println("Item updated successfully");
            }
        }
        catch(SQLException e ){
            e.printStackTrace();
        }
    }
    public static void deleteItem(int id) {
        String query = "DELETE FROM item WHERE id = ?";
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        ps.setInt(1, id);
            int rows=ps.executeUpdate();
            if(rows>0) {
                System.out.println("Item deleted successfully");
            }

    }
        catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static List<Item> getLostItems() {
        String query = "SELECT * FROM item WHERE type = 'LOST' AND match_status IN ('pending', 'matched', 'MATCHED') AND status = 'ACCEPTED'";
    List<Item> items = new ArrayList<>();
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Item i = new Item();
            i.setId(rs.getInt("id"));
            i.setName(rs.getString("name"));
            i.setDescription(rs.getString("description"));
            i.setCategory(rs.getString("category"));
            i.setLocation(rs.getString("location"));
            i.setStatus(ItemStatus.valueOf(rs.getString("status")));
            i.setType(ItemType.valueOf(rs.getString("type")));
            i.setDatefound(rs.getDate("datefound").toLocalDate());
            i.setUserId(rs.getInt("userid"));
            items.add(i);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return items;

    }

    public static List<Item> getFoundItems() {
        String query = "SELECT * FROM item WHERE type='FOUND' AND match_status IN ('pending', 'matched', 'MATCHED') AND status = 'ACCEPTED'";
    List<Item> items = new ArrayList<>();

    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Item i = new Item();
            i.setId(rs.getInt("id"));
            i.setName(rs.getString("name"));
            i.setDescription(rs.getString("description"));
            i.setCategory(rs.getString("category"));
            i.setLocation(rs.getString("location"));
            i.setStatus(ItemStatus.valueOf(rs.getString("status")));
            i.setType(ItemType.valueOf(rs.getString("type")));
            i.setDatefound(rs.getDate("datefound").toLocalDate());
            i.setUserId(rs.getInt("userid"));
            i.setImage(rs.getString("image"));
            i.setMatchedStatus(MatchedStatus.valueOf(rs.getString("match_status").toUpperCase()));
            items.add(i);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return items;

    }

    public static String getUserEmail(Item item) {
        String query = "SELECT email FROM users WHERE id = ?";
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        ps.setInt(1, item.getUserId());
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getString("email");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
    }

    public static void updateMatchStatus(Integer idItem, MatchedStatus matchedStatus) {
        String query = "UPDATE item SET match_status = ? WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setString(1, matchedStatus.toString());
            ps.setInt(2, idItem);
    
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Item updated match status to " + matchedStatus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public static void updateStatus(Integer idItem, String status) {
        String query = "UPDATE item SET status = ? WHERE id = ?";
        String upperStatus = status.toUpperCase();

    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        if (upperStatus.equals("ACCEPTED")) {
            // Update the status to "ACCEPTED"
            ps.setString(1, upperStatus);
            ps.setInt(2, idItem);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Item updated status to " + upperStatus);
            }
        } else {
            // Delete the item if the status is not "ACCEPTED"
            deleteItem(idItem);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }

    public static List<Item> filterItems(String status) throws SQLException{
        String query = "SELECT * FROM item WHERE status = ?";
        List<Item> items = new ArrayList<>();
    
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setString(1, status.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Item i = new Item();
                    i.setId(rs.getInt("id"));
                    i.setName(rs.getString("name"));
                    i.setDescription(rs.getString("description"));
                    i.setCategory(rs.getString("category"));
                    i.setLocation(rs.getString("location"));
                    i.setStatus(ItemStatus.valueOf(rs.getString("status")));
                    i.setType(ItemType.valueOf(rs.getString("type")));
                    i.setDatefound(rs.getDate("datefound").toLocalDate());
                    i.setUserId(rs.getInt("userid"));
                    i.setMatchedStatus(MatchedStatus.valueOf(rs.getString("match_status").toUpperCase()));
                    i.setImage(rs.getString("image"));
                    items.add(i);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return items;
    }
    public static Integer GetNbPendingItems() throws SQLException{
        int res = 0;
    String query = "SELECT COUNT(*) FROM item WHERE match_status='pending'";
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            res = rs.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return res;
    }
    public static Integer GetNbMatchedItems() throws SQLException{
        int res = 0;
        String query = "SELECT COUNT(*) FROM item WHERE match_status='MATCHED'";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
    
            if (rs.next()) {
                res = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public static Integer GetNbResolvedItems() throws SQLException {
        int res = 0;
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM item WHERE match_status='RESOLVED'");
             ResultSet rs = ps.executeQuery()) {
    
            if (rs.next()) {
                res = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public static Integer GetNbRejectedItems() throws SQLException{
        int res = 0;
    String query = "SELECT COUNT(*) FROM item WHERE match_status='REJECTED'";
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            res = rs.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return res;
    }

    public static List<Item> getPendingItems() throws SQLException{
        String query = "SELECT * FROM item WHERE status='PENDING'";
        List<Item> items = new ArrayList<>();
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
    
            while (rs.next()) {
                Item i = new Item();
                i.setId(rs.getInt("id"));
                i.setName(rs.getString("name"));
                i.setDescription(rs.getString("description"));
                i.setCategory(rs.getString("category"));
                i.setLocation(rs.getString("location"));
                i.setImage(rs.getString("image"));
                i.setStatus(ItemStatus.valueOf(rs.getString("status")));
                i.setType(ItemType.valueOf(rs.getString("type")));
                i.setDatefound(rs.getDate("datefound").toLocalDate());
                i.setUserId(rs.getInt("userid"));
                i.setMatchedStatus(MatchedStatus.valueOf(rs.getString("match_status").toUpperCase()));
                items.add(i);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
        
       
    }

    public static List<Item> getAllItems() throws SQLException{
        String query = "SELECT * FROM item";
    List<Item> items = new ArrayList<>();
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Item i = new Item();
            i.setId(rs.getInt("id"));
            i.setName(rs.getString("name"));
            i.setDescription(rs.getString("description"));
            i.setCategory(rs.getString("category"));
            i.setLocation(rs.getString("location"));
            i.setImage(rs.getString("image"));
            i.setStatus(ItemStatus.valueOf(rs.getString("status")));
            i.setType(ItemType.valueOf(rs.getString("type")));
            i.setDatefound(rs.getDate("datefound").toLocalDate());
            i.setUserId(rs.getInt("userid"));
            i.setMatchedStatus(MatchedStatus.valueOf(rs.getString("match_status").toUpperCase()));
            items.add(i);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return items;}


}
