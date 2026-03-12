<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="고객 관리 - 고객 리스트" />
<%@ include file="../includes/header.jsp"%>

<div class="container-fluid mt-5 px-5">
    <div class="card shadow-lg w-100">
        <div class="card-header">
            <h5 class="mb-0">고객 리스트</h5>
        </div>
        <div class="card-body">
	       <div class="table-responsive">
	           <table class="table table-bordered table-hover text-center align-middle mb-0">
	               <thead>
	                   <tr>
	                       <th>고객 ID</th>
	                       <th>고객명</th>
	                       <th>생년월일</th>
	                       <th>성별</th>
	                       <th>전화번호</th>
	                       <th>이메일</th>
	                       <th>주소</th>
	                       <th>등록일</th>
	                       <th>관리</th>
	                   </tr>
	               </thead>
	               <tbody>
	                   <c:forEach var="customer" items="${list}">
	                       <tr>
	                           <td>${customer.customer_id}</td>
	                           <td>${customer.name}</td>
	                           <td><fmt:formatDate value="${customer.birth_date}" pattern="yyyy-MM-dd" /></td>
	                           <td>
	                               <c:choose>
	                                   <c:when test="${customer.gender == 'M'}">남</c:when>
	                                   <c:when test="${customer.gender == 'F'}">여</c:when>
	                                   <c:otherwise>-</c:otherwise>
	                               </c:choose>
	                           </td>
	                           <td>${customer.phone}</td>
	                           <td>${customer.email}</td>
	                           <td>${customer.address}</td>
	                           <td><fmt:formatDate value="${customer.reg_date}" pattern="yyyy-MM-dd" /></td>
	                           <td>
	                               <a href="${pageContext.request.contextPath}/customer/get?customer_id=${customer.customer_id}" class="btn btn-sm btn-info text-white">상세</a>
	                               <a href="${pageContext.request.contextPath}/customer/modify?customer_id=${customer.customer_id}" class="btn btn-sm btn-secondary">수정</a>
	                               <form action="${pageContext.request.contextPath}/customer/remove" method="post" style="display:inline-block;" onsubmit="return confirm('정말 삭제하시겠습니까?')">
	                                   <input type="hidden" name="customer_id" value="${customer.customer_id}">
	                                   <button type="submit" class="btn btn-sm btn-danger">삭제</button>
	                               </form>
	                           </td>
	                       </tr>
	                   </c:forEach>
	               </tbody>
	            </table>	
	            <div class="text-end mt-3">
	                <a href="${pageContext.request.contextPath}/customer/register" class="btn btn-sm btn-register">고객 등록</a>
	            </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../includes/footer.jsp"%>
