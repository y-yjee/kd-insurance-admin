<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="관리자용 교육자료" />
<%@ include file="../includes/header.jsp" %>

<div class="guide-container">
  <div class="guide-title">🧑‍🏫 관리자 교육자료</div>

  <!-- 시스템 소개 -->
  <div class="guide-section">
    <h3>1. 시스템 개요</h3>
    <p>
      이 시스템은 고객, 피보험자, 계약, 보험상품 등을 통합 관리할 수 있는 보험 관리자용 웹 애플리케이션입니다.
    </p>
  </div>

  <!-- 주요 기능 설명 -->
  <div class="guide-section">
    <h3>2. 주요 기능 소개</h3>
    <ul>
      <li><strong>고객 관리:</strong> 고객 등록, 수정, 삭제 및 상세 조회</li>
      <li><strong>피보험자 관리:</strong> 고객과 연결된 피보험자 정보 관리</li>
      <li><strong>계약 관리:</strong> 보험 계약 정보 등록 및 변경</li>
      <li><strong>상품 관리:</strong> 보험 상품 목록 관리 및 조건 수정</li>
      <li><strong>시스템 로그:</strong> 관리자 활동 이력 확인</li>
    </ul>
  </div>

  <!-- 사용 팁 -->
  <div class="guide-section">
    <h3>3. 사용 시 유의사항</h3>
    <ul>
      <li>등록 또는 삭제 전 반드시 확인 팝업을 통해 의도를 재확인하세요.</li>
      <li>외래키 관계로 인해 <span class="badge-tip">삭제가 제한</span>될 수 있습니다.</li>
      <li>날짜 입력은 YYYY-MM-DD 형식을 지켜주세요.</li>
      <li>로그아웃 후 재로그인 시 세션 정보가 초기화됩니다.</li>
    </ul>
  </div>

  <!-- 자주 묻는 질문 -->
  <div class="guide-section">
    <h3>4. 자주 묻는 질문 (FAQ)</h3>
    <ul>
      <li><strong>Q:</strong> 고객 삭제가 안 됩니다.<br>
        <strong>A:</strong> 해당 고객과 연결된 계약 또는 피보험자가 존재할 경우 삭제할 수 없습니다.
      </li>
      <li><strong>Q:</strong> 계약 수정 시 오류가 발생합니다.<br>
        <strong>A:</strong> 시작일이 종료일보다 늦지 않도록 입력했는지 확인하세요.
      </li>
    </ul>
  </div>

  <!-- 도움말 -->
  <div class="guide-section">
    <h3>5. 문의 및 지원</h3>
    <p>
      시스템 사용 중 문제가 발생하면 <strong>관리자팀 (admin@example.com)</strong> 또는 <strong>개발팀 내선 1234</strong>로 문의해 주세요.
    </p>
  </div>
</div>

<%@ include file="../includes/footer.jsp" %>