package NotificationServlets;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.notificationDao.NotificationDao;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="unreadNotifs",urlPatterns = "/unreadNotifs")
public class NbUnreadNotifs extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId=Integer.parseInt(request.getParameter("userId"));
        int nb= NotificationDao.getNumberOfUnreadNotifications(userId);
        Gson gson = new Gson();
        String json = gson.toJson(nb);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();

    }

}
