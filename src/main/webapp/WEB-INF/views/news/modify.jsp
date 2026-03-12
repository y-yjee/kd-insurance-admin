<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="주간 뉴스 기사 수정" />
<%@ include file="../includes/header.jsp" %>

<div class="container py-5">
  <div class="card shadow-lg border-0 rounded-3 mx-auto" style="max-width: 600px;">
    <div class="card-header text-white text-center py-3 rounded-top-3" style="background-color: #2D4470;">
      <h4 class="mb-0 fw-bold">주간 뉴스 기사 수정</h4>
    </div>

    <div class="card-body p-4">
      <form action="${pageContext.request.contextPath}/news/modify" method="post">
        <input type="hidden" name="news_id" value="${news.news_id}">

        <div class="mb-4">
          <div class="form-check form-switch d-flex align-items-center">
            <input type="checkbox" name="important" value="Y" class="form-check-input me-2" id="importantCheckbox"
              <c:if test="${news.important eq 'Y'}">checked</c:if>>
            <label class="form-check-label text-muted fw-normal" for="importantCheckbox">
              <i class="fas fa-thumbtack me-1 text-primary"></i> 중요 뉴스로 설정
            </label>
          </div>
        </div>

        <div class="mb-4">
          <label for="newsTitle" class="form-label fw-bold text-dark">
            <span class="text-danger">*</span> 제목
          </label>
          <input type="text" name="title" id="newsTitle" class="form-control form-control-lg"
            value="${news.title}" placeholder="주간 뉴스 제목을 입력하세요" required>
        </div>

        <div class="mb-4">
          <label for="newsContent" class="form-label fw-bold text-dark">
            <span class="text-danger">*</span> 내용
          </label>
          <textarea name="content" id="newsContent" rows="10" class="form-control"
            placeholder="주간 뉴스 기사 내용을 상세히 입력하세요" required>${news.content}</textarea>
        </div>

        <div class="mb-4">
          <label for="newsWriter" class="form-label fw-bold text-dark">작성자</label>
          <input type="text" name="writer" id="newsWriter" class="form-control"
            value="${news.writer}" required readonly>
          <div class="form-text text-muted">작성자는 기본값으로 '관리자'로 설정되며 수정할 수 없습니다.</div>
        </div>

        <div class="d-flex justify-content-end gap-2">
          <a href="${pageContext.request.contextPath}/news/list" class="btn btn-outline-secondary px-4 py-2">
            <i class="fas fa-list me-1"></i> 목록
          </a>
          <button type="button" class="btn btn-danger px-4 py-2" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
            <i class="fas fa-trash-alt me-1"></i> 삭제
          </button>
          <button type="submit" class="btn text-white px-4 py-2" style="background-color: #2D4470;">
            <i class="fas fa-edit me-1"></i> 수정
          </button>
        </div>
      </form>
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
          <button type="button" class="btn btn-secondary py-2 px-4" data-bs-dismiss="modal">취소</button>

          <form action="${pageContext.request.contextPath}/news/remove" method="post" class="m-0">
            <input type="hidden" name="news_id" value="${news.news_id}">
            <button type="submit" class="btn btn-danger py-2 px-4">삭제하기</button>
          </form>
        </div>
      </div>

    </div>
  </div>
</div>

<%@ include file="../includes/footer.jsp" %>