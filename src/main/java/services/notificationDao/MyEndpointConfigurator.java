package services.notificationDao;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.HandshakeResponse;
import jakarta.websocket.server.HandshakeRequest;
import jakarta.websocket.server.ServerEndpointConfig;

public class MyEndpointConfigurator extends ServerEndpointConfig.Configurator {
    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        super.modifyHandshake(sec, request, response);

        // Retrieve the HttpSession from the request
        HttpSession httpSession = (HttpSession) request.getHttpSession();

        if (httpSession != null) {
            String userId = (String) httpSession.getAttribute("userId"); // Your stored userId in HttpSession
            sec.getUserProperties().put("userId", userId);
        }}
}
