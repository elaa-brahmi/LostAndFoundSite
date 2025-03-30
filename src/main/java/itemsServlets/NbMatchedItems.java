package itemsServlets;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ItemDao;

import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name="matchedItems",urlPatterns = "/matchedItems")
public class NbMatchedItems extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int nbMatchedItems = ItemDao.GetNbMatchedItems();
            response.setContentType("text/plain");
            // response.setCharacterEncoding("UTF-8");
            response.getWriter().write(String.valueOf(nbMatchedItems));
            response.getWriter().flush();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
