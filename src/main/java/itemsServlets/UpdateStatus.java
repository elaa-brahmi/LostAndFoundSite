package itemsServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ItemDao;

import java.io.IOException;
@WebServlet(name="updateStatusItems",urlPatterns = "/updateStatusItems")
public class UpdateStatus extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer itemid = Integer.parseInt(request.getParameter("itemid"));
        String status = request.getParameter("status");
        ItemDao.updateStatus(itemid, status);
        request.setAttribute("update_status", "item status updated successfully");
        request.getRequestDispatcher("/pages/tables.jsp").forward(request, response);

    }
}
