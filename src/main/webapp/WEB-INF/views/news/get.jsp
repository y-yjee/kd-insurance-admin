<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="주간 뉴스 기사 상세보기" />
<%@ include file="../includes/header.jsp" %>

<div class="container py-5">
    <div class="card shadow-lg border-0 rounded-3 mx-auto" style="max-width: 800px;">
        <div class="card-header text-white text-center py-3 rounded-top-3" style="background-color: #2D4470;">
            <h4 class="mb-0 fw-bold">주간 뉴스 기사 상세보기</h4>
        </div>

        <div class="card-body p-4">
            <div class="d-flex align-items-center mb-3">
                <h5 class="mb-0 fw-bolder text-dark flex-grow-1">
                    <c:if test="${news.important == 'Y'}">
                        <span class="badge bg-danger me-2"><i class="fas fa-exclamation-circle"></i> 중요</span>
                    </c:if>
                    ${news.title}
                </h5>
                <small class="text-muted text-end">
                    <i class="fas fa-eye me-1"></i> 조회수: ${news.view_count}
                </small>
            </div>
            <hr class="my-3">

            <div class="d-flex justify-content-between align-items-center mb-4">
                <p class="text-muted mb-0">
                    <i class="fas fa-user-edit me-1"></i> 작성자: <span class="fw-bold">${news.writer}</span>
                </p>
                <p class="text-muted mb-0">
                    <i class="fas fa-calendar-alt me-1"></i> 등록일: <span class="fw-bold"><fmt:formatDate value="${news.reg_date}" pattern="yyyy-MM-dd HH:mm" /></span>
                </p>
            </div>

            <div class="mb-4 p-3 bg-light rounded-3 border">
                <p class="lead mb-0 text-dark" style="white-space: pre-wrap;">${news.content}</p>
            </div>
            
            <hr class="my-4">
            
            <div class="d-flex justify-content-end gap-2">
                <a href="${pageContext.request.contextPath}/news/list" class="btn btn-outline-secondary px-4 py-2">
                    <i class="fas fa-list me-1"></i> 목록
                </a>
                <a href="${pageContext.request.contextPath}/news/modify?news_id=${news.news_id}" class="btn text-white px-4 py-2" style="background-color: #2D4470;">
                    <i class="fas fa-edit me-1"></i> 수정
                </a>
                <button type="button" class="btn btn-danger px-4 py-2" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                    <i class="fas fa-trash-alt me-1"></i> 삭제
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteConfirmModalLabel">주간 뉴스 삭제 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말로 이 주간 뉴스를 삭제하시겠습니까? <br> 삭제된 주간 뉴스는 복구할 수 없습니다.
      </div>
      <div class="modal-footer">
        <div class="ms-auto d-flex gap-2">
          <button type="button" class="btn btn-secondary px-4 py-2" data-bs-dismiss="modal">취소</button>
          <form action="${pageContext.request.contextPath}/news/remove" method="post" class="m-0">
            <input type="hidden" name="news_id" value="${news.news_id}">
            <button type="submit" class="btn btn-danger px-4 py-2">삭제하기</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../includes/footer.jsp" %>