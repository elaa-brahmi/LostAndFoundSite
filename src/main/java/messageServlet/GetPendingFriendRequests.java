package services.messageServlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FriendRequest;
import services.messageDao.FriendRequestDao;

import java.io.PrintWriter;
import java.util.List;
import java.io.IOException;
import java.util.Map;

@WebServlet(name="getPendingFriendRequests",urlPatterns ="/getPendingFriendRequests")
public class GetPendingFriendRequests extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");
        Integer user_id_int=Integer.parseInt(user_id);
        List<Map<String, String>>  allFriendREQUESTS=FriendRequestDao.fetchPendingFriendRequestsByReceiverId(user_id_int);
        Gson gson=new Gson();
        String json=gson.toJson(allFriendREQUESTS);
        System.out.println(json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
