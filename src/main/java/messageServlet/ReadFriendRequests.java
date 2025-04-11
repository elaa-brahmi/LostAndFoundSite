package services.messageServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.FriendRequestDao;

import java.io.IOException;

@WebServlet(name="updateReadabilityFriendRequests",urlPatterns = "/updateReadabilityFriendRequests")
public class ReadFriendRequests extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");
        FriendRequestDao.updateFriendRequestStatusToRead(Integer.parseInt(user_id));
    }
}
