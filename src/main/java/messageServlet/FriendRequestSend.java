package services.messageServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FriendRequest;
import services.messageDao.FriendRequestDao;

import java.io.IOException;

@WebServlet(name="sendFriendRequest",urlPatterns="/sendFriendRequest")
public class FriendRequestSend extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String senderId=request.getParameter("senderId");
        String receiverId=request.getParameter("receiverId");
        FriendRequest friendRequest=new FriendRequest(Integer.parseInt(senderId),Integer.parseInt(receiverId));
        FriendRequestDao.addFriendRequest(friendRequest);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
