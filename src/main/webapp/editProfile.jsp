<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2025-03-07
  Time: 11:25 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="services.UserDao" %>
<%@ page import="java.sql.SQLException" %>
<%
int idUser=Integer.parseInt(request.getParameter("idUser"));

        User user=UserDao.getUser(idUser);

%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">

    <title>edit profile</title>
    <style>
        .swal-footer{
            text-align: center!important;
        }

        .profile-container {
            min-width: 400px;
            margin-top: 4%;
            max-width: 28rem; /* matches max-w-md */
            margin-left: auto;
            margin-right: auto;
            position: relative;
            overflow: hidden;
            z-index: 0;
            background-color: #1f2937; /* Tailwind bg-gray-800 */
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

            /* before pseudo */
            --before-width: 6rem;
            --before-height: 6rem;
            --after-width: 8rem;
            --after-height: 8rem;
        }

        .profile-container::before {
            content: "";
            width: var(--before-width);
            height: var(--before-height);
            position: absolute;
            background-color: #4b5563; /* bg-gray-600 */
            border-radius: 9999px;
            z-index: -10;
            filter: blur(32px);
        }

        .profile-container::after {
            content: "";
            width: var(--after-width);
            height: var(--after-height);
            position: absolute;
            top: 6rem; /* top-24 */
            right: -3rem; /* -right-12 */
            background-color: #38bdf8; /* sky-400 */
            border-radius: 9999px;
            z-index: -10;
            filter: blur(48px);
        }

        .title {
            font-size: 1.5rem; /* text-2xl */
            font-weight: 700;
            color: white;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: #d1d5db; /* gray-300 */
        }

        .input {
            margin-top: 0.25rem;
            padding: 0.5rem;
            width: 100%;
            background-color: #374151; /* bg-gray-700 */
            border: 1px solid #4b5563; /* border-gray-600 */
            border-radius: 0.375rem;
            color: white;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
        }

        .submit-btn {
            background: linear-gradient(to right, #4b5563, #a78bfa, #3b82f6); /* gray-600 -> purple-400 -> blue-500 */
            color: white;
            padding: 0.5rem 1rem;
            font-weight: bold;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            transition: opacity 0.3s ease;
        }

        .submit-btn:hover {
            opacity: 0.8;
        }
        .poppins-semibold {
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            font-style: normal;
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

            /* padding-right: calc(var(--bs-gutter-x)* .5); */
            /* padding-left: calc(var(--bs-gutter-x)* .5); */
            margin-top: var(--bs-gutter-y);
        }

    </style>
</head>

<body style="overflow-x: hidden;"><!--Viewport Height-->
<input type="hidden" id="error" value="<%=request.getAttribute("error")%>">


<div class="containerr highlightTextIn" style="background-color: #CCCCFF;">


    <button alt="HOME"  onclick="window.location.href='home.jsp';">HOME</button>
    <button alt="MY POSTS"  onclick="window.location.href='MyPosts.jsp';">MY POSTS</button>
    <button alt="REPORT ITEM"  onclick="window.location.href='addItem.jsp';">REPORT ITEM</button>
    <button alt="ABOUT"  onclick="window.location.href='index.jsp';">ABOUT</button>
    <button alt="REGISTER"  onclick="window.location.href='login.jsp';">REGISTER</button>
</div>
<div class="profile-container">
    <h2 class="title">Update Your Profile</h2>

    <form method="post" action="UpdateUser">
        <input type="hidden" name="idUser" value="<%= idUser %>">

        <div class="form-group">
            <label class="label">Full Name</label>
            <input
                    class="input"
                    type="text" name="name" value="<%= user.getName() %>" />
        </div>

        <div class="form-group">
            <label class="label" for="email">Email Address</label>
            <input
                    class="input"
                    name="email"
                    value="<%= user.getEmail() %>"
                    id="email"
                    type="email" />
        </div>

        <div class="form-group">
            <label class="label" for="phone">Phone</label>
            <input
                    class="input"
                    name="phone"
                    id="phone"
                    value="<%= user.getPhone() %>" />
        </div>

        <div class="form-actions">
            <button class="submit-btn" type="submit">Update Profile</button>
        </div>
    </form>
</div>

<!-- footer -->
<div class="my-5" style="width: 100%;;position: relative;
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

<script type="text/javascript">
    let errorMessage = document.getElementById('error');
    var error=errorMessage? errorMessage.value :"";
    if(error!=="null" && error.trim()!==""){
        swal('Error', error, 'warning');
    }
</script>

</body>
</html>
