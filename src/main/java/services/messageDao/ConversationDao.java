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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

public static List<Map<String, Object>> getAllConversationsByUser(Integer userId) {
    String sql = "SELECT c.id AS conversationId, " +
                 "       CASE " +
                 "           WHEN c.user1_id = ? THEN u2.id " +
                 "           ELSE u1.id " +
                 "       END AS otherMemberId, " +
                 "       CASE " +
                 "           WHEN c.user1_id = ? THEN u2.name " +
                 "           ELSE u1.name " +
                 "       END AS otherMemberName, " +
                 "       CASE " +
                 "           WHEN c.user1_id = ? THEN u2.pictures " +
                 "           ELSE u1.pictures " +
                 "       END AS otherMemberPicture, " +
                 "       c.created_at " +
                 "FROM conversations c " +
                 "JOIN users u1 ON c.user1_id = u1.id " +
                 "JOIN users u2 ON c.user2_id = u2.id " +
                 "WHERE c.user1_id = ? OR c.user2_id = ? " +
                 "ORDER BY c.created_at DESC";

    List<Map<String, Object>> conversations = new ArrayList<>();

    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        // Set parameters for the query
        ps.setInt(1, userId); // For CASE statement (otherMemberId)
        ps.setInt(2, userId); // For CASE statement (name)
        ps.setInt(3, userId); // For CASE statement (picture)
        ps.setInt(4, userId); // For WHERE clause (user1_id)
        ps.setInt(5, userId); // For WHERE clause (user2_id)

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> conversation = new HashMap<>();
                int conversationId = rs.getInt("conversationId");
                String lastMessageTime = getLastMessageTime(conversationId);

                // Fetch the last message using the existing method
                Message lastMessage = getLastMessageByConversationId(conversationId);
                int unreadMsg=MessageDao.getNumberOfUnreadMessages(conversationId);
                conversation.put("unreadMsg", unreadMsg);
                conversation.put("conversationId", conversationId);
                conversation.put("otherMemberId", rs.getInt("otherMemberId"));
                conversation.put("otherMemberName", rs.getString("otherMemberName"));
                conversation.put("otherMemberPicture", rs.getString("otherMemberPicture"));
                conversation.put("lastMessage", lastMessage != null ? lastMessage.getContact() : "No messages yet");
                conversation.put("lastMessageTime", lastMessageTime!= null ? lastMessageTime : "");
                System.out.println(conversation);
                conversations.add(conversation);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return conversations;
}
 public static String getLastMessageTime(int conversationId) {
        String sql = "SELECT sent_at FROM messages WHERE conversation_id = ? ORDER BY sent_at DESC LIMIT 1";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Timestamp timestamp = rs.getTimestamp("sent_at");
                    return timestamp.toString();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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

    public static Message getLastMessageByConversationId(int conversationId) {
        String sql = "SELECT * FROM messages WHERE conversation_id = ? ORDER BY sent_at DESC LIMIT 1";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Message message = new Message();
                    message.setId(rs.getInt("id"));
                    message.setConversationId(rs.getInt("conversation_id"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setContact(rs.getString("content"));
                    message.setSendAt(rs.getTimestamp("sent_at").toString());
                    System.out.println(message.toString());
                    return message;
                }
                else{
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
   
}
