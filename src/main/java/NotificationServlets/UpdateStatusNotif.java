package NotificationServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MatchedStatus;
import model.NotifStatus;
import model.Notification;
import services.ItemDao;
import services.notificationDao.NotificationDao;

import java.io.IOException;
@WebServlet(name="NotifStatus",urlPatterns="/updateNotifStatus")
public class UpdateStatusNotif extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status"); // accepted or rejected
        Integer id = Integer.parseInt(request.getParameter("idNotif"));
        Notification notif=NotificationDao.getNotificationById(id);
        NotifStatus notifStatus=NotifStatus.valueOf(status.toUpperCase());
        if(notifStatus.equals(NotifStatus.ACCEPTED)) {
            NotificationDao.updateNotifStatus(NotifStatus.ACCEPTED,id);
            ItemDao.updateMatchStatus(notif.getItemId(), MatchedStatus.RESOLVED);
            ItemDao.updateMatchStatus(notif.getPossibleId(), MatchedStatus.RESOLVED);

        }
        else{
            NotificationDao.updateNotifStatus(NotifStatus.REJECTED,id);
            ItemDao.updateMatchStatus(notif.getItemId(), MatchedStatus.MATCHED);
            ItemDao.updateMatchStatus(notif.getPossibleId(), MatchedStatus.MATCHED);


        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
