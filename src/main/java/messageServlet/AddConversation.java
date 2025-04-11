package services.messageServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Conversation;
import services.messageDao.ConversationImpl;

import java.io.IOException;

@WebServlet(name="addConvo",urlPatterns = "/addConvo")
public class AddConversation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String receiverId=request.getParameter("receiverId");
        String senderId=request.getParameter("senderId");

        System.out.println(" creating a conversation servlet , receiverId= "+receiverId+" senderId= "+senderId);
       // Conversation conversation=new Conversation(Integer.parseInt(receiverId),Integer.parseInt(senderId));
        ConversationImpl conversationImpl=new ConversationImpl();
        int id=conversationImpl.addConversationToUser(Integer.parseInt(receiverId),Integer.parseInt(senderId));
        response.getWriter().write("{\"conversationId\": " + id + "}");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
