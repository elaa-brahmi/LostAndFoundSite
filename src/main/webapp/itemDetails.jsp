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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <title>item details</title>
    <!-- Inclure Toastr CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- AOS JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            AOS.init();
        });
    </script>
    <style>
        /*@import url('https://fonts.googleapis.com/css?family=Fira+Sans:400,500,600,700,800');*/
        /*@import url('https://fonts.googleapis.com/css?family=Fira+Sans:400,500,600,700,800');*/
        /** {*/
        /*    box-sizing: border-box;*/
        /*}*/
        body {

            min-height: 100vh;
            font-family: 'Fira Sans', sans-serif;

        }

        .blog-slider {
            width: 95%;
            position: relative;
            top: 120px;
            max-width: 800px;
            margin: auto;
            background: #fff;
            box-shadow: 0px 14px 80px rgba(34, 35, 58, 0.2);
            padding: 25px;
            border-radius: 25px;
            height: 400px;
            transition: all .3s;
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
            top: 120px;
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


        .toast-info {
        background-color: #007bff !important; /* Blue background for info notifications */
        color: #ffffff !important; /* White text */
    }

    .toast-success {
        background-color: #28a745 !important; /* Green background for success notifications */
        color: #ffffff !important; /* White text */
    }

    .toast-error {
        background-color: #dc3545 !important; /* Red background for error notifications */
        color: #ffffff !important; /* White text */
    }

    .toast-warning {
        background-color: #ffc107 !important; /* Yellow background for warning notifications */
        color: #000000 !important; /* Black text */
    }

    /* Customize the progress bar color */
    .toast-progress {
        background-color: #ffffff !important; /* White progress bar */
    }
        @media (min-width: 576px) {
            .container,
            .container-sm {
                max-width: none !important;
            }
        }
        @media (min-width: 768px) {
            .container, .container-md, .container-sm {
                max-width: none !important;
            }
        }
        @media (min-width: 992px) {
            .container, .container-lg, .container-md, .container-sm {
                max-width:none !important;
            }
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
    </style>
</head>
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Inclure Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <div class="containerr highlightTextIn" style="background-color: #CCCCFF;">


        <button alt="HOME"  onclick="window.location.href='home.jsp';">HOME</button>
        <button alt="MY POSTS"  onclick="window.location.href='MyPosts.jsp';">MY POSTS</button>
        <button alt="REPORT ITEM"  onclick="window.location.href='addItem.jsp';">REPORT ITEM</button>
        <button alt="ABOUT"  onclick="window.location.href='index.jsp';">ABOUT</button>
        <button alt="REGISTER"  onclick="window.location.href='login.jsp';">REGISTER</button>
    </div>

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



    <!-- footer -->
    <div class="my-5" style="width: 100%;position: relative;
    top: 200px;left: 0;right: 0;">

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
                    <a class="text-black" href="https://mdbootstrap.com/">Lost&Found TN</a>
                </div>
                <!-- Copyright -->
            </footer>
            <!-- Footer -->
        </section>

    </div>
    <!-- End of .container -->
    <script>
        toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": true,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": true,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
};

    function sendFriendRequest(){
        $.ajax({
            url: 'http://localhost:8080/sendFriendRequest',
            type: 'POST',
            data: {
                senderId:<%= session.getAttribute("userId")%>,
                receiverId:sessionStorage.getItem('receiverId')
            },
            success: function(data){
                toastr.success('Friend request sent successfully!','success');
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
            setTimeout(function () {
                window.location.href = "MyPosts.jsp";
            }, 4000); // 3000ms = 3 seconds


        },error: function (data) {
            console.log(data);
        }
    });
}
function updateNotif(status){
    document.querySelector(".btn.btn-secondary").classList.add("hidden");
    document.querySelector(".btn.btn-danger").classList.add("hidden");
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
                    toastr.info('you item is matched,you will not receive any further notification about it','info' );

                }
                else{
                    toastr.info('you item is still pending ,you will be notified if theres a new potential match','info' );
                    console.log("you item is still pending ,you will be notified if there's a new potential match");
                    deleteNotif(notifId);
                }
            }
        },
        error: function (data) {
            console.log(data);
        }
    });
}




</script>
</body>
</html>
