package services.messageServlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.FriendRequestDao;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="frPending",urlPatterns="/frPending")
public class GetNumberOfPendingFriendRequets extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int frPending= FriendRequestDao.getNumberOfPendingFriendRequests(userId);
        Gson gson = new Gson();
        String json = gson.toJson(frPending);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }

}
