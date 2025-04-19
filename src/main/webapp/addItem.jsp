
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("userId")==null && session.getAttribute("role")!="user"){
        response.sendRedirect("login.jsp"); 

    }
%>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>add item</title>
    
    <style>

        .custum-file-upload {
            height: 100px;

            display: flex;
            flex-direction: column;

            gap: 20px;
            cursor: pointer;
            align-items: center;
            justify-content: center;
            border: 2px dashed #cacaca;
            background-color: rgba(255, 255, 255, 1);
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0px 48px 35px -48px rgba(0,0,0,0.1);
        }


        .infos input[type="date"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            margin-bottom: 20px;
            background-color: white;
            color: black;
        }


        .custum-file-upload .icon {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .custum-file-upload .icon svg {
            height: 50px;
            fill: rgba(75, 85, 99, 1);
        }

        .custum-file-upload .text {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .custum-file-upload .text span {
            font-weight: 200;
            color: rgba(75, 85, 99, 1);
        }

        .custum-file-upload input {
            display: none;
        }
        .form {
            display: flex;
            flex-direction: column;
            gap: 10px;

           
            background-color: #fff;
            padding: 20px;
            border-radius: 20px;

        }

        .title {
            font-size: 1vw;
           color: #6c63ff;
            letter-spacing: -1px;
            position: relative;
            display: flex;
            align-items: center;
            padding-left: 30px;
        }

        .title::before,.title::after {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            border-radius: 50%;
            left: 0;
            background-color: #6c63ff;
        }

        .title::before {
            width: 18px;
            height: 18px;

        }

        .title::after {
            width: 18px;
            height: 18px;
            animation: pulse 1s linear infinite;
        }
        .signin a {
            color: rgb(123, 36, 28);
        }
        .signin a:hover {
            text-decoration: underline  rgb(123, 36, 28);
        }

        .flex {
            display: flex;
            width: 100%;
            gap: 6px;
        }

        .form label {
            position: relative;
        }

        .form label .input {
            width: 100%;
            padding: 10px 10px 20px 10px;
            outline: 0;
            border: 1px solid rgba(105, 105, 105, 0.397);
            border-radius: 10px;
        }

        .form label .input + span {
            position: absolute;
            left: 10px;
            top: 15px;
            color: grey;
            font-size: 0.9em;
            cursor: text;
            transition: 0.3s ease;
        }

        .form label .input:placeholder-shown + span {
            top: 15px;
            font-size: 0.9em;
        }

        .form label .input:focus + span,.form label .input:valid + span {
            top: 30px;
            font-size: 0.7em;
            font-weight: 600;
        }

        .form label .input:valid + span {
            color: green;
        }

        .submit {
            border: none;
            outline: none;
            background-color: #6c63ff;
            padding: 10px;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            transform: .3s ease;
        }

        .submit:hover {
            background-color:rgb(108 99 255);
        }

        @keyframes pulse {
            from {
                transform: scale(0.9);
                opacity: 1;
            }

            to {
                transform: scale(1.8);
                opacity: 0;
            }
        }
        .filter-switch {
            border: 2px solid #3a3a3a;
            border-radius: 30px;
            position: relative;
            display: flex;
            align-items: center;
            height: 50px;

            overflow: hidden;
        }
        .filter-switch input {
            display: none;
        }
        .filter-switch label {
            flex: 1;
            text-align: center;
            cursor: pointer;
            border: none;
            border-radius: 30px;
            position: relative;
            overflow: hidden;
            z-index: 1;
            transition: all 0.5s;
            font-weight: 500;
            font-size: 18px;
        }
        .filter-switch .background {
            position: absolute;
            width: 49%;
            height: 38px;
            background-color: #6c63ff;
            top: 4px;
            left: 4px;
            border-radius: 30px;
            transition: left 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        #option2:checked ~ .background {
            left: 50%;
        }
        #option1:checked + label[for="option1"] {
            color: #FFFFFF;
            font-weight: bold;
        }
        #option2:checked + label[for="option2"] {
            color: #FFFFFF;
            font-weight: bold;
        }
        #option1:not(:checked) + label[for="option1"],
        #option2:not(:checked) + label[for="option2"] {
            color: #3a3a3a;
        }



        .btn:hover {
         /*   background: #fff3;*/

            background-color:#fff;
            color: black;
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


        .popup {
            margin: 10px;
            box-shadow: 4px 4px 10px -10px rgba(0, 0, 0, 1);
            width: 300px;
            justify-content: space-around;
            align-items: center;
            display: flex;
            border-radius: 4px;
            padding: 5px 0;
            font-weight: 300;
        }
        .popup svg {
            width: 1.25rem;
            height: 1.25rem;
        }
        .popup-icon svg {
            margin: 5px;
            display: flex;
            align-items: center;
        }
        .close-icon {
            margin-left: auto;
        }
        .close-svg {
            cursor: pointer;
        }
        .close-path {
            fill: grey;
        }




        /* INFO */

        .info-popup {
            background-color: #eff6ff;
            border: solid 1px #1d4ed8;
        }
        .info-icon path {
            fill: #1d4ed8;
        }
        .info-message {
            color: #1d4ed8;
        }
        .hidden{
            display: none;
        }



        .row>* {
            flex-shrink: 0;

            /* max-width: 100%; */
            padding-right: 0 !important;
            padding-left: 0 !important;
            margin-top: var(--bs-gutter-y);
        }

    </style>
</head>
<body style="overflow-x: hidden;"><!--Viewport Height-->
<div class="containerr highlightTextIn" style="background-color: #CCCCFF;">


    <button alt="HOME"  onclick="window.location.href='home.jsp';">HOME</button>
    <button alt="MY POSTS"  onclick="window.location.href='MyPosts.jsp';">MY POSTS</button>
    <button alt="REPORT ITEM"  onclick="window.location.href='addItem.jsp';">REPORT ITEM</button>
    <button alt="ABOUT"  onclick="window.location.href='index.jsp';">ABOUT</button>
    <button alt="REGISTER"  onclick="window.location.href='login.jsp';">REGISTER</button>
</div>


<div style="
    width: 100% !important;
    padding: 2%;
   "> <!--Container-->
<div class="row popup-container" style="max-width: 800px;" > <!--row 1-->
    <div class="popup info-popup">
        <div class="popup-icon info-icon">
            <svg
                    aria-hidden="true"
                    viewBox="0 0 20 20"
                    xmlns="http://www.w3.org/2000/svg"
                    class="info-svg"
            >
                <path
                        clip-rule="evenodd"
                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                        fill-rule="evenodd"
                ></path>
            </svg>
        </div>
        <div class="info-message">Please choose the appropriate category, location and picture to ensure efficient matching </div>
        <div class="popup-icon close-icon" onclick="closePopup()">
            <svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20"
                    class="close-svg"
            >
                <path
                        d="m15.8333 5.34166-1.175-1.175-4.6583 4.65834-4.65833-4.65834-1.175 1.175 4.65833 4.65834-4.65833 4.6583 1.175 1.175 4.65833-4.6583 4.6583 4.6583 1.175-1.175-4.6583-4.6583z"
                        class="close-path"
                ></path>
            </svg>
        </div>
    </div>
</div>


<div class="row"> <!--row 2-->


<form class="container form mx-auto col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" action="addItem" method="post" enctype="multipart/form-data" style="    width: fit-content;min-width: 350px;">
    <p class="title text-center poppins-semibold-italic" style="font-size: 25px;">add item </p>
    <div class="row">
        <label style="margin-bottom: 12px;" class="col-12 col-md-6 g-1">
            <input style="width: 97%;" class="input" required="" placeholder="" type="text" name="name"  >
            <span>name</span>
        </label>

        <label class="col-12 col-md-6 ">
            <textarea class=" input"  required="" placeholder="" type="text" name="description" ></textarea>
            <span>description</span>
        </label>
    </div>

    <label class="row">
        <select style="border-radius:1px solid gray;" class="input poppins-light-italic" id="category" name="category" required >
            <option value="Electronics">Electronics</option>
            <option value="Personal Accessories">Personal Accessories</option>
            <option value="Identification & Documents">Identification & Documents</option>
            <option value="Clothing & Wearables">Clothing & Wearables</option>
            <option value="Keys & Security Items">Keys & Security Items</option>
            <option value="Travel & Transport Items">Travel & Transport Items</option>
            <option value="Household & Miscellaneous Items">Household & Miscellaneous Items</option></select>
    </label>

    <label class="row">
        <select style="border-radius:1px solid gray;" class="input poppins-light-italic" id="location" name="location" required >

                <option value="Tunis">Tunis</option>
                <option value="Sidi Bouzid">Sidi Bouzid</option>
                <option value="Sfax">Sfax</option>
                <option value="Sousse">Sousse</option>
                <option value="Kairouan">Kairouan</option>
                <option value="Métouia">Métouia</option>
                <option value="Kebili">Kebili</option>
                <option value="Sukrah">Sukrah</option>
                <option value="Gabès">Gabès</option>
                <option value="Ariana">Ariana</option>
                <option value="Sakiet ed Daier">Sakiet ed Daier</option>
                <option value="Gafsa">Gafsa</option>
                <option value="Msaken">Msaken</option>
                <option value="Medenine">Medenine</option>
                <option value="Béja">Béja</option>
                <option value="Kasserine">Kasserine</option>
                <option value="Radès">Radès</option>
                <option value="Hammamet">Hammamet</option>
                <option value="Tataouine">Tataouine</option>
                <option value="Monastir">Monastir</option>
                <option value="tozeur">tozeur</option>
                <option value="Siliana">Siliana</option>


        </select>
    </label>


        <label  class="row custum-file-upload" for="file">
            <div>
                <div class="icon">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="" viewBox="0 0 24 24"><g stroke-width="0" id="SVGRepo_bgCarrier"></g><g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier"></g><g id="SVGRepo_iconCarrier"> <path fill="" d="M10 1C9.73478 1 9.48043 1.10536 9.29289 1.29289L3.29289 7.29289C3.10536 7.48043 3 7.73478 3 8V20C3 21.6569 4.34315 23 6 23H7C7.55228 23 8 22.5523 8 22C8 21.4477 7.55228 21 7 21H6C5.44772 21 5 20.5523 5 20V9H10C10.5523 9 11 8.55228 11 8V3H18C18.5523 3 19 3.44772 19 4V9C19 9.55228 19.4477 10 20 10C20.5523 10 21 9.55228 21 9V4C21 2.34315 19.6569 1 18 1H10ZM9 7H6.41421L9 4.41421V7ZM14 15.5C14 14.1193 15.1193 13 16.5 13C17.8807 13 19 14.1193 19 15.5V16V17H20C21.1046 17 22 17.8954 22 19C22 20.1046 21.1046 21 20 21H13C11.8954 21 11 20.1046 11 19C11 17.8954 11.8954 17 13 17H14V16V15.5ZM16.5 11C14.142 11 12.2076 12.8136 12.0156 15.122C10.2825 15.5606 9 17.1305 9 19C9 21.2091 10.7909 23 13 23H20C22.2091 23 24 21.2091 24 19C24 17.1305 22.7175 15.5606 20.9844 15.122C20.7924 12.8136 18.858 11 16.5 11Z" clip-rule="evenodd" fill-rule="evenodd"></path> </g></svg>
                </div>
                <div class="text">
                    <span>Click to upload image</span>
                </div>
            </div>

            <input type="file" id="file" name="image">
        </label>

        <input style="border: 1px solid #c8c5c5;
    border-radius: 8px;
    text-align: center;
    height: 60px;" class="row infos input" name="date" id="data" type="date" required="">



        <div id="firstFilter" class="row filter-switch" >
            <div style="display: flex;">
            <input checked="" id="option1" name="type" type="radio" value="lost" required="" />
            <label class="option poppins-medium-italic" for="option1">lost</label>
            <input id="option2" name="type" type="radio" value="found" />
            <label class="option poppins-medium-italic" for="option2">found</label>
            <span class="background"></span></div>
        </div>

<div class="row justify-content-center" >
    <button class="submit poppins-semibold-italic">Submit</button></div>

</form>
    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6" style="justify-content: center;display: flex;">
        <img src="assets/img/search.svg" alt="search" >

    </div>
</div>
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


<script>
    function closePopup(){
        document.querySelector(".popup-container").classList.add("hidden");
    }
</script>
</body>
</html>
