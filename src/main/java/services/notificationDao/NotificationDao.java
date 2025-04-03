package services.notificationDao;

import model.Item;

import model.MatchedStatus;
import model.NotifStatus;
import model.Notification;
import services.BDConnection;
import services.EmailSender;
import services.ItemDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

public class NotificationDao {

    public static void checkMatches(List<Item> items,Item item) {
        System.out.println("🔄 Checking for lost & found matches for item  ");
        for (Item possible : items) {
                if (isPotentialMatch(possible, item)) {
                    System.out.println("there is a potential match with id " + possible.getId());
                    Integer userId = item.getUserId();
                    Integer userIdPossible = possible.getUserId();
                    String emailLost =ItemDao.getUserEmail(item);
                    String emailFound =ItemDao.getUserEmail(possible);
                    String messageUser = "🔔 Possible match for your  object:\n " +
                            "📌 Title: " + item.getName() + "\n" +
                            "📍 Location: " + item.getLocation() +
                            "\n"+ "visit the website for verification.";
                    String messagePossible = "🔔 Possible match for your  object: \n" +
                            "📌 Title: " + possible.getName() + "\n" +
                            "📍 Location: " + possible.getLocation() +
                            "\n"+ "visit the website for verification.";
                    Notification notificationUser = new Notification(userId,messageUser, NotifStatus.PENDING,item.getId(), possible.getId());
                    Notification notificationPossible=new Notification(userIdPossible,messagePossible,NotifStatus.PENDING,possible.getId(),item.getId());
                    storeNotification(notificationUser);
                    storeNotification(notificationPossible);
                    // 1️⃣ Send WebSocket notification if user is online
                    WebsocketNotification.sendNotificationToUser(userId.toString(), messageUser);
                    WebsocketNotification.sendNotificationToUser(userIdPossible.toString(), messagePossible);
                    // 2️⃣ Send email notification regardless of online status
                    EmailSender.sendNotifEmail(emailLost, item,messageUser);
                    EmailSender.sendNotifEmail(emailFound, possible,messagePossible);
                    ItemDao.updateMatchStatus(item.getId(), MatchedStatus.MATCHED);
                    ItemDao.updateMatchStatus(possible.getId(), MatchedStatus.MATCHED);
                    return;
                }

        }
        System.out.println("no matches found");
    }
     static boolean isPotentialMatch(Item lost, Item found) {
        return lost.getCategory().equals(found.getCategory()) &&
                lost.getLocation().equals(found.getLocation()) &&
                isWithinTimeRange(lost.getDatefound(), found.getDatefound());
    }
    static boolean isWithinTimeRange(LocalDate lostDate, LocalDate foundDate) {
        try {
            // Calculate the difference in days
            long daysBetween = ChronoUnit.DAYS.between(lostDate, foundDate);
            // Allow a match if the found date is within ±20 days of the lost date
            System.out.println("daysBetween: " + daysBetween);
            return Math.abs(daysBetween) <= 20;
        } catch (Exception e) {
            System.err.println("❌ Error parsing dates: " + e.getMessage());
            return false;
        }
    }
    static void storeNotification(Notification notification) {
        String query = "INSERT INTO notification (message, user_id, status, item_id, possible_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setString(1, notification.getMessage());
            ps.setInt(2, notification.getUserId());
            ps.setString(3, notification.getStatus().toString());
            ps.setInt(4, notification.getItemId());
            ps.setInt(5, notification.getPossibleId());
    
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("A notification has been stored for user " + notification.getUserId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void updateNotifStatus(NotifStatus status,Integer notificationId) {
        String query = "UPDATE notification SET status = ? WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setString(1, status.toString());
            ps.setInt(2, notificationId);
    
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Notification with ID " + notificationId + " has been updated to " + status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static Notification getNotificationById(Integer notificationId) {
        String query = "SELECT * FROM notification WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setInt(1, notificationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Notification notif = new Notification();
                    notif.setId(rs.getInt("id"));
                    notif.setMessage(rs.getString("message"));
                    notif.setUserId(rs.getInt("user_id"));
                    notif.setStatus(NotifStatus.valueOf(rs.getString("status")));
                    notif.setItemId(rs.getInt("item_id"));
                    notif.setPossibleId(rs.getInt("possible_id"));
                    notif.setDateSent(rs.getTimestamp("created_at").toString());
                    return notif;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void deleteNotificationById(Integer notificationId) {
        String query = "DELETE FROM notification WHERE id = ?";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setInt(1, notificationId);
    
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Notification with ID " + notificationId + " has been deleted.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static float getPercentageOfAcceptedNotifications() throws SQLException {
        String query = "SELECT COUNT(*) FROM notification WHERE status = 'ACCEPTED'";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
    
            if (rs.next()) {
                return (float) (rs.getInt(1) * 100) / getNbNotifs();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;

    }
    public static float getPercentageOfRejectedNotifications() throws SQLException {
        String query = "SELECT COUNT(*) FROM notification WHERE status = 'REJECTED'";
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            return (float) (rs.getInt(1) * 100) / getNbNotifs();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;

    }
    public static Integer getNbNotifs() throws SQLException {
        String query = "SELECT COUNT(*) FROM notification";
        try (Connection con = BDConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
    
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    public static float getPercentageOfPendingNotifications() throws SQLException {
        String query = "SELECT COUNT(*) FROM notification WHERE status = 'PENDING'";
    try (Connection con = BDConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            return (float) (rs.getInt(1) * 100) / getNbNotifs();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
