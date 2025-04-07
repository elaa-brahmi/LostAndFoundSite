package services.messageServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.messageDao.ConversationDao;

import java.io.IOException;

@WebServlet(name="deleteConvo",urlPatterns="/deleteConvo")
public class DeleteConvo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String convoId = request.getParameter("id");
        int convoIdInt = Integer.parseInt(convoId);
        ConversationDao.delete(convoIdInt);
    }
}
