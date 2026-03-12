<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="계약 관리 - 계약 정보 수정" />
<%@ include file="../includes/header.jsp" %>

<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
	<div class="container-fluid py-4">
	  <div class="row justify-content-center">
	    <div class="col-lg-8">
	      <div class="card shadow">
	        <div class="card-header text-center" style="background-color: #2D4470; color: white;">
	            <h5 class="mb-0">🛠 계약 정보 수정</h5>
	          </div>
	        <div class="card-body">
	          <form action="${pageContext.request.contextPath}/contract/modify" method="post">
	
	            <!-- contract_id는 숨김 필드로 꼭 포함 -->
	            <input type="hidden" name="contract_id" value="${contract.contract_id}" />
	
	            <div class="mb-3">
	              <label for="customer_id" class="form-label">고객 ID</label>
	              <input type="text" class="form-control" id="customer_id" name="customer_id" value="${contract.customer_id}" readonly>
	            </div>
	
	            <div class="mb-3">
	              <label for="insured_id" class="form-label">피보험자 ID</label>
	              <input type="text" class="form-control" id="insured_id" name="insured_id" value="${contract.insured_id}" readonly>
	            </div>
	
	            <div class="mb-3">
	              <label class="form-label d-block">보험 상품명</label>
	              <div class="form-check form-check-inline">
	                <input class="form-check-input" type="radio" name="product_name" id="product1" value="실손보험" 
	                  <c:if test="${contract.product_name == '실손보험'}">checked</c:if> required>
	                <label class="form-check-label" for="product1">실손보험</label>
	              </div>
	              <div class="form-check form-check-inline">
	                <input class="form-check-input" type="radio" name="product_name" id="product2" value="암보험" 
	                  <c:if test="${contract.product_name == '암보험'}">checked</c:if> required>
	                <label class="form-check-label" for="product2">암보험</label>
	              </div>
	              <div class="form-check form-check-inline">
	                <input class="form-check-input" type="radio" name="product_name" id="product3" value="운전자보험" 
	                  <c:if test="${contract.product_name == '운전자보험'}">checked</c:if> required>
	                <label class="form-check-label" for="product3">운전자보험</label>
	              </div>
	            </div>
	
	            <div class="row mb-3">
	              <div class="col">
	                <label for="start_date" class="form-label">계약 시작일</label>
	                <input type="date" class="form-control" id="start_date" name="start_date" 
	                  value="<fmt:formatDate value='${contract.start_date}' pattern='yyyy-MM-dd'/>" required>
	              </div>
	              <div class="col">
	                <label for="end_date" class="form-label">계약 종료일</label>
	                <input type="date" class="form-control" id="end_date" name="end_date" 
	                  value="<fmt:formatDate value='${contract.end_date}' pattern='yyyy-MM-dd'/>">
	              </div>
	            </div>
	
	            <div class="mb-3">
	              <label for="status" class="form-label">계약 상태</label>
	              <select id="status" name="status" class="form-select" required>
	                <option value="ACTIVE" <c:if test="${contract.status == 'ACTIVE'}">selected</c:if>>ACTIVE</option>
	                <option value="EXPIRED" <c:if test="${contract.status == 'EXPIRED'}">selected</c:if>>EXPIRED</option>
	                <option value="CANCELED" <c:if test="${contract.status == 'CANCELED'}">selected</c:if>>CANCELED</option>
	              </select>
	            </div>
	
               <div class="d-flex justify-content-between mt-4">
	              <a href="${pageContext.request.contextPath}/contract/list" class="btn btn-secondary">
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