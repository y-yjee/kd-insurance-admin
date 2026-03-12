<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/auth.jsp"%>

<div class="d-flex" style="min-height: 100vh;">
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

    <div class="flex-grow-1" style="background-color: #ffffff;">
        <div class="card border-0 rounded-0 shadow-sm h-100">
            <div class="card-header text-white py-3 rounded-0" style="background-color: #2D4470 !important;">
                <h4 class="mb-0 fw-bold"><i class="fas fa-user-shield me-2"></i> 관리자 권한</h4>
            </div>
            <div class="card-body p-4">
                <p class="text-muted mb-4">
                    리더들 중에서 관리자를 지정할 수 있으며, 반드시 한 명 이상 지정되어야 합니다.<br>
                    관리자는 사용 정책을 설정하고 모든 정보에 접근할 수 있으니 설정에 유의해주세요.
                </p>

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h5 class="mb-0">
                            총 <span class="badge rounded-pill ms-1" style="background-color: #e2f0ff; color: #2D4470;">6명</span>의 관리자
                        </h5>
                    </div>
                    <button class="btn px-4 py-2 shadow-sm" style="background-color: #2D4470; color: #fff; border-radius: 0.35rem;">
                        <i class="fas fa-user-plus me-2"></i> 추가 / 편집
                    </button>
                </div>

                <div class="table-responsive border rounded" style="border-color: #e0e0e0 !important;">
                    <table class="table table-hover table-borderless text-center align-middle mb-0">
                        <thead class="bg-white">
                        <tr>
                            <th scope="col" class="text-center" style="width: 5%;"><input type="checkbox" class="form-check-input"></th>
                            <th scope="col" class="text-start" style="width: 25%;">이름</th>
                            <th scope="col" style="width: 15%;">사번</th>
                            <th scope="col" style="width: 25%;">직급</th>
                            <th scope="col" style="width: 30%;">근무지명</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="border-bottom">
                            <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                            <td class="text-start">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <img src="${pageContext.request.contextPath}/resources/img/jaeho.png" alt="Profile" class="profile-img">
                                    </div>
                                    <div>
                                        <strong class="d-block">성재호</strong>
                                        <small class="text-muted">Alegria_Insurance</small>
                                    </div>
                                </div>
                            </td>
                            <td>E0249</td>
                            <td>대표이사 (CEO)</td>
                            <td>Alegria_Insurance 본사 (HQ001)</td>
                        </tr>
                        <tr class="border-bottom">
                            <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                            <td class="text-start">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <img src="${pageContext.request.contextPath}/resources/img/yoonjee.png" alt="Profile" class="profile-img">
                                    </div>
                                    <div>
                                        <strong class="d-block">조윤지</strong>
                                        <small class="text-muted">Alegria_Insurance</small>
                                    </div>
                                </div>
                            </td>
                            <td>E5151</td>
                            <td>부사장 (Vice President)</td>
                            <td>Alegria_Insurance 본사 (HQ001)</td>
                        </tr>
                        <tr class="border-bottom">
                            <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                            <td class="text-start">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <img src="${pageContext.request.contextPath}/resources/img/hosung.png" alt="Profile" class="profile-img">
                                    </div>
                                    <div>
                                        <strong class="d-block">한호성</strong>
                                        <small class="text-muted">Alegria_Insurance</small>
                                    </div>
                                </div>
                            </td>
                            <td>F2233</td>
                            <td>전무 (Executive Director)</td>
                            <td>Alegria_Insurance 본사 (HQ001)</td>
                        </tr>
                        <tr class="border-bottom">
                            <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                            <td class="text-start">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <img src="${pageContext.request.contextPath}/resources/img/hoon.png" alt="Profile" class="profile-img">
                                    </div>
                                    <div>
                                        <strong class="d-block">이훈</strong>
                                        <small class="text-muted">Alegria_Insurance</small>
                                    </div>
                                </div>
                            </td>
                            <td>I2199</td>
                            <td>상무 (Managing Director)</td>
                            <td>Alegria_Insurance (HQ001)</td>
                        </tr>
                        <tr class="border-bottom">
                            <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                            <td class="text-start">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <img src="${pageContext.request.contextPath}/resources/img/jihye.png" alt="Profile" class="profile-img">
                                    </div>
                                    <div>
                                        <strong class="d-block">심지혜</strong>
                                        <small class="text-muted">Alegria_Insurance</small>
                                    </div>
                                </div>
                            </td>
                            <td>I2254</td>
                            <td>이사 (Director)</td>
                            <td>Alegria_Insurance 본사 (HQ001)</td>
                        </tr>
                        <tr class="border-bottom">
                            <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                            <td class="text-start">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <img src="${pageContext.request.contextPath}/resources/img/seoyoon.png" alt="Profile" class="profile-img">
                                    </div>
                                    <div>
                                        <strong class="d-block">홍서윤</strong>
                                        <small class="text-muted">Alegria_Insurance</small>
                                    </div>
                                </div>
                            </td>
                            <td>I2371</td>
                            <td>부장 (Department Head)</td>
                            <td>Alegria_Insurance 본사 (HQ001)</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="text-start mt-4">
                    <button class="btn btn-danger px-4 py-2 shadow-sm rounded-0"><i class="fas fa-trash-alt me-2"></i> 삭제</button>
                </div>

            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp"%>
