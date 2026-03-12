<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="공지사항 상세보기" />
<%@ include file="../includes/header.jsp" %>

<div class="container py-5">
    <div class="card shadow-lg border-0 rounded-3 mx-auto" style="max-width: 800px;">
        <div class="card-header text-white text-center py-3 rounded-top-3" style="background-color: #2D4470;">
            <h4 class="mb-0 fw-bold">공지사항 상세보기</h4>
        </div>

        <div class="card-body p-4">
            <div class="d-flex align-items-center mb-3">
                <h5 class="mb-0 fw-bolder text-dark flex-grow-1">
                    <c:if test="${notice.important == 'Y'}">
                        <span class="badge bg-danger me-2"><i class="fas fa-exclamation-circle"></i> 중요</span>
                    </c:if>
                    ${notice.title}
                </h5>
                <small class="text-muted text-end">
                    <i class="fas fa-eye me-1"></i> 조회수: ${notice.view_count}
                </small>
            </div>
            <hr class="my-3">

            <div class="d-flex justify-content-between align-items-center mb-4">
                <p class="text-muted mb-0">
                    <i class="fas fa-user-edit me-1"></i> 작성자: <span class="fw-bold">${notice.writer}</span>
                </p>
                <p class="text-muted mb-0">
                    <i class="fas fa-calendar-alt me-1"></i> 등록일: <span class="fw-bold"><fmt:formatDate value="${notice.reg_date}" pattern="yyyy-MM-dd HH:mm" /></span>
                </p>
            </div>

            <div class="mb-4 p-3 bg-light rounded-3 border">
                <p class="lead mb-0 text-dark" style="white-space: pre-wrap;">${notice.content}</p>
            </div>
            
            <hr class="my-4">
            
            <!-- 댓글 추가 UI -->
            <div class='row'>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading d-flex justify-content-between align-items-baseline">
                            <div class="d-flex align-items-baseline">
                                <i class="fa fa-comments fa-fw mr-8" style="color:#2D4470;"></i> <p class="ml-3">Reply</p>
                            </div>
                            <button id='addReplyBtn' class='btn btn-secondary btn-xs pull-right'
                                style="background-color: #fff; color: #2D4470; border:1px solid #2D4470; padding:0 0.5rem; font-size:0.75rem;"
                                data-bs-toggle="modal" data-bs-target="#myModal">New Reply</button>
                        </div>
                        <div class="panel-body">
                            <ul class="chat" id="replyList" style="cursor:pointer;"></ul>
                            <div id="replyPaging" class="mt-3"></div>
                        </div>
                        <div class="panel-footer"></div>
                    </div>
                </div>
            </div>
			
            <!-- 댓글 등록 모달 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">NEW REPLY</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Reply</label>
                                <input class="form-control" name='reply' value='New Reply!!!!'>
                            </div>
                            <div class="form-group">
                                <label>Replyer</label>
                                <input class="form-control" name='replyer' value='replyer'>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id='modalRegisterBtn' type="button" class="btn btn-secondary" style="background-color:#2D4470;">Register</button>
                            <button id='modalCloseBtn' type="button" data-bs-dismiss="modal" class="btn btn-default">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            

            <hr class="my-4">

            <div class="d-flex justify-content-end gap-2">
                <a href="${pageContext.request.contextPath}/notice/list" class="btn btn-outline-secondary px-4 py-2">
                    <i class="fas fa-list me-1"></i> 목록
                </a>
                <a href="${pageContext.request.contextPath}/notice/modify?notice_id=${notice.notice_id}" class="btn text-white px-4 py-2" style="background-color: #2D4470;">
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
        <h5 class="modal-title" id="deleteConfirmModalLabel">공지사항 삭제 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말로 이 공지사항을 삭제하시겠습니까? <br> 삭제된 공지사항은 복구할 수 없습니다.
      </div>
      <div class="modal-footer">
        <div class="ms-auto d-flex gap-2">
          <button type="button" class="btn btn-secondary px-4 py-2" data-bs-dismiss="modal">취소</button>
          <form action="${pageContext.request.contextPath}/notice/remove" method="post" class="m-0">
            <input type="hidden" name="notice_id" value="${notice.notice_id}">
            <button type="submit" class="btn btn-danger px-4 py-2">삭제하기</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  const notice_id = ${notice.notice_id};
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/noticeReply.js"></script>

<%@ include file="../includes/footer.jsp" %>