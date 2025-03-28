let socket;

function connectWebSocket() {
    socket = new WebSocket("ws://localhost:8080/notification");

    socket.onopen = function () {
        console.log("connected to WebSocket !");
    };

    socket.onmessage = function (event) {
        console.log(event);
        console.log("Message received from the server : ", event.data);
        document.getElementById('messages').innerHTML
            += '<br />' + event.data;
    };

    socket.onclose = function () {
        console.log(" WebSocket closed.");
        setTimeout(connectWebSocket, 3000);
    };

    socket.onerror = function (error) {
        console.log(" error WebSocket : ", error);
    };
}


connectWebSocket();
