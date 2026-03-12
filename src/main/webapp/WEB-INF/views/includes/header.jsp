<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/img/apple-icon.png">
  <link rel="icon" type="image/png" href="<c:url value='/resources/img/favicon-32x32-trimmed.png'/>">
  <title>
    KD 손해보험
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
  
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/nucleo-svg.css" rel="stylesheet" />
  
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  
  <!-- Material Icons -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
  
  <!-- CSS Files -->
  <link id="pagestyle" href="${pageContext.request.contextPath}/resources/css/material-dashboard.css?v=3.2.0" rel="stylesheet" />
  
  <!-- 부트스트랩 스크립트 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>   
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- jQuery 라이브러리 추가 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <!-- 외부 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Alegria-Insurance.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/log.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/guide.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/news.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/scheduleList.css">
  

</head>

<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-radius-lg fixed-start ms-2  bg-white my-2" id="sidenav-main">
    <div class="sidenav-header">
<!--       <i class="fas fa-times p-3 cursor-pointer text-dark opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i> -->
      <a class="navbar-brand px-4 py-3 m-0" href="${pageContext.request.contextPath}/navbar/dashboard">
        <img src="${pageContext.request.contextPath}/resources/img/logo-ct-dark2.png"  alt="main_logo">
        <span class="ms-1 text-sm text-dark">KD 손해보험</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
        <ul class="navbar-nav">
        <!-- 대시보드 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/navbar/dashboard">
               <i class="material-symbols-rounded opacity-5">dashboard</i>
               <span class="nav-link-text ms-1">대시보드</span>
             </a>
           </li>
      
        <!-- 고객관리 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/customer/list">
                  <i class="material-symbols-rounded opacity-5">person</i>
                  <span class="nav-link-text ms-1">고객관리</span>
             </a>
           </li>
      
           <!-- 주민관리 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/insuredperson/list">
               <i class="material-symbols-rounded opacity-5">groups</i>
               <span class="nav-link-text ms-1">주민관리</span>
             </a>
           </li>
      
           <!-- 계약관리 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/contract/list">
               <i class="material-symbols-rounded opacity-5">receipt</i>
               <span class="nav-link-text ms-1">계약관리</span>
             </a>
           </li>
           
           <!-- 상품관리 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/navbar/product">
               <i class="material-symbols-rounded opacity-5">shield_with_heart</i>
               <span class="nav-link-text ms-1">상품관리</span>
             </a>
           </li>
           
           <!-- 공지사항 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/notice/list">
               <i class="material-symbols-rounded opacity-5">notifications</i>
               <span class="nav-link-text ms-1">공지사항</span>
             </a>
           </li>
           
           <!-- 최신뉴스 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/news/list">
               <i class="material-symbols-rounded opacity-5">newspaper</i>
               <span class="nav-link-text ms-1">주간뉴스</span>
             </a>
           </li>
      
           <!-- 보상청구 -->
           <li class="nav-item">
             <a class="nav-link text-dark" href="${pageContext.request.contextPath}/navbar/claims">
               <i class="material-symbols-rounded opacity-5">point_of_sale</i>
               <span class="nav-link-text ms-1">보상청구</span>
             </a>
           </li>
      
           <!-- 구분선 및 계정 페이지 -->
           <!-- 시스템/관리자 메뉴 -->
            <li class="nav-item mt-3">
              <h6 class="ps-4 ms-2 text-uppercase text-xs text-dark font-weight-bolder opacity-5">관리자 설정</h6>
            </li>
            
            <li class="nav-item">
              <a class="nav-link text-dark" href="${pageContext.request.contextPath}/navbar/system">
                <i class="material-symbols-rounded opacity-5">settings</i>
                <span class="nav-link-text ms-1">시스템 설정</span>
              </a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link text-dark" href="${pageContext.request.contextPath}/navbar/auth">
                <i class="material-symbols-rounded opacity-5">admin_panel_settings</i>
                <span class="nav-link-text ms-1">관리자 권한</span>
              </a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link text-dark" href="${pageContext.request.contextPath}/navbar/terms">
                <i class="material-symbols-rounded opacity-5">rule</i>
                <span class="nav-link-text ms-1">약관 관리</span>
              </a>
            </li>
         </ul>
              
    </div>
    <div class="sidenav-footer position-absolute w-100 bottom-0 ">
      <div class="mx-3">
        <a class="btn btn-outline-dark mt-4 w-100" href="${pageContext.request.contextPath}/navbar/guide" type="button">관리자 교육자료</a>
        <a class="btn bg-gradient-dark w-100" href="${pageContext.request.contextPath}/navbar/log" type="button">시스템 로그</a>
      </div>
    </div>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-3 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">
           <c:choose>
             <c:when test="${not empty pageTitle}">
               <c:out value="${pageTitle}" />
             </c:when>
             <c:otherwise>
               Dashboard
             </c:otherwise>
           </c:choose>
         </li>
          </ol>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group input-group-outline">
              <label class="form-label">Type here...</label>
              <input type="text" class="form-control">
            </div>
          </div>
          <ul class="navbar-nav d-flex align-items-center  justify-content-end">
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0">
                <i class="material-symbols-rounded fixed-plugin-button-nav">settings</i>
              </a>
            </li>
            <li class="nav-item dropdown pe-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="material-symbols-rounded">notifications</i>
              </a>
              
            </li>
            <li class="nav-item dropdown d-flex align-items-center">
			  <a class="nav-link text-body font-weight-bold px-0" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <i class="material-symbols-rounded">account_circle</i>
			  </a>
			  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
			    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/customLogout">로그아웃</a></li>
			  </ul>
			</li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>    
<!-- JavaScript -->
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const toggleLink = document.querySelector('a[href="#dashboardSubmenu"]');
    const toggleIcon = toggleLink.querySelector('.toggle-icon');
    const submenu = document.getElementById('dashboardSubmenu');

    submenu.addEventListener('show.bs.collapse', function () {
      toggleIcon.classList.remove('fa-plus');
      toggleIcon.classList.add('fa-minus');
    });

    submenu.addEventListener('hide.bs.collapse', function () {
      toggleIcon.classList.remove('fa-minus');
      toggleIcon.classList.add('fa-plus');
    });
  });
</script>