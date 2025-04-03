package userServlets;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import services.BDConnection;
import services.UserDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet(name="UserInfos",urlPatterns="/UserInfos")
public class GetUser extends HttpServlet {
    Connection con ;
    User user=null;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
          
            int userId = Integer.parseInt(request.getParameter("userId"));
            User user=UserDao.getUser(userId);
         
            Gson gson = new Gson();
            String userDetails= gson.toJson(user);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Write the JSON to the response
            PrintWriter out = response.getWriter();
            out.print(userDetails);
            out.flush();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
