package NotificationServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.notificationDao.NotificationDao;

import java.io.IOException;

@WebServlet(name="updateUnreadNotifs",urlPatterns="/updateUnreadNotifs")
public class UpdateNotifReadStatus extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");
        NotificationDao.updateUnreadNotifs(Integer.parseInt(user_id));
    }
}
