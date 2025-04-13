package messageServlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.MessageDao;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="unreadMsgUser",urlPatterns="/unreadMsgUser")
public class NbUnreadMsgByUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        Integer unreadMsg = MessageDao.getNumberOfUnreadMessagesByUser(Integer.parseInt(userId));
        Gson gson=new Gson();
        String json=gson.toJson(unreadMsg);
        System.out.println(json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        System.out.println(unreadMsg);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
