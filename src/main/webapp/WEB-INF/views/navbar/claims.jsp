<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="보상청구" />
<%@ include file="../includes/header.jsp" %>
<style>
  .table-bordered td, .table-bordered th {
    border: 1px solid #dee2e6 !important;
  }
</style>
<div class="container py-5">
  <div class="card shadow border-0 rounded-4">
    <div class="card-header bg-primary text-white text-center fw-bold fs-5">
      보상청구 목록
    </div>

    <div class="card-body p-4">
      <div class="table-responsive">
        <table class="table table-bordered align-middle text-center">
          <thead class="table-light">
            <tr>
              <th>청구번호</th>
              <th>고객명</th>
              <th>보험상품</th>
              <th>청구금액</th>
              <th>상태</th>
              <th>접수일</th>
              <th>처리일</th>
              <th>상세보기</th>
            </tr>
          </thead>
          <tbody>
            <tr><td>CLM-20250701</td><td>홍길동</td><td>암보험</td><td>5,000,000원</td><td><span class="badge bg-warning text-dark">심사중</span></td><td>2025-07-01</td><td>-</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250702</td><td>김민수</td><td>실손보험</td><td>1,200,000원</td><td><span class="badge bg-success">승인</span></td><td>2025-07-02</td><td>2025-07-04</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250703</td><td>이영희</td><td>운전자보험</td><td>3,500,000원</td><td><span class="badge bg-danger">거절</span></td><td>2025-07-03</td><td>2025-07-06</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250704</td><td>박정우</td><td>실손보험</td><td>800,000원</td><td><span class="badge bg-success">승인</span></td><td>2025-07-04</td><td>2025-07-07</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250705</td><td>최지훈</td><td>운전자보험</td><td>1,700,000원</td><td><span class="badge bg-warning text-dark">심사중</span></td><td>2025-07-05</td><td>-</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250706</td><td>김서연</td><td>암보험</td><td>45,500,000원</td><td><span class="badge bg-success">승인</span></td><td>2025-07-06</td><td>2025-07-09</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250707</td><td>조민호</td><td>실손보험</td><td>2,000,000원</td><td><span class="badge bg-danger">거절</span></td><td>2025-07-07</td><td>2025-07-10</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250708</td><td>윤하나</td><td>운전자보험</td><td>1,300,000원</td><td><span class="badge bg-warning text-dark">심사중</span></td><td>2025-07-08</td><td>-</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250709</td><td>서지우</td><td>암보험</td><td>6,000,000원</td><td><span class="badge bg-success">승인</span></td><td>2025-07-09</td><td>2025-07-11</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250710</td><td>강하늘</td><td>운전자보험</td><td>900,000원</td><td><span class="badge bg-danger">거절</span></td><td>2025-07-10</td><td>2025-07-13</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250711</td><td>장예린</td><td>실손보험</td><td>1,500,000원</td><td><span class="badge bg-success">승인</span></td><td>2025-07-11</td><td>2025-07-14</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
            <tr><td>CLM-20250712</td><td>백현진</td><td>암보험</td><td>3,000,000원</td><td><span class="badge bg-warning text-dark">심사중</span></td><td>2025-07-12</td><td>-</td><td><a href="#" class="btn btn-sm btn-outline-primary">보기</a></td></tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<%@ include file="../includes/footer.jsp" %>
