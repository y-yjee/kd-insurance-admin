<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="주간 뉴스 기사 리스트" />
<%@ include file="../includes/header.jsp" %>

<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="display-4 fw-bold" style="background: linear-gradient(90deg, #1E3A8A, #3B82F6); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
            주간 뉴스 기사
        </h2>
        <p class="lead text-muted mt-3">클릭하면 주간 뉴스 상세 페이지로 이동합니다.</p>
    </div>

    <div class="news-list-container">
        <div class="row row-cols-1 g-4">
            <c:forEach var="news" items="${list}">
			    <div class="col">
			        <a href="${pageContext.request.contextPath}/news/get?news_id=${news.news_id}" 
			           class="card shadow-sm border-0 text-decoration-none card-hover-effect fixed-card-height">
			            <div class="card-body d-flex flex-column">
			
			                <%-- 중요 배지 (중앙 정렬) --%>
			                <c:if test="${news.important == 'Y'}">
			                    <div class="text-center mb-2">
			                        <span class="badge bg-danger"><i class="fas fa-star me-1"></i> 중요</span>
			                    </div>
			                </c:if>
			
			                <%-- 제목 (중앙 정렬) --%>
			                <h4 class="card-title fw-bold text-center mb-3 mt-4">${news.title}</h4>
			
			                <%-- 작성자 왼쪽 / 등록일 오른쪽 --%>
			                <div class="d-flex justify-content-between mb-2 mt-2 small text-muted">
			                    <span><i class="fas fa-user me-1"></i>작성자 : ${news.writer}</span>
			                    <span><i class="fas fa-calendar-alt me-1"></i>등록일 : <fmt:formatDate value="${news.published_date}" pattern="yyyy-MM-dd" /></span>
			                </div>
			
			                <%-- 본문 --%>
			                <p class="lead mb-3 px-3"
							   style="white-space: pre-line; text-align: left; overflow-y: auto; max-height: 500px;">
							   ${news.content}
							</p>
			
			                <%-- 구분선 --%>
			                <hr class="my-2">
			
			                <%-- 조회수 오른쪽 정렬 --%>
			                <div class="d-flex justify-content-end small text-muted">
			                    <span><i class="fas fa-eye me-1"></i>${news.view_count}</span>
			                </div>
			
			            </div>
			        </a>
			    </div>
			</c:forEach>

            <%-- 데이터 없을 때 --%>
            <c:if test="${empty list}">
                <div class="col-12">
                    <div class="text-center py-5 text-muted card shadow-sm border-0">
                        <div class="card-body">
                            등록된 주간 뉴스 기사가 없습니다.
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <c:if test="${pageMaker.total > 0}">
    <nav aria-label="Page navigation" >
        <ul class="pagination justify-content-center">

            <c:if test="${pageMaker.prev}">
                <li class="page-item">
                    <a class="page-link" href="?pageNum=${pageMaker.startPage - 1}&amount=${pageMaker.cri.amount}">이전</a>
                </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                    <a class="page-link" href="?pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
                <li class="page-item">
                    <a class="page-link" href="?pageNum=${pageMaker.endPage + 1}&amount=${pageMaker.cri.amount}">다음</a>
                </li>
            </c:if>

        </ul>
    </nav>
</c:if>

    <hr class="my-4">

    <div class="d-flex justify-content-end mt-4">
        <a href="${pageContext.request.contextPath}/news/register" class="btn text-white px-4 py-2" style="background-color: #1E3A8A;">
            <i class="fas fa-plus-circle me-1"></i> 주간 뉴스 기사 등록
        </a>
    </div>
</div>


<%@ include file="../includes/footer.jsp" %>