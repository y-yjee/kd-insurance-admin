<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>관리자 로그인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Fonts - Inter (Material Dashboard 3 default) -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <!-- Font Awesome Icons (for potential future use, though not directly used in this specific page for now) -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

  <style>
    body {
      background-color: #f0f2f5; /* Material Dashboard 3 배경색과 유사하게 조정 */
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh; /* 전체 뷰포트 높이 사용 */
      margin: 0;
      font-family: 'Inter', sans-serif; /* Material Dashboard 3 폰트 적용 */
      color: #344767; /* Material Dashboard 3 기본 텍스트 색상 */
    }

    .login-card {
      max-width: 450px; /* 카드 너비 약간 늘림 */
      width: 90%; /* 모바일에서 유연하게 반응하도록 */
      background-color: #fff;
      padding: 40px 35px; /* 패딩 조정 */
      border-radius: 1rem; /* Material Dashboard 3 둥근 모서리 */
      box-shadow: 0 8px 26px -4px rgba(0, 0, 0, 0.15), 0 8px 9px -5px rgba(0, 0, 0, 0.06); /* Material Dashboard 3 스타일 그림자 */
      animation: fadeIn 0.8s ease-out; /* 부드러운 등장 애니메이션 */
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .login-title {
      text-align: center;
      margin-bottom: 30px;
      font-weight: 700; /* 더 굵게 */
      color: #344767; /* Material Dashboard 3 기본 텍스트 색상 */
      font-size: 1.8rem; /* 제목 크기 키움 */
    }

    .login-logo img {
      width: 120px; /* 로고 크기 약간 키움 */
      display: block;
      margin: 0 auto 25px; /* 로고 하단 여백 조정 */
    }

    .form-floating > .form-control {
      padding: 0.8rem 0.75rem; /* 패딩 조정 */
      height: 48px !important; /* 높이 조정 */
      font-size: 1rem; /* 폰트 크기 조정 */
      border-radius: 0.5rem; /* 입력 필드 둥근 모서리 */
      border: 1px solid #ced4da; /* 기본 테두리 색상 */
      transition: border-color 0.2s ease, box-shadow 0.2s ease;
    }

    .form-floating > label {
      padding: 0.8rem 0.75rem; /* 라벨 패딩 조정 */
      font-size: 0.9rem; /* 라벨 폰트 크기 조정 */
      color: #6c757d; /* 라벨 색상 조정 */
    }

    .form-control:focus {
      border-color: #2D4470; /* KD 손해보험 네이비 */
      box-shadow: 0 0 0 0.2rem rgba(45, 68, 112, 0.25); /* 포커스 시 그림자 색상 조정 */
    }

    .btn-navy {
      background-color: #2D4470; /* KD 손해보험 네이비 */
      color: white;
      padding: 0.75rem 1.5rem; /* 버튼 패딩 조정 */
      font-size: 1rem; /* 버튼 폰트 크기 조정 */
      font-weight: 600;
      border-radius: 0.75rem; /* 버튼 둥근 모서리 */
      transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
      border: none; /* 테두리 제거 */
    }

    .btn-navy:hover {
      background-color: #1A237E; /* 더 진한 네이비로 호버 효과 */
      color: white;
      box-shadow: 0 4px 10px rgba(45, 68, 112, 0.3); /* 호버 시 그림자 */
      transform: translateY(-2px); /* 약간 위로 떠오르는 효과 */
    }

    .remember-me {
      font-size: 0.875rem; /* 폰트 크기 조정 */
      color: #6c757d;
    }

    .form-check-input:checked {
        background-color: #2D4470; /* 체크박스 체크 시 색상 */
        border-color: #2D4470;
    }
    .form-check-input:focus {
        box-shadow: 0 0 0 0.25rem rgba(45, 68, 112, 0.25); /* 체크박스 포커스 시 그림자 */
    }

    /* 에러 메시지 스타일 */
    .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
        border-color: #f5c6cb;
        border-radius: 0.5rem;
        font-size: 0.9rem;
        padding: 0.75rem 1.25rem;
        margin-bottom: 1.5rem;
    }
  </style>
</head>
<body>

  <div class="login-card">
    <div class="login-logo">
      <img src="${pageContext.request.contextPath}/resources/img/logo-ct-dark2.png" alt="KD 손해보험 로고">
    </div>
    <h4 class="login-title">관리자 로그인</h4>

    <!-- 에러 메시지 alert -->
    <c:if test="${not empty error}">
      <div class="alert alert-danger text-center" role="alert">
        ${error}
      </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/admin/login">
	  <!-- CSRF 토큰 추가 -->
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	  <div class="form-floating mb-3">
	    <input type="text" class="form-control" id="username" name="username" placeholder="아이디" required>
	    <label for="username">아이디</label>
	  </div>
	
	  <div class="form-floating mb-3">
	    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
	    <label for="password">비밀번호</label>
	  </div>
	
	  <div class="form-check mb-4 remember-me">
	    <input class="form-check-input" type="checkbox" name="remember-me" id="rememberMe">
	    <label class="form-check-label" for="rememberMe">
	      아이디 기억하기
	    </label>
	  </div>
	
	  <button type="submit" class="btn btn-navy w-100">로그인</button>
	</form>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
