<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="피보험자 관리 - 피보험자 등록" />
<%@ include file="../includes/header.jsp"%>

<div class="container mt-5">
  <div class="card shadow-lg w-100">
    <div class="card-header">
      <h5 class="mb-0">피보험자 등록</h5>
    </div>
    <div class="card-body">
      <form action="${pageContext.request.contextPath}/insuredperson/register" method="post">

        <!-- 고객 ID 및 이름 검색 -->
        <div class="row mb-3">
		  <div class="col-md-4">
		    <label class="form-label">고객 ID</label>
		    <input type="text" name="customer_id" id="customerId" class="form-control" readonly>
		  </div>
		  <div class="col-md-4">
		    <label class="form-label">고객 이름</label>
		    <input type="text" id="customerName" class="form-control" readonly>
		  </div>
		  <div class="col-md-4">
		    <label class="form-label">&nbsp;</label> <%-- 빈 라벨로 정렬 맞추기 --%>
		    <div class="d-flex">
		      <button type="button"
		              class="btn btn-outline-primary px-3"
		              style="height: 38px; min-width: 110px;"
		              onclick="openCustomerSearch()">
		        고객 검색 <i class="fas fa-search ms-1"></i>
		      </button>
		    </div>
		  </div>
		</div>
		        
        <!-- 피보험자 ID -->
        <div class="mb-3">
          <label class="form-label fw-bold">피보험자 ID</label>
          <input type="text" name="insured_id" class="form-control" required />
        </div>

        <!-- 피보험자 이름 -->
        <div class="mb-3">
          <label class="form-label fw-bold">피보험자 이름</label>
          <input type="text" name="name" class="form-control" required />
        </div>

        <!-- 생년월일 -->
        <div class="mb-3">
          <label class="form-label fw-bold">생년월일</label>
          <input type="date" name="birth_date" class="form-control" required />
        </div>

        <!-- 성별 -->
        <div class="mb-3">
          <label class="form-label fw-bold">성별</label>
          <select name="gender" class="form-select" required>
            <option value="M">남성</option>
            <option value="F">여성</option>
          </select>
        </div>

        <!-- 관계 -->
        <div class="mb-3">
          <label class="form-label fw-bold">관계</label>
          <input type="text" name="relationship" class="form-control" />
        </div>
        
		<!-- 버튼 -->
		<div class="d-flex justify-content-end gap-2 mt-3">
            <button type="submit" class="btn text-white btn-sm" style="background: #2d4470; box-shadow: 1px 1px 1px #2d4470;">등록</button>
            <button type="button" class="btn btn-secondary btn-sm">취소</button>
            <a href="${pageContext.request.contextPath}/insuredperson/list" class="btn bg-gradient-light border btn-sm">목록</a>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  // 팝업 열기 함수
  function openCustomerSearch() {
    window.open('/customer/search', 'customerSearch', 'width=600,height=400,scrollbars=yes');
  }

  // 팝업에서 값 받아오기
  function setCustomer(id, name) {
    document.getElementById("customerId").value = id;
    document.getElementById("customerName").value = name;
  }
</script>

<%@ include file="../includes/footer.jsp"%>
