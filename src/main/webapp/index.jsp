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
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&family=Poetsen+One&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poetsen+One&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
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
    <title>about</title>
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

        /* begin header*/
        div.containerr
        {

            z-index:2;
            min-width: 600px;
            width: 100%;
            position: sticky;
            top:0;
            height: 15%;
            display: flex;
            justify-content: space-evenly;
            font-family: Raleway;
            margin: 0 auto;
            text-align: center;
        }




        div.containerr button {
            background: none;
            border: none;
            color: #3a3a3a;
            font: 25px Raleway, sans-serif;

            padding: 10px 10px;
            position: relative;
            z-index: 0;
            cursor: pointer;
        }


        /* Highlight text in */
        div.highlightTextIn button:before {
            position: absolute;
            color: #fff;
            top: 25%;
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
        /* end header */
        .row>* {
            flex-shrink: 0;
            padding-right: 0 !important;
            padding-left: 0 !important;
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
        .poppins-extrabold {
            font-family: "Poppins", sans-serif;
            font-weight: 800;
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


        .scroll img {
            height: 100%;
            min-width: 100%;
            object-fit: cover; /* Ensures the images cover their container */

            opacity: 0.7; /* Slightly dim the images for better text visibility */
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




        .timeline ul {

            padding: 50px 0;
        }

        .timeline ul li {
            list-style-type: none;
            position: relative;
            width: 6px;
            margin: 0 auto;
            padding-top: 50px;
            background: black;
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

        .report:hover{
            color: #fff; /* Darker purple */
          width:250px;
            font-size:25px;



        }
        .report{
            transition: all 0.3s ease;
            cursor: pointer;
            background-color: #8d8ddd;
            font-size: 20px;
            height: 70px;
            width: 200px;
            border-radius: 25px;
            border: 1px;
        }
        .step-container {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            margin-top: 90px;
        }

        .step {
            position: relative;
        }

        .circle {
            width: 120px;
            height: 120px;
            background: white;
            border-radius: 30px;
            box-shadow: 0 0 0 20px rgba(0, 128, 128, 0.02),
            0 0 0 40px rgba(0, 128, 128, 0.02),
            0 0 20px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease-in-out;
        }

        .circle i {
            font-size: 40px;
            color: #67c5bb;
            transition: color 0.3s ease-in-out;
        }

        .circle:hover {
            animation: ring 0.6s ease-in-out;
            box-shadow: 0 0 0 20px rgba(141, 141, 221, 0.1),
            0 0 0 40px rgba(141, 141, 221, 0.05),
            0 0 30px rgba(141, 141, 221, 0.4);
        }

        .circle:hover i {
            color: #8d8ddd;
        }

        /* Ring animation (like a bell wiggle) */
        @keyframes ring {
            0% { transform: rotate(0deg); }
            15% { transform: rotate(15deg); }
            30% { transform: rotate(-10deg); }
            45% { transform: rotate(8deg); }
            60% { transform: rotate(-6deg); }
            75% { transform: rotate(4deg); }
            100% { transform: rotate(0deg); }
        }
        .dots {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .dots span {
            width: 6px;
            height: 6px;
            background-color: #2f4f4f;
            border-radius: 50%;
            animation: pulse 2s infinite ease-in-out;
        }

        /* Make dot sizes vary like in your image */
        .dots span:nth-child(1),
        .dots span:nth-child(10) {
            width: 3px;
            height: 3px;
        }

        .dots span:nth-child(2),
        .dots span:nth-child(9) {
            width: 5px;
            height: 5px;
        }

        .dots span:nth-child(3),
        .dots span:nth-child(8) {
            width: 7px;
            height: 7px;
        }

        .dots span:nth-child(4),
        .dots span:nth-child(7) {
            width: 9px;
            height: 9px;
        }

        .dots span:nth-child(5),
        .dots span:nth-child(6) {
            width: 11px;
            height: 11px;
        }
        @media (min-width: 1200px) {
            .ms-lg-7rem {
                margin-left: 7rem;
            }
        }
        .info-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            padding: 1.5rem;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease;
        }

        .info-card:hover {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .icon-wrapper {
            background-color: #fef3c7;
            border-radius: 50%;
            padding: 0.75rem;
            flex-shrink: 0;
        }

        .icon {
            width: 2rem;
            height: 2rem;
            color: #fcd34d;
        }

        .title {
            color: #065f46;
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .message {
            color: #374151;
            font-size: 0.875rem;
            line-height: 1.5;
            margin-bottom: 0;
        }

        .highlight {
            color: #10b981;
            font-weight: 500;
        }

        @media (min-width: 576px) {
            .icon {
                width: 2.5rem;
                height: 2.5rem;
            }

            .title {
                font-size: 1.5rem;
            }

            .message {
                font-size: 1rem;
            }
        }
        /* From Uiverse.io by Yaya12085 */
        .cookie-card {
            max-width: 550px;
            padding: 1rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 20px 20px 30px rgba(0, 0, 0, .05);
        }

        .titleCookie {
            font-weight: 600;
            color: rgb(31 41 55);
        }

        .description {
            margin-top: 1rem;
            font-size: 0.875rem;
            line-height: 1.25rem;
            color: rgb(75 85 99);
        }

        .description a {
            --tw-text-opacity: 1;
            color: rgb(59 130 246);
        }

        .description a:hover {
            -webkit-text-decoration-line: underline;
            text-decoration-line: underline;
        }

        .actions {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 1rem;
            -moz-column-gap: 1rem;
            column-gap: 1rem;
            flex-shrink: 0;
        }

        .pref {
            font-size: 0.75rem;
            line-height: 1rem;
            color: rgb(31 41 55 );
            -webkit-text-decoration-line: underline;
            text-decoration-line: underline;
            transition: all .3s cubic-bezier(0.4, 0, 0.2, 1);
            border: none;
            background-color: transparent;
        }

        .pref:hover {
            color: rgb(156 163 175);
        }

        .pref:focus {
            outline: 2px solid transparent;
            outline-offset: 2px;
        }

        .accept {
            font-size: 0.75rem;
            line-height: 1rem;
            background-color: rgb(17 24 39);
            font-weight: 500;
            border-radius: 0.5rem;
            color: #fff;
            padding-left: 1rem;
            padding-right: 1rem;
            padding-top: 0.625rem;
            padding-bottom: 0.625rem;
            border: none;
            transition: all .15s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .accept:hover {
            background-color: rgb(55 65 81);
        }

        .accept:focus {
            outline: 2px solid transparent;
            outline-offset: 2px;
        }

        /* From Uiverse.io by Juanes200122 */
        .containerProgress {
            /* color: black; */
            margin-right: auto !important;
            margin-left: auto !important;
            margin-top: 4rem;
            position: relative;
            /* margin: auto; */
            max-width: 70%;
            width: 100%;
            background: #afa8a7;
            /* margin: 0 15px; */
            padding: 10px 20px;
            border-radius: 7px;
        }

        .containerProgress .skill-box {
            width: 100%;
            margin: 25px 0;
        }

        .skill-box .title {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: black;
        }

        .skill-box .skill-bar {
            height: 8px;
            width: 100%;
            border-radius: 6px;
            margin-top: 6px;
            background: white;
        }

        .skill-bar .skill-per {
            position: relative;
            display: block;
            height: 100%;
            width: 90%;
            border-radius: 6px;
            background: rgb(226, 226, 226);
            animation: progress 0.4s ease-in-out forwards;
            opacity: 0;
        }

        .skill-per.users{
            /*progreso de las diferentes lenguajes*/
            width: 70%;
            animation-delay: 0.1s;
        }

        .skill-per.fi{
            /*progreso de las diferentes lenguajes*/
            width: 45%;
            animation-delay: 0.1s;
        }

        .skill-per.li{
            /*progreso de las diferentes lenguajes*/
            width: 55%;
            animation-delay: 0.2s;
        }

        @keyframes progress {
            0% {
                width: 0;
                opacity: 1;
            }

            100% {
                opacity: 1;
            }
        }

        .skill-per .tooltip {
            opacity:1;
            position: absolute;
            right: -14px;
            top: -28px;
            font-size: 9px;
            font-weight: 500;
            color: rgb(0, 0, 0);
            font-weight: bold;
            padding: 2px 6px;
            border-radius: 3px;
            background: rgb(226, 226, 226);
            z-index: 1;
        }

        .tooltip::before {
            opacity: 0;
            content: "";
            position: absolute;
            left: 50%;
            bottom: -2px;
            height: 10px;
            width: 10px;
            z-index: -1;
            background-color: rgb(226, 226, 226);
            transform: translateX(-50%) rotate(45deg);
        }

        /* From Uiverse.io by kamehame-ha */


        .cardsTes .green {
            background-color: #71b1aa;
        }

        .cardsTes .purple {
            background-color: #7e7ece;
        }

        .cardsTes .green {
            background-color: #71b1aa;
        }

        .cardsTes .card {
            margin-bottom:5%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            height: 250px;

            border-radius: 20px;
            color: white;
            cursor: pointer;
            transition: 400ms;
        }

        .cardsTes .card p.tip {
            font-size: 15px;
            font-weight: 700;
        }

        .cardsTes .card p.second-text {
            font-size: .7em;
        }

        .cardsTes .card:hover {
            transform: scale(1.1, 1.1);
        }

        .cardsTes :hover > .card:not(:hover) {
            filter: blur(10px);
            transform: scale(0.9, 0.9);
        }
        .roboto-Poetsen  {
                     font-family: "Roboto", sans-serif;
                     font-optical-sizing: auto;
                     font-weight: 700;
                     font-style: normal;
                     font-variation-settings:
                             "wdth" 100;
                 }
        .robotoFont {
                     font-family: "Roboto", sans-serif;
                     font-optical-sizing: auto;
                     font-weight: 800;
                     font-style: italic;
                     font-variation-settings:
                             "wdth" 100;
                 }
    </style>
</head>



<body style="overflow-x: hidden;">
<div class="containerr highlightTextIn" style="background-color: #CCCCFF;">


    <button alt="HOME"  onclick="window.location.href='home.jsp';">HOME</button>
    <button alt="MY POSTS"  onclick="window.location.href='MyPosts.jsp';">MY POSTS</button>
    <button alt="REPORT ITEM"  onclick="window.location.href='addItem.jsp';">REPORT ITEM</button>
    <button alt="ABOUT"  onclick="window.location.href='index.jsp';">ABOUT</button>
    <button alt="REGISTER"  onclick="window.location.href='login.jsp';">REGISTER</button>
</div>

<div class="row" style="background-color: #ccccff;">
    <div class="col-12 col-md-6" style="text-align:center;margin:auto;padding: 4rem;">
        <span class="poppins-extrabold" style=" color: #000;text-transform: capitalize;font-size: 2rem;">Turn panic into peace of mind</span><div class="w-100"></div>
       <span style=" color: #000;font-size: 1.5rem;"> Lost something? Found something?<div class="w-100"></div>
        We’ll take it from here</span><div class="w-100"></div>
        <button class="report mt-3" onclick="window.location.href='addItem.jsp';">report an item</button>

    </div>
    <div class="col-12 col-md-6" style="display: flex
;
    justify-content: center;
    align-items: center;">
        <img style="width:500px;" src="assets/img/search-Photoroom.png" alt="">
    </div>
</div>
<div class="mx-auto mt-5">
    <h1 class="poppins-semibold text-center">HOW CAN WE HELP YOU</h1>
    <div class="step-container row">
        <div class="col-12 col-md-12 col-lg-12 col-xl-3">
            <div class="step-content mx-auto" style="max-width: 400px;gap: 2rem;">
            <div class="step-dots-content ms-lg-7rem  d-flex flex-column flex-xl-row align-items-center" style="gap: 4rem;
    margin-bottom: 2rem;" >
                <div class="step text-center">
                    <div class="circle mx-auto">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                </div>
                <div class="dots">
                    <span></span><span></span><span></span><span></span><span></span>
                    <span></span><span></span><span></span><span></span><span></span>
                </div>
            </div>
            <div class="content text-center p-1">
                <h3 class="text-center">Report a lost or found item</h3>

                    Fill the declaration and give as much detail as possible (the location of loss, the type of item, the description) to help the algorithm to identify it quickly
            </div></div>
        </div>

    <div class="col-12 col-md-12 col-lg-12 col-xl-3">
        <div class="step-content mx-auto" style="max-width: 400px;gap: 2rem;">
            <div class="step-dots-content ms-lg-7rem  d-flex flex-column flex-xl-row align-items-center" style="gap: 4rem;
    margin-bottom: 2rem;">
                <div class="step text-center">
                    <div class="circle mx-auto">
                        <i class="fas fa-user-shield"></i>
                    </div>
                </div>
                <div class="dots">
                    <span></span><span></span><span></span><span></span><span></span>
                    <span></span><span></span><span></span><span></span><span></span>
                </div></div>
                <div class="content text-center p-1">
                   <h3 class="text-center">connect with your match</h3>
                    Once the lost item is matched, you’ll be able to connect with the other user through our secure chat system.

                </div></div>
        </div>
        <div class="col-12 col-md-12 col-lg-12 col-xl-3">
            <div class="step-content mx-auto row" style="max-width: 400px;gap: 1.7rem;">
        <div class="step">
            <div class="circle mx-auto">
                <i class="fas fa-handshake"></i>
            </div>
        </div>
            <div class="content text-center p-1"> <h3 class="text-center">Get it back!</h3>
                Once you're authenticated and matched, you can chat with the other user to agree on how to return the item—either by meeting up or arranging a delivery
            </div>
            </div>
        </div>
    </div>


    <div class="container mx-auto" style="margin-top: 9rem !important;" data-aos="zoom-in">
        <div class="row g-4">
            <div class="col-12 col-md-6 col-lg-4 mx-auto" style="width: 60%;">
                <div class="info-card">
                    <div class="d-flex flex-column flex-sm-row align-items-center align-items-sm-start gap-3">
                        <div class="icon-wrapper">
                            <img src="https://raw.githubusercontent.com/lucide-icons/lucide/main/icons/lightbulb.svg" alt="Lightbulb icon" class="icon">
                        </div>
                        <div class="text-center text-sm-start">
                            <h3 class="title">You should know</h3>
                            <p class="message">If you add a photo to your report, you increase <span class="highlight">by more than 50%</span> your chances of finding your lost item</p>
                        </div>
                    </div>
                </div>
            </div>
</div>
</div>
    <div class="cookie-card" data-aos="fade-left" id="cookie" style="position: fixed;
    bottom: 15px;
    right: 15px;
    font-size: 29px;

    z-index: 1;">
        <span class="titleCookie ">🍪 Cookie Notice</span>
        <p class="description">We use cookies to ensure that we give you the best experience on our website. <a href="#">Read cookies policies</a>. </p>
        <div class="actions">
            <button class="pref">
                Manage your preferences
            </button>
            <button class="accept" onclick="hideCookie()">
                Accept
            </button>
        </div>
    </div>


        <!-- From Uiverse.io by Juanes200122 -->
    <h3 class="roboto-Poetsen mt-5 text-center">statistics</h3>
        <div class="containerProgress" data-aos="zoom-in">
            <div class="skill-box">
                <span class="title">users</span>

                <div class="skill-bar">
      <span class="skill-per users" style="background-color: black;">
        <span class="tooltip">70%</span>
      </span>
                </div>
            </div>

            <div class="skill-box">
                <span class="title">found items</span>

                <div class="skill-bar">
      <span class="skill-per fi" style="background-color: black;">
        <span class="tooltip">45%</span>
      </span>
                </div>
            </div>
            <div class="skill-box">
                <span class="title">lost items</span>

                <div class="skill-bar">
      <span class="skill-per li" style="background-color: black;">
        <span class="tooltip">55%</span>
      </span>
                </div>
            </div>
        </div>


<h3 class="roboto-Poetsen mt-5 text-center ">Testimonials</h3>
    <!-- From Uiverse.io by kamehame-ha -->
    <div class="cardsTes mx-auto mt-5 row " style="gap: 10%;
    width: 80%;">
        <div class="card green col-12 col-md-6 col-lg-3 p-3">
            <p class="tip">"I lost my backpack on campus and thought it was gone forever. Thanks to this platform, someone found it and contacted me the same day!"
            </p>
            <p class="second-text">— Yasmine B., Student</p>
        </div>
        <div class="card purple col-12 col-md-6 col-lg-3 p-3">
            <p class="tip">"I found a phone at a bus stop and wasn’t sure what to do. Reporting it here was so easy, and the owner proved it through chat. We met up safely and she was so grateful!"</p>
            <p class="second-text">— Omar R., Graphic Designer</p>
        </div>
        <div class="card green col-12 col-md-6 col-lg-3 p-3">
            <p class="tip">"The chat system made everything smooth. I described my lost watch, and the finder confirmed it was mine. We arranged delivery in minutes."</p>
            <p class="second-text">— Khaled T., Engineer</p>
        </div>
    </div>
<div class="100"></div>
    <div class="mx-auto mt-5" data-aos="zoom-in-up">
        <p class="robotoFont" style="text-align: center;
    font-size: 30px;">Ready to find what you've lost or help someone else?</p>
        <div class="d-flex justify-content-center align-items-center">
        <button class="report mt-3 " style="margin-right:5%;"  onclick="window.location.href='addItem.jsp';">lost an item</button>
        <button class="report mt-3"  onclick="window.location.href='addItem.jsp';">found an item</button>
        </div>
    </div>


<!-- footer -->
<div style="width: 100%;;position: relative;
    top: 10px;left: 0;right: 0;margin-top: 10rem !important;">

    <section class="">
        <!-- Footer -->
        <footer class="text-center text-white" style="background-color: #ccccff;
    color: black !important;">
            <!-- Grid container -->
            <div class="container p-4 pb-0">
                <!-- Section: CTA -->
                <section class="">
                    <p class="d-flex justify-content-center align-items-center">
                        <span class="me-3"><a style="text-decoration:none; color:black;" href="login.jsp">Register for free</a></span>
                        <button type="button" class="btn btn-outline-light btn-rounded">
                            <a style="text-decoration:none; color:black;" href="login.jsp">Sign up!</a>
                        </button>
                    </p>
                </section>
                <!-- Section: CTA -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2025 Copyright:
                <a class="text-black" href="home.jsp">Lost&Found TN</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </section>

</div>
<!-- End of .container -->

</div>




<script>
    function hideCookie(){
        var cookie=document.querySelector("#cookie");
        cookie.style.display='none';
        localStorage.setItem("cookieAccepted", "true");

    }
    window.onload = function() {
        var cookieAccepted = localStorage.getItem("cookieAccepted");
        console.log(cookieAccepted);
        const isAuthenticated = <%= session.getAttribute("userId") != null ? "true" : "false" %>;
        console.log("user authentication "+isAuthenticated);
        if(!cookieAccepted || isAuthenticated==="false"){
            console.log("cookie accepted "+cookieAccepted);
            console.log("user authenticated "+isAuthenticated);

            var cookie=document.querySelector("#cookie");
            cookie.style.display='block';}
            else{
            console.log("cookie not shown");}
     
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
