package services.messageServlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.ConversationImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name="getConversations",urlPatterns="/getConversations")
public class GetUserConversations extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");
        Integer user_id_int=Integer.parseInt(user_id);
        ConversationImpl conversationimpl=new ConversationImpl();
        List<Map<String, Object>> conversations= conversationimpl.getAllConversationsByUser(user_id_int);
        Gson gson=new Gson();
        String json=gson.toJson(conversations);
        System.out.println(json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        System.out.println(conversations);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
