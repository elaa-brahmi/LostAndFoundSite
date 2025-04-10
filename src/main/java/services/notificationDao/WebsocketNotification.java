package services.notificationDao;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.ServerEndpoint;
import jakarta.websocket.*;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
@ServerEndpoint(value = "/WebsocketNotification", configurator = MyEndpointConfigurator.class)
public class WebsocketNotification{
    private static final Map<String, Session> userSessions = new ConcurrentHashMap<>();
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        System.out.println("here 1");
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        if (httpSession == null) {
            System.out.println("HttpSession is null in websocket endpoint");
            try {
                session.close(new CloseReason(CloseReason.CloseCodes.CANNOT_ACCEPT, "HttpSession is null"));
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }

        Object userIdObj = httpSession.getAttribute("userId");
        System.out.println("here 1" + userIdObj);

        if (userIdObj == null) {
            System.out.println("userId is null in websocket endpoint");
            try {
                session.close(new CloseReason(CloseReason.CloseCodes.CANNOT_ACCEPT, "userId is null"));
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }

        String userId = userIdObj.toString();
        System.out.println("Attempting to open WebSocket for userId: " + userId);

        // Set userId in the WebSocket session's user properties
        session.getUserProperties().put("userId", userId);

        // Handle duplicate connections
        if (userSessions.containsKey(userId)) {
            Session oldSession = userSessions.get(userId);
            try {
                oldSession.close(new CloseReason(CloseReason.CloseCodes.NORMAL_CLOSURE, "New connection established"));
                System.out.println("Closed old WebSocket session for userId: " + userId);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Add the new session to the map
        userSessions.put(userId, session);
        System.out.println("WebSocket opened for userId: " + userId);
    }
    @OnClose
    public void onClose(Session session) {

     String userId = (String) session.getUserProperties().get("userId");
        if (userId != null) {
            userSessions.remove(userId);
            System.out.println("WebSocket closed for userId: " + userId);
        } else {
            System.out.println("WebSocket closed, but userId was null.");
        }
    }
    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("WebSocket error: " + throwable.getMessage());
        throwable.printStackTrace();
    }

    public static void sendNotificationToUser(String userId, String message) {  // Use String type for userId
        Session session = userSessions.get(userId);
        if (session == null) {
            System.out.println("Cannot send notification. Session is null or closed for userId: " + userId);
            return;
        }
        System.out.println("send notif session id"+session.getId());
        for (Map.Entry<String, Session> entry : userSessions.entrySet()) {
            String Id = entry.getKey();
            Session sessionn = entry.getValue();
            System.out.println("Session of the map: " + sessionn);
            System.out.println("Id user in map: " + Id);

        }

        if (session != null ) {
            try {
                session.getBasicRemote().sendText(message);
                System.out.println(" WebSocket notification sent to user: " + userId);
            } catch (IOException e) {
                System.out.println("Error sending notification to client : "+userId+" " + e.getMessage());
                e.printStackTrace();
            }
        }
        else {
            System.out.println("Cannot send notification. Session is null or closed for userId:  " + userId);
        }
    }


}
