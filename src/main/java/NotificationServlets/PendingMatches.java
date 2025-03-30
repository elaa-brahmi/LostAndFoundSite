package NotificationServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.notificationDao.NotificationDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="pendingMatches",urlPatterns = "/pendingMatches")
public class PendingMatches extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            float percentage = NotificationDao.getPercentageOfPendingNotifications();
            System.out.println("pending percentage: " + percentage);
            response.setContentType("text/plain");
            // response.setCharacterEncoding("UTF-8");
            response.getWriter().write(String.valueOf(percentage));
            response.getWriter().flush();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
