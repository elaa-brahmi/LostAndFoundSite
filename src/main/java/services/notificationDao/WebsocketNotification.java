package services.notificationDao;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.ServerEndpoint;
import jakarta.websocket.*;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
@ServerEndpoint(value = "/notification", configurator = MyEndpointConfigurator.class)
public class WebsocketNotification {
    private static final Map<String, Session> userSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        if(httpSession == null) {
            System.out.println("HttpSession is null in websocket endpoint");
        }
        else{
            String userId = httpSession.getAttribute("userId").toString(); //null pointer exception
            if(userId == null) {
                System.out.println("userId is null in websocket endpoint");
            }
            else {
                System.out.println("Attempting to open WebSocket for userId: " + userId);
            }
            if(!userSessions.containsKey(userId)) {
                userSessions.put(userId, session);
                System.out.println(" userId added to map socket: " + userId);
            }
            else{
                System.out.println("User id is already connected " + userId);
            }
        }
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
//    @OnMessage
//    public void onMessage(String message, Session session) {  //incoming messages from client
//        System.out.println("Received message: " + message);
//        try {
//            session.getBasicRemote().sendText(message);
//        } catch (IOException e) {
//            System.out.println("Error sending message to client : " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
    public static void sendNotificationToUser(String userId, String message) {  // Use String type for userId
        Session session = userSessions.get(userId);
        if (session != null && session.isOpen()) {
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
