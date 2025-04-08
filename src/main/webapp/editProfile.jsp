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

        .profile-container {
            margin-top: 4%;
            max-width: 28rem; /* matches max-w-md */
            margin-left: auto;
            margin-right: auto;
            position: relative;
            overflow: hidden;
            z-index: 10;
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


<%--<div--%>
<%--        style="margin-top:4%;"--%>
<%--        class="max-w-md mx-auto relative overflow-hidden z-10 bg-gray-800 p-8 rounded-lg shadow-md before:w-24 before:h-24 before:absolute before:bg-gray-600 before:rounded-full before:-z-10 before:blur-2xl after:w-32 after:h-32 after:absolute after:bg-sky-400 after:rounded-full after:-z-10 after:blur-xl after:top-24 after:-right-12"--%>
<%-->--%>
<%--    <h2 class="text-2xl font-bold text-white mb-6">Update Your Profile</h2>--%>

<%--    <form method="post" action="UpdateUser">--%>
<%--        <input type="hidden" name="idUser" value="<%= idUser %>">--%>
<%--        <div class="mb-4">--%>
<%--            <label class="block text-sm font-medium text-gray-300" >Full Name</label>--%>
<%--            <input--%>
<%--                    class="mt-1 p-2 w-full bg-gray-700 border border-gray-600 rounded-md text-white"--%>
<%--                    type="text" name="name" value="<%= user.getName() %>"/>--%>
<%--        </div>--%>
<%--        <div class="mb-4">--%>
<%--            <label class="block text-sm font-medium text-gray-300" for="email">Email Address</label>--%>
<%--            <input--%>
<%--                    class="mt-1 p-2 w-full bg-gray-700 border border-gray-600 rounded-md text-white"--%>
<%--                    name="email"--%>
<%--                    value="<%= user.getEmail() %>"--%>
<%--                    id="email"--%>
<%--                    type="email"--%>
<%--            />--%>
<%--        </div>--%>

<%--        <div class="mb-4">--%>
<%--            <label class="block text-sm font-medium text-gray-300" for="phone">phone</label>--%>
<%--            <input--%>
<%--                    class="mt-1 p-2 w-full bg-gray-700 border border-gray-600 rounded-md text-white"--%>
<%--                   value="<%= user.getPhone() %>"--%>
<%--                    name="phone"--%>
<%--                    id="phone"--%>
<%--            ></input>--%>
<%--        </div>--%>

<%--        <div class="flex justify-end">--%>
<%--            <button--%>
<%--                    class="bg-gradient-to-r from-gray-600 via-purple-400 to-blue-500 text-white px-4 py-2 font-bold rounded-md hover:opacity-80"--%>
<%--                    type="submit"--%>
<%--            >--%>
<%--                Update Profile--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<script type="text/javascript">
    let errorMessage = document.getElementById('error');
    var error=errorMessage? errorMessage.value :"";
    if(error!=="null" && error.trim()!==""){
        swal('Error', error, 'warning');
    }
</script>

</body>
</html>
