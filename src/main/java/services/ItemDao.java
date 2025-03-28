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
    public static Connection con;

    private static final Logger logger =Logger.getLogger(UserDao.class.getName());
    public ItemDao() {}
    public static Integer create(Item item) {
        try {
            con = BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into item(name,description,category,location,image,datefound,status,type,userid,match_status) values(?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, item.getName());
            ps.setString(2, item.getDescription());
            ps.setString(3, item.getCategory());
            ps.setString(4, item.getLocation());
            ps.setString(5, item.getImage());
            ps.setDate(6, Date.valueOf(item.getDatefound()));
            ps.setString(7, "PENDING");// accepted status
            ps.setString(8, item.getType().toString());// type
            ps.setInt(9, item.getUserId());
            ps.setString(10,item.getMatchedStatus().toString().toLowerCase());
            int rows = ps.executeUpdate();
            if (rows>0) {
                System.out.println("item added");
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        System.out.println("the generated key is " + rs.getInt(1));
                        return rs.getInt(1);  // Retrieve the generated ID
                    }
                }

            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    public static Item getItem(int id) {
        try {
            con = BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from item where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
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
                System.out.println(i);
                return i;
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return null;
    }

    public static void updateItem(Item item) {
        try{
            con = BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE item  SET name = ?, description = ?, category = ?, location = ?, image = ?, datefound = ?, type = ?, userid = ?, status = ? WHERE id = ?");
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
        try{
            con = BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from item WHERE id = ?");
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
        try{
            con = BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM item WHERE type = 'LOST' AND match_status IN ('pending', 'matched','MATCHED') AND status = 'ACCEPTED'");
            ResultSet rs = ps.executeQuery();
            List<Item> items = new ArrayList<Item>();
            while(rs.next()) {
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
                System.out.println(i);
                items.add(i);

            }
            return items;


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static List<Item> getFoundItems() {
        try{
            con = BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from item WHERE type='FOUND' AND match_status IN ('pending', 'matched','MATCHED') AND status = 'ACCEPTED'");
            ResultSet rs = ps.executeQuery();
            List<Item> items = new ArrayList<>();
            while(rs.next()) {
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
                System.out.println(i);
                items.add(i);

            }
            return items;


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static String getUserEmail(Item item) {
        try{
            con = BDConnection.getConnection();
            int userId = item.getUserId();
            PreparedStatement ps = con.prepareStatement("select email from users WHERE id=?");
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getString("email");
            }

        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public static void updateMatchStatus(Integer idItem, MatchedStatus matchedStatus) {
        try{
            con = BDConnection.getConnection();
            String match_Status=MatchedStatus.MATCHED.toString();
            PreparedStatement ps = con.prepareStatement("UPDATE item  SET match_status= ? WHERE id = ?");
            ps.setString(1,match_Status);
            ps.setInt(2,idItem);
            int rows=ps.executeUpdate();
            if(rows>0) {
                System.out.println("Item updated matched status to"+ match_Status);
            }

    }
        catch(SQLException e){
        e.printStackTrace();}
    }
}
