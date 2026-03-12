<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageTitle" value="상품 관리" />
<%@ include file="../includes/header.jsp" %>


<link href="/resources/css/product.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">


<div class="container-fluid py-4">
    <div class="row mb-4 align-items-center">
        <div class="col-md-7">
            <h4 class="text-dark fw-bold">상품 관리</h4>
            <p class="text-sm text-secondary">보험 상품 목록, 약관 다운로드, 정렬 및 필터, 계약 연동 기능 포함</p>
        </div>
        <div class="col-md-5 text-end d-flex align-items-center justify-content-end">
            <form method="get" class="d-flex me-3">
                <select class="form-select me-2" name="sort">
                    <option value="name">상품명순</option>
                    <option value="amount">보장금액순</option>
                </select>
                <select class="form-select" name="filter">
                    <option value="all">전체</option>
                    <option value="active">판매중</option>
                    <option value="inactive">판매중단</option>
                </select>
            </form>
            <button type="button" class="btn add-product-btn" onclick="alert('상품 추가 폼으로 이동합니다. (현재 정적 페이지)')">
                <i class="fas fa-plus me-2"></i> 새 상품 추가
            </button>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card statistic-card">
                <div class="icon text-primary"><i class="fas fa-cubes"></i></div>
                <div class="value">12</div>
                <div class="label">총 상품 수</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card statistic-card">
                <div class="icon text-success"><i class="fas fa-store-alt"></i></div>
                <div class="value">8</div>
                <div class="label">판매중인 상품</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card statistic-card">
                <div class="icon text-warning"><i class="fas fa-times-circle"></i></div>
                <div class="value">4</div>
                <div class="label">판매중단 상품</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="card statistic-card">
                <div class="icon text-info"><i class="fas fa-file-contract"></i></div>
                <div class="value">95</div>
                <div class="label">오늘 신규 계약</div>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-6">
            <label for="productSelect" class="form-label">계약 등록 시 상품 선택</label>
            <select class="form-select" id="productSelect">
                <option value="1">암보험</option>
                <option value="2">실손보험</option>
                <option value="3">운전자보험</option>
                <option value="4">치아보험</option>
                <option value="5">어린이보험</option>
                <option value="6">여행자보험</option>
            </select>
        </div>
    </div>

    <div class="row">

        <c:set var="productsDataString" value="암보험|진단, 수술, 입원 등 암 관련 종합 보장|만 19세 ~ 60세, 건강 검진 통과|100,000,000|Y;실손보험|병원비, 약제비 등 실제 지출한 의료비 보상|연령 제한 없음, 건강 상태에 따라 가입 가능|50,000,000|Y;운전자보험|교통사고 발생 시 벌금, 변호사 선임 비용 등 보장|운전 면허 소지자|20,000,000|Y;치아보험|임플란트, 크라운, 스케일링 등 치과 치료비 보장|만 20세 ~ 65세, 최근 1년 이내 치과 치료 무|5,000,000|N;어린이보험|성장기 질병 및 상해 집중 보장|0세 ~ 18세 가입 가능|30,000,000|Y;여행자보험|해외 여행 중 발생할 수 있는 사고 및 질병 보장|출국 전 가입 필수|10,000,000|Y" />
        <c:set var="productList" value="${fn:split(productsDataString, ';')}" />

        <c:forEach var="productString" items="${productList}">
            <c:set var="productProps" value="${fn:split(productString, '|')}" />
            <div class="col-xl-4 col-md-6 mb-4">
                <div class="card shadow border">
                    <div class="card-header bg-gradient-primary text-white d-flex justify-content-between align-items-center">
                        <h6 class="mb-0 text-white">${productProps[0]}</h6>
                        <a href="/resources/agreements/${productProps[0]}.pdf" download class="btn btn-sm btn-light text-dark">약관 PDF</a>
                    </div>
                    <div class="card-body">
                        <p><strong>보장 내용:</strong> ${productProps[1]}</p> <%-- 상세 내용 --%>
                        <p><strong>가입 조건:</strong> ${productProps[2]}</p> <%-- 가입 조건 --%>
                        <p><strong>보장 금액:</strong> ${productProps[3]}원</p> <%-- 보장 금액 --%>
                        <p><strong>상태:</strong> <span class="badge bg-${productProps[4] == 'Y' ? 'success' : 'secondary'}">
                                ${productProps[4] == 'Y' ? '판매중' : '판매중단'}
                            </span></p>
                    </div>
                    <div class="card-footer">
                        <button type="button" class="btn btn-outline-primary btn-sm" onclick="alert('${productProps[0]} 상품을 수정합니다. (현재 정적 페이지)')">수정</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" onclick="alert('${productProps[0]} 상품을 삭제합니다. (현재 정적 페이지)')">삭제</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js" crossorigin="anonymous"></script>