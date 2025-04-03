<!--
=========================================================
* Soft UI Dashboard 3 - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/soft-ui-dashboard
* Copyright 2024 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
    Lost & Found Admin Dashboard
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,800" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/soft-ui-dashboard.css?v=1.1.0" rel="stylesheet" />
  <!-- Nepcha Analytics (nepcha.com) -->
  <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
  <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
  <!--jquery for dynamic fetchin-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="#" target="_blank">
        <img src="assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold">Lost&Found Dashboard</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link  active" href="#">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 45 40" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>shop </title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1716.000000, -439.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g transform="translate(0.000000, 148.000000)">
                        <path class="color-background opacity-6" d="M46.7199583,10.7414583 L40.8449583,0.949791667 C40.4909749,0.360605034 39.8540131,0 39.1666667,0 L7.83333333,0 C7.1459869,0 6.50902508,0.360605034 6.15504167,0.949791667 L0.280041667,10.7414583 C0.0969176761,11.0460037 -1.23209662e-05,11.3946378 -1.23209662e-05,11.75 C-0.00758042603,16.0663731 3.48367543,19.5725301 7.80004167,19.5833333 L7.81570833,19.5833333 C9.75003686,19.5882688 11.6168794,18.8726691 13.0522917,17.5760417 C16.0171492,20.2556967 20.5292675,20.2556967 23.494125,17.5760417 C26.4604562,20.2616016 30.9794188,20.2616016 33.94575,17.5760417 C36.2421905,19.6477597 39.5441143,20.1708521 42.3684437,18.9103691 C45.1927731,17.649886 47.0084685,14.8428276 47.0000295,11.75 C47.0000295,11.3946378 46.9030823,11.0460037 46.7199583,10.7414583 Z"></path>
                        <path class="color-background" d="M39.198,22.4912623 C37.3776246,22.4928106 35.5817531,22.0149171 33.951625,21.0951667 L33.92225,21.1107282 C31.1430221,22.6838032 27.9255001,22.9318916 24.9844167,21.7998837 C24.4750389,21.605469 23.9777983,21.3722567 23.4960833,21.1018359 L23.4745417,21.1129513 C20.6961809,22.6871153 17.4786145,22.9344611 14.5386667,21.7998837 C14.029926,21.6054643 13.533337,21.3722507 13.0522917,21.1018359 C11.4250962,22.0190609 9.63246555,22.4947009 7.81570833,22.4912623 C7.16510551,22.4842162 6.51607673,22.4173045 5.875,22.2911849 L5.875,44.7220845 C5.875,45.9498589 6.7517757,46.9451667 7.83333333,46.9451667 L19.5833333,46.9451667 L19.5833333,33.6066734 L27.4166667,33.6066734 L27.4166667,46.9451667 L39.1666667,46.9451667 C40.2482243,46.9451667 41.125,45.9498589 41.125,44.7220845 L41.125,22.2822926 C40.4887822,22.4116582 39.8442868,22.4815492 39.198,22.4912623 Z"></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Dashboard</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  " href="pages/tables.jsp">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <path class="color-background opacity-6" d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z"></path>
                        <path class="color-background" d="M40.25,14 L24.5,14 C23.53225,14 22.75,14.78225 22.75,15.75 L22.75,38.5 L19.25,38.5 L19.25,22.75 C19.25,21.78225 18.46775,21 17.5,21 L1.75,21 C0.78225,21 0,21.78225 0,22.75 L0,40.25 C0,41.21775 0.78225,42 1.75,42 L40.25,42 C41.21775,42 42,41.21775 42,40.25 L42,15.75 C42,14.78225 41.21775,14 40.25,14 Z M12.25,36.75 L7,36.75 L7,33.25 L12.25,33.25 L12.25,36.75 Z M12.25,29.75 L7,29.75 L7,26.25 L12.25,26.25 L12.25,29.75 Z M35,36.75 L29.75,36.75 L29.75,33.25 L35,33.25 L35,36.75 Z M35,29.75 L29.75,29.75 L29.75,26.25 L35,26.25 L35,29.75 Z M35,22.75 L29.75,22.75 L29.75,19.25 L35,19.25 L35,22.75 Z"></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Tables</span>
          </a>
        </li>


        <li class="nav-item">
          <a class="nav-link" onclick="signout()">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="16px" height="16px" viewBox="0 0 42 42" xmlns="http://www.w3.org/2000/svg" fill="currentColor">
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <path d="M16 28L26 18L16 8" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"></path>
                        <path d="M26 18H8" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"></path>
                        <path d="M12 36H6C4.34315 36 3 34.6569 3 33V9C3 7.34315 4.34315 6 6 6H12" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"></path>

                      </g></g></g></g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Sign Out</span>
          </a>
        </li>



      </ul>
    </div>

  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
<%--            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>--%>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Dashboard</li>
          </ol>
          <h6 class="font-weight-bolder mb-0">Dashboard</h6>
        </nav>


      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-lg-6 col-12">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card">
                <span class="mask bg-primary opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                        <i class="ni ni-circle-08 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3" id="nbUsers">

                      </h5>
                      <span class="text-white text-sm">Users</span>
                    </div>
                    <div class="col-4">
                      <div class="dropdown text-end mb-6">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers1" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers1">
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0"></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
              <div class="card">
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                        <i class="ni ni-active-40 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3" id="nbPendingItems">

                      </h5>
                      <span class="text-white text-sm">not matched</span>
                    </div>
                    <div class="col-4">
                      <div class="dropstart text-end mb-6">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers2" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers2">
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0"></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row mt-4">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card">
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                        <i class="ni ni-cart text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3" id="nbResolvedItems">

                      </h5>
                      <span class="text-white text-sm">Resolved Items</span>
                    </div>
                    <div class="col-4">
                      <div class="dropdown text-end mb-6">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers3" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers3">
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0"></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
              <div class="card">
                <span class="mask bg-dark opacity-10 border-radius-lg"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-2xl">
                        <i class="ni ni-like-2 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3" id="nbMatchedItems">

                      </h5>
                      <span class="text-white text-sm">Matched Items</span>
                    </div>
                    <div class="col-4">
                      <div class="dropstart text-end mb-6">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers4" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers4">
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0"></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-12 mt-4 mt-lg-0">
          <div class="card shadow h-100">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-0">matches status</h6>
            </div>
            <div class="card-body pb-0 p-3">
              <ul class="list-group">
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-0">
                  <div class="w-100">
                    <div class="d-flex mb-2">
                      <span class="me-2 text-sm font-weight-bold text-dark">accepted matches</span>
                      <span class="ms-auto text-sm font-weight-bold" id="acceptedMatches"></span>
                    </div>
                    <div>
                      <div class="progress progress-md">
                        <div id="acceptedPercentage" class="progress-bar bg-primary " role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
                  <div class="w-100">
                    <div class="d-flex mb-2">
                      <span class="me-2 text-sm font-weight-bold text-dark">rejected matches</span>
                      <span class="ms-auto text-sm font-weight-bold" id="rejectedMatches"></span>
                    </div>
                    <div>
                      <div class="progress progress-md">
                        <div id="rejectedPercentage" class="progress-bar bg-primary " role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
                  <div class="w-100">
                    <div class="d-flex mb-2">
                      <span class="me-2 text-sm font-weight-bold text-dark">pending matches</span>
                      <span id="pendingMatches" class="ms-auto text-sm font-weight-bold"></span>
                    </div>
                    <div>
                      <div class="progress progress-md">
                        <div id="pendingPercentage" class="progress-bar bg-primary " role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>
      <div class="row my-4">
        <h6>Pending Items</h6>

            <div class="card-body px-0 pb-2">

  <div class="table-responsive p-0">
    <table class="table align-items-center justify-content-center mb-0">
      <thead>
      <tr>

        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">name</th>
        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">description</th>
        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">location</th>
        <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">date lost/found</th>
        <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">status</th>
        <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">type</th>
        <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">match status</th>
        <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">edit status</th>



      </tr>
      </thead>
      <tbody id="tbodyItemsPending">

      </tbody>
    </table>
  </div>
            </div>
          </div>
        </div>


    </main>
  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="assets/js/plugins/chartjs.min.js"></script>
  <script>
    var ctx = document.getElementById("chart-bars").getContext("2d");

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Sales",
          tension: 0.4,
          borderWidth: 0,
          borderRadius: 4,
          borderSkipped: false,
          backgroundColor: "#fff",
          data: [450, 200, 100, 220, 500, 100, 400, 230, 500],
          maxBarThickness: 6
        }, ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
            },
            ticks: {
              suggestedMin: 0,
              suggestedMax: 500,
              beginAtZero: true,
              padding: 15,
              font: {
                size: 14,
                family: "Inter",
                style: 'normal',
                lineHeight: 2
              },
              color: "#fff"
            },
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false
            },
            ticks: {
              display: false
            },
          },
        },
      },
    });


    var ctx2 = document.getElementById("chart-line").getContext("2d");

    var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(203,12,159,0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke1.addColorStop(0, 'rgba(203,12,159,0)'); //purple colors

    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

    gradientStroke2.addColorStop(1, 'rgba(20,23,39,0.2)');
    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke2.addColorStop(0, 'rgba(20,23,39,0)'); //purple colors

    new Chart(ctx2, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
            label: "Mobile apps",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#cb0c9f",
            borderWidth: 3,
            backgroundColor: gradientStroke1,
            fill: true,
            data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
            maxBarThickness: 6

          },
          {
            label: "Websites",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#3A416F",
            borderWidth: 3,
            backgroundColor: gradientStroke2,
            fill: true,
            data: [30, 90, 40, 140, 290, 290, 340, 230, 400],
            maxBarThickness: 6
          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#b2b9bf',
              font: {
                size: 11,
                family: "Inter",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#b2b9bf',
              padding: 20,
              font: {
                size: 11,
                family: "Inter",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });
  </script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/soft-ui-dashboard.min.js?v=1.1.0"></script>
<script src="assets/js/dashboard.js"></script>
</body>

</html>