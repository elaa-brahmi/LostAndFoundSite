package services.messageDao;

import model.Conversation;
import model.FriendRequest;
import model.Message;
import services.BDConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ConversationDao {
    public static Conversation getConversation(Integer conversationId) {
        String sql = "select * from conversations where id = ?";
        try(Connection con= BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
                ){
            ps.setInt(1, conversationId);
            try(ResultSet rs = ps.executeQuery()){
                if(rs.next()) {
                    Conversation conversation = new Conversation();
                    conversation.setId(rs.getInt("id"));
                    conversation.setCreated_At(rs.getTimestamp("created_at").toString());
                    conversation.setUser1_id(rs.getInt("user1_id"));
                    conversation.setUser2_id(rs.getInt("user2_id"));
                    return conversation;

                }

            }

        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public static List<Conversation> getAllConversationsByUser(Integer userId) {
       String sql = "SELECT * FROM conversations WHERE user1_id = ? OR user2_id = ?";
    List<Conversation> conversations = new ArrayList<>();

    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);
        ps.setInt(2, userId);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Conversation conversation = new Conversation();
                conversation.setId(rs.getInt("id"));
                conversation.setUser1_id(rs.getInt("user1_id"));
                conversation.setUser2_id(rs.getInt("user2_id"));
                conversation.setCreated_At(rs.getTimestamp("created_at").toString());
                conversations.add(conversation);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return conversations;
    }

    public static int addConversationToUser(Integer userId1,Integer userId2) {
        String sql = "INSERT INTO conversations (user1_id, user2_id) VALUES (?, ?)";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userId1);
            ps.setInt(2, userId2);
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // Return the generated conversation ID
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
        
    }

    public static void delete(Integer id) {
        String sql = "DELETE FROM conversations WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Message> getAllMessagesByConversation(Integer conversationId) {
        return null;
    }

    public static void updateConvoStatus(Integer conversationId, String convoStatus) {
        String sql = "UPDATE conversations SET status = ? WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
                if(convoStatus=="accepted"){
                    ps.setString(1, convoStatus);
                    ps.setInt(2, conversationId);
                    ps.executeUpdate();
                }
                else{
                    delete(conversationId);
                }
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
   
}
