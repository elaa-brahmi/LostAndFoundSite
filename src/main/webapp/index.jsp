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
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
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
        background-color: #3a3a3a;
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
        border-radius: 5px;
    }

    .btn:hover {

        background-color: rgb(123, 36, 28);
      /*  background: #fff3;*/
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



        .poppins-semibold {
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            font-style: normal;
        }
        .poppins-light-italic {
            font-family: "Poppins", sans-serif;
            font-weight: 300;
            font-style: italic;
        }
        .poppins-semibold-italic {
            font-family: "Poppins", sans-serif;
            font-weight: 600;
            font-style: italic;
        }
        .poppins-medium-italic {
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            font-style: italic;
        }
        .scroll {
            opacity:7;
            position: relative;
            width: 100%;
            height: auto;
            background-color: transparent;
            overflow: hidden;
            z-index: 1;

            padding: 0;
        }

        .scroll img {
            height: 100%;
            min-width: 100%;
            object-fit: cover; /* Ensures the images cover their container */

            opacity: 0.7; /* Slightly dim the images for better text visibility */
        }

        .m-scroll {
           
            animation: scrollImg 30s infinite linear;
            display: flex;
            width: max-content;
            height: 100%;
         /*    height: 100%; */
        }

        span {
            display: inline-block;
            width: fit-content;

            padding: 0;
            color: white;
        }



        @keyframes scrollImg {
            from {
                transform: translateX(0%);
            }
            to {
                transform: translateX(-50%);
            }
        }
        .lobster-regular {
            font-family: "Lobster", sans-serif;
            font-weight: 600;
            font-style: normal;
            z-index:2;
        }

        .card-title {
            color: #262626;
            font-size: 1.5em;
            line-height: normal;
            font-weight: 700;
            margin-bottom: 0.5em;
        }

        .small-desc {
            font-size: 1em;
            font-weight: 400;
            line-height: 1.5em;
            color: #452c2c;
        }

        .small-desc {
            font-size: 1em;
        }

        .go-corner {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            width: 2em;
            height: 2em;
            overflow: hidden;
            top: 0;
            right: 0;
            background: linear-gradient(135deg, #6293c8, #384c6c);
            border-radius: 0 4px 0 32px;
        }

        .go-arrow {
            margin-top: -4px;
            margin-right: -4px;
            color: white;
            font-family: courier, sans;
        }

        .card {
            box-shadow: rgba(142, 142, 142, 0.3) 0px 30px 30px -10px;

            font-size: 18px;
            display: block;
            position: relative;
            top: 100px;
            width: 600px;
            height: auto;
            background-color: #f2f8f9;
            border-radius: 10px;
            padding: 2em 1.2em;
            margin: 12px;
            text-decoration: none;
            z-index: 0;
            overflow: hidden;
            background: linear-gradient(to bottom, #c3e6ec, #a7d1d9);
            font-family: Arial, Helvetica, sans-serif;
        }

        .card:before {
            content: '';
            position: absolute;
            z-index: -1;
            top: -16px;
            right: -16px;
            background: linear-gradient(135deg, #364a60, #384c6c);
            height: 32px;
            width: 32px;
            border-radius: 32px;
            transform: scale(1);
            transform-origin: 50% 50%;
            transition: transform 0.35s ease-out;
        }

        .card:hover:before {
            transform: scale(50);
        }

        .card:hover .small-desc {
            transition: all 0.5s ease-out;
            color: rgba(255, 255, 255, 0.8);
        }

        .card:hover .card-title {
            transition: all 0.5s ease-out;
            color: #ffffff;
        }
        .roboto {
                     font-family: "Roboto", sans-serif;
                     font-optical-sizing: auto;
                     font-weight:600;
                     font-style: normal;
                     font-variation-settings:
                             "wdth" 100;
            position: absolute;
            top: 350px;
            left: 100px;
            font-size: 5rem;
            z-index: 2;
                 }
        .parent {

            position: relative;
            top: 70px;
            width: 470px;
            padding: 20px;
            perspective: 1000px;
        }

        .img3d{


            transform-style: preserve-3d;
            background: linear-gradient(135deg,#0000 18.75%,#f3f3f3 0 31.25%,#0000 0),
            repeating-linear-gradient(45deg,#f3f3f3 -6.25% 6.25%,#ffffff 0 18.75%);
            background-size: 60px 60px;
            background-position: 0 0, 0 0;
            background-color: #f0f0f0;
            width: 100%;
            box-shadow: rgba(142, 142, 142, 0.3) 0px 30px 30px -10px;
            transition: all 0.5s ease-in-out;
        }

        .img3d:hover {
            background-position: -100px 100px, -100px 100px;
            transform: rotate3d(0.5, 1, 0, 30deg);
        }
        .timeline ul {
            background-color: #3a3a3a;
            padding: 50px 0;
        }

        .timeline ul li {
            list-style-type: none;
            position: relative;
            width: 6px;
            margin: 0 auto;
            padding-top: 50px;
            background: #fff;
        }

        .timeline ul li::after {
            content: "";
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: inherit;
            z-index: 1;
        }

        .timeline ul li div {
            position: relative;
            bottom: 0;
            width: 400px;
            padding: 15px;
            background: rgb(123, 36, 28);
        }

        .timeline ul li div::before {
            content: "";
            position: absolute;
            bottom: 7px;
            width: 0;
            height: 0;
            border-style: solid;
        }

        .timeline ul li:nth-child(odd) div {
            left: 45px;
        }

        .timeline ul li:nth-child(odd) div::before {


            left: -15px;
            border-width: 8px 16px 8px 0;
            border-color: transparent rgb(123, 36, 28) transparent transparent;
        }

        .timeline ul li:nth-child(even) div {
            left: -470px;
        }

        .timeline ul li:nth-child(even) div::before {
            right: -15px;
            border-width: 8px 0 8px 16px;
            border-color: transparent transparent transparent  rgb(123, 36, 28);
        }




        /* EFFECTS
        –––––––––––––––––––––––––––––––––––––––––––––––––– */

        .timeline ul li::after {
            transition: background 0.5s ease-in-out;
        }

        .timeline ul li.in-view::after {
            background: rgb(123, 36, 28);
        }

        .timeline ul li div {
            visibility: hidden;
            opacity: 0;
            transition: all 0.5s ease-in-out;
        }

        .timeline ul li:nth-child(odd) div {
            transform: translate3d(200px, 0, 0);
        }

        .timeline ul li:nth-child(even) div {
            transform: translate3d(-200px, 0, 0);
        }

        .timeline ul li.in-view div {
            transform: none;
            visibility: visible;
            opacity: 1;
        }


        /* GENERAL MEDIA QUERIES
        –––––––––––––––––––––––––––––––––––––––––––––––––– */

        @media screen and (max-width: 900px) {
            .timeline ul li div {
                width: 250px;
            }
            .timeline ul li:nth-child(even) div {
                left: -289px;
                /*250+45-6*/
            }
        }

        @media screen and (max-width: 600px) {
            .timeline ul li {
                margin-left: 20px;
            }
            .timeline ul li div {
                width: calc(100vw - 91px);
            }
            .timeline ul li:nth-child(even) div {
                left: 45px;
            }
            .timeline ul li:nth-child(even) div::before {
                left: -15px;
                border-width: 8px 16px 8px 0;
                border-color: transparent rgb(123, 36, 28) transparent transparent;
            }
        }


        /* EXTRA/CLIP PATH STYLES
        –––––––––––––––––––––––––––––––––––––––––––––––––– */
        .timeline-clippy ul li::after {
            width: 40px;
            height: 40px;
            border-radius: 0;
        }

        .timeline-rhombus ul li::after {
            clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
        }

        .timeline-rhombus ul li div::before {
            bottom: 12px;
        }

        .timeline-star ul li::after {
            clip-path: polygon(
                    50% 0%,
                    61% 35%,
                    98% 35%,
                    68% 57%,
                    79% 91%,
                    50% 70%,
                    21% 91%,
                    32% 57%,
                    2% 35%,
                    39% 35%
            );
        }

        .timeline-heptagon ul li::after {
            clip-path: polygon(
                    50% 0%,
                    90% 20%,
                    100% 60%,
                    75% 100%,
                    25% 100%,
                    0% 60%,
                    10% 20%
            );
        }

        .timeline-infinite ul li::after {
            animation: scaleAnimation 2s infinite;
        }

        @keyframes scaleAnimation {
            0% {
                transform: translateX(-50%) scale(1);
            }
            50% {
                transform: translateX(-50%) scale(1.25);
            }
            100% {
                transform: translateX(-50%) scale(1);
            }
        }





        div.containerr
        {
            position: relative;
            top: 300px;
            font-size: 20px;
            display: flex;
            justify-content: space-evenly;
            font-family: Raleway;
            margin: 0 auto;
            padding: 6em 3em;
            text-align: center;
        }




        div.containerr button {
            background: none;
            border: none;
            color: #3a3a3a;
            font: 20px Raleway, sans-serif;
            margin: 0 10px;
            padding: 10px 10px;
            position: relative;
            z-index: 0;
            cursor: pointer;
        }

        /* Gray background */
        .gray {
            background: #9e9e9e;
        }

        /* Highlight text in */
        div.highlightTextIn button:before {
            position: absolute;
            color: #FFF;
            top: 0;
            left: 0;
            padding: 10px;
            overflow: hidden;
            content: attr(alt);
            transition: all 0.3s;
            transform: scale(1.2);
            opacity: 0;
        }

        div.highlightTextIn button:hover:before {
            transform: scale(1);
            opacity: 1;
        }

    </style>
</head>
<body>


<div class="nav">
    <div class="container">
        <div><img src="assets/logo.png" alt="logo" width="100px" height="90px"></div>
        <a href="home.jsp" class="btn poppins-semibold">Home</a>
        <a href="MyPosts.jsp" class="btn poppins-semibold">profile</a>
        <a href="addItem.jsp" class="btn poppins-semibold" >report lost/found item </a>
        <a href="index.jsp" class="btn poppins-semibold">about</a>

    </div>
</div>
<div>
    <div class="roboto">
        <div>Lost & Found Tunisia</div>
        <div>about the website</div></div>
    <div class="scroll">
        <div class="m-scroll">


            <span><img  src="assets/img/item1.jpg"  alt="img1"></span>
            <span><img  src="assets/img/item4.jpg" alt="img4"></span>
            <span><img  src="assets/img/item5.jpg" alt="img5"></span>
            <span ><img src="assets/img/item3.jpg" alt="img3" ></span>
            <span><img src="assets/img/item2.jpg" alt="img2"></span>
             <!-- Duplicate images for seamless scrolling -->
            <span><img  src="assets/img/item4.jpg" alt="img4"></span>
            <span><img  src="assets/img/item5.jpg" alt="img5"></span>
            <span ><img src="assets/img/item3.jpg" alt="img3" ></span>
            <span><img src="assets/img/item2.jpg" alt="img2"></span>
    
         


        </div>
    </div>

</div>




<div style="display: flex; align-items: center; justify-content: space-evenly;">
    <div data-aos="fade-right" class="parent">
        <div class="img3d">

            <img  src="assets/img/puzzle.jpg" width="100%" height="100%" alt="banner">

        </div>
    </div>


<div class="card" data-aos="fade-left">
    <p class="card-title">What is lost and found TN </p>
    <p class="small-desc">
        The Lost & Found Inventory Management Software and Dynamic Matching System provides a comprehensive,
        web-based solution for organizations to report, manage, and track lost and found items.
        The platform enables users to efficiently organize and maintain a structured database,
        with real-time in-platform notifications and email alerts when potential matches are identified.
        Users can then connect directly with their matches through a secure, built-in chat system,
        making it easy to coordinate the return of lost items.

    </p>
    <div class="go-corner">
        <div class="go-arrow">→</div>
    </div>
</div>
</div>


<section class="timeline" style="position: relative;
    top: 200px;">
    <ul>
        <li>
            <div class="poppins-medium-italic" style="color:white;">
                If you forget or lose an item, if you wish, you can use our online reporting service.Simply fill out our online form describing the lost item and the potential location(s) of loss.
            </div>
        </li>
        <li>
            <div class="poppins-medium-italic" style="color:white;">
                we have set up a dedicated section that allows Internet users to consult the most recent reports from our platform.


            </div>
        </li>
        <li>
            <div class="poppins-medium-italic" style="color:white;">
                If your item matches with others, you’ll receive suggestions for potential matches. You can review these and accept the ones that fit your needs. Once a match is accepted, you’ll be able to connect and communicate directly with the other party.</div>
        </li>

    </ul>
</section>







<div class="containerr gray highlightTextIn">
    <button alt="HOME"  onclick="window.location.href='home.jsp';">HOME</button>
    <button alt="MY POSTS"  onclick="window.location.href='MyPosts.jsp';">MY POSTS</button>
    <button alt="REPORT ITEM"  onclick="window.location.href='addItem.jsp';">REPORT ITEM</button>
    <button alt="ABOUT"  onclick="window.location.href='index.jsp';">ABOUT</button>
    <button alt="REGISTER"  onclick="window.location.href='login.jsp';">REGISTER</button>
</div>






<script>
    window.onload = function() {
        <% if (session.getAttribute("userId") != null && "user".equals(session.getAttribute("role"))) { %>
            document.getElementById("register").classList.toggle("hidden");
        <% } %>
    }</script>
<script>
    (function () {
        "use strict";

        // define variables
        var items = document.querySelectorAll(".timeline li");

        // check if an element is in viewport
        // http://stackoverflow.com/questions/123999/how-to-tell-if-a-dom-element-is-visible-in-the-current-viewport
        function isElementInViewport(el) {
            var rect = el.getBoundingClientRect();
            return (
                rect.top >= 0 &&
                rect.left >= 0 &&
                rect.bottom <=
                (window.innerHeight || document.documentElement.clientHeight) &&
                rect.right <= (window.innerWidth || document.documentElement.clientWidth)
            );
        }

        function callbackFunc() {
            for (var i = 0; i < items.length; i++) {
                if (isElementInViewport(items[i])) {
                    items[i].classList.add("in-view");
                }
            }
        }

        // listen for events
        window.addEventListener("load", callbackFunc);
        window.addEventListener("resize", callbackFunc);
        window.addEventListener("scroll", callbackFunc);
    })();

</script>


<%--<div id="register" style="margin-top: 3rem;--%>
<%--    text-align: center;">--%>
<%--    <button class="styled-button" onclick="login()">--%>
<%--        Register Now--%>
<%--        <div class="inner-button">--%>
<%--            <svg--%>
<%--                    id="Arrow"--%>
<%--                    viewBox="0 0 32 32"--%>
<%--                    xmlns="http://www.w3.org/2000/svg"--%>
<%--                    height="30px"--%>
<%--                    width="30px"--%>
<%--                    class="icon"--%>
<%--            >--%>
<%--                <defs>--%>
<%--                    <linearGradient y2="100%" x2="100%" y1="0%" x1="0%" id="iconGradient">--%>
<%--                        <stop style="stop-color:#FFFFFF;stop-opacity:1" offset="0%"></stop>--%>
<%--                        <stop style="stop-color:#AAAAAA;stop-opacity:1" offset="100%"></stop>--%>
<%--                    </linearGradient>--%>
<%--                </defs>--%>
<%--                <path--%>
<%--                        fill="url(#iconGradient)"--%>
<%--                        d="M4 15a1 1 0 0 0 1 1h19.586l-4.292 4.292a1 1 0 0 0 1.414 1.414l6-6a.99.99 0 0 0 .292-.702V15c0-.13-.026-.26-.078-.382a.99.99 0 0 0-.216-.324l-6-6a1 1 0 0 0-1.414 1.414L24.586 14H5a1 1 0 0 0-1 1z"--%>
<%--                ></path>--%>
<%--            </svg>--%>
<%--        </div>--%>
<%--    </button>--%>

<%--</div>--%>
<%--</div>--%>
<script>
    function login(){
        window.location.href="login.jsp";
    }






</script><script>
    AOS.init({
        once: true,
        mirror: false
    });
</script>

</body>
</html>
