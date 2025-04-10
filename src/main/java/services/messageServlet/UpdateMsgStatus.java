package services.messageServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.MessageImpl;

import java.io.IOException;

@WebServlet(name="updateMsgStatus",urlPatterns="/updateMsgStatus")
public class UpdateMsgStatus extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String conversation_id=request.getParameter("conversation_id");
        String userId=request.getParameter("userId");
        MessageImpl msg=new MessageImpl();
        msg.MarkAllMessagesAsRead(Integer.parseInt(conversation_id),Integer.parseInt(userId));
    }
}
