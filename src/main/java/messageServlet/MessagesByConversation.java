package services.messageServlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Message;
import services.messageDao.ConversationImpl;
import services.messageDao.MessageDao;
import services.messageDao.MessageImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name="fetchMessagesByConversationId",urlPatterns="/fetchMessagesByConversationId")
public class MessagesByConversation extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String conversation_id=request.getParameter("conversation_id");
        MessageImpl msgimpl=new MessageImpl();
        List<Message> messages=msgimpl.getMessagesByConversationId(Integer.parseInt(conversation_id));
        Gson gson=new Gson();
        String json=gson.toJson(messages);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        System.out.println(messages);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
