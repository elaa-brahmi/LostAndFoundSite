package itemsServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ItemDao;

import java.io.IOException;

@WebServlet(name="DeleteItem",urlPatterns = "/DeleteItem")
public class DeleteItem extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("idItem"));
        ItemDao.deleteItem(itemId);
        response.sendRedirect("MyPosts");

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
