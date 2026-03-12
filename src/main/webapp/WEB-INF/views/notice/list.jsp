<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="공지사항 리스트" />
<%@ include file="../includes/header.jsp" %>

<div class="container py-5">
    <div class="card shadow-lg border-0 rounded-3">
        <div class="card-header text-white text-center py-3 rounded-top-3" style="background-color: #2D4470;">
            <h4 class="mb-0 fw-bold">공지사항 리스트</h4>
        </div>
        <div class="card-body p-4">
            <div class="table-responsive">
                <table class="table table-hover align-middle text-center mb-4">
                    <thead class="table-light">
                        <tr>
                            <th class="text-secondary opacity-7 text-uppercase" style="width: 10%;">번호</th>
                            <th class="text-secondary opacity-7 text-uppercase" style="width: 45%;">제목</th> <%-- 제목 컬럼 너비 증가 --%>
                            <th class="text-secondary opacity-7 text-uppercase" style="width: 15%;">작성자</th>
                            <th class="text-secondary opacity-7 text-uppercase" style="width: 15%;">등록일</th>
                            <th class="text-secondary opacity-7 text-uppercase" style="width: 15%;">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="notice" items="${list}">
                            <tr>
                                <td>
                                    <p class="text-xs font-weight-bold mb-0">${notice.notice_id}</p>
                                </td>
                                <td class="text-start"> <%-- 제목은 왼쪽 정렬 --%>
                                    <a href="${pageContext.request.contextPath}/notice/get?notice_id=${notice.notice_id}" class="text-dark text-decoration-none fw-bold">
                                        <c:if test="${notice.important == 'Y'}">
                                            <span class="badge bg-danger me-1"><i class="fas fa-exclamation-circle"></i> 중요</span>
                                        </c:if>
                                        ${notice.title}
                                    </a>
                                </td>
                                <td>
                                    <p class="text-xs font-weight-bold mb-0">${notice.writer}</p>
                                </td>
                                <td>
                                    <p class="text-xs font-weight-bold mb-0"><fmt:formatDate value="${notice.reg_date}" pattern="yyyy-MM-dd" /></p>
                                </td>
                                <td>
                                    <p class="text-xs font-weight-bold mb-0">${notice.view_count}</p>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="5" class="text-center py-4 text-muted">등록된 공지사항이 없습니다.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-end">
                <a href="${pageContext.request.contextPath}/notice/register" class="btn text-white px-4 py-2" style="background-color: #2D4470;">
                    <i class="fas fa-plus-circle me-1"></i> 공지사항 등록
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>