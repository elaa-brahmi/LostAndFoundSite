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
    public static Connection con;

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
                    Notification notificationUser = new Notification(userId,messageUser, NotifStatus.PENDING,item.getId());
                    Notification notificationPossible=new Notification(userIdPossible,messagePossible,NotifStatus.PENDING,possible.getId());
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
                }
        }
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
        try{
            con = BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into notification (message,user_id,status,item_id) values(?,?,?,?)");
            ps.setString(1, notification.getMessage());
            ps.setInt(2, notification.getUserId());
            ps.setString(3, notification.getStatus().toString());
            ps.setInt(4, notification.getItemId());
            int row=ps.executeUpdate();
            if(row>0){
                System.out.println("a notification has been stored to user "+notification.getUserId());
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    public static void updateNotifStatus(NotifStatus status,Integer notificationId) {
        try{
            con=BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update notification set status=? where id=?");
            ps.setString(1, status.toString());
            ps.setInt(2, notificationId);
            ps.executeUpdate();
            int rows=ps.executeUpdate();
            if(rows>0){
                System.out.println("a notification has been updated to "+status.toString());
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }

    }

    public static Notification getNotificationById(Integer notificationId) {
        try{
            con=BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from notification where id=?");
            ps.setInt(1, notificationId);
            ResultSet rs = ps.executeQuery();
            Notification notif=new Notification();

            while(rs.next()){
                notif.setId(rs.getInt("id"));
                notif.setMessage(rs.getString("message"));
                notif.setUserId(rs.getInt("user_id"));
                notif.setStatus(NotifStatus.valueOf(rs.getString("status")));
                notif.setItemId(rs.getInt("item_id"));
            }
            return notif;
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    public static void deleteNotificationById(Integer notificationId) {
        try{
            con=BDConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from notification where id=?");
            ps.setInt(1, notificationId);
            ps.executeUpdate();
            int rows=ps.executeUpdate();
            if(rows>0){
                System.out.println("a notification has been deleted to "+notificationId);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
}
