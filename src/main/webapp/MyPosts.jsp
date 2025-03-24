

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






    </style>
</head>
<body class="vh-100" style="overflow-x: hidden;  padding:0;">
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
                console.log(data.accepted);
                console.log(data.pending);
                renderItemsAccepted(data.accepted);
                renderItemsPending(data.pending);


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
        console.log(AcceptedPosts);
        var acceptedPosts=document.getElementById("acceptedPosts");
        acceptedPosts.innerHTML = "";
        AcceptedPosts.forEach(function (item) {
        var divPosts=document.createElement("div");
        divPosts.className="containerPending";
            divPosts.setAttribute("data-aos","zoom-out-down");
            divPosts.setAttribute("data-aos-anchor-placement","bottom-bottom");


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
        var div = document.getElementById("userProfile");
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
    <img id="preview" class="hidden" src="` + user.picture + `">
    <svg id="svg" class="pfp" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 122.88"><g><path d="M61.44,0c8.32,0,16.25,1.66,23.5,4.66l0.11,0.05c7.47,3.11,14.2,7.66,19.83,13.3l0,0c5.66,5.65,10.22,12.42,13.34,19.95 c3.01,7.24,4.66,15.18,4.66,23.49c0,8.32-1.66,16.25-4.66,23.5l-0.05,0.11c-3.12,7.47-7.66,14.2-13.3,19.83l0,0 c-5.65,5.66-12.42,10.22-19.95,13.34c-7.24,3.01-15.18,4.66-23.49,4.66c-8.31,0-16.25-1.66-23.5-4.66l-0.11-0.05 c-7.47-3.11-14.2-7.66-19.83-13.29L18,104.87C12.34,99.21,7.78,92.45,4.66,84.94C1.66,77.69,0,69.76,0,61.44s1.66-16.25,4.66-23.5 l0.05-0.11c3.11-7.47,7.66-14.2,13.29-19.83L18.01,18c5.66-5.66,12.42-10.22,19.94-13.34C45.19,1.66,53.12,0,61.44,0L61.44,0z M16.99,94.47l0.24-0.14c5.9-3.29,21.26-4.38,27.64-8.83c0.47-0.7,0.97-1.72,1.46-2.83c0.73-1.67,1.4-3.5,1.82-4.74 c-1.78-2.1-3.31-4.47-4.77-6.8l-4.83-7.69c-1.76-2.64-2.68-5.04-2.74-7.02c-0.03-0.93,0.13-1.77,0.48-2.52 c0.36-0.78,0.91-1.43,1.66-1.93c0.35-0.24,0.74-0.44,1.17-0.59c-0.32-4.17-0.43-9.42-0.23-13.82c0.1-1.04,0.31-2.09,0.59-3.13 c1.24-4.41,4.33-7.96,8.16-10.4c2.11-1.35,4.43-2.36,6.84-3.04c1.54-0.44-1.31-5.34,0.28-5.51c7.67-0.79,20.08,6.22,25.44,12.01 c2.68,2.9,4.37,6.75,4.73,11.84l-0.3,12.54l0,0c1.34,0.41,2.2,1.26,2.54,2.63c0.39,1.53-0.03,3.67-1.33,6.6l0,0 c-0.02,0.05-0.05,0.11-0.08,0.16l-5.51,9.07c-2.02,3.33-4.08,6.68-6.75,9.31C73.75,80,74,80.35,74.24,80.7 c1.09,1.6,2.19,3.2,3.6,4.63c0.05,0.05,0.09,0.1,0.12,0.15c6.34,4.48,21.77,5.57,27.69,8.87l0.24,0.14 c6.87-9.22,10.93-20.65,10.93-33.03c0-15.29-6.2-29.14-16.22-39.15c-10-10.03-23.85-16.23-39.14-16.23 c-15.29,0-29.14,6.2-39.15,16.22C12.27,32.3,6.07,46.15,6.07,61.44C6.07,73.82,10.13,85.25,16.99,94.47L16.99,94.47L16.99,94.47z"></path></g></svg>
  </div>
  </form>


            <div class="author-name">
                <div class="author-name-prefix">user</div> ` + user.name + `
            </div>
        </div>
        <div class="tags" style="display: flex;column-gap: 9%;flex-direction: row;">
<button class="notifbutton" onclick="fetchNotifs(` +user.id+ `)">
   <svg viewBox="0 0 448 512" class="bell"><path d="M224 0c-17.7 0-32 14.3-32 32V49.9C119.5 61.4 64 124.2 64 200v33.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V200c0-75.8-55.5-138.6-128-150.1V32c0-17.7-14.3-32-32-32zm0 96h8c57.4 0 104 46.6 104 104v33.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V200c0-57.4 46.6-104 104-104h8zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z"></path></svg>
</button>

<button class="notifbutton" onclick="editProfile(` +user.id+ `)">
   <svg viewBox="0 0 448 512" class="bell"><path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path></svg>
</button>
<button class="notifbutton" onclick="logout()">
   <svg viewBox="0 0 448 512" class="bell"><path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path></svg>
</button>
        </div>
    </div>

        `;
    }


</script>
<div style="margin-top: 5%;display: flex;justify-content: space-around;">
    <div id="userProfile" style="width: 35%;
    position: relative;
    top: 7%;
    margin-left: 5%;
 transition: transform 0.1s ease-out;">
    </div>
    <div style="height: auto;
    width: 40%;
    margin-right: 10%;
    display: flex;
    flex-direction: column;">
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
<script>

//    const cards = document.querySelectorAll(".containerPending *");
//    const observer = new IntersectionObserver(entries => {
//        entries.forEach(entry => {
//            if  (entry.intersectionRatio >= 0.5) { // Trigger when 50% is visible
//                entry.target.classList.add("slit-in-vertical");
//                //observer.unobserve(entry.target); // Ensures animation happens only once
//            }
//        });
//    }, {threshold: 0.2}); // Trigger when 20% of the element is visible
//
//    cards.forEach(card => observer.observe(card));
//    window.addEventListener("scroll", () => {
//        let scrollY = window.scrollY; // Get how much the user has scrolled
//        document.querySelector("#userProfile").style.transform = `translateY(`+scrollY`+px)`;
//    });
    function editItem(itemId){
        // Redirect to EditItem.jsp with itemId in the URL
        window.location.href = "EditItem.jsp?itemId=" + itemId;
    }
    function fetchNotifs(id){
        console.log(id);
    }
    function editProfile(id){
        console.log(id);
        window.location.href = "editProfile.jsp?idUser=" + id;

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
                alert("Item deleted successfully!");
                location.reload();
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
            preview.classList.add("hidden");
            defaultSvg.style.display = "block";

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
    // Check if the user has a picture when the page loads
    window.onload = function() {
        setTimeout(() => {
            const userPicture = document.getElementById('preview').src;
            console.log("userpicture "+ userPicture);
            const previewImage = document.getElementById('preview');
            const svg = document.getElementById('svg');

            if (userPicture) {
                previewImage.style.display = "block";  // Show image
                svg.style.display = "none";  // Hide SVG
            } else {
                previewImage.style.display = "none";  // Hide image
                svg.style.display = "block";  // Show SVG
            }
        }, 300); // Delay execution by 500ms

    }






</script>
</body>
</html>
