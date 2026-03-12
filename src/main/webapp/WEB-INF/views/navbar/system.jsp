<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header.jsp 포함 --%>
<%@ include file="../includes/system.jsp" %>

<div class="d-flex" style="min-height: 100vh;">
    <%-- 왼쪽 사이드바 - 설정 메뉴 --%>
    <div class="text-white p-3 shadow-sm" style="width: 250px; flex-shrink: 0; background-color: #2D4470 !important;">
        <!-- <h5 class="fw-bold mb-4">시스템 설정</h5> -->
        <h5 class="fw-bold mb-4">
        <a href="${pageContext.request.contextPath}/navbar/dashboard" style="text-decoration: none; color: inherit;">
            <img src="${pageContext.request.contextPath}/resources/img/logo-ct-dark4.png" alt="KD 손해보험 로고"
                 alt="시스템 설정 아이콘" 
                 style="height: 24px; vertical-align: middle; margin-right: 8px;"> 
            손해보험 
        </h5>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a href="#" class="nav-link text-white-50 py-2 hover-white rounded-0">회사 정보</a>
            </li>
            <li class="nav-item">
                <a href="/navbar/auth" class="nav-link text-white-50 py-2 hover-white rounded-0">관리자</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link text-white-50 py-2 hover-white rounded-0">근무 정책</a>
            </li>
            <li class="nav-item">
                <%-- '보안' 메뉴 활성화 상태로 표시 --%>
                <a href="/navbar/system" class="nav-link active fw-bold py-2 rounded-0" style="background-color: rgba(255,255,255,0.1); color: #fff !important;" aria-current="page">보안</a>
            </li>
            <li class="nav-item">
                <a href="/navbar/terms" class="nav-link text-white-50 py-2 hover-white rounded-0">약관 관리</a>
            </li>
        </ul>
    </div>

    <%-- 메인 콘텐츠 영역 --%>
    <div class="flex-grow-1" style="background-color: #ffffff;">
        <div class="card border-0 rounded-0 shadow-sm h-100">
            <div class="card-header text-white py-3 rounded-0" style="background-color: #2D4470 !important;">
                <h4 class="mb-0 fw-bold"><i class="fas fa-lock me-2"></i> 보안 설정</h4>
            </div>
            <div class="card-body p-4">
                <p class="text-muted mb-4">
                    계정의 보안을 강화하고 중요한 데이터에 대한 접근을 관리합니다.<br>
                    내부 정책에 맞는 인증 방법을 설정하여 보안 수준을 높이세요.
                </p>

                <%-- 각 보안 설정 섹션 --%>
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title fw-bold mb-3"><i class="fas fa-key me-2 text-primary"></i> 비밀번호 변경</h5>
                                <p class="card-text text-muted small">
                                    비밀번호 변경은 보안 정책에 따라 <strong class="text-dark">시스템 관리자에게 문의</strong>해주시기 바랍니다.
                                </p>
                                <%-- 버튼을 비활성화하거나, 관리자 문의 페이지로 연결할 수 있습니다. 여기서는 단순히 텍스트만 변경합니다. --%>
                                <button class="btn btn-outline-secondary btn-sm px-3" disabled>
                                    관리자에게 문의
                                </button>
                                <%-- 또는 버튼을 링크로 변경 가능
                                <a href="mailto:admin@yourcompany.com" class="btn btn-outline-secondary btn-sm px-3">
                                    관리자에게 이메일 문의
                                </a>
                                --%>
                            </div>
                        </div>
                    </div>
                    <%-- 사원 번호/직원 ID 기반 추가 인증 섹션 (이전과 동일) --%>
                    <div class="col-md-6 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title fw-bold mb-3"><i class="fas fa-id-card me-2 text-primary"></i> 사원 번호 추가 인증</h5>
                                <p class="card-text text-muted small">
                                    로그인 시 사원 번호를 통한 추가 인증으로 계정 보안을 강화합니다.
                                </p>
                                <button class="btn btn-secondary btn-sm px-3" style="background-color: #e0e0e0; color: #6c757d; border-color: #d6d6d6;">
                                    설정/관리
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title fw-bold mb-3"><i class="fas fa-history me-2 text-primary"></i> 로그인 활동 기록</h5>
                                <p class="card-text text-muted small">
                                    최근 로그인 활동 및 접속 정보를 확인하여 의심스러운 활동을 감지할 수 있습니다.
                                </p>
                                <button class="btn btn-outline-secondary btn-sm px-3" style="color: #2D4470; border-color: #2D4470;">
                                    기록 보기
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title fw-bold mb-3"><i class="fas fa-desktop me-2 text-primary"></i> 접근 기기 관리</h5>
                                <p class="card-text text-muted small">
                                    현재 계정에 접근 가능한 기기들을 확인하고 관리할 수 있습니다. (예: 특정 IP 허용, 기기 등록)
                                </p>
                                <button class="btn btn-outline-secondary btn-sm px-3" style="color: #2D4470; border-color: #2D4470;">
                                    설정/관리
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<%-- footer.jsp 포함 --%>
<%@ include file="../includes/footer.jsp"%>
