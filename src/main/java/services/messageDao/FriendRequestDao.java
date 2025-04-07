package services.messageDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.FriendRequest;
import model.FriendRequestEnum;
import services.BDConnection;

public class FriendRequestDao {
    public static void addFriendRequest(FriendRequest friendRequest) {
        String sql = "INSERT INTO friend_requests (sender_id, receiver_id) VALUES (?, ?)";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, friendRequest.getSenderId());
            ps.setInt(2, friendRequest.getReceiverId());
            // ps.setString(3, friendRequest.getStatus().toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public static FriendRequest getFriendRequestById(Integer friendRequestId) {
        String sql = "SELECT * FROM friend_requests WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, friendRequestId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    FriendRequest friendRequest = new FriendRequest();
                    friendRequest.setId(rs.getInt("id"));
                    friendRequest.setSenderId(rs.getInt("sender_id"));
                    friendRequest.setReceiverId(rs.getInt("receiver_id"));
                    friendRequest.setStatus(FriendRequestEnum.valueOf(rs.getString("status")));
                    return friendRequest;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateFriendRequestStatus(Integer friendRequestId, String status) {
        //todo if accepted add a new convo
        //todo if rejected delete the friendRequest
        FriendRequest friendRequest = getFriendRequestById(friendRequestId);
        if (status.equals("ACCEPTED")) {
            ConversationImpl conversationImpl = new ConversationImpl();
            conversationImpl.addConversationToUser(friendRequest.getSenderId(), friendRequest.getReceiverId());
        } else {
            deleteFriendRequest(friendRequestId);
        }
        String sql = "UPDATE friend_requests SET status = ? WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, friendRequestId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public static void deleteFriendRequest(Integer friendRequestId) {
        String sql = "DELETE FROM friend_requests WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, friendRequestId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static List<Map<String, String>> fetchPendingFriendRequestsByReceiverId(Integer receiverId) {
        String sql = "SELECT fr.id AS requestId, fr.sender_id AS senderId, u.name AS senderName ,u.pictures AS Senderpicture " +
                "FROM friend_requests fr " +
                "JOIN users u ON fr.sender_id = u.id " +
                "WHERE fr.receiver_id = ? AND fr.status = 'PENDING' ORDER BY fr.created_at DESC";
        List<Map<String, String>> friendRequests = new ArrayList<>();

        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, receiverId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> request = new HashMap<>();
                    request.put("requestId", String.valueOf(rs.getInt("requestId")));
                    request.put("senderId", String.valueOf(rs.getInt("senderId")));
                    request.put("senderName", rs.getString("senderName"));
                    request.put("senderPicture", rs.getString("Senderpicture"));
                    System.out.println(request.toString());
                    friendRequests.add(request);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return friendRequests;
    }

    public static int getNumberOfPendingFriendRequests(Integer userId) {
        String sql = "SELECT COUNT(*) FROM friend_requests WHERE receiver_id = ? AND read = 'false'";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public static void updateFriendRequestStatusToRead(Integer receiverId) {
        String sql = "UPDATE friend_requests SET read = 'true' WHERE receiver_id = ? AND read = 'false'";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, receiverId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}