package messageServlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.FriendRequestDao;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="checkFriendship",urlPatterns="/checkFriendship")
public class CheckFriendship extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId=request.getParameter("senderId");
        String receiverId=request.getParameter("receiverId");
        boolean friends=FriendRequestDao.checkFriendship(Integer.parseInt(userId),Integer.parseInt(receiverId));
        Gson gson = new Gson();
        String json = gson.toJson(friends);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
}
