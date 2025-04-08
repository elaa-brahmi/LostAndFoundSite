

<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.Date"
%>
<%@ page import="model.Item" %>
<%@ page import="services.ItemDao" %>
<%
  if(session.getAttribute("userId")==null && session.getAttribute("role")!="user"){
    response.sendRedirect("login.jsp");

  }



%>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-V5r6eMclcfOo3qNnUw9MvEQuuVZMKWRWy4R4aRIhIG8rypYcszK4G+HdJ6ZfQByTZFn5DkEYq0IHk9s9DBQ1Eg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons">
    <!-- Inclure Toastr CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- AOS JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            AOS.init();
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>My posts</title>
    <style>
        /* From Uiverse.io by Madflows */
        .cardUser {
            display: flex;
            position: relative;
            flex-direction: column;
            height: 350px;
            width: 190px;
            min-width: 250px;
            padding: 1rem;
            border-radius: 16px;
            background: #17141d;
            box-shadow: -1rem 0 3rem #00000067;
            transition: .2s;
            font-family: 'Inter', sans-serif;
        }

        .cardUser:hover {
            transform: translateY(-0.4rem);
        }

        .card-author {
            position: relative;
            display: flex;
            align-items: center;
            row-gap: 1rem;
            flex-direction: column;
        }

        .author-name {
            color: #7a7a8c;
            text-align: start !important;
            width: 100%;
        }

        .author-name-prefix {
            color: #e52e71;
            font-weight: 600;
        }

        .author-avatar span {
            display: block;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #f2f2f2;
            margin: 16px 10px;
        }


        .card-header {
            margin-bottom: auto;
            color: #7a7a8c;
        }

        .card-header p {
            font-size: 14px;
            margin: 0 0 1rem;
            color: #7a7a8c;
        }

        .card-header .title {
            font-size: 15px;
            margin: .25rem 0 auto;
            cursor: pointer;
            font-family: 'Arial Black', sans-serif;
        }

        .card-header .title:hover {
            background: linear-gradient(90deg,#ff8a00,#e52e71);
            text-shadow: none;
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .tags {
            margin: 1rem 0 2rem;
            padding: .5rem 0 1rem;
            line-height: 2;
            margin-bottom: 0;
        }

        .tags a {
            font-style: normal;
            font-weight: 700;
            color: #7a7a8c;
            text-transform: uppercase;
            font-size: .66rem;
            border: 3px solid #28242f;
            border-radius: 2rem;
            padding: .2rem .85rem .25rem;
            position: relative;
        }

        .tags a:hover {
            background: linear-gradient(90deg,#ff8a00,#e52e71);
            text-shadow: none;
            -webkit-text-fill-color: transparent;
            -webkit-background-clip: text;
            -webkit-box-decoration-break: clone;
            box-decoration-break: clone;
            background-clip: text;
            border-color: white;
        }
        /* From Uiverse.io by vinodjangid07 */
        .notifbutton {
            width: 50px;
            height: 50px;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgb(44, 44, 44);
            border-radius: 50%;
            cursor: pointer;
            transition-duration: .3s;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.13);
            border: none;
        }

        .bell {
            width: 18px;
        }

        .bell path {
            fill: white;
        }

        .notifbutton:hover {
            background-color: rgb(56, 56, 56);
        }

        .notifbutton:hover .bell {
            animation: bellRing 0.9s both;
        }

        /* bell ringing animation keyframes*/
        @keyframes bellRing{
            0%,
            100% {
                transform-origin: top;
            }

            15% {
                transform: rotateZ(10deg);
            }

            30% {
                transform: rotateZ(-10deg);
            }

            45% {
                transform: rotateZ(5deg);
            }

            60% {
                transform: rotateZ(-5deg);
            }

            75% {
                transform: rotateZ(2deg);
            }
        }

        .notifbutton:active {
            transform: scale(0.8);
        }
        /* From Uiverse.io by Codecite */
        .btn {
            transition: all 0.3s ease-in-out;
            font-family: "Dosis", sans-serif;
        }
        .acceptedBtn{
            border-radius: 50px;
            background-image: linear-gradient(135deg, #58d68d 0%, #58d68d 100%);
            box-shadow: 0 20px 30px -6px rgba(238, 103, 97, 0.5);
            outline: none;
            cursor: pointer;
            border: none;
            font-size: 19px;
            color: white;

        }
        .acceptedBtn:hover {
            transform: translateY(3px);
            box-shadow: none;
        }

        .acceptedBtn:active {
            opacity: 0.5;
        }
        .lostbtn {

            border-radius: 50px;
            background-image: linear-gradient(135deg, #feb692 0%, #f9e79f 100%);
            box-shadow: 0 20px 30px -6px rgba(238, 103, 97, 0.5);
            outline: none;
            cursor: pointer;
            border: none;
            font-size: 19px;
            color: white;
        }

        .lostbtn:hover {
            transform: translateY(3px);
            box-shadow: none;
        }

        .lostbtn:active {
            opacity: 0.5;
        }


        /* From Uiverse.io by ZAKARIAE48CHELLE */
        .BtnEdit {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            width: 100px;
            height: 40px;
            border: none;
            padding: 0px 20px;
            background-color: black;
            color: white;
            font-weight: 700;
            cursor: pointer;
            border-radius: 10px;
            box-shadow: 5px 5px 0px black;
            transition-duration: 0.3s;
        }

        .svg {
            width: 13px;
            position: absolute;
            right: 0;
            margin-right: 20px;
            fill: white;
            transition-duration: 0.3s;
        }

        .BtnEdit:hover {
            color: transparent;
        }

        .BtnEdit:hover svg {
            right: 43%;
            margin: 0;
            padding: 0;
            border: none;
            transition-duration: 0.3s;
        }

        .BtnEdit:active {
            transform: translate(3px, 3px);
            transition-duration: 0.3s;
            box-shadow: 2px 2px 0px white;
        }
        .containerPending{
            height: auto;
            margin-top: 3%;
            display: table-column;
            border-radius: 16px;
            padding: 5%;
            background: #f8f9f9;
            box-shadow: -1rem 0 3rem #00000067;
        }
        .outline {
            position: absolute;
            inset: 0;
            pointer-events: none;
        }
        .rect {
            stroke-dashoffset: 5;
            stroke-dasharray: 0 0 10 40 10 40;
            transition: 0.5s;
            stroke: #fff;
        }
        .nav {
            position: relative;
            height: 100px;
        }
        .container:hover .outline .rect {
            transition: 999999s;
            stroke-dashoffset: 1;
            stroke-dasharray: 0;
        }

        .container {
            width: 99%;
            position: absolute;
            inset: 0;
            background: grey;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
            padding: 0.5em;
        }

        .btn {
            padding: 0.5em 1em;
            color: #fff;
            font-size: 2em;
            text-decoration: none;
            cursor: pointer;
            transition: 0.1s;
        }

        .btn:hover {
            background: #fff3;
        }

        .btn:nth-child(1):hover ~ svg .rect {
            stroke-dashoffset: 0;
            stroke-dasharray: 0 2 8 73.3 8 10.7;
        }

        .btn:nth-child(2):hover ~ svg .rect {
            stroke-dashoffset: 0;
            stroke-dasharray: 0 12.6 9.5 49.3 9.5 31.6;
        }

        .btn:nth-child(3):hover ~ svg .rect {
            stroke-dashoffset: 0;
            stroke-dasharray: 0 24.5 8.5 27.5 8.5 55.5;
        }

        .btn:nth-child(4):hover ~ svg .rect {
            stroke-dashoffset: 0;
            stroke-dasharray: 0 34.7 6.9 10.2 6.9 76;
        }

        .btn:hover ~ .outline .rect {
            stroke-dashoffset: 0;
            stroke-dasharray: 0 0 10 40 10 40;
            transition: 0.5s !important;
        }

        .profileimage {
            background-color: transparent;
            border: none;
            margin-top: 20px;
            border-radius: 5em;
            width: 100px;
            height: 100px;
        }

        .pfp {
            border-radius: 35em;
            fill: white;
        }
        #preview {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        .hidden {
            display: none;
        }

        /* ...existing code... */

@media (max-width: 768px) {
    .nav .container {
        flex-direction: column;
        align-items: center;
    }

    .nav .btn {
        font-size: 1.5em;
    }

    .containerPending {
      width: 100%;
        margin-top: 10px;
    }

    .cardUser {
        width: 100%;
        margin-bottom: 20px;
    }

    #userProfile {
        width: 100%;
        margin-left: 0;
        top: 0;
    }

    #PendingPosts, #acceptedPosts {
        width: 100%;
        margin-right: 0;
    }

    .container {
        flex-direction: column;
        align-items: center;
    }

    .btn {
        font-size: 1.5em;
        padding: 0.5em 1em;
    }

    .profileimage {
        width: 80px;
        height: 80px;
    }

    .notifbutton {
        width: 40px;
        height: 40px;
    }

    .bell {
        width: 16px;
    }
}

/* ...existing code... */
.hiddenn{
    display:none !important;
}

#notFound{
    margin-left: 5% !important;
}
        .cookie-card {
            border-radius: 15px;
            width: 320px;
            height: 200px;
            background-color: #fff;
        }

        .cookie-title {
            font-size: 20px;
            position: relative;
            left: 90px;
            top: 15px;
            font-weight: bold;
            color: rgb(31 41 55);
        }

        .cookie-description {
            position: relative;
            top: 25px;
            font-size: 15px;
            text-align: center;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            color: rgb(75 85 99);
        }

        .cookies-policy {
            color: rgb(31 41 55);
            text-decoration: underline;
        }

        .cookies-policy:hover {
            text-decoration: none;
        }
        .cookies-policy:active {
            color: rgba(31, 41, 55, 0.61);
        ;
        }
        .accept-button {
            cursor: pointer;
            font-weight: bold;
            border-radius: 5px;
            width: 85px;
            height: 35px;
            background-color: rgba(255, 255, 255, 0);
            position: relative;
            left: 115px;
            top: 45px;
        }
        .accept-button:hover {
            background-color: rgb(31 41 55);
            color: #fff;
            border: rgb(31 41 55);
        ;
        }
        .accept-button:active {
            font-weight: 100;
        }
        .notification-container {
            position: absolute;
            z-index: 999;
            top: 540px;
            height:auto;
            max-height:350px;
            overflow-y: scroll;
            width: 400px;
            background: white;
            border-radius: 0.5rem;
            box-shadow: 0.5rem 0.5rem 2rem rgba(0, 0, 0, 0.2);
            font-weight: 300;
            margin-bottom: 20px;
        }

        .notification-container h3 {
            text-transform: uppercase;
            font-size: 75%;
            font-weight: 700;
            color: #84929f;
            padding: 1.5rem;
        }

        .notification.new {
            background: #f3f9fd;
        }

        input.checkbox[type='checkbox'] {
            display: none;
        }
        input.checkbox[type='checkbox'] + label {
            display: block;
        }
        input.checkbox[type='checkbox']:not(:checked) + label {
            transition: height .25s;
            height: 0;
            padding: 0;
            font-size: 0;
            border: none;
            display: none;
        }
        input.checkbox[type='checkbox']:checked + label {
            height: 3.25rem;
            padding: 1.125rem 4rem 0.75rem 2rem;
            font-size: 75%;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }

        .notification-container i {
            color: #b5c4d2;
            font-size: 140%;
            /*position: absolute;*/
            right: 1.5rem;
        }

        .notification-container i.right:hover {
            opacity: 0.8;
            cursor: pointer;
        }

        .notification {
            display: block;
            padding: 1rem;
            border-bottom: 1px solid #e1e1e1;
        }

        .notification.new {
            background: #f3f9fd;
        }

        .notification em {
            font-weight: 700;
            font-size: 115%;
            color: #b5c4d2;
        }

        .notification-icon {
            position: relative;
            display: inline-block;
            margin-right: 15px;
        }

        .notification-icon i {
            font-size: 24px;
        }

        .notification-icon .num-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background: red;
            color: white;
            font-size: 12px;
            padding: 2px 6px;
            border-radius: 50%;
        }
        .msg-container {
            position:absolute;
            right:400px;
            bottom:0;
            height:350px;

            background-color: #fff;
            border:1px solid black;
            border-radius: 10px;
            padding: 15px;
            margin-right: 20px;
            display: flex;
            flex-direction: column;
            width: 300px;
        }

        .msg-header {
            display: flex;

            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
            justify-content: space-between;
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
            height:500px;

        }

        .messages-container {
            padding: 15px;

            height: 35%;
            overflow-y: scroll;
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
        #requestContainerDiv{
            width:300px;
            border-bottom:2px solid black;
            border-radius:5px;
            position:relative;
            height:auto;
        }
        .request{ width:100%;
            border-bottom:1px solid black;
            border-radius:5px;
            position:relative;
            height:100px;}
        #requestContainerDiv p{
            font-family:sans-serif;
            margin: 0 0 0 10px;

        }
        #info{
            position:relative;
            text-align:center;
            top:20px;
        }

        #info {
            text-align:center;
            color:#4267B2;

            font-size:18px;
        }



        #button-block{
            position:relative;
            top:30px;
            left:40px;
        }

        #button-block div{
            display:inline-block;
        }

        #confirm, #delete{
            background-color:#4267B2;
            color:white;
            padding:7px;
            border-radius:2px;
            margin-right:10px;
            font-family:sans-serif;
        }

        #delete{
            color:#222;
            background-color:#bbb;
            border:1px solid #999;
            padding:6px;
            margin-right:0;
        }

        #button-block div:hover{
            opacity:.8;
            cursor:pointer;
        }

        .containerC .inner-container {
            overflow-y: scroll;
            overflow-x: hidden;
            width: calc(100% + 20px);
            margin: 0 -10px;
            padding: 0 10px;
        }

        .containerC.conversations {
            box-shadow: 0 2px 8px rgb(0 0 0 / 87%);
            width: 400px;
            height: 78vh;
            background-color: white;
            position: absolute;
            border-radius: 10px;
            top: 120px;
            right: 0;

        }

        .containerC.conversations .inner-container {
            max-height: calc(100vh - 60px - 57px);
        }
        .containerC header {
            background-color: white;
            padding: 20px;
            margin: -10px 0;
            border-bottom: solid 1px #D4D4D1;
            display: flex;
            justify-content: space-between;
        }

        .containerC header h2 {
            color: #333;

            text-transform: capitalize;
            letter-spacing: 0.5px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: 500;
            font-size: 16px;
            margin: 0;
        }

        article.conversation {
            width: calc(100% + 20px);
            clear: both;
            padding: 20px 10px;
            border-bottom: solid 1px #D4D4D1;
            margin: 0 -10px;
            cursor: pointer;
        }

        article.conversation.active {
            background-color: #E5E5E5;
        }

        article.conversation .avatar {
            width: 40px;
            float: left;
            margin-right: 20px;
            position: relative;
        }

        article.conversation .avatar img {
            border-radius: 50%;
            width: 100%;
            height: 10%;
            padding-left: 5px;
        }

        article.conversation .avatar .unread {
            background-color: #E7A54E;
            border-radius: 10px;
            text-align: center;
            color: white;
            position: absolute;
            vertical-align: middle;
            line-height: 12px;
            font-size: 12px;
            top: -6px;
            right: -8px;
            padding: 2px 4px;
            border: solid 2px #F5F5F5;
        }

        article.conversation author {
            color: #333;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 16px;
            max-width: 75%;
            font-weight: 500;


        }

        article.conversation p {
            max-width: 75%;
            font-size: 15px;
            margin: 5px 0 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        article.conversation time {
            float: right;

            color: #555555;
            font-size: 13px;
            padding-right: 30px;
        }
        form.search {

            display: flex;
            justify-content: center;
            background-color: #E5E5E5;
            margin: 0;
            padding: 10px;
            border-bottom: solid 1px #D4D4D1;
            position: relative;
            border-bottom: solid 1px #D4D4D1;

        }



        form.search input[type=search] {
            background-color: #E5E5E5;
            border: 0;
            width: 100%;
            padding: 10px 10px 10px 30px;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
        }

        form.search input[type=search]::placeholder {
            color: #555555;}
        .dot {
            position: absolute;
            left: 0;
            top: 0;
            transform: translate(-50%, -50%);
            width: 12px;
            height: 12px;
            background-color: rgb(194, 3, 3);
            border-radius: 100%;
        }
        .dotnotif{
            position: absolute;
            top: 6px;
            left: 5px;
        }
        .dotConvo{
            position: absolute;
            top: 6px;
            left: 5px;
        }
        .dotrequest{
            position: absolute;
            top: 6px;
            left: 5px;
        }
    </style>
</head>

<body class="vh-100" style="overflow-x: hidden;  padding:0;">
<!-- Inclure jQuery (nécessaire pour Toastr) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Inclure Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


<div class="nav">
    <div class="container">
        <div><img src="assets/logo.png" alt="logo" width="100px" height="90px"></div>
        <a href="home.jsp" class="btn">Home</a>
        <a href="MyPosts.jsp" class="btn">profile</a>
        <a href="addItem.jsp" class="btn" >report lost/found item </a>
        <a href="index.jsp" class="btn">about</a>
        <svg
                class="outline"
                overflow="visible"
                width="100%"
                height="100px"
                viewBox="0 0 100% 100px"
                xmlns="http://www.w3.org/2000/svg"
        >
            <rect
                    class="rect"
                    pathLength="100"
                    x="0"
                    y="0"
                    width="100%"
                    height="100px"
                    fill="transparent"
                    stroke-width="5"
            ></rect>
        </svg>
    </div>
</div>
<script>
    <% if (request.getAttribute("alert_add") != null) { %>
    toastr.success('<%= request.getAttribute("alert_add") %>', 'success');
    <% } %>



    <% if (request.getAttribute("alert_update_item") != null) { %>
    toastr.info('<%= request.getAttribute("alert_update_item") %>', 'info');
    <% } %>

    <% if (request.getAttribute("alert_update_user") != null) { %>
    toastr.info('<%= request.getAttribute("alert_update_user") %>', 'info');
    <% } %>
    $(document).ready(function () {
        fetchItems();
        fetchUserInfos();
    });

    function fetchUserInfos() {
        $.ajax({
            url: 'http://localhost:8080/UserInfos',
            type: 'GET',
            data: {
                userId:<%= session.getAttribute("userId") %>,
            },
            dataType: 'json',
            success: function (data) {
                console.log("user infos "+ data);
                renderUserInfos(data);
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    }

    function fetchItems() {
        $.ajax({
            url: 'http://localhost:8080/UserItems',
            type: 'GET',
            data: {
                userId: <%= session.getAttribute("userId") %>,
            },
            dataType: 'json',
            success: function (data) {
                console.log("all data "+data);
                console.log("accepted data "+data.accepted);
                console.log("pending data "+data.pending);
                var PostContainer=document.getElementById("PostContainer");
                var notFound = document.getElementById("notFound");
                if(data.accepted.length===0 && data.pending.length===0){
                    console.log("no items found");
                    PostContainer.classList.add("hiddenn");
                    notFound.classList.remove("hiddenn");

                }
                else{
                    PostContainer.classList.remove("hiddenn");
                    notFound.classList.add("hiddenn");
                    renderItemsAccepted(data.accepted);
                    renderItemsPending(data.pending);

                }


            },
            error: function (xhr, status, error) {
                console.log(error);
            }

        });
    }

    function renderItemsPending(PendingPosts) {
        var Pendingdiv = document.getElementById("PendingPosts");
        Pendingdiv.innerHTML = "";
        PendingPosts.forEach(function (item) {
            var div = document.createElement("div");
            div.className = "containerPending";
            div.setAttribute("data-aos","zoom-out-down");
            div.setAttribute("data-aos-anchor-placement","bottom-bottom");
            div.setAttribute("data-item-id", item.id); // Add this line
            div.innerHTML = `
<div style="display: table-row;>
             <span style="font-size:18px;">` + item.name + `: ` + item.description + `</span></div>
<div style="display: table-row;">
        <div style="font-size:18px;">` + item.datefound + `</div>
        <div style="font-size:18px;"><strong>` + item.type + `</strong></div></div>

<div style="display: flex;
    justify-content: center;
    gap: 4%;">

        <button class="BtnEdit" onclick="editItem(` +item.id+ `)" >
            Edit
            <svg viewBox="0 0 512 512" class="svg">
                <path
                        d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"
                ></path>
            </svg>

<button class="BtnEdit" onclick="deleteItem(` +item.id+ `)" >
            delete
            <svg viewBox="0 0 512 512" class="svg">
                <path
                        d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"
                ></path>
            </svg>
        </button>

</div>
 <div class="w-100"></div><br><button class="lostbtn">` + item.status + `</button>
            `;
            Pendingdiv.appendChild(div);


        });
    }

    function renderItemsAccepted(AcceptedPosts) {

        var acceptedPosts=document.getElementById("acceptedPosts");
        acceptedPosts.innerHTML = "";
        AcceptedPosts.forEach(function (item) {
        var divPosts=document.createElement("div");
        divPosts.className="containerPending";
            divPosts.setAttribute("data-aos","zoom-out-down");
            divPosts.setAttribute("data-aos-anchor-placement","bottom-bottom");
            divPosts.setAttribute("data-item-id", item.id); // Add this line

            divPosts.innerHTML = `
<div style="display: table-row;>
             <span style="font-size:18px;">` + item.name + `: ` + item.description + `</span>
</div>
        <div style="display: table-row;">
<div style="font-size:18px;">` + item.datefound + `</div>
        <div style="font-size:18px;"><strong>` + item.type + `</strong></div>
</div>
<div style="display: flex;
    justify-content: center;
    gap: 4%;">
        <button class="BtnEdit" onclick="editItem(` +item.id+ `)" >
            Edit
            <svg viewBox="0 0 512 512" class="svg">
                <path
                        d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"
                ></path>
            </svg>
        </button>


<button class="BtnEdit" onclick="deleteItem(` +item.id+ `)" >
            delete
            <svg viewBox="0 0 512 512" class="svg">
                <path
                        d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"
                ></path>
            </svg>
        </button></div>
<div class="w-100"></div><br><button class="acceptedBtn">` + item.status + `</button>
            `;
            acceptedPosts.appendChild(divPosts);
        });
    }


    function renderUserInfos(user) {
        console.log(user);
        var div = document.getElementById("userProfile");
        var userPicture=user.picture==="no image is found" ? "../assets/img/noUser.png": user.picture;
        console.log("userpictureee"+userPicture);
        div.innerHTML = `
        <div class="cardUser">
        <header class="card-header">
            <p><%= new Date()%></p>
            <span class="title">` + user.email + `</span>
            <span class="title">` + user.phone + `</span>
        </header>
        <div class="card-author">

<form id="uploadForm" action="saveUserPic" type="post" enctype="multipart/form-data">
        <div class="profileimage" onclick="document.getElementById('upload').click()">
        <input type="file" id="upload" accept="image/*" style="display: none" onchange="previewImage(event)">
    <img id="preview"  src="` + userPicture+ `">

  </div>
  </form>
            <div class="author-name">
                <div class="author-name-prefix">user</div> ` + user.name + `
            </div>
        </div>
        <div class="tags" style="display: flex;column-gap: 9%;flex-direction: row;">
<button class="notifbutton" onclick="fetchNotifss()">
 <div class="dotnotif dot hidden"></div>
   <svg viewBox="0 0 448 512" class="bell"><path d="M224 0c-17.7 0-32 14.3-32 32V49.9C119.5 61.4 64 124.2 64 200v33.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V200c0-75.8-55.5-138.6-128-150.1V32c0-17.7-14.3-32-32-32zm0 96h8c57.4 0 104 46.6 104 104v33.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V200c0-57.4 46.6-104 104-104h8zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z"></path></svg>
</button>
<button class="notifbutton" onclick="editProfile(` +user.id+ `)">
   <svg viewBox="0 0 448 512" class="bell"><path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path></svg>
</button>
<button class="notifbutton" onclick="logout()">
   <svg viewBox="0 0 448 512" class="bell"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg>
</button>

<button class="notifbutton" onclick="fetchConversations()">
 <div class="dotConvo dot"></div>

  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
</button>
<button class="notifbutton" onclick="seeFriendRequests()">
 <div class="dotrequest dot hidden"></div>

  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"> <path d="M2 21a8 8 0 0 1 13.292-6"></path>
   <circle r="5" cy="8" cx="10"></circle>
        <path d="M19 16v6"></path>
        <path d="M22 19h-6"></path>
  </svg>
</button>
        </div>
    </div>

        `;
    }
    function seeFriendRequests(){
        document.querySelector('.dotrequest').classList.add('hidden');
        document.getElementById("friendRequestsContainer").classList.toggle("hiddenn");
        updatefrToRead();
        $.ajax({
            url:"http://localhost:8080/getPendingFriendRequests",
            type:'GET',
            data:{
                user_id:"<%= session.getAttribute("userId")%>"
            },
            success:function(data){
                console.log("friend requests "+data);
                var container=document.getElementById("requestContainerDiv");
                container.innerHTML="";
                if(data.length===0){
                    container.innerHTML=`<p style="color: #000000;">No friend requests</p>`;
                }
                else{
                    data.forEach(function(request){
                        console.log("request"+request);

                        var div=document.createElement("div");
                        div.className="request";
                        var userPicture=request.senderPicture==="no image is found" ? "../assets/img/noUser.png": request.senderPicture;
                        console.log("userPicture"+userPicture);

                        div.innerHTML=`
                        <p id="info" style="display:flex;"> <b> <img src="`+userPicture+`" width="30px" height="30px" alt="userPicture" style="border-radius: 50%; object-fit: cover; margin-right:8px"></b> <b>`+request.senderName+`</b> <br></p>
                      <div id="button-block">
                        <div id="confirm" onclick="updateFriendRequestStatus('ACCEPTED',`+request.requestId+`)">Confirm</div>
                        <div id="delete" onclick="updateFriendRequestStatus('REJECTED',`+request.requestId+`)">Delete Request</div>

                        </div>
                        `;
                        container.appendChild(div);
                    });
                }
            },
            error:function(data){
                console.log(data);
            }
        });
    }
    function updatefrToRead(){
        $.ajax({
            url:"http://localhost:8080/updateReadabilityFriendRequests",
            type:'POST',
            data:{
                user_id:"<%= session.getAttribute("userId")%>"
            },
            success:function(data){
                console.log("update friends requests "+data);
            },
            error:function(data){
                console.log("update friends requests "+data);
            }

        });
    }
function updateFriendRequestStatus(status,requestId) {
        console.log(status);
        console.log(requestId);
        $.ajax({
            url:"http://localhost:8080/updateFriendRequestStatus",
            type:'POST',
            data:{
                requestId:requestId,
                status:status
            },
            success:function(data){
                console.log("status updated"+data);
             if(status==="ACCEPTED"){
                 toastr.success(data.message, "friend request accepted");
                 //todo start a conversation
                 }
             else{
                 toastr.success(data.message, "friend request rejected");
             }
                    seeFriendRequests();
            },
            error:function(data){
                console.log(data);
                toastr.error("An error occurred", "Error");
            }
        })
}
function fetchConversations(){
        document.getElementById("conversationsHolder").classList.toggle("hiddenn");
        $.ajax({
            url:"http://localhost:8080/getConversations",
            type:'GET',
            data:{
                user_id:"<%= session.getAttribute("userId")%>"

            },
            success:function(data){
                console.log(data);
                //todo create the conversations box and display conversations
                var holder=document.getElementById("holder");
                holder.innerHTML="";
                data.forEach(function(conversation){
                    console.log(conversation);
                    var article=document.createElement("article");
                    article.className="conversation";
                   // article.setAttribute("conversationId",conversation.conversationId);
                    article.addEventListener("click",function () {
                    openConversation(conversation.conversationId,conversation.otherMemberId);
                }) ;
                    const timestamp=conversation.lastMessageTime;
                    const dateObj = new Date(timestamp); // Convert to Date object
                    const hours = dateObj.getHours().toString().padStart(2, '0'); // Extract hours
                    const minutes = dateObj.getMinutes().toString().padStart(2, '0'); // Extract minutes
                    var memeberImg=conversation.otherMemberPicture==="no image is found" ? "../assets/img/noUser.png": conversation.otherMemberPicture;
                    article.innerHTML=`
            <div class="avatar">
                <img src="`+memeberImg+`" />
                <span class="unread">`+conversation.unreadMsg+`</span>
            </div>
            <author>`+conversation.otherMemberName+`</author>
            <time>`+hours+`:`+minutes+`</time>
            <p>`+conversation.lastMessage+`</p>
<span><svg style="cursor:pointer;position: relative;right: -75%;top: -10px;width: 20px;" onclick="deleteConvo(`+conversation.conversationId+`)" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></span>

                    `
                    holder.appendChild(article);



                });
            },
            error:function(data){
                console.log(data);
            }
        });

}
</script>
<div style="margin-top: 5%;
    display: flex;
    flex-direction: row;">
    <div id="userProfile" style="width: 41%;
    position: relative;
    top: 7%;
    margin-left: 5%;
 transition: transform 0.1s ease-out;">
    </div>
    <div id="notFound" class="hiddenn">
        <div class="cookie-card">
            <span class="cookie-title">No posts yet</span>
            <p class="cookie-description">"Lost something? Found an item? Post it here and let our system reunite owners with their belongings!"
            </p>
            <button class="accept-button" onclick="redirect()">post now</button>
        </div>
    </div>
    <div style="height: auto;
    width: 40%;
    margin-right: 10%;
    display: flex;
    flex-direction: column;" id="PostContainer">
        <div id="PendingPosts" style="display: flex;
    height: auto;
    row-gap: 7%;
    flex-direction: column;">
        </div>
        <div id="acceptedPosts" style="display: flex;
    height: auto;
    row-gap: 7%;
    flex-direction: column;"></div>
    </div>
</div>

<div id="friendRequestsContainer" style="box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    background-color: white;
    border-radius: 10px;
    top: 90%;
    position: absolute;" class="hiddenn">
    <h3 style="padding-left: 10px;">friend requests</h3>
    <div id="requestContainerDiv">
    </div>
</div>


<div class="notification-container hidden" >
    <h3>Notifications
        <i class="material-icons dp48 right">settings</i>
    </h3>
    <div id="notificationContainerTexts" style="padding-bottom:9px;"></div>
</div>



<div class="conversations containerC hiddenn" id="conversationsHolder">
    <header>
        <h2>Conversations</h2>
        <span><svg style="cursor: pointer;" onclick="closeConversation()" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span>
    </header>
    <form class="search">
        <input type="search" placeholder="Search conversations" />
        <span style="position: relative;top: 8px;width: 50px;"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></span>
    </form>
    <div class="inner-container" id="holder">

    </div>
</div>




<div class="msg-container hiddenn" id="chat">
    <div class="msg-header">
<span style="display: flex; justify-content: center;">
        <div class="img-avatar"></div>
        <div class="text-chat">Chat</div></span>
        <span><svg style="cursor: pointer;" onclick="closeChat()" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span>

    </div>
    <div class="msg-body">
        <div class="messages-container">

        </div>
        <div class="message-input">
            <form id="sendMsg" >
                <textarea placeholder="Type your message here" class="message-send" id="contentMsg"></textarea>
                <button type="submit" class="button-send" style="margin-top:4px;">Send</button>
            </form>
        </div>
    </div>
</div>


<script>
    function deleteConvo(id){
        $.ajax({
            url:"http://localhost:8080/deleteConvo",
            type:"POST",
            data:{
                id:id
            },
            success:function(data){
                console.log(data);
                fetchConversations();
            },
            error:function(data){
                console.log(data);
            }

        });
    }
    function closeConversation(){
        document.getElementById('conversationsHolder').classList.add('hiddenn');

    }
    function closeChat(){
        document.getElementById('chat').classList.add('hiddenn');
    }
    function openConversation(idConvo,idRecei){
        updateMgStatus(idConvo);
        console.log("open conversation with id "+idConvo);
        console.log("open conversation with id receiver "+idRecei);

        document.getElementById("chat").classList.toggle("hiddenn");
        //todo fetch messages of conversation having this id
        document.getElementById("sendMsg").addEventListener('submit', function(){
            sendMessage(idConvo,idRecei,event);

        });
        $.ajax({
            url:"http://localhost:8080/fetchMessagesByConversationId",
            type:"GET",
            data:{
                conversation_id:idConvo
            },
            success:function(data){
                console.log(data);
                var messagescontainer=document.querySelector('.messages-container');
                messagescontainer.innerHTML='';
                data.forEach(function(message){
                    console.log(message);
                    if(message.senderId.toString()==="<%= session.getAttribute("userId")%>"){
                        const messageBox1 = document.createElement("div");
                        messageBox1.className = "message-box right";
                        messageBox1.innerHTML = `<p>`+message.content+`</p>`;
                        messagescontainer.appendChild(messageBox1);
                    }
                    else{
                        const messageBox2 = document.createElement("div");
                        messageBox2.className = "message-box left";
                        messageBox2.innerHTML = `<p>`+message.content+`</p>`;
                        messagescontainer.appendChild(messageBox2);
                    }
                });
            },
            error:function(data){
                console.log(data);
            }
        });
        //todo update all messages statues of that conversation to read


    }
    function updateMgStatus(idConvo){
        $.ajax({
            url:"http://localhost:8080/updateMsgStatus",
            type:"POST",
            data:{
                conversation_id:idConvo,
                userId:"<%= session.getAttribute("userId")%>"
            },
            success:function(data){
                console.log(data);
            },
            error:function(data){
                console.log(data);
            }
        });

    }
    document.getElementById("contentMsg").addEventListener("keydown", function (event) {
        if (event.key === "Enter" && !event.shiftKey) {
            event.preventDefault(); // Prevent newline
            sendMessage();
        }
    });
    function redirect(){
        window.location.href="addItem.jsp";
    }

    function editItem(itemId){
        // Redirect to EditItem.jsp with itemId in the URL
        window.location.href = "EditItem.jsp?itemId=" + itemId;
    }
    function fetchNotifss(){
        document.querySelector('.dotnotif').classList.add('hidden');
        //todo update  unread notif statueses
        updateUnreadNotifs();

        var NotifContainer=document.querySelector(".notification-container");
        NotifContainer.classList.toggle('hidden');
    }
    function editProfile(id){
        console.log(id);
        window.location.href = "editProfile.jsp?idUser=" + id;

    }
    function updateUnreadNotifs(){
        $.ajax({
            url:"http://localhost:8080/updateUnreadNotifs",
            type:"POST",
            data:{
                user_id:"<%= session.getAttribute("userId")%>"
            },
            success:function(data){
                console.log(data);
            },
            error:function(data){
                console.log(data);
            }
        });

    }
    function deleteItem(idItem){
        fetch("DeleteItem", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "idItem=" + encodeURIComponent(idItem)
        })
            .then(response => response.text())
            .then(data => {
                console.log("Server Response:", data);
                try {
                    let jsonData = JSON.parse(data);
                    if (jsonData.status === "success") {
                        toastr.error(jsonData.message, "Success");
                        // Remove the deleted item from the DOM
                    const itemElement = document.querySelector(`[data-item-id="${idItem}"]`);
                    if (itemElement) {
                        itemElement.remove();
                    }
                    fetchItems();
                     // Check if there are no more items and show the "No posts yet" message
                     const remainingItems = document.querySelectorAll(".containerPending");
                    if (remainingItems.length === 0) {
                        document.getElementById("PostContainer").classList.add("hiddenn");
                        document.getElementById("notFound").classList.remove("hiddenn");
                    }
                    }}
                catch (error) {
                    console.error("Parsing Error: ", error);
                    toastr.error("Une erreur est survenue", "Erreur");
                }

            })
            .catch(error => console.error("Error:", error));
    }
    function logout(){
        fetch("logout", { method: "GET" })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url; // Redirect to login page
                }
            });
    }
    function previewImage(event){
        const file = event.target.files[0];
        const preview = document.getElementById("preview");
        const defaultSvg = document.getElementById("svg");
        if(file){
            const reader = new FileReader();
            reader.onload = function(){
                preview.src = reader.result;
                preview.classList.remove("hidden");
                defaultSvg.style.display = "none";

            };
            reader.readAsDataURL(file);
            uploadImage(file);
        }
            else{
            //preview.classList.add("hidden");
            //defaultSvg.style.display = "block";

            }
        }
        function uploadImage(file){
        console.log("image is uploaded");
        console.log(file);
            let formData = new FormData();
            formData.append("image", file);
            fetch("saveUserPic", {
                method: "POST",
                body: formData
            })
                .then(response => response.text()) // Assuming the server responds with text
                .then(data => console.log("Upload successful: ", data))
                .catch(error => console.error("Error:", error));
        }

        function connectToWebsocket(){
            console.log('Connected websocket');
            let  socket = new WebSocket("ws://localhost:8080/WebsocketNotification");
            console.log(socket);

            socket.onopen = function () {
                console.log("connected to WebSocket !");
                fetchNotifs();
            };

            socket.onmessage = function (event) {
                console.log(event);
                console.log("Message received from the server : ", event.data);
                fetchNotifs();
            };

            socket.onclose = function () {
                console.log(" WebSocket closed.");

            };

            socket.onerror = function (error) {
                console.log(" error WebSocket : ", error);
            };


        }
    //todo fetch notifs by user
    function fetchNotifs() {
        $.ajax({
            url: 'http://localhost:8080/notifsUser',
            type: 'GET',
            data: {
                user_id:<%= session.getAttribute("userId")%>
            },
            dataType: 'json',
            success: function (data) {
                console.table(data);
                var NotifContainerText = $("#notificationContainerTexts");
                NotifContainerText.empty();
                var i=0;
                data.forEach(notif => {
                    i++;
                    console.log(notif);
                    const timestamp=notif.dateSent;
                    const dateObj = new Date(timestamp); // Convert to Date object
                    const hours = dateObj.getHours().toString().padStart(2, '0'); // Extract hours
                    const minutes = dateObj.getMinutes().toString().padStart(2, '0'); // Extract minutes
                    console.log(`${hours}:${minutes}`);
                    var div = document.createElement("div");
                    div.setAttribute("data-notif-id", notif.id); // Add a unique identifier for each popped notif
                    div.style="padding-bottom:9px;";
                    div.innerHTML = ` <input class="checkbox" type="checkbox" value="small" checked />
            <label class="notification new" >
                <em>`+i+`</em> ` + notif.message + `.<br>
                <a onclick="ItemDetails(`+notif.possibleId+`, ` + notif.id + `)" style="color:blue; cursor:pointer;"> view item details</a><br>`
                 +hours+ `:`+minutes+ `
                <i class="material-icons dp48 right" style="cursor:pointer; position: relative;
    top: -25px;
    right: -300px;" onclick="deleteNotif(` +notif.id+ `)">clear</i>
            </label>
                        `;
                NotifContainerText.append(div);
                });
                
            },
            error: function () {
                console.error(" error WebSocket : ", error);
            }
        });
    }
    function ItemDetails(id,notifId){
        window.location.href="itemDetails.jsp?idItem=" + id+ "&notifId=" + notifId;
    }
    function deleteNotif(id){


        $.ajax({
            url:"http://localhost:8080/deleteNotif",
            type:"POST",
            data:{
                id:id
            },
            success:function(data){
                console.log("notif deleted "+data);
                fetchNotifs();
            },
            error:function(xhr,status,error){
                console.log("error deleting notif "+error);
            }

        });
    }
    function fetchUnreadNotifs(idUser){
        $.ajax({
            url:'http://localhost:8080/unreadNotifs',
            type:'GET',
            data:{
                userId:idUser
            },
            success:function(data){
                console.log("unread notifs "+data);
                if(data>0){
                    document.querySelector(".dotnotif").classList.remove("hidden");
                }
            },
            error:function(xhr,status,error){
                console.log(data);
            }
        });
    }
    function fetchNumberOfPendingFriendRequests(idUser){
        $.ajax({
            url:'http://localhost:8080/frPending',
            type:'GET',
            data:{
                userId:idUser
            },
            success:function(data){
                console.log("pending friend requests "+data);
                if(data>0){
                    document.querySelector(".dotrequest").classList.remove("hidden");
                }
            },
            error:function(data){
                console.log(data);
            }

        });
    }
    // Check if the user has a picture when the page loads
    window.onload = function() {
        // todo check wether you have friendrequests
        connectToWebsocket();
        connectToWebsocketChat();
        fetchUnreadNotifs("<%=session.getAttribute("userId")%>");
        fetchNumberOfPendingFriendRequests("<%=session.getAttribute("userId")%>");



        setTimeout(() => {
            const userPicture = document.getElementById('preview').src;
            console.log("userpicture "+ userPicture);
            const previewImage = document.getElementById('preview');


        }, 300); // Delay execution by 500ms
    }




    let socketChat;
    let newReceiver;

    function connectToWebsocketChat(){
        socketChat = new WebSocket("ws://localhost:8080/WebsocketMessage");
        console.log('Connected websocket');
        console.log(socketChat);
        socketChat.onopen = function () {
            console.log("connected to WebSocket !");
        };

        socketChat.onmessage = function (event) {
            const message = JSON.parse(event.data);
            console.log("you received a message from :"+message.from);
            console.log("Message received from the server: ", message);
            try{
                const messagesContainer = document.querySelector(".messages-container");
                const messageBox = document.createElement("div");
                messageBox.className = "message-box left";
                messageBox.innerHTML = `<p>`+message.messageForwarded+`</p>`;
                messagesContainer.appendChild(messageBox);
            } catch (error) {
                console.error("Error parsing WebSocket message:", error);
            }
        };
        socketChat.onclose = function () {
            console.log(" WebSocket closed.");

        };
        socketChat.onerror = function (error) {
            console.log(" error WebSocket : ", error);
        };
    }
    function sendMessage(idConvo,idRecei,event) {
        console.log("conversation id click send msg "+idConvo);
        console.log("receiver id click send msg "+idRecei);

        if(event) event.preventDefault(); // Prevent form submission
        var msg=document.getElementById("contentMsg").value;
        if(msg.trim().length === 0){
            console.log("you can't send an empty message");
            return;
        }
        else{
            console.log("msg sent :"+msg);
            //console.log(sessionStorage.getItem('receiverId'));
            const message = {
                receiverId: idRecei.toString(),
                content: msg
            };
            console.log("message sent by user "+message);
            if (socketChat && socketChat.readyState === WebSocket.OPEN) {
                socketChat.send(JSON.stringify(message));

                const MsgContainer=document.querySelector(".messages-container");
                const messageBox = document.createElement("div");
                messageBox.className = "message-box right";
                messageBox.innerHTML = `<p>`+msg+`</p>`;
                MsgContainer.appendChild(messageBox);
                document.getElementById("contentMsg").value = "";
                //todo save message to conversation id
                $.ajax({
                    url:"http://localhost:8080/addMsg",
                    type:"POST",    
                    data:{
                        conversationId:idConvo,
                        message:msg,
                        sender_id:"<%= session.getAttribute("userId")%>"
                    },
                    success:function(data){
                        console.log("message saved "+data);
                    },
                    error:function(data){
                        console.log("error saving message "+data);
                    }
                });


            } else {
                console.log("WebSocket is not open. Unable to send message.");
            }
        }

    }

</script>

</body>
</html>
