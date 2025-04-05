let socket;

function connectWebSocket() {
    console.log('Connected websocket');
    socket = new WebSocket("ws://localhost:8080/WebsocketNotification");
    console.log(socket);

    socket.onopen = function () {
        console.log("connected to WebSocket !");
        //todo fetch notifs ajax

    };

    socket.onmessage = function (event) {
        console.log(event);
        console.log("Message received from the server : ", event.data);
        document.getElementById('messages').innerHTML
            += '<br />' + event.data;
        //todo naayet function to fetch notifs
    };

    socket.onclose = function () {
        console.log(" WebSocket closed.");

    };

    socket.onerror = function (error) {
        console.log(" error WebSocket : ", error);
    };
}
window.onload = function () {
connectWebSocket();
}


