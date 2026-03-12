<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="대시보드" />
<%@ include file="../includes/header.jsp"%>

<div class="container-fluid py-4">
    <div class="row align-items-stretch">
	    <div class="col-xl-6 col-sm-6 mb-4">
	        <a href="${pageContext.request.contextPath}/news/list" class="summary-card-link d-block h-100">
	            <div class="card summary-card news-card">
	                <div class="card-body text-center d-flex flex-column justify-content-center align-items-center">
	                    <i class="fas fa-newspaper news-icon"></i>
	                    <h6 class="news-title"><i class="fas fa-arrow-right me-2"></i>주간 뉴스 보러가기</h6>
	                </div>
	            </div>
	        </a>
	    </div>
	
	    <div class="col-xl-6 col-sm-12 mb-4">
	        <div class="card summary-card schedule-card h-100">
	            <div class="card-body text-center d-flex flex-column justify-content-center">
	                <h6 class="schedule-title"><i class="fas fa-calendar-alt me-2"></i>이번주 주요 일정</h6>
	                <div class="schedule-container mt-3">
	                    <ul id="scheduleList" class="schedule-list">
	                        <li><span class="schedule-date">8/5(월)</span> - 영업팀 주간 회의</li>
	                        <li><span class="schedule-date">8/6(화)</span> - 신규 계약자 상담 일정</li>
	                        <li><span class="schedule-date">8/7(수)</span> - 피보험자 시스템 점검</li>
	                        <li><span class="schedule-date">8/8(목)</span> - 마케팅 전략 회의</li>
	                        <li><span class="schedule-date">8/9(금)</span> - 계약 갱신 보고서 마감</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

    <div class="row">
        <div class="col-xl-3 col-sm-6 mb-4">
            <a href="${pageContext.request.contextPath}/customer/list" class="summary-card-link">
                <div class="card summary-card">
                    <div class="card-body">
                        <h6><i class="fas fa-users me-2"></i>전체 고객 수</h6>
                        <h3>${totalCustomers}</h3>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-sm-6 mb-4">
            <a href="${pageContext.request.contextPath}/insuredperson/list" class="summary-card-link">
                <div class="card summary-card">
                    <div class="card-body">
                        <h6><i class="fas fa-user-shield me-2"></i>전체 피보험자 수</h6>
                        <h3>${totalInsured}</h3>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-sm-6 mb-4">
            <a href="${pageContext.request.contextPath}/contract/list" class="summary-card-link">
                <div class="card summary-card">
                    <div class="card-body">
                        <h6><i class="fas fa-file-contract me-2"></i>전체 계약 수</h6>
                        <h3>${totalContracts}</h3>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-sm-6 mb-4">
            <a href="${pageContext.request.contextPath}/notice/list" class="summary-card-link">
                <div class="card summary-card">
                    <div class="card-body">
                        <h6><i class="fas fa-bullhorn me-2"></i>전체 공지사항 수</h6>
                        <h3>${totalNotices}</h3>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card chart-card">
                <div class="card-body">
                    <div class="section-title"><i class="fas fa-chart-bar me-2"></i>월별 계약 수</div>
                    <canvas id="monthlyChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card chart-card">
                <div class="card-body">
                    <div class="section-title"><i class="fas fa-chart-pie me-2"></i>상품별 계약 분포</div>
                    <canvas id="productPie"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="card mb-4">
        <div class="card-body">
            <div class="section-title"><i class="fas fa-clipboard-list me-2"></i>최근 등록 계약</div>
            <div class="table-responsive">
                <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                            <th>고객 ID</th>
                            <th>고객명</th>
                            <th>피보험자명</th>
                            <th>상품명</th>
                            <th>계약 시작일</th>
                            <th>계약 종료일</th>
                            <th>계약 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="contract" items="${recentContracts}">
                            <tr class="clickable-row" data-href="${pageContext.request.contextPath}/contract/get?contract_id=${contract.contract_id}">
                                <td>${contract.customer_id}</td>
                                <td>${contract.customerName}</td>
                                <td>${contract.insuredName}</td>
                                <td>${contract.product_name}</td>
                                <td><fmt:formatDate value="${contract.start_date}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${contract.end_date}" pattern="yyyy-MM-dd"/></td>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${contract.status eq 'ACTIVE'}">
                                            <span class="badge badge-sm bg-gradient-success">정상</span>
                                        </c:when>
                                        <c:when test="${contract.status eq 'CANCELED'}">
                                            <span class="badge badge-sm bg-gradient-danger">해지</span>
                                        </c:when>
                                        <c:when test="${contract.status eq 'EXPIRED'}">
                                            <span class="badge badge-sm bg-gradient-secondary">만료</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-sm bg-gradient-info">기타</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty recentContracts}">
                            <tr>
                                <td colspan="7" class="text-center">최근 등록된 계약이 없습니다.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="section-title"><i class="fas fa-bell me-2"></i>최근 공지사항</div>
            <div class="table-responsive">
                <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                            <th>공지 번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="notice" items="${recentNotices}">
                            <tr class="clickable-row" data-href="${pageContext.request.contextPath}/notice/get?notice_id=${notice.notice_id}">
                                <td>${notice.notice_id}</td>
                                <td class="text-center">
                                    <c:if test="${notice.important == 'Y'}">
                                        <span class="badge bg-danger me-1"><i class="fas fa-exclamation-circle"></i> 중요</span>
                                    </c:if>
                                    ${notice.title}
                                </td>
                                <td>${notice.writer}</td>
                                <td><fmt:formatDate value="${notice.reg_date}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty recentNotices}">
                            <tr>
                                <td colspan="4" class="text-center">최근 등록된 공지사항이 없습니다.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        new Chart(document.getElementById('monthlyChart'), {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                datasets: [{
                    label: '계약 수',
                    data: [3, 7, 4, 6, 8, 5, 7, 4, 6, 8, 9, 10],
                    backgroundColor: '#2D4470',
                    borderRadius: 5,
                }]
            },
            options: {
            	responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                barPercentage: 0.5,
                categoryPercentage: 0.7,
                scales: {
                    x: { grid: { display: false } },
                    y: { beginAtZero: true, ticks: { stepSize: 1 } }
                }
            }
        });

        new Chart(document.getElementById('productPie'), {
            type: 'pie',
            data: {
                labels: ['실손보험', '암보험', '운전자보험'],
                datasets: [{
                    data: [40, 25, 35],
                    backgroundColor: ['#4299E1', '#F6AD55', '#48BB78', '#ED8936', '#9F7AEA'],
                    hoverOffset: 10,
                    borderColor: '#fff',
                    borderWidth: 2
                }]
            },
            options: { 
            	responsive: true,
                maintainAspectRatio: false }
        });

        const rows = document.querySelectorAll('.clickable-row');
        rows.forEach(row => {
            row.addEventListener('click', () => {
                const href = row.getAttribute('data-href');
                if (href) window.location.href = href;
            });
        });
        
     // 일정 더미 텍스트 자동 변경 (스크롤업 애니메이션)
        const schedules = [
            "8/5(월) - 영업팀 주간 회의",
            "8/6(화) - 신규 계약자 상담 일정",
            "8/7(수) - 피보험자 시스템 점검",
            "8/8(목) - 마케팅 전략 회의",
            "8/9(금) - 계약 갱신 보고서 마감"
        ];

        const scheduleList = document.getElementById("scheduleList");
        scheduleList.innerHTML = ''; // 기존 HTML 초기화 

		
        // 스케줄 리스트를 DOM에 추가
        schedules.forEach(schedule => {
            const li = document.createElement("li");
            li.textContent = schedule;
            scheduleList.appendChild(li);
        });

        // 애니메이션이 부드럽게 반복되도록 첫 번째 항목을 복제하여 마지막에 추가
        const firstSchedule = scheduleList.querySelector("li").cloneNode(true);
        scheduleList.appendChild(firstSchedule); 
        
    });
</script>

<%@ include file="../includes/footer.jsp"%>