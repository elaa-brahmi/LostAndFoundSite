package services.notificationDao;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.HandshakeResponse;
import jakarta.websocket.server.HandshakeRequest;
import jakarta.websocket.server.ServerEndpointConfig;

public class MyEndpointConfigurator extends ServerEndpointConfig.Configurator {
//    @Override
//    public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
//       // super.modifyHandshake(config, request, response);
//        // Retrieve the HttpSession from the request
//        HttpSession httpSession = (HttpSession) request.getHttpSession();
//        if (httpSession != null) {
//            String userId = (String) httpSession.getAttribute("userId");
//            if (userId != null) {
//                config.getUserProperties().put("userId", userId);
//                System.out.println(" Handshake successful, userId: " + userId);
//            } else {
//                System.out.println("HttpSession found, but userId is null.");
//            }
//        } else {
//            System.out.println( "No HttpSession found in handshake.");
//        }
//    }
        @Override
        public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
            HttpSession httpSession = (HttpSession) request.getHttpSession();
            if (httpSession != null) {
                System.out.println("HttpSession found in handshake.");
                config.getUserProperties().put(HttpSession.class.getName(), httpSession);
            }
            else{

                System.out.println("No HttpSession found in handshake.");
            }
        }
}
