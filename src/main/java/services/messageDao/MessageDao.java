package services.messageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.Message;
import services.BDConnection;

public class MessageDao {

    public static void createMessage(Message msg) {
        String sql = "INSERT INTO messages (content, sender_id, conversation_id) VALUES (?, ?, ?)";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, msg.getContact());
            ps.setInt(2, msg.getSenderId());
            ps.setInt(3, msg.getConversationId());

           int rows= ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Message added successfully.");
            } else {
                System.out.println("Failed to add message.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteMessage(int messageId) {
        String sql = "DELETE FROM messages WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, messageId);
            int rows=ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Message deleted successfully.");
            } else {
                System.out.println("Failed to delete message.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateMessage(int messageId, String newContent) {
        String sql = "UPDATE messages SET content = ? WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newContent);
            ps.setInt(2, messageId);
            int rows=ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Message updated successfully.");
            } else {
                System.out.println("Failed to update message.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Message> getMessagesByConversationId(int conversationId) {
        String sql = "SELECT * FROM messages WHERE conversation_id = ?  ORDER BY sent_at DESC";
        List<Message> messages = new ArrayList<>();
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            try(ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message();
                    message.setId(rs.getInt("id"));
                    message.setContact(rs.getString("content"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setConversationId(rs.getInt("conversation_id"));
                    message.setSendAt(rs.getTimestamp("sent_at").toString());
                    message.setRead(rs.getBoolean("is_read"));
                    messages.add(message);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
           
    }

    public static Message getMessageById(int messageId) {
        String sql = "SELECT * FROM messages WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, messageId);
            try(ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Message message = new Message();
                    message.setId(rs.getInt("id"));
                    message.setContact(rs.getString("content"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setConversationId(rs.getInt("conversation_id"));
                    message.setSendAt(rs.getTimestamp("sent_at").toString());
                    message.setRead(rs.getBoolean("is_read"));
                    return message;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Message getLastMessageByConversationId(int conversationId) {
        String sql = "SELECT * FROM messages WHERE conversation_id = ? ORDER BY sent_at DESC LIMIT 1";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            try(ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Message message = new Message();
                    message.setId(rs.getInt("id"));
                    message.setContact(rs.getString("content"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setConversationId(rs.getInt("conversation_id"));
                    message.setSendAt(rs.getTimestamp("sent_at").toString());
                    message.setRead(rs.getBoolean("is_read"));
                    return message;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void markMessageAsRead(int messageId) {
        String sql = "UPDATE messages SET is_read = TRUE WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, messageId);
            int rows=ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Message marked as read successfully.");
            } else {
                System.out.println("Failed to mark message as read.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Message> getUnreadMessagesByConversationId(int conversationId) {
        String sql = "SELECT * FROM messages WHERE conversation_id = ? AND is_read = FALSE";
        List<Message> messages = new ArrayList<>();
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            try(ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message();
                    message.setId(rs.getInt("id"));
                    message.setContact(rs.getString("content"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setConversationId(rs.getInt("conversation_id"));
                    message.setSendAt(rs.getTimestamp("sent_at").toString());
                    message.setRead(rs.getBoolean("is_read"));
                    messages.add(message);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    public static void deleteMessagesByConversationId(int conversationId) {
        String sql = "DELETE FROM messages WHERE conversation_id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, conversationId);
            int rows=ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Messages deleted successfully.");
            } else {
                System.out.println("Failed to delete messages.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
