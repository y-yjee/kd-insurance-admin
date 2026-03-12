<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="피보험자 관리 - 피보험자 리스트" />
<%@ include file="../includes/header.jsp"%>

<div class="container-fluid mt-5 px-5">
    <div class="card shadow-lg w-100">
        <div class="card-header">
            <h5 class="mb-0">피보험자 리스트</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center align-middle mb-0">
                    <thead>
                        <tr>
                            <th>피보험자 ID</th>
                            <th>피보험자명</th>
                            <th>고객 ID</th>
                            <th>생년월일</th>
                            <th>성별</th>
                            <th>관계</th>
                            <th>등록일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="person" items="${list}">
                            <tr>
                                <td>${person.insured_id}</td>
                                <td>${person.name}</td>
                                <td>${person.customer_id}</td>
                                <td><fmt:formatDate value="${person.birth_date}" pattern="yyyy-MM-dd"/></td>
                                <td>
	                                 <c:choose>
	                                     <c:when test="${person.gender == 'M'}">남</c:when>
	                                     <c:when test="${person.gender == 'F'}">여</c:when>
	                                     <c:otherwise>-</c:otherwise>
	                                 </c:choose>
	                            </td>
                                <td>${person.relationship}</td>
                                <td><fmt:formatDate value="${person.reg_date}" pattern="yyyy-MM-dd"/></td>
                                <td>
                                    <a href="/insuredperson/get?insured_id=${person.insured_id}" class="btn btn-sm btn-info text-white">상세</a>
                                    <a href="/insuredperson/modify?insured_id=${person.insured_id}" class="btn btn-sm btn-secondary">수정</a>
                                    <form action="/insuredperson/remove" method="post" style="display:inline-block;" onsubmit="return confirm('삭제하시겠습니까?')">
                                        <input type="hidden" name="insured_id" value="${person.insured_id}" />
                                        <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
			    <div class="text-end mt-3">
			        <a href="/insuredperson/register" class="btn btn-sm btn-register">피보험자 등록</a>              
			    </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp"%>
