<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2025-03-16
  Time: 2:18 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Title</title>
    <style>
        .styled-button {
            position: relative;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            font-weight: bold;
            color: #ffffff;
            background: linear-gradient(to bottom, #171717, #242424);
            border-radius: 9999px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 1), 0 10px 20px rgba(0, 0, 0, 0.4);
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #292929;
        }

        .styled-button::before {
            content: "";
            position: absolute;
            top: -2px;
            right: -1px;
            bottom: -1px;
            left: -1px;
            background: linear-gradient(to bottom, #292929, #000000);
            z-index: -1;
            border-radius: 9999px;
            transition: all 0.2s ease;
            opacity: 1;
        }

        .styled-button:active {
            transform: translateY(2px);
            box-shadow: 0 1px 2px rgba(0, 0, 0, 1), 0 5px 10px rgba(0, 0, 0, 0.4);
        }

        .styled-button .inner-button {
            position: relative; /* Ensure relative positioning for pseudo-element */
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(to bottom, #171717, #242424);
            width: 40px;
            height: 40px;
            margin-left: 10px;
            border-radius: 50%;
            box-shadow: 0 0 1px rgba(0, 0, 0, 1);
            border: 1px solid #252525;
            transition: all 0.2s ease;
        }

        .styled-button .inner-button::before {
            content: "";
            position: absolute;
            top: -2px;
            right: -1px;
            bottom: -1px;
            left: -1px;
            background: linear-gradient(to bottom, #292929, #000000);
            z-index: -1;
            border-radius: 9999px;
            transition: all 0.2s ease;
            opacity: 1;
        }
        .styled-button .inner-button .icon {
            filter: drop-shadow(0 10px 20px rgba(26, 25, 25, 0.9))
            drop-shadow(0 0 4px rgba(0, 0, 0, 1));
            transition: all 0.4s ease-in-out;
        }
        .styled-button .inner-button .icon:hover {
            filter: drop-shadow(0 10px 20px rgba(50, 50, 50, 1))
            drop-shadow(0 0 20px rgba(2, 2, 2, 1));
            transform: rotate(-35deg);
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
    .container1{
        margin-top: 1rem;
        display: flex;
        flex-direction: column;
        column-gap: 0.5rem;
    }
    .container2{
        display: flex;
        justify-content: space-around;
        flex-direction: row;

    }
    .img1{
        border-radius: 16px;
        background: #17141d;
        box-shadow: -1rem 0 3rem #00000067;
    }
    .img1:hover{
        transform: translateY(-0.4rem);
    }




        @media (max-width: 768px) {
            .img1{
                width: 100%;
                height:auto;
            }
            .container3{
                width: 100%;
                margin: auto;
            }
            .container4{
                width: 1000%;
            }
            .container2{
                width: 100%;
                display: flex;
                align-items: center;
                flex-direction: column;
            }
            .container1{
                width: 100%;
                display: flex;
                align-items: center;
                flex-direction: column;
            }
            .text-center, .texte-center {
        text-align: center;
    }
    .nav .container {
        flex-direction: column;
        align-items: center;
    }
    .nav .btn {
        font-size: 1.5em;
    }
    .container {
        flex-direction: column;
        align-items: center;
    }
    .btn {
        font-size: 1.5em;
        padding: 0.5em 1em;
    }
        }
        .hidden{
            display: none;
        }




    </style>
</head>
<body>


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
<div>
<img src="assets/pexels.jpg" alt="Description" width="100%" height="100%">
</div>
<div style="margin:0.5rem;">
<div style="font-size:18px; max-width: 100%;">
   <h1> What is lost and found TN</h1>
    The Lost & Found Inventory Management Software and Dynamic Matching System provides a comprehensive solution for organizations to report, manage, and track lost and found items. The web-based platform enables users to efficiently organize and maintain a database of lost and found items and receive real-time notifications of matching reports With a focus on streamlining the lost and found process, this system offers a tailored solution to handle the complexities of lost item management, freeing up time and resources for the core business operations of the organization
    <h1>Highlights</h1>
    <svg style="width: 2%;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09ZM18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456ZM16.894 20.567 16.5 21.75l-.394-1.183a2.25 2.25 0 0 0-1.423-1.423L13.5 18.75l1.183-.394a2.25 2.25 0 0 0 1.423-1.423l.394-1.183.394 1.183a2.25 2.25 0 0 0 1.423 1.423l1.183.394-1.183.394a2.25 2.25 0 0 0-1.423 1.423Z" ></path>
    </svg>

    Web-based platform for reporting, managing, and tracking lost and found items<br>
    <svg style="width: 2%;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09ZM18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456ZM16.894 20.567 16.5 21.75l-.394-1.183a2.25 2.25 0 0 0-1.423-1.423L13.5 18.75l1.183-.394a2.25 2.25 0 0 0 1.423-1.423l.394-1.183.394 1.183a2.25 2.25 0 0 0 1.423 1.423l1.183.394-1.183.394a2.25 2.25 0 0 0-1.423 1.423Z" ></path>
    </svg>
    Dynamic matching system to identify and notify users of potential item matches<br>
    <svg style="width: 2%;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09ZM18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456ZM16.894 20.567 16.5 21.75l-.394-1.183a2.25 2.25 0 0 0-1.423-1.423L13.5 18.75l1.183-.394a2.25 2.25 0 0 0 1.423-1.423l.394-1.183.394 1.183a2.25 2.25 0 0 0 1.423 1.423l1.183.394-1.183.394a2.25 2.25 0 0 0-1.423 1.423Z" ></path>
    </svg>
    Ability to create sub-admin accounts for delegating management tasks<br>
    <svg style="width: 2%;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09ZM18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456ZM16.894 20.567 16.5 21.75l-.394-1.183a2.25 2.25 0 0 0-1.423-1.423L13.5 18.75l1.183-.394a2.25 2.25 0 0 0 1.423-1.423l.394-1.183.394 1.183a2.25 2.25 0 0 0 1.423 1.423l1.183.394-1.183.394a2.25 2.25 0 0 0-1.423 1.423Z" ></path>
    </svg>
    Email notifications and system alerts for recent matching reports Archiving functionality for recovered lost items
</div>
<div class="container1" style="margin-top:3rem;">
    <div class="container2">

        <img data-aos="zoom-out-down" class="img1  container3 " src="assets/lostItem.jpg" width="30%" height="30%">
        <div data-aos="zoom-out-down" style="margin:2rem;" class="text-center  container4"><h2 style="color:darkblue;"> REPORT A LOST ITEM</h2>
        <p style="font-size:20px;">If you forget or lose an item, if you wish, you can use our online reporting service.<br> Simply fill out our online form describing the lost item and the potential location(s) of loss.</p>
    </div> </div>
    <div class="container2">
        <div data-aos="zoom-out-down" style="margin:2rem;" class="texte-center  container3">
        <h2 style="color:darkblue;">  List of recent lost items</h2>
        <p style="font-size:20px;">We receive a large number of reports of lost items every day, we have set up a<br> dedicated section that allows Internet users to consult the most recent reports from our platform.</p>
    </div><img data-aos="zoom-out-down"  class="img1  container4" src="assets/items.jpg" width="30%" height="30%">

    </div>
    <div class="container2">
        <img data-aos="zoom-out-down" class="img1  container3" src="assets/contact.jpg" width="30%" height="30%">
       <div data-aos="zoom-out-down" class="text-center  container4" style="margin:2rem;"> <h2 style="color:darkblue;">Contact INFORMATION for lost and found services</h2>
       <p style="font-size:20px;"> We have listed contact information for many Lost and Found services for over 300<br> cities around the world.
        We have classified our publications by country and then by city.</p>
    </div>
    </div>

</div>
<script>
    window.onload = function() {
        <% if (session.getAttribute("userId") != null && "user".equals(session.getAttribute("role"))) { %>
            document.getElementById("register").classList.toggle("hidden");
        <% } %>
    }
</script>
    </script>

<div id="register" style="margin-top: 3rem;
    text-align: center;">
    <button class="styled-button" onclick="login()">
        Register Now
        <div class="inner-button">
            <svg
                    id="Arrow"
                    viewBox="0 0 32 32"
                    xmlns="http://www.w3.org/2000/svg"
                    height="30px"
                    width="30px"
                    class="icon"
            >
                <defs>
                    <linearGradient y2="100%" x2="100%" y1="0%" x1="0%" id="iconGradient">
                        <stop style="stop-color:#FFFFFF;stop-opacity:1" offset="0%"></stop>
                        <stop style="stop-color:#AAAAAA;stop-opacity:1" offset="100%"></stop>
                    </linearGradient>
                </defs>
                <path
                        fill="url(#iconGradient)"
                        d="M4 15a1 1 0 0 0 1 1h19.586l-4.292 4.292a1 1 0 0 0 1.414 1.414l6-6a.99.99 0 0 0 .292-.702V15c0-.13-.026-.26-.078-.382a.99.99 0 0 0-.216-.324l-6-6a1 1 0 0 0-1.414 1.414L24.586 14H5a1 1 0 0 0-1 1z"
                ></path>
            </svg>
        </div>
    </button>

</div>
</div>
<script>
    function login(){
        window.location.href="login.jsp";
    }






</script><script src="/webcoscketNotif.js"></script>

</body>
</html>
