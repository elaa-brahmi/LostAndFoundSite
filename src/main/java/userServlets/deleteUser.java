package userServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="deleteUser",urlPatterns = "/deleteUser")
public class deleteUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id user to delete: " + id);
        try {
            UserDao.deleteUser(id);
           // request.setAttribute("message_delete_user", "User deleted successfully");
          //  getServletContext().getRequestDispatcher("tables.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
