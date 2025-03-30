package userServlets;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import services.UserDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="allUsers",urlPatterns = "/allUsers")
public class GetAllUsers extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<User> users= UserDao.getUsers();
            Gson gson = new Gson();
            String usersDetails= gson.toJson(users);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Write the JSON to the response
            PrintWriter out = response.getWriter();
            out.print(usersDetails);
            out.flush();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
