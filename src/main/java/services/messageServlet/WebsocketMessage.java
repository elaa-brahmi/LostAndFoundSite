package services.messageServlet;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import org.cloudinary.json.JSONObject;
import services.notificationDao.MyEndpointConfigurator;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value = "/WebsocketMessage", configurator = MyEndpointConfigurator.class)
public class WebsocketMessage {
    private static final Map<String, Session> userSessions = new ConcurrentHashMap<>();
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
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
    @OnMessage
    public void onMessage(String message,Session session) { // the message is formatted as json
        try{
            String SenderId=session.getUserProperties().get("userId").toString();
            JSONObject json = new JSONObject(message);
            String receiverId = json.getString("receiverId");
            String messageContent = json.getString("message");
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("from", SenderId);
            jsonResponse.put("to", receiverId);
            jsonResponse.put("message", messageContent);
            jsonResponse.put("timestamp", java.time.Instant.now().toString());
            sendMessageToUser(SenderId, jsonResponse.toString());// send to the sender
            System.out.println("Received message from " + SenderId + " to " + receiverId + ": " + messageContent);

            if (userSessions.containsKey(receiverId)) {
                Session receiverSession = userSessions.get(receiverId);
                if (receiverSession != null && receiverSession.isOpen()) {
                    sendMessageToUser(receiverId, jsonResponse.toString()); //send to the receiver
                } else {
                    System.out.println("User " + receiverId + " is offline.");
                    // Optionally: store message in DB for later delivery
                }
            } else {
                System.out.println("Receiver not connected.");
            }}
        catch(Exception e){
            e.printStackTrace();
        }
    }

    private void sendMessageToUser(String userId, String jsonMessage) {
        Session session = userSessions.get(userId);
        if (session != null && session.isOpen()) {
            try {
                session.getBasicRemote().sendText(jsonMessage);
            } catch (IOException e) {
                System.out.println("Error sending message to user " + userId + ": " + e.getMessage());
                e.printStackTrace();
            }
        }
    }

}
