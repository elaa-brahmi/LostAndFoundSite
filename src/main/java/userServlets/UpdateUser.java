package userServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import services.UserDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name="UpdateUser" , urlPatterns ="/UpdateUser")
public class UpdateUser extends HttpServlet {
    private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
    private boolean isValidEmail(String email) {
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder message = new StringBuilder();
       // System.out.println(request.getParameter("idUser"));
        Integer id = Integer.parseInt(request.getParameter("idUser"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if(phone.length()!=8){
            message.append("Invalid phone number");
            request.setAttribute("error",message.toString());
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;

        }
        if(!isValidEmail(email)){
            message.append("Invalid email address");
            request.setAttribute("error",message.toString());
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;

        }


        User newUser = new User(id,name, email, phone);
        try {
            UserDao.updateUser(newUser);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
getServletContext().getRequestDispatcher("/MyPosts.jsp").forward(request, response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
