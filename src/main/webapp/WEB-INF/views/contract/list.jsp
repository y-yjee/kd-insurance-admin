<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="계약 관리 - 계약 리스트" />
<%@ include file="../includes/header.jsp"%>

<div class="container-fluid mt-5 px-5">
    <div class="card shadow-lg w-100">
        <div class="card-header">
            <h5 class="mb-0">보험 계약 리스트</h5>
        </div>
        <div class="card-body">
        	<div class="table-responsive">
	             <table class="table table-bordered table-hover text-center align-middle mb-0">
	                 <thead>
	                     <tr>
	                         <th>계약번호</th>
	                         <th>고객명</th>
	                         <th>피보험자명</th>
	                         <th>보험 상품명</th>
	                         <th>시작일</th>
	                         <th>종료일</th>
	                         <th>계약 상태</th>
	                         <th>등록일</th>
	                         <th>관리</th>
	                     </tr>
	                 </thead>
	                 <tbody>
	                     <c:forEach var="contract" items="${contractList}">
	                         <tr>
	                             <td>${contract.contract_id}</td>
	                             <td>${contract.customerName}</td>
	                             <td>${contract.insuredName}</td>
	                             <td>${contract.product_name}</td>
	                             <td><fmt:formatDate value="${contract.start_date}" pattern="yyyy-MM-dd"/></td>
	                             <td>
	                                 <c:choose>
	                                     <c:when test="${contract.end_date != null}">
	                                         <fmt:formatDate value="${contract.end_date}" pattern="yyyy-MM-dd"/>
	                                     </c:when>
	                                     <c:otherwise>-</c:otherwise>
	                                 </c:choose>
	                             </td>
	                             <td>${contract.status}</td>
	                             <td><fmt:formatDate value="${contract.reg_date}" pattern="yyyy-MM-dd"/></td>
	                             <td>
	                                 <a href="${pageContext.request.contextPath}/contract/get?contract_id=${contract.contract_id}" class="btn btn-sm btn-info text-white">상세</a>
	                                 <a href="${pageContext.request.contextPath}/contract/modify?contract_id=${contract.contract_id}" class="btn btn-sm btn-secondary">수정</a>
	                                 <form action="${pageContext.request.contextPath}/contract/remove" method="post" style="display:inline-block;" onsubmit="return confirm('정말 삭제하시겠습니까?')">
	                                     <input type="hidden" name="contract_id" value="${contract.contract_id}">
	                                     <button type="submit" class="btn btn-sm btn-danger">삭제</button>
	                                 </form>
	                             </td>
	                         </tr>
	                     </c:forEach>
	                 </tbody>
	             </table>
	            <div class="text-end mt-3">
	                <a href="/contract/register" class="btn btn-sm btn-register">계약 등록</a>
	            </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../includes/footer.jsp" %>