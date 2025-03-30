package NotificationServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.notificationDao.NotificationDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="acceptedNotifs",urlPatterns = "/PercentageAcceptedNotifs")
public class GetAcceptedNotifs extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            float percentage = NotificationDao.getPercentageOfAcceptedNotifications();
            System.out.println("acceptedNotifs: " + percentage);
            response.setContentType("text/plain");
            // response.setCharacterEncoding("UTF-8");
            response.getWriter().write(String.valueOf(percentage));
            response.getWriter().flush();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
