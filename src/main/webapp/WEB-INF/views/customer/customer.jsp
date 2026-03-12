<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>고객 검색 팝업</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            max-width: 800px;
            margin-top: 2rem;
        }
        h3.text-primary {
            color: #344767 !important;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem !important;
        }
        .table thead {
            background-color: #f0f2f5;
        }
        .table th {
            color: #6c757d;
            font-weight: 600;
            text-align: center;
        }
        .table td {
            text-align: center;
        }
        .btn-outline-primary {
            color: #2D4470;
            border-color: #2D4470;
            border-radius: 0.5rem;
        }
        .btn-outline-primary:hover {
            background-color: #2D4470;
            color: #ffffff;
        }
        .text-muted-custom {
            color: #929292;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="mb-4 text-primary"><i class="fas fa-search me-2"></i>고객 목록 검색</h3>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>고객 ID</th>
                    <th>고객 이름</th>
                    <th>피보험자 ID</th>
                    <th>피보험자 이름</th>
                    <th>선택</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.customer_id}</td>
                        <td>${customer.name}</td>

                        <!-- 🔹 피보험자 ID 리스트 출력 -->
                        <td>
                            <c:choose>
                                <c:when test="${not empty customer.insuredList}">
                                    <c:forEach var="insured" items="${customer.insuredList}">
                                        ${insured.insured_id}<br/>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted-custom">없음</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <!-- 🔹 피보험자 이름 리스트 출력 -->
                        <td>
                            <c:choose>
                                <c:when test="${not empty customer.insuredList}">
                                    <c:forEach var="insured" items="${customer.insuredList}">
                                        ${insured.name}<br/>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted-custom">없음</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <button type="button" class="btn btn-sm btn-outline-primary"
                                onclick="selectCustomer('${customer.customer_id}', '${customer.name}')">
                                선택
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty customerList}">
                    <tr>
                        <td colspan="5" class="text-center py-4">
                            <i class="fas fa-info-circle me-2"></i>검색된 고객이 없습니다.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<script>
    function selectCustomer(customerId, customerName) {
        if (window.opener && !window.opener.closed) {
            window.opener.setCustomerFromPopup(customerId, customerName);
            window.close();
        } else {
            alert("부모창이 닫혔습니다.");
        }
    }

    // 테이블 클릭 시 선택
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.table tbody tr').forEach(row => {
            row.addEventListener('click', function(event) {
                if (!event.target.closest('button')) {
                    const customerId = this.cells[0].innerText;
                    const customerName = this.cells[1].innerText;
                    selectCustomer(customerId, customerName);
                }
            });
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
