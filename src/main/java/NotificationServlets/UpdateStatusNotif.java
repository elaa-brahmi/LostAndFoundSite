package NotificationServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MatchedStatus;
import model.NotifStatus;
import model.Notification;
import services.ItemDao;
import services.notificationDao.NotificationDao;

import java.io.IOException;

public class UpdateStatusNotif extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status"); // accepted or rejected
        Integer id = Integer.parseInt(request.getParameter("idNotif"));
        Notification notif=NotificationDao.getNotificationById(id);
        NotifStatus notifStatus=NotifStatus.valueOf(status);
        NotificationDao.updateNotifStatus(notifStatus,id);
        if(notifStatus.equals(NotifStatus.ACCEPTED)) {
            notif.setStatus(NotifStatus.ACCEPTED);
            ItemDao.updateMatchStatus(notif.getItemId(), MatchedStatus.RESOLVED);
        }
        else{
            notif.setStatus(NotifStatus.REJECTED);

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
