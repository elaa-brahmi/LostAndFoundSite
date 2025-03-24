//package services.notificationDao;
//
//import model.Item;
//import org.quartz.*;
//import services.EmailSender;
//import services.ItemDao;
//
//import java.time.LocalDate;
//import java.time.temporal.ChronoUnit;
//import java.util.List;
////Purpose: This job is executed by the Quartz Scheduler to find matches.
////How it Works:
////Queries the lost and found objects from the database.
////Compares them based on:
////Category (Same type of item).
////Location (Lost and found in the same place).
////Time (Within a defined range, e.g., 7 days).
////If a match is found, it triggers:
////A WebSocket notification for online users.
////An email notification for both online and offline users.
//
//public class MatchCheckJob implements Job {
//    //the logic has to change when every new post arrives we check the matches
//
//    @Override
//    public void execute(JobExecutionContext context) throws JobExecutionException {
//        System.out.println("🔄 Checking for lost & found matches...");
//        List<Item> lostItems = ItemDao.getLostItems();
//        List<Item> foundItems = ItemDao.getFoundItems();
//
//
//        for (Item lostItem : lostItems) {
//            for (Item foundItem : foundItems) {
//                if (isPotentialMatch(lostItem, foundItem)) {
//                    Integer userIdLost = lostItem.getUserId();
//                    Integer userIdFound = foundItem.getUserId();
//                    String emailLost =ItemDao.getUserEmail(lostItem);
//                    String emailFound =ItemDao.getUserEmail(foundItem);
//
//                    String messageFound = "🔔 Possible match for your found object:\n " +
//                            "📌 Title: " + foundItem.getName() + "\n" +
//                            "📍 Location: " + foundItem.getLocation() + "\n"+ ".";
//                    String messageLost = "🔔 Possible match for your lost object: \n" +
//                            "📌 Title: " + foundItem.getName() + "\n" +
//
//                            "📍 Location: " + foundItem.getLocation() + "\n"+ ".";
//
//                    // 1️⃣ Send WebSocket notification if user is online
//                  WebsocketNotification.sendNotificationToUser(userIdLost.toString(), messageLost);
//                    WebsocketNotification.sendNotificationToUser(userIdFound.toString(), messageFound);
//
//
//                    // 2️⃣ Send email notification regardless of online status
//                    EmailSender.sendNotifEmail(emailLost, lostItem,messageLost);
//                    EmailSender.sendNotifEmail(emailFound, foundItem,messageFound);
//
//
//                }
//            }
//        }
//    }
//    private boolean isPotentialMatch(Item lost, Item found) {
//        return lost.getCategory().equals(found.getCategory()) &&
//                lost.getLocation().equals(found.getLocation()) &&
//                isWithinTimeRange(lost.getDatefound(), found.getDatefound());
//    }
//    private boolean isWithinTimeRange(LocalDate lostDate, LocalDate foundDate) {
//        try {
//            // Calculate the difference in days
//            long daysBetween = ChronoUnit.DAYS.between(lostDate, foundDate);
//
//            // Allow a match if the found date is within ±7 days of the lost date
//            return Math.abs(daysBetween) <= 7;
//
//        } catch (Exception e) {
//            System.err.println("❌ Error parsing dates: " + e.getMessage());
//            return false;
//        }
//    }
//}
