<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="계약 관리 - 계약 등록" />
<%@ include file="../includes/header.jsp"%>

<div class="container mt-5">
  <div class="card shadow-lg w-100">
    <div class="card-header">
      <h5 class="mb-0">계약 등록</h5>
    </div>
    <div class="card-body">
      <form action="${pageContext.request.contextPath}/contract/register" method="post">

        <!-- 고객 선택 -->
		<div class="row mb-3">
		  <div class="col-md-4">
		    <label class="form-label">고객 ID</label>
		    <input type="text" id="customer_id" name="customer_id" class="form-control" readonly>
		  </div>
		  <div class="col-md-4">
		    <label class="form-label">고객 이름</label>
		    <input type="text" id="customer_name" class="form-control" readonly>
		  </div>
		  <div class="col-md-4">
		    <label class="form-label">&nbsp;</label> <%-- 빈 라벨로 정렬 맞추기 --%>
		    <div class="d-flex">
		      <button type="button"
		              class="btn btn-outline-primary px-3"
		              style="height: 38px; min-width: 110px;"
		              onclick="openCustomerPopup()">
		        고객 검색 <i class="fas fa-search ms-1"></i>
		      </button>
		    </div>
		  </div>
		</div>

        <!-- 피보험자 선택 -->
        <div class="mb-3">
          <label class="form-label">피보험자 ID (선택)</label>
          <select name="insured_id" id="insured_id" class="form-select" required onchange="syncInsuredName()">
            <option value="">먼저 고객을 선택하세요</option>
          </select>
        </div>

        <!-- 피보험자 이름 -->
        <div class="mb-3">
          <label class="form-label">피보험자 이름 (자동)</label>
          <input type="text" id="insured_name" class="form-control" readonly>
        </div>

        <!-- 보험 상품명 -->
        <div class="mb-3">
          <label class="form-label d-block">보험 상품명</label>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="product_name" id="product1" value="실손보험" required>
            <label class="form-check-label" for="product1">실손보험</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="product_name" id="product2" value="암보험" required>
            <label class="form-check-label" for="product2">암보험</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="product_name" id="product3" value="운전자보험" required>
            <label class="form-check-label" for="product3">운전자보험</label>
          </div>
        </div>

        <!-- 계약일 -->
        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label">계약 시작일</label>
            <input type="date" name="start_date" class="form-control" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">계약 종료일</label>
            <input type="date" name="end_date" class="form-control">
          </div>
        </div>

        <!-- 계약 상태 -->
        <div class="mb-3">
          <label class="form-label">계약 상태</label>
          <select name="status" class="form-select">
            <option value="ACTIVE">ACTIVE</option>
            <option value="EXPIRED">EXPIRED</option>
            <option value="CANCELED">CANCELED</option>
          </select>
        </div>
        
        <!-- 버튼 -->
		<div class="d-flex justify-content-end gap-2 mt-3">
            <button type="submit" class="btn text-white btn-sm" style="background: #2d4470; box-shadow: 1px 1px 1px #2d4470;">등록</button>
            <button type="button" class="btn btn-secondary btn-sm">취소</button>
            <a href="${pageContext.request.contextPath}/contract/list" class="btn bg-gradient-light border btn-sm">목록</a>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
  function setCustomerFromPopup(customerId, customerName) {
    document.getElementById("customer_id").value = customerId;
    document.getElementById("customer_name").value = customerName;

    // Ajax로 피보험자 목록 조회
    fetch('${pageContext.request.contextPath}/insuredperson/byCustomer?customerId=' + customerId)
      .then(response => response.json())
      .then(data => {
        const insuredSelect = document.getElementById("insured_id");
        const insuredNameInput = document.getElementById("insured_name");

        insuredSelect.innerHTML = '<option value="">피보험자를 선택하세요</option>';
        insuredNameInput.value = '';

        if (data.length > 0) {
          data.forEach(person => {
            const option = document.createElement("option");
            option.value = person.insured_id; // 피보험자 ID
            option.text = person.insured_id;  // 셀렉트에는 ID 출력
            option.dataset.name = person.name; // 이름은 dataset으로 저장
            insuredSelect.appendChild(option);
          });
        } else {
          insuredSelect.innerHTML = '<option value="">피보험자 없음</option>';
        }
      })
      .catch(error => {
        console.error("피보험자 목록 조회 실패:", error);
      });
  }

  // 피보험자 ID 선택 시 이름 연동
  function syncInsuredName() {
    const select = document.getElementById("insured_id");
    const selected = select.options[select.selectedIndex];
    document.getElementById("insured_name").value = selected.dataset.name || '';
  }

  function openCustomerPopup() {
    window.open(
      '${pageContext.request.contextPath}/customer/customer',
      '고객 검색',
      'width=800,height=700,left=200,top=150'
    );
  }
</script>

<%@ include file="../includes/footer.jsp"%>
