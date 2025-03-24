package services.notificationDao;
import jakarta.websocket.server.ServerEndpoint;
import jakarta.websocket.*;
import jakarta.websocket.Session;
import services.ItemDao;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
@ServerEndpoint(value = "/notification", configurator = MyEndpointConfigurator.class)
public class WebsocketNotification {
    private static final Map<String, Session> userSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        String userId = (String) session.getUserProperties().get("userId");
        if(userId != null && !userSessions.containsKey(userId) ) {
            userSessions.put(userId, session);
            System.out.println("🔗 WebSocket connected: " + userId);
        }
    }
    @OnClose
    public void onClose(Session session) {
        // Retrieve the userId from the session properties
        String userId = (String) session.getUserProperties().get("userId");
        userSessions.remove(userId);
        System.out.println("❌ WebSocket closed: " + userId);

    }

    public static void sendNotificationToUser(String userId, String message) {  // Use String type for userId
        Session session = userSessions.get(userId);
        if (session != null && session.isOpen()) {
            try {
                session.getBasicRemote().sendText(message);
                System.out.println("📩 WebSocket notification sent to user: " + userId);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


}
