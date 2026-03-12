<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="계약 관리 - 계약 상세정보" />
<%@ include file="../includes/header.jsp" %>

<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
  <div class="container-fluid py-4">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow">
          <div class="card-header text-center" style="background-color: #2D4470; color: white;">
            <h5 class="mb-0">계약 상세 정보</h5>
          </div>
          <div class="card-body">
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <th style="width: 30%;">계약 ID</th>
                  <td>${contract.contract_id}</td>
                </tr>
                <tr>
                  <th>고객 ID</th>
                  <td>${contract.customer_id}</td>
                </tr>
                <tr>
                  <th>고객명</th>
                  <td>${contract.customerName}</td>
                </tr>
                <tr>
                  <th>피보험자 ID</th>
                  <td>${contract.insured_id}</td>
                </tr>
                <tr>
                  <th>피보험자명</th>
                  <td>${contract.insuredName}</td>
                </tr>
                <tr>
                  <th>보험 상품명</th>
                  <td>${contract.product_name}</td>
                </tr>
                <tr>
                  <th>계약 시작일</th>
                  <td><fmt:formatDate value="${contract.start_date}" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                  <th>계약 종료일</th>
                  <td><fmt:formatDate value="${contract.end_date}" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                  <th>계약 상태</th>
                  <td>${contract.status}</td>
                </tr>
                <tr>
                  <th>등록일</th>
                  <td><fmt:formatDate value="${contract.reg_date}" pattern="yyyy-MM-dd" /></td>
                </tr>
              </tbody>
            </table>

            <div class="text-end mt-4">
              <a href="${pageContext.request.contextPath}/contract/list" class="btn btn-primary"
                 style="background: #2d4470; box-shadow: 1px 1px 1px #2d4470;">목록</a>

              <a href="${pageContext.request.contextPath}/contract/modify?contract_id=${contract.contract_id}" 
                 class="btn btn-secondary">수정</a>

              <form action="${pageContext.request.contextPath}/contract/remove" method="post" class="d-inline">
                <input type="hidden" name="contract_id" value="${contract.contract_id}">
                <button type="submit" class="btn btn-danger"
                        onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="../includes/footer.jsp" %>
