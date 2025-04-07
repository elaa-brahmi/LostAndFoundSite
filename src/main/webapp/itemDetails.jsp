<%@ page import="model.Conversation" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2025-04-01
  Time: 1:31 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>item details</title>
    <!-- Inclure Toastr CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
   
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- AOS JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            AOS.init();
        });
    </script><script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Fira+Sans:400,500,600,700,800');
        @import url('https://fonts.googleapis.com/css?family=Fira+Sans:400,500,600,700,800');
        * {
            box-sizing: border-box;
        }
        body {

            min-height: 100vh;
            font-family: 'Fira Sans', sans-serif;
            display: flex;
        }

        .blog-slider {
            width: 95%;
            position: relative;
            max-width: 800px;
            margin: auto;
            background: #fff;
            box-shadow: 0px 14px 80px rgba(34, 35, 58, 0.2);
            padding: 25px;
            border-radius: 25px;
            height: 400px;
            transition: all .3s;


            @media screen and (max-width: 992px) {
                max-width: 680px;
                height: 400px;
            }

            @media screen and (max-width: 768px) {
                min-height: 500px;
                height: auto;
                margin: 180px auto;
            }


            @media screen and (max-height: 500px) and (min-width: 992px) {
                height: 350px;
            }

            &__item {
                display: flex;
                align-items: center;

                @media screen and (max-width: 768px) {
                    flex-direction: column;
                }

                &.swiper-slide-active {
                    .blog-slider__img {
                        img {
                            opacity: 1;
                            transition-delay: .3s;
                        }
                    }
                    .blog-slider__content {
                        > * {

                            opacity: 1;
                            transform: none;


                        }
                    }
                }

            }

            &__img {
            // width: 40%;
                width: 300px;
                flex-shrink: 0;
                height: 300px;
                background-image: linear-gradient(147deg, #fe8a39 0%, #fd3838 74%);
                box-shadow: 4px 13px 30px 1px rgba(252, 56, 56, 0.2);
                border-radius: 20px;
                transform: translateX(-80px);

                overflow: hidden;

                &:after {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-image: linear-gradient(147deg, #fe8a39 0%, #fd3838 74%);
                    border-radius: 20px;
                    opacity: 0.8;
                }

                img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    display: block;
                    opacity: 0;
                    border-radius: 20px;
                    transition: all .3s;
                }


                @media screen and (max-width: 992px) {
                // width: 45%;
                }
                @media screen and (max-width: 768px) {
                    transform: translateY(-50%);
                    width: 90%;
                }
                @media screen and (max-width: 576px) {
                    width: 95%;
                }
                @media screen and (max-height: 500px) and (min-width: 992px) {
                    height: 270px;
                }
            }

            &__content {
            // width: 60%;
                padding-right: 25px;
                @media screen and (max-width: 992px) {
                // width: 55%;
                }
                @media screen and (max-width: 768px) {
                    margin-top: -80px;
                    text-align: center;
                    padding: 0 30px;
                }

                @media screen and (max-width: 576px) {
                    padding: 0
                }
                > * {
                    opacity: 0;
                    transform: translateY(25px);
                    transition: all .4s;


                }

            }

            &__code {
                color: #7b7992;
                margin-bottom: 15px;
                display: block;
                font-weight: 500;
            }

            &__title {
                font-size: 24px;
                font-weight: 700;
                color: #0d0925;
                margin-bottom: 20px;
            }

            &__text {
                color: #4e4a67;
                margin-bottom: 30px;
                line-height: 1.5em;
            }

            &__button {
                display: inline-flex;
                background-image: linear-gradient(147deg, #fe8a39 0%, #fd3838 74%);
                padding: 15px 35px;
                border-radius: 50px;
                color: #fff;
                box-shadow: 0px 14px 80px rgba(252, 56, 56, 0.4);
                text-decoration: none;
                font-weight: 500;
                justify-content: center;
                text-align: center;
                letter-spacing: 1px;
                @media screen and (max-width: 576px) {
                    width: 100%;
                }

            }
            .swiper-container-horizontal>.swiper-pagination-bullets, .swiper-pagination-custom, .swiper-pagination-fraction {
                bottom: 10px;
                left: 0;
                width: 100%;

            }
            &__pagination {
                position: absolute;
                z-index: 21;
                right: 20px;
                width: 11px!important;
                text-align: center;
                left: auto!important;
                top: 50%;
                bottom: auto!important;
                transform: translateY(-50%);
                @media screen and (max-width: 768px) {
                    transform: translateX(-50%);
                    left: 50%!important;
                    top: 205px;
                    width: 100%!important;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
                &.swiper-pagination-bullets .swiper-pagination-bullet {
                    margin: 8px 0;
                    @media screen and (max-width: 768px) {
                        margin: 0 5px;
                    }
                }

                .swiper-pagination-bullet {
                    width: 11px;
                    height: 11px;
                    display: block;
                    border-radius: 10px;
                    background: #062744;
                    opacity: 0.2;
                    transition: all .3s;
                    &-active {
                        opacity: 1;
                        background: #fd3838;
                        height: 30px;
                        box-shadow: 0px 0px 20px rgba(252, 56, 56, 0.3);

                        @media screen and (max-width: 768px) {
                            height: 11px;
                            width: 30px;
                        }
                    }
                }

            }

        }
        .hidden{
            display:none !important;
        }


        .warning {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            /*width: 320px;*/
            padding: 12px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: start;
            background: #FEF7D1;
            border: 1px solid #F7C752;
            border-radius: 8px;
            box-shadow: 0px 0px 5px -3px #111;
            position: absolute;
            right: 0;
            top: 5px;
            width: 500px;
            height: 50px;
        }

        .warning__icon {
            width: 20px;
            height: 20px;
            transform: translateY(-2px);
            margin-right: 8px;
        }

        .warning__icon path {
            fill: #F7C752;
        }

        .warning__title {
            font-weight: 500;
            font-size: 14px;
            color: #755118;
        }

        .warning__close {
            width: 20px;
            height: 20px;
            margin-left: auto;
            cursor: pointer;
        }

        .warning__close path {
            fill: #755118;
        }
        .msg-container {
            position:absolute;
            right:0;
            bottom:0;
            height:300px;
            overflow-y: scroll;
            background-color: #fff;
            border-radius: 10px;
            padding: 15px;
            margin: 20px;
            display: flex;
            flex-direction: column;
            width: 300px;
        }

        .msg-header {
            display: flex;
            align-items: center;
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        .msg-header .img-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 20px;
            background-color: #333;
        }

        .msg-header .text-chat {
            color: black;
            margin: 0;
            font-size: 20px;
        }

        .msg-body {
            flex: 1;
            overflow-y: auto;
        }

        .messages-container {
            padding: 15px;
        }

        .message-box {
            padding: 10px;
            margin-bottom: 5px;
            border-radius: 10px;
        }

        .message-box.left {
            background-color: #f1f1f1;
            color: black;
            font-size: 13px;
            left: 0;
        }

        .message-box.right {
            background-color: #333;
            color: #fff;
            font-size: 13px;
            right: 0;
        }

        .message-input {
            padding: 5px;
            border-top: 1px solid #ccc;
        }

        .message-input .message-send {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 10px;
            resize: none;
        }

        .message-input .button-send {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-left: 10px;
            border-radius: 10px;
            font-size: 13px;
        }

        .message-input .button-send:hover {
            background-color: #f1f1f1;
            color: #333;
        }

    </style>
</head>
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Inclure Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


    <div class="warning hidden" data-aos="fade-up">
        <div class="warning__icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" height="24" fill="none"><path fill="#393a37" d="m13 14h-2v-5h2zm0 4h-2v-2h2zm-12 3h22l-11-19z"></path></svg>
        </div>
        <div class="warning__title">once you accept the match you will not be notified about your lost item anymore </div>
        <div class="warning__close" onclick="closeWarning()"><svg xmlns="http://www.w3.org/2000/svg" width="20" viewBox="0 0 20 20" height="20"><path fill="#393a37" d="m15.8333 5.34166-1.175-1.175-4.6583 4.65834-4.65833-4.65834-1.175 1.175 4.65833 4.65834-4.65833 4.6583 1.175 1.175 4.65833-4.6583 4.6583 4.6583 1.175-1.175-4.6583-4.6583z"></path></svg></div>
    </div>


<div class="blog-slider">
    <div class="blog-slider__wrp swiper-wrapper">
        <div class="blog-slider__item swiper-slide" style="display: flex;
    flex-direction: row;
    column-gap: 15%;">
            <div class="blog-slider__img">

                <img id="itemImage" src="" width="200px" height="200px" alt="">
            </div>
            <div class="blog-slider__content" style="display: flex
;
    flex-direction: column;
    row-gap: 10px;">
                <span id="datefound" class="blog-slider__code"></span>
                <div id="name" class="blog-slider__title">item name: &nbsp;</div>
                <div id="description" class="blog-slider__text">item description: &nbsp; </div>
                <div id="location" class="blog-slider__text"> item location: &nbsp; </div>
                <div id="type">type: &nbsp;</div>
                </div>
            </div>
        <div style="display: flex; align-items: center; justify-content: center; column-gap: 15px; margin-top: 8%;">
            <button  class="btn btn-secondary hidden" onclick="updateNotif('accepted')">accept match</button>
            <button class="btn btn-danger hidden" onclick="updateNotif('rejected')">reject match</button>
            <button class="btn btn-info hidden" id="request" onclick="sendFriendRequest()" >send matcher a friend request</button>

        </div>
    </div>
<button class="btn btn-primary" onclick="redirectHome()">back</button>
    </div>


<%--    <div class="msg-container hidden" id="chat">--%>
<%--        <div class="msg-header">--%>
<%--            <div class="img-avatar"></div>--%>
<%--            <div class="text-chat">Chat</div>--%>
<%--        </div>--%>
<%--        <div class="msg-body">--%>
<%--            <div class="messages-container">--%>

<%--            </div>--%>
<%--            <div class="message-input">--%>
<%--                <form onsubmit="sendMessage(event)">--%>
<%--                    <textarea placeholder="Type your message here" class="message-send" id="contentMsg"></textarea>--%>
<%--                    <button type="submit" class="button-send">Send</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <script>
    <%--var ConversationId;--%>
    <%--function sendFriendRequest(){--%>
    <%--  //  document.getElementById("chat").classList.remove("hidden");--%>
    <%--       $.ajax({--%>
    <%--           url: 'http://localhost:8080/addConvo',--%>
    <%--           type: 'POST',--%>
    <%--           data: {--%>
    <%--               receiverId:sessionStorage.getItem('receiverId'),--%>
    <%--               senderId:<%= session.getAttribute("userId")%>--%>

    <%--           },--%>
    <%--           success: function(data){--%>
    <%--               console.log("conversation creation :"+data);--%>
    <%--               const response=JSON.parse(data);--%>
    <%--               ConversationId=response.conversationId;--%>
    <%--               console.log("conversation id created  "+ConversationId);--%>
    <%--           },--%>
    <%--           error: function(data){--%>
    <%--               console.log(data);--%>
    <%--           }--%>
    <%--       });--%>

    <%--}--%>

    function sendFriendRequest(){
        $.ajax({
            url: 'http://localhost:8080/sendFriendRequest',
            type: 'POST',
            data: {
                senderId:<%= session.getAttribute("userId")%>,
                receiverId:sessionStorage.getItem('receiverId')
            },
            success: function(data){
                toastr.success("Friend request sent successfully!");
                console.log(data);
                //todo friend request sent successfully
                const urlParams = new URLSearchParams(window.location.search);

                const notifId=urlParams.get('notifId');
                document.getElementById("request").value = "request sent";
                document.getElementById("request").disabled = true;

                //todo delete notif to not show this page again
                deleteNotif(notifId);
            },
            error: function(data){
                console.log(data);
            }

        });
    }
    function redirectHome(){
        window.location.href = "MyPosts.jsp";
    }
    function closeWarning(){
        document.querySelector(".warning").classList.add('hidden');
    }
window.onload = function () {
    const urlParams = new URLSearchParams(window.location.search);
    const itemId = urlParams.get('idItem');
    console.log(itemId);
    $.ajax({
        url: 'http://localhost:8080/ItemById',
        type: 'GET',
        data: {
            id:itemId
        },
        dataType: 'json',
        success: function (data) {
            console.log(data);
            sessionStorage.setItem('receiverId', data.UserId);
            if(data.type==="FOUND" && data.matchedStatus==="RESOLVED"){
                document.getElementById("request").classList.remove("hidden");
            }
            if(data.type==="FOUND" && data.matchedStatus!=="RESOLVED"){
                console.info("this is a found item");
                document.querySelector(".btn.btn-secondary").classList.remove("hidden");
                document.querySelector(".btn.btn-danger").classList.remove("hidden");
                document.querySelector(".warning").classList.remove("hidden");
            }
            if(data.image==="no image is found"){
                document.getElementById('itemImage').src = "assets/img/noPic.png";
            }else{
                document.getElementById('itemImage').src = data.image;
            }
            document.getElementById("name").innerHTML = `<em>Item Name:&nbsp;</em> ` + data.name;
            document.getElementById("description").innerHTML = `<em>Description:&nbsp;</em> ` + data.description;
            document.getElementById("location").innerHTML = `<em>Location:&nbsp;</em> ` + data.location;
            document.getElementById("datefound").innerHTML = `<em>Date Found/lost:&nbsp;</em> ` + data.datefound;
            document.getElementById("type").innerHTML = `<em>Type:&nbsp;</em> ` + data.type.toLowerCase();



        },
        error: function (data) {
            console.log(data);
        }
    });
}
function deleteNotif(id){
    $.ajax({
        url: 'http://localhost:8080/deleteNotif',
        type: 'POST',
        data: {
            id:id
        }
        ,success: function (data) {
            console.log(data);
            window.location.href = "MyPosts.jsp";
        },error: function (data) {
            console.log(data);
        }
    });
}
function updateNotif(status){
    document.querySelector(".btn .btn-secondary").classList.add("hidden");
    document.querySelector(".btn .btn-danger").classList.add("hidden");
    const urlParams = new URLSearchParams(window.location.search);
    const notifId=urlParams.get('notifId');
    console.info("notif id ",notifId);
    $.ajax({
        url: 'http://localhost:8080/updateNotifStatus',
        type: 'POST',
        data: {
            status:status,
            idNotif:notifId
        },
        success: function (data) {
            console.log(data);
            if(data.type!=="LOST"){

                if(status === "accepted"){
                    document.getElementById("request").classList.remove("hidden");
                    //todo toastr not working
                   // toastr.info('you item is matched,you will not receive any further notification about it' , 'success');

                }
                else{
                   // toastr.info("you item is still pending ,you will be notified if there's a new potential match" , 'success');
                    console.log("you item is still pending ,you will be notified if there's a new potential match");
                }
            }
        },
        error: function (data) {
            console.log(data);
        }
    });
}
// document.getElementById("contentMsg").addEventListener("keydown", function (event) {
//     if (event.key === "Enter" && !event.shiftKey) {
//         event.preventDefault(); // Prevent newline
//         sendMessage();
//     }
// });
<%--let socket;--%>

<%--    function connectToWebsocket(){--%>
<%--        socket = new WebSocket("ws://localhost:8080/WebsocketMessage");--%>

<%--        console.log('Connected websocket');--%>
<%--        console.log(socket);--%>
<%--        socket.onopen = function () {--%>
<%--            console.log("connected to WebSocket !");--%>
<%--        };--%>

<%--        socket.onmessage = function (event) {--%>
<%--            const message = JSON.parse(event.data);--%>
<%--            console.log("Message received from the server: ", message);--%>
<%--            try{--%>
<%--                --%>
<%--                const messagesContainer = document.querySelector(".messages-container");--%>
<%--                const messageBox = document.createElement("div");--%>
<%--                messageBox.className = "message-box left";--%>
<%--                messageBox.innerHTML = `<p>`+message.messageForwarded+`</p>`;--%>
<%--                messagesContainer.appendChild(messageBox);--%>
<%--            } catch (error) {--%>
<%--                console.error("Error parsing WebSocket message:", error);--%>
<%--            }--%>
<%--        };--%>
<%--        socket.onclose = function () {--%>
<%--            console.log(" WebSocket closed.");--%>

<%--        };--%>
<%--        socket.onerror = function (error) {--%>
<%--            console.log(" error WebSocket : ", error);--%>
<%--        };--%>
<%--    }--%>
<%--    function sendMessage(event) {--%>
<%--        if(event) event.preventDefault(); // Prevent form submission--%>
<%--            var msg=document.getElementById("contentMsg").value;--%>
<%--            if(msg.trim().length === 0){--%>
<%--                console.log("you can't send an empty message");--%>
<%--                return;--%>
<%--            }--%>
<%--            else{--%>
<%--                console.log("msg sent :"+msg);--%>
<%--                console.log(sessionStorage.getItem('receiverId'));--%>

<%--                const message = {--%>
<%--                    receiverId: sessionStorage.getItem("receiverId"),--%>
<%--                    content: msg--%>
<%--                };--%>
<%--                const messageData={--%>
<%--                    receiverId: sessionStorage.getItem("receiverId"),--%>
<%--                    content: msg,--%>
<%--                    senderId:"<%= session.getAttribute("userId")%>",--%>
<%--                    conversationId:ConversationId--%>
<%--                };--%>
<%--                console.log(messageData);--%>
<%--                //todo ajax create message--%>
<%--                $.ajax({--%>
<%--                    url: 'http://localhost:8080/addMsg',--%>
<%--                    type: 'POST',--%>
<%--                    data:{--%>
<%--                        receiverId: sessionStorage.getItem("receiverId"),--%>
<%--                        content: msg,--%>
<%--                        senderId:<%= session.getAttribute("userId")%>,--%>
<%--                        conversationId:ConversationId,--%>
<%--                    },--%>
<%--                    success: function (data) {--%>
<%--                        console.log(data);--%>
<%--                    },--%>
<%--                    error: function (data) {--%>
<%--                        console.log(data);--%>
<%--                    }--%>
<%--                });--%>
<%--                console.log("message sent by user "+message);--%>
<%--                if (socket && socket.readyState === WebSocket.OPEN) {--%>
<%--                socket.send(JSON.stringify(message));--%>
<%--               --%>
<%--                const MsgContainer=document.querySelector(".messages-container");--%>
<%--                    const messageBox = document.createElement("div");--%>
<%--                    messageBox.className = "message-box right";--%>
<%--                    messageBox.innerHTML = `<p>`+msg+`</p>`;--%>
<%--                    MsgContainer.appendChild(messageBox);--%>
<%--                    document.getElementById("contentMsg").value = "";--%>


<%--        } else {--%>
<%--            console.log("WebSocket is not open. Unable to send message.");--%>
<%--        }--%>
<%--            }--%>
<%--        --%>
<%--    }--%>



</script>
</body>
</html>
