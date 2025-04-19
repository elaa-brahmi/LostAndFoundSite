
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  if(session.getAttribute("userId")==null && session.getAttribute("role")!="user"){
    response.sendRedirect("login.jsp");
  }
%>


<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
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

  /*button:active {*/
  /*  top: 4px;*/
  /*  box-shadow:#283542 0px 3px 2px,#000 0px 3px 5px;*/
  /*}*/
  .card {
    height: 550px;
    padding: 2rem;
    background: #f5f5f5;
    position: relative;
    overflow: visible;
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  }
  .card-img {
    display: flex;
    justify-content: center;
    align-items: center;

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
    transform: translateY(-17%);
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
    /*justify-content: start;*/
    /*display: flex;*/
    /*margin-top: 180px;*/
    /*margin-left: 130px;*/
    /*padding-left: 5%;*/
    /*max-width: 80%;*/
    /*min-width: 80%;*/
    /*max-height: 1200px;*/
    /*min-height: 1200px;*/
    /*flex-direction: row;*/
    /*flex-wrap: wrap;*/
    /*row-gap: 50px;*/
    /*column-gap: 15px;*/
  }
  .pagination {
    justify-content: center;
    display: flex;

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
    background-color: #6c63ff;
    /*box-shadow: 0 6px 15px rgba(0, 255, 255, 0.5);*/
  }


  .filterButton {
    width:200px;

    padding: 15px 30px;
    color: #fff;
    font-size: 16px;
    text-transform: uppercase;
    border: 1px solid rgba(123, 36, 28 0.3);
    background-color: #3a3a3a;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    cursor: pointer;
    transition:
            background 0.3s ease,
            transform 0.3s ease;
  }

#notFound{
  display:flex;
  align-items: center;
  justify-content: center;
  margin: auto;
}
.hidden{
  display: none !important;
}
.filters{
  justify-content: center;
  width: 80%;
  gap:5px;
  margin-top: 5%;
  display: flex;
  flex-direction: row;
}
.filterButton:hover{
  transform: translateY(-3px);
  background-color: #6c63ff;
}
.filterCategories{

  text-align: center;
  height: 58px;
  border-radius: 10px;

}


  .poppins-extralight {
    font-family: "Poppins", sans-serif;
    font-weight: 200;
    font-style: normal;
  }
  .poppins-light {
    font-family: "Poppins", sans-serif;
    font-weight: 300;
    font-style: normal;
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
</style>

  </head>
  <body class="vh-100" style="overflow-x: hidden;  padding:0;">

  <div class="containerr highlightTextIn" style="background-color: #CCCCFF;">


    <button alt="HOME"  onclick="window.location.href='home.jsp';">HOME</button>
    <button alt="MY POSTS"  onclick="window.location.href='MyPosts.jsp';">MY POSTS</button>
    <button alt="REPORT ITEM"  onclick="window.location.href='addItem.jsp';">REPORT ITEM</button>
    <button alt="ABOUT"  onclick="window.location.href='index.jsp';">ABOUT</button>
    <button alt="REGISTER"  onclick="window.location.href='login.jsp';">REGISTER</button>
  </div>



    <div class="row filters mx-auto">
      <select id="categoryFilter" class="col-12 col-md-5 filterCategories poppins-light-italic">
        <option value="" >All Categories</option>
        <option value="Personal Accessories">Personal Accessories</option>
        <option value="Identification & Documents">Identification & Documents</option>
        <option value="Clothing & Wearables">Clothing & Wearables</option>
        <option value="Keys & Security Items">Keys & Security Items</option>
        <option value="Travel & Transport Items">Travel & Transport Items</option>
        <option value="Household & Miscellaneous Items">Household & Miscellaneous Items</option>
      </select>
      <select id="locationFilter" class=" col-12 col-md-5 filterCategories poppins-light-italic">
        <option value="" >All Locations</option>
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
    
      <button class="filterButton poppins-light-italic col-12 col-md-2 " onclick="applyFilters()">Apply Filters</button>
    </div>


  
  <script>
    let currentPage = 1;
    $(document).ready(function() {
      fetchItems(currentPage);
    });
    function fetchItems(page,category='',location='') {
      $.ajax({
        url: 'http://localhost:8080/allItems', // URL of the servlet
        type: 'GET',
        data: {
          page: page,
          pageSize: 6,
          category: category,
          location: location
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
    function applyFilters() {
    const category = $('#categoryFilter').val();
    const location = $('#locationFilter').val();
    console.log(category, location);
    fetchItems(1, category, location);
  }
    function renderItems(items){
      var notFound=document.getElementById("notFound");
      var cardItems=document.getElementById("cardItems");

      if(items.length ===0){
        notFound.classList.remove('hidden');
        cardItems.classList.add('hidden');
        notFound.innerHTML=`<div class="mx-auto mt-5"><p style="font-size: 28px;" class=" text-center poppins-semibold-italic">No items are found </p>
<img src="assets/img/empty.svg" alt="empty" style="width: 400px;height: 400px; min-width: 300px;min-height:300px;">
</div>
`;

      } else{
        notFound.classList.add('hidden');
        cardItems.classList.remove('hidden');
        cardItems.innerHTML="";
      items.forEach(function(item) {
        console.log(item);
        console.log(item.image);
        var cardItem = document.createElement("div");
        cardItem.classList.add("card");

      cardItem.classList.add("col-12", "col-sm-12", "col-md-6", "col-lg-6", "col-xl-4");

        cardItem.setAttribute("data-aos","zoom-in-up");
        var imageSrc = item.image === "no image is found" ? "assets/img/noPic.png" : item.image;
        cardItem.innerHTML = `
        <div class="card-img">

           <img src="`+imageSrc+`" alt="no image was provided" width="250px" height="250px" style="height:100%; padding:3px; ">
        </div>
        <div class="card-info" >
            <p class="text-title poppins-semibold-italic">`+item.name+` <br>`+item.category+`</p>
            <p class="text-body poppins-medium-italic "><em>location: &nbsp;</em>`+item.location+`<br>
            <em>date found/lost: &nbsp;</em>`+item.datefound+` <br> <em>description: &nbsp;</em> `+item.description+`<br>
            <em>type: &nbsp;</em><strong>`+item.type+`</strong></p>
        </div>

<div style="left: 20%;bottom: 15px;position: absolute;display: flex;justify-content: center;">
            <div class="tooltip-container" style=" margin-bottom:6px;">
              <button class="tooltip-trigger poppins-light-italic" onmouseover="fetchUserInfos(` + item.UserId + `, this)">poster's infos</button>
                 <div class="tooltip">This is a 3D glassmorphic tooltip!</div>
            </div>
          </div>





    `;
        cardItems.appendChild(cardItem); // Make sure 'cardItems' is defined in your HTML
      });}

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

          `;
        })
        .catch(error => {
          console.log(error);
        });
      }
  </script>
  <div id="notFound" class="hidden"></div>

  <div id="cardItems" class="row mt-5 g-3 mx-auto" style="
    width: 70%;">
  </div>
  <div class="row mx-auto" style="margin-top:5%;">
  <div id="pagination" class="pagination"></div>
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
  <script> AOS.init({
  once: true,
  mirror: false
  });</script>
  </body>
</html>
