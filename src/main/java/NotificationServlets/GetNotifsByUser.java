package NotificationServlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.NotifStatus;
import model.Notification;
import services.BDConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="notifsUser",urlPatterns = "/notifsUser")
public class GetNotifsByUser extends HttpServlet {
    Connection con;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Notification> list=new ArrayList<>();
        try{
            con= BDConnection.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from notification where user_id=? order by created_at desc");
            ps.setInt(1,Integer.parseInt(request.getParameter("user_id")));
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Notification notif=new Notification();
                notif.setUserId(rs.getInt("user_id"));
                notif.setId(rs.getInt("id"));
                notif.setMessage(rs.getString("message"));
                notif.setStatus(NotifStatus.valueOf(rs.getString("status")));
                notif.setItemId(rs.getInt("item_id"));
                notif.setPossibleId(rs.getInt("possible_id"));
                notif.setDateSent( rs.getTimestamp("created_at").toString());
                list.add(notif);
            }
            Gson gson = new Gson();
            String json = gson.toJson(list);
            System.out.println("json notif "+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();

        }

        catch(SQLException e){
            e.printStackTrace();

        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
