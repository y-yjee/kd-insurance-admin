<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="고객 관리 - 고객 정보 수정" />
<%@ include file="../includes/header.jsp" %>

<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
  <div class="container-fluid py-4">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow">
          <div class="card-header text-center" style="background-color: #2D4470; color: white;">
            <h5 class="mb-0">🛠 고객 정보 수정</h5>
          </div>
          <div class="card-body">
            <form action="${pageContext.request.contextPath}/customer/modify" method="post">
               <!-- hidden 필수값 (수정 시 반드시 필요) -->
              <input type="hidden" name="password" value="${customer.password}" />
              <input type="hidden" name="customer_id" value="${customer.customer_id}" />

              <div class="mb-3">
                <label class="form-label fw-bold">고객 ID</label>
                <input type="text" class="form-control bg-light" value="${customer.customer_id}" readonly>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">이름</label>
                <input type="text" name="name" class="form-control" value="${customer.name}" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">이메일</label>
                <input type="email" name="email" class="form-control" value="${customer.email}">
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">전화번호</label>
                <input type="text" name="phone" class="form-control" value="${customer.phone}" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">생년월일</label>
                <input type="date" name="birth_date" class="form-control bg-light" 
                       value="<fmt:formatDate value='${customer.birth_date}' pattern='yyyy-MM-dd'/>" readonly>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">성별</label>
                <input type="text" name="gender" class="form-control bg-light" 
                       value="${customer.gender}" readonly>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">주소</label>
                <input type="text" name="address" class="form-control" value="${customer.address}">
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">권한</label>
                <input type="text" name="role" class="form-control bg-light" value="${customer.role}" readonly>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">가입일</label>
                <input type="text" class="form-control bg-light" 
                       value="<fmt:formatDate value='${customer.reg_date}' pattern='yyyy-MM-dd'/>" readonly>
              </div>

              <div class="d-flex justify-content-between mt-4">
                <a href="${pageContext.request.contextPath}/customer/list" class="btn btn-secondary">
                  ← 목록
                </a>
                <button type="submit" class="btn btn-primary" style="background-color: #2d4470;">
                  💾 저장
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="../includes/footer.jsp" %>