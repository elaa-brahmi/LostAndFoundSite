
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  if(session.getAttribute("userId")==null && session.getAttribute("role")!="user"){
    response.sendRedirect("login.jsp");
  }
%>


<html>
  <head>
    <title>Title</title>
    <!-- BOX ICONS CSS-->
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- AOS JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        AOS.init();
      });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

  .form {
    --input-text-color: #fff;
    --input-bg-color: #283542;
    --focus-input-bg-color: transparent;
    --text-color: #949faa;
    --active-color: #1b9bee;
    --width-of-input: 200px;
    --inline-padding-of-input: 1.2em;
    --gap: 0.9rem;
  }

  .form {
    font-size: 0.9rem;
    display: flex;
    gap: 0.5rem;
    justify-content: center;
    position: relative;
    isolation: isolate;
  }

  .fancy-bg {
    position: absolute;
    width: 100%;
    inset: 0;
    background: var(--input-bg-color);
    border-radius: 30px;
    height: 100%;
    z-index: -1;
    pointer-events: none;
    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
  }

  label {
    width: 100%;
    padding: 0.8em;
    height: 40px;
    padding-inline: var(--inline-padding-of-input);
    display: flex;
    align-items: center;
  }

  .search,.close-btn {
    position: absolute;
  }

  .search {
    fill: var(--text-color);
    left: var(--inline-padding-of-input);
  }

  .search svg {
    width: 17px;
    display: block;
  }

  .close-btn {
    border: none;
    right: var(--inline-padding-of-input);
    box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    padding: 0.1em;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: var(--active-color);
    opacity: 0;
    visibility: hidden;
  }

  .input {
    color: black;
    width: 100%;
    margin-inline: min(2em,calc(var(--inline-padding-of-input) + var(--gap)));
    background: none;
    border: none;
  }

  .input:focus {
    outline: none;
  }

  .input::placeholder {
    color: var(--text-color)
  }

  .input:focus ~ .fancy-bg {
    border: 1px solid var(--active-color);
    background: var(--focus-input-bg-color);
  }

  .input:focus ~ .search {
    fill: var(--active-color);
  }

  .input:valid ~ .close-btn {
    opacity: 1;
    visibility: visible;
  }
  input:-webkit-autofill,
  input:-webkit-autofill:hover,
  input:-webkit-autofill:focus,
  input:-webkit-autofill:active {
    -webkit-transition: "color 9999s ease-out, background-color 9999s ease-out";
    -webkit-transition-delay: 9999s;
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

  .btn-search {
    --bg: grey;
    --text-color: #fff;
    position: relative;
    width: 150px;
    border: none;
    background: var(--bg);
    color: var(--text-color);
    padding: 1em;
    font-weight: bold;
    text-transform: uppercase;
    transition: 0.2s;
    border-radius: 5px;
    opacity: 0.8;
    letter-spacing: 1px;
    box-shadow: #949faa 0px 7px 2px,#949faa 0px 8px 5px;
  }

  button:hover {
    opacity: 1;
  }

  button:active {
    top: 4px;
    box-shadow:#283542 0px 3px 2px,#000 0px 3px 5px;
  }
  .card {
    width:26%;
    height:550px;
    padding: .8em;
    background: #f5f5f5;
    position: relative;
    overflow: visible;
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  }
  .card-img {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #e5e7e9;
    height: 40%;
    width: 100%;
    border-radius: .5rem;
    transition: .3s ease;
  }
  .card-info {
    padding-top: 10%;
  }
  .card-footer {
    width: 100%;
    display: flex;
    justify-content: center;

    padding-top: 10px;
    border-top: 1px solid #ddd;
  }

  .text-title {
    font-weight: 900;
    font-size: 1.2em;
    line-height: 1.5;
  }

  .text-body {
    font-size: .9em;
    padding-bottom: 10px;
  }

 .card-button {
    border: 1px solid #252525;
    display: flex;
    padding: .3em;
    cursor: pointer;
    border-radius: 50px;
    transition: .3s ease-in-out;
  }

 .card-img:hover {
    transform: translateY(-25%);
    box-shadow: rgba(226, 196, 63, 0.25) 0px 13px 47px -5px, rgba(180, 71, 71, 0.3) 0px 8px 16px -8px;
  }

  .card-button:hover {
    border: 1px solid #ffcaa6;
    background-color: #ffcaa6;
  }
  .card-btn {
    width:70px;
    height:50px;
    border: none;
    font-size: 1rem;
    background-color: green;
    color: white;
    cursor: pointer;
    transition: all 0.3s ease;
    border-radius: 2em;
    padding: 0.6em 1em;
  }

  .card-btn:hover {
    background-color: #026602;
  }
  #cardItems{
    justify-content: start;
    display: flex;
    margin-top: 180px;
    margin-left: 130px;
    padding-left: 5%;
    max-width: 80%;
    min-width: 80%;
    max-height: 1200px;
    min-height: 1200px;
    flex-direction: row;
    flex-wrap: wrap;
    row-gap: 50px;
    column-gap: 15px;
  }
  .pagination {
    justify-content: center;
    display: flex
  ;
    width: 80%;
  }
  .pagination button {
    margin: 0 5px;
    padding: 5px 10px;
    cursor: pointer;
  }
  /* From Uiverse.io by kamehame-ha */
  .light-button button.bt {
    position: relative;
    height: 55px;
    display: flex;
    align-items: flex-end;
    outline: none;
    background: none;
    border: none;
    cursor: pointer;
  }

  .light-button button.bt .button-holder {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 40px;
    width: 100px;
    background-color: #0a0a0a;
    border-radius: 5px;
    color: #0f0f0f;
    font-weight: 700;
    transition: 300ms;
    outline: #0f0f0f 2px solid;
    outline-offset: 20;
  }



  .light-button button.bt .light-holder {
    position: absolute;
    height: 60px;
    width: 100px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .light-button button.bt .light-holder .dot {
    position: absolute;
    top: 0;
    width: 10px;
    height: 10px;
    background-color: #0a0a0a;
    border-radius: 10px;
    z-index: 2;
  }

  .light-button button.bt .light-holder .light {
    position: absolute;
    top: 0;
    width: 200px;
    height: 10px;
    clip-path: polygon(50% 0%, 25% 100%, 75% 100%);
    background: transparent;
  }

  .light-button button.bt:hover .button-holder svg {
    fill: rgba(88, 101, 242, 1);
  }

  .light-button button.bt:hover .button-holder {
    color: rgba(88, 101, 242, 1);
    outline: rgba(88, 101, 242, 1) 2px solid;
    outline-offset: 2px;
  }

  .light-button button.bt:hover .light-holder .light {
    background: rgb(255, 255, 255);
    background: linear-gradient(
            180deg,
            rgba(88, 101, 242, 1) 0%,
            rgba(255, 255, 255, 0) 75%,
            rgba(255, 255, 255, 0) 100%
    );
  }




  .cardUser {
    width: 190px;
    height: 254px;
    background: #f5f5f5;
    padding: 2rem 1.5rem;
    transition: box-shadow .3s ease, transform .2s ease;
  }

  .card-infoo {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    transition: transform .2s ease, opacity .2s ease;
  }

  /*Image*/
  .card-avatar {
    --size: 60px;
    background: linear-gradient(to top, #f1e1c1 0%, #fcbc97 100%);
    width: var(--size);
    height: var(--size);
    border-radius: 50%;
    transition: transform .2s ease;
    margin-bottom: 1rem;
  }


  /*Card footer*/
  .card-social {
    transform: translateY(200%);
    display: flex;
    justify-content: space-around;
    width: 100%;
    opacity: 0;
    transition: transform .2s ease, opacity .2s ease;
  }

  .card-social__item {
    list-style: none;
  }

  .card-social__item svg {
    display: block;
    height: 18px;
    width: 18px;
    fill: #515F65;
    cursor: pointer;
    transition: fill 0.2s ease ,transform 0.2s ease;
  }

  /*Text*/
  .card-title {
    color: #333;
    font-size: 1.5em;
    font-weight: 600;
    line-height: 2rem;
  }

  .card-subtitle {
    color: #859ba8;
    font-size: 0.8em;
  }

  /*Hover*/
  .cardUser:hover {
    box-shadow: 0 8px 50px #23232333;
  }

  .cardUser:hover .card-infoo {
    transform: translateY(-5%);
  }

  .cardUser:hover .card-social {
    transform: translateY(100%);
    opacity: 1;
  }

  .card-social__item svg:hover {
    fill: #232323;
    transform: scale(1.1);
  }

  .card-avatar:hover {
    transform: scale(1.1);
  }
  .visisble{
    display:block;
  }


  .tooltip-container {
    position: relative;
    display: inline-block;
    background: rgb(41, 38, 38);
  }

  .tooltip {
    position: absolute;
    bottom: 120%;
    left: 50%;
    transform: translateX(-50%);
    background: #3a3a3a;
    color: #fff;
    padding: 15px 20px;
    border-radius: 15px;
    border: 1px solid rgba(50, 48, 48, 0.3);
    backdrop-filter: blur(12px);
    font-size: 14px;
    text-align: center;
    box-shadow:
            0 8px 20px rgba(0, 0, 0, 0.4),
            inset 0 0 10px rgba(255, 255, 255, 0.3);
    white-space: nowrap;
    visibility: hidden;
    opacity: 0;
    transition:
            opacity 0.4s ease,
            transform 0.4s ease;
  }

  .tooltip::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    transform: translateX(-50%);
    border-width: 8px;
    border-style: solid;
    border-color: rgba(54, 52, 52, 0.3) transparent transparent transparent;
    filter: drop-shadow(0px 2px 4px rgba(0, 0, 0, 0.3));
  }

  .tooltip-container:hover .tooltip {
    visibility: visible;
    opacity: 1;
    transform: translateX(-50%) translateY(-15px);
  }

  .tooltip-container:hover .tooltip::after {
    border-color: rgba(123, 36, 28 0.6) transparent transparent transparent;
  }

  .tooltip-trigger {
    padding: 15px 30px;
    color: #fff;
    font-size: 16px;
    text-transform: uppercase;

    border: 1px solid rgba(123, 36, 28 0.3);
    background: rgba(255, 255, 255, 0.1);
    /*background: rgba(255, 255, 255, 0.1);*/
    /*border: 1px solid rgba(255, 255, 255, 0.3);*/
    border-radius: 10px;
    backdrop-filter: blur(10px);
    cursor: pointer;
    transition:
            background 0.3s ease,
            transform 0.3s ease;
  }

  .tooltip-trigger:hover {
    /*background: linear-gradient(45deg, #4facfe, #00f2fe);*/
    transform: translateY(-3px);
    background-color: rgb(123, 36, 28)
    /*box-shadow: 0 6px 15px rgba(0, 255, 255, 0.5);*/
  }
/* filter css*/

  .select {
    width: fit-content;
    cursor: pointer;
    position: relative;
    transition: 300ms;
    color: white;
    overflow: hidden;
  }

  .selected {
    background-color: #2a2f3b;
    padding: 5px;
    margin-bottom: 3px;
    border-radius: 5px;
    position: relative;
    z-index: 100000;
    font-size: 15px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .arrow {
    position: relative;
    right: 0px;
    height: 10px;
    transform: rotate(-90deg);
    width: 25px;
    fill: white;
    z-index: 100000;
    transition: 300ms;
  }

  .options {
    display: flex;
    flex-direction: column;
    border-radius: 5px;
    padding: 5px;
    background-color: #2a2f3b;
    position: relative;
    top: -100px;
    opacity: 0;
    transition: 300ms;
  }

  .select:hover > .options {
    opacity: 1;
    top: 0;
  }

  .select:hover > .selected .arrow {
    transform: rotate(0deg);
  }

  .option {
    border-radius: 5px;
    padding: 5px;
    transition: 300ms;
    background-color: #2a2f3b;
    width: 150px;
    font-size: 15px;
  }
  .option:hover {
    background-color: #323741;
  }

  .options input[type="radio"] {
    display: none;
  }

  .options label {
    display: inline-block;
  }
  .options label::before {
    content: attr(data-txt);
  }

  .options input[type="radio"]:checked + label {
    display: none;
  }

  .options input[type="radio"]#all:checked + label {
    display: none;
  }

  .select:has(.options input[type="radio"]#all:checked) .selected::before {
    content: attr(data-default);
  }
  .select:has(.options input[type="radio"]#option-1:checked) .selected::before {
    content: attr(data-1);
}
.select:has(.options input[type="radio"]#option-2:checked) .selected::before {
    content: attr(data-2);
}
.select:has(.options input[type="radio"]#option-3:checked) .selected::before {
    content: attr(data-3);
}
.select:has(.options input[type="radio"]#option-4:checked) .selected::before {
    content: attr(data-4);
}
.select:has(.options input[type="radio"]#option-5:checked) .selected::before {
    content: attr(data-5);
}
.select:has(.options input[type="radio"]#option-6:checked) .selected::before {
    content: attr(data-6);
}
.select:has(.options input[type="radio"]#option-7:checked) .selected::before {
    content: attr(data-7);
}
.select:has(.options input[type="radio"]#option-8:checked) .selected::before {
    content: attr(data-8);
}
.select:has(.options input[type="radio"]#option-9:checked) .selected::before {
    content: attr(data-9);
}
.select:has(.options input[type="radio"]#option-10:checked) .selected::before {
    content: attr(data-10);
}
.select:has(.options input[type="radio"]#option-11:checked) .selected::before {
    content: attr(data-11);
}
.select:has(.options input[type="radio"]#option-12:checked) .selected::before {
    content: attr(data-12);
}
.select:has(.options input[type="radio"]#option-13:checked) .selected::before {
    content: attr(data-13);
}
.select:has(.options input[type="radio"]#option-14:checked) .selected::before {
    content: attr(data-14);
}
.select:has(.options input[type="radio"]#option-15:checked) .selected::before {
    content: attr(data-15);
}
.select:has(.options input[type="radio"]#option-16:checked) .selected::before {
    content: attr(data-16);
}
.select:has(.options input[type="radio"]#option-17:checked) .selected::before {
    content: attr(data-17);
}
.select:has(.options input[type="radio"]#option-18:checked) .selected::before {
    content: attr(data-18);
}
.select:has(.options input[type="radio"]#option-19:checked) .selected::before {
    content: attr(data-19);
}
.select:has(.options input[type="radio"]#option-20:checked) .selected::before {
    content: attr(data-20);
}
.select:has(.options input[type="radio"]#option-21:checked) .selected::before {
    content: attr(data-21);
}
.select:has(.options input[type="radio"]#option-22:checked) .selected::before {
    content: attr(data-22);
}



  .panel {
    background: #e9e9e9;
    border: 1px solid #d0d0d0;
    width: 20vw;
    height: 90vh;
    position: relative;
  }

  .title {
    font-family: sans-serif;
    padding: 8px 0 7px 12px;
    color: #808080;
    font-weight: bold;
    overflow: hidden;
    white-space: nowrap;
    background: #d0d0d0;
  }

  .left,
  .right {
    position: absolute;
    top: 0;
    right: 0;
    font-size: 20px;
    font-weight: bold;
    letter-spacing: -6px;
    display: inline-block;
    cursor: pointer;
    background: #d0d0d0;
    color: #808080;
  }

  .left {
    padding: 5px 19px 5px 15px;
  }

  .right {
    padding: 5px 18px 5px 16px;
    display: none;
  }

  .left:after {
    content: '\2329\2329\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\2329\2329';
  }

  .right:after {
    content: '\232A\232A\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\00A0\232A\232A';
  }

  .left:hover,
  .right:hover {
    color: #ffffff;
    background: #808080;
  }
  .bodyContainer{
    margin-left:350px;
  }

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




  <div class="panel">
    <div class="title">Expand / Collapse Panel</div>
    <div class="left"></div>
    <div class="right"></div>
  </div>

  
  <script>
    let currentPage = 1;
    $(document).ready(function() {
      fetchItems(currentPage);
    });
    function fetchItems(page) {
      $.ajax({
        url: 'http://localhost:8080/allItems', // URL of the servlet
        type: 'GET',
        data: {
          page: page,
          pageSize: 6
        },
        dataType: 'json',
       success: function(data) {
        console.log(data);
        renderItems(data.itemsServlets);
        renderPagination(data.currentPage,data.totalPages);
      },
      error: function(xhr,status,error) {
        console.log(error);
      }
    });}
    function renderItems(items){
      var cardItems=document.getElementById("cardItems");
      cardItems.innerHTML="";
      items.forEach(function(item) {
        console.log(item);
        console.log(item.image);


        var cardItem = document.createElement("div");
        cardItem.classList.add("card");
        cardItem.setAttribute("data-aos","zoom-in-down");
        cardItem.innerHTML = `
        <div class="card-img">

           <img src="`+item.image+`" alt="no image was provided" style="height:100%; padding:3px; ">
        </div>
        <div class="card-info" >
            <p class="text-title">`+item.name+` <br>`+item.category+`</p>
            <p class="text-body"><em>location: &nbsp;</em>`+item.location+`</p>
            <p><em>date found/lost: &nbsp;</em>`+item.datefound+` <br> <em>description: &nbsp;</em> `+item.description+`</p>
            <p><em>type: &nbsp;</em><strong>`+item.type+`</strong></p>
        </div>

<div style="display: flex; justify-content: center; margin: auto;">
            <div class="tooltip-container">
              <button class="tooltip-trigger" onmouseover="fetchUserInfos(` + item.UserId + `, this)">poster's infos</button>
              <div class="tooltip">This is a 3D glassmorphic tooltip!</div>
            </div>
          </div>





    `;
        cardItems.appendChild(cardItem); // Make sure 'cardItems' is defined in your HTML
      });

    }
    function renderPagination(currentPage,totalPages){
      var pagination = document.getElementById("pagination");
      pagination.innerHTML = ""; // Clear previous pagination controls
      if (currentPage > 1) {
        pagination.innerHTML += '<button onclick="fetchItems(' + (currentPage - 1) + ')">Previous</button>';
      }

      for (let i = 1; i <= totalPages; i++) {
        pagination.innerHTML += '<button ' + (i === currentPage ? 'disabled' : '') + ' onclick="fetchItems(' + i + ')">' + i + '</button>';
      }

      if (currentPage < totalPages) {
        pagination.innerHTML += '<button onclick="fetchItems(' + (currentPage + 1) + ')">Next</button>';
      }
    }


    function fetchUserInfos(idUser, element){
        console.log("user id:"+idUser);
        fetch('UserInfos?userId=' + encodeURIComponent(idUser), {
          method: 'GET'
        })
        .then(response => response.json())
        .then(data => {
          console.log(data);
          // Update the tooltip content
          const tooltip = element.nextElementSibling;
          tooltip.innerHTML = `
            <p><strong>Name:</strong> `+data.name+`</p>
            <p><strong>Email:</strong> `+data.email+`</p>
            <p><strong>Phone:</strong> `+data.phone+`</p>
          `;
        })
        .catch(error => {
          console.log(error);
        });
      }
    $(".left").click(function () {
      $(".panel").css("width","68px");
      $(".left").hide();
      $(".right").show();
      bodyContainer.classList.toggle("bodyContainer");

    });

    $(".right").click(function () {
      $(".panel").css("width","20vw");
      var bodyContainer=document.getElementById("cardItems");
      bodyContainer.classList.toggle("bodyContainer");
      $(".right").hide();
      $(".left").show();
    });

  </script>

  <div id="cardItems" class="mt-5 " style="margin-top: 10%;margin-left: 10%; " >
  </div>
  <div class="d-flex justify-content-center" style="width:80%;margin-left: 20%; margin-top:5%;">
  <div id="pagination" class="pagination"></div>
  </div>

  </body>
</html>
