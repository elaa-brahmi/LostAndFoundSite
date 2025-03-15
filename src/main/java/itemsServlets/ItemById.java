package itemsServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Item;
import model.ItemStatus;
import model.ItemType;
import services.ItemDao;
import services.cloudinary.CloudinaryServices;

import java.io.IOException;
import java.time.LocalDate;
@WebServlet(name="ItemById",urlPatterns = "/ItemById")
public class ItemById extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
