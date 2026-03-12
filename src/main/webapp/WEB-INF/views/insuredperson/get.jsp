<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageTitle" value="피보험자 관리 - 피보험자 상세정보" />
<%@ include file="../includes/header.jsp" %>

<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
  <div class="container-fluid py-4">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow">
          <div class="card-header text-center" style="background-color: #2D4470; color: white;">
            <h5 class="mb-0">피보험자 상세 정보</h5>
          </div>
          <div class="card-body">
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <th style="width: 30%;">피보험자 ID</th>
                  <td>${insured.insured_id}</td>
                </tr>
                <tr>
                  <th>피보험자명</th>
                  <td>${insured.name}</td>
                </tr>
                <tr>
                  <th>생년월일</th>
                  <td><fmt:formatDate value="${insured.birth_date}" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                  <th>성별</th>
                  <td>${insured.gender}</td>
                </tr>
                <tr>
                  <th>계약자 ID</th>
                  <td>${insured.customer_id}</td>
                </tr>
                <tr>
                  <th>관계</th>
                  <td>${insured.relationship}</td>
                </tr>
                <tr>
                  <th>등록일</th>
                  <td><fmt:formatDate value="${insured.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
              </tbody>
            </table>

            <div class="text-end mt-4">
              <a href="${pageContext.request.contextPath}/insuredperson/list" class="btn btn-primary" 
                 style="background: #2d4470; box-shadow: 1px 1px 1px #2d4470;">목록</a>
              <a href="${pageContext.request.contextPath}/insuredperson/modify?insured_id=${insured.insured_id}" 
                 class="btn btn-secondary">수정</a>
              <form action="${pageContext.request.contextPath}/insuredperson/remove" method="post" class="d-inline">
                <input type="hidden" name="insured_id" value="${insured.insured_id}">
                <button type="submit" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="../includes/footer.jsp" %>
