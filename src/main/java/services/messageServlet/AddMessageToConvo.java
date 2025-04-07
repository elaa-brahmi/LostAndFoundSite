package services.messageServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Message;
import services.messageDao.MessageImpl;

import java.io.IOException;

@WebServlet(name="addMsg",urlPatterns = "/addMsg")
public class AddMessageToConvo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content=request.getParameter("message");
        String senderId=request.getParameter("sender_id");
        String conversationId=request.getParameter("conversationId");
        System.out.println(" creating a message servlet , "+" senderId= "+senderId+" content= "+content+" conversationId= "+conversationId);
        Message message=new Message(content,Integer.parseInt(senderId),Integer.parseInt(conversationId));
        MessageImpl messageImpl=new MessageImpl();
        messageImpl.addMessage(message);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
