package services.messageServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.FriendRequestDao;

import java.io.IOException;
@WebServlet(name="updateFriendRequestStatus",urlPatterns="/updateFriendRequestStatus")
public class UpdateRequestStatus extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestId=request.getParameter("requestId");
        String status=request.getParameter("status");
        FriendRequestDao.updateFriendRequestStatus(Integer.parseInt(requestId),status);
    }
}
