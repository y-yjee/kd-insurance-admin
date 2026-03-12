<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="피보험자 관리 - 피보험자 정보 수정" />
<%@ include file="../includes/header.jsp" %>

<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
  <div class="container-fluid py-4">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow">
          <div class="card-header text-center" style="background-color: #2D4470; color: white;">
            <h5 class="mb-0">🛠 피보험자 정보 수정</h5>
          </div>
          <div class="card-body">
            <form action="${pageContext.request.contextPath}/insuredperson/modify" method="post">
               <!-- hidden 필수값 (수정 시 반드시 필요) -->
              <input type="hidden" name="insured_id" value="${insuredPerson.insured_id}" />
              <input type="hidden" name="customer_id" value="${insuredPerson.customer_id}" />

              <div class="mb-3">
                <label class="form-label fw-bold">피보험자 ID</label>
                <input type="text" class="form-control bg-light" value="${insuredPerson.insured_id}" readonly>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">고객 ID</label>
                <input type="text" class="form-control bg-light" value="${insuredPerson.customer_id}" readonly>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">이름</label>
                <input type="text" name="name" class="form-control" value="${insuredPerson.name}" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">생년월일</label>
                <input type="date" name="birth_date" class="form-control" 
                       value="<fmt:formatDate value='${insuredPerson.birth_date}' pattern='yyyy-MM-dd'/>" required>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">성별</label>
                <select name="gender" class="form-select" required>
                  <option value="M" <c:if test="${insuredPerson.gender == 'M'}">selected</c:if>>남성</option>
                  <option value="F" <c:if test="${insuredPerson.gender == 'F'}">selected</c:if>>여성</option>
                </select>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">관계</label>
                <input type="text" name="relationship" class="form-control" value="${insuredPerson.relationship}" required>
              </div>

              <div class="d-flex justify-content-between mt-4">
                <a href="${pageContext.request.contextPath}/insuredperson/list" class="btn btn-secondary">
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
