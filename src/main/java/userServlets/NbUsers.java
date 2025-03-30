package userServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="nbUsers",urlPatterns="/NbUsers")
public class NbUsers extends HttpServlet

{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Integer NbUsers= UserDao.getNumberOfUsers();
            resp.setContentType("text/plain");
            resp.getWriter().write(String.valueOf(NbUsers));
            resp.getWriter().flush();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
}
