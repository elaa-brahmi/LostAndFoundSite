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
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>edit profile</title>
    <style>
        .swal-footer{
            text-align: center!important;
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
    </style>
</head>


<body class="vh-100" style="overflow-x: hidden;  padding:0;">
<input type="hidden" id="error" value="<%=request.getAttribute("error")%>">

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


<div
        style="margin-top:4%;"
        class="max-w-md mx-auto relative overflow-hidden z-10 bg-gray-800 p-8 rounded-lg shadow-md before:w-24 before:h-24 before:absolute before:bg-gray-600 before:rounded-full before:-z-10 before:blur-2xl after:w-32 after:h-32 after:absolute after:bg-sky-400 after:rounded-full after:-z-10 after:blur-xl after:top-24 after:-right-12"
>
    <h2 class="text-2xl font-bold text-white mb-6">Update Your Profile</h2>

    <form method="post" action="UpdateUser">
        <input type="hidden" name="idUser" value="<%= idUser %>">
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-300" >Full Name</label>
            <input
                    class="mt-1 p-2 w-full bg-gray-700 border border-gray-600 rounded-md text-white"
                    type="text" name="name" value="<%= user.getName() %>"/>
        </div>
        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-300" for="email">Email Address</label>
            <input
                    class="mt-1 p-2 w-full bg-gray-700 border border-gray-600 rounded-md text-white"
                    name="email"
                    value="<%= user.getEmail() %>"
                    id="email"
                    type="email"
            />
        </div>

        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-300" for="phone">phone</label>
            <input
                    class="mt-1 p-2 w-full bg-gray-700 border border-gray-600 rounded-md text-white"
                   value="<%= user.getPhone() %>"
                    name="phone"
                    id="phone"
            ></input>
        </div>

        <div class="flex justify-end">
            <button
                    class="bg-gradient-to-r from-gray-600 via-purple-400 to-blue-500 text-white px-4 py-2 font-bold rounded-md hover:opacity-80"
                    type="submit"
            >
                Update Profile
            </button>
        </div>
    </form>
</div>
<script type="text/javascript">
    let errorMessage = document.getElementById('error');
    var error=errorMessage? errorMessage.value :"";
    if(error!=="null" && error.trim()!==""){
        swal('Error', error, 'warning');
    }
</script><script src="/webcoscketNotif.js"></script>

</body>
</html>
