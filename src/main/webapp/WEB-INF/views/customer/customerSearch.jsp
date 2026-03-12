<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 검색 팝업</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome Icons (Material Dashboard 3에서 사용) -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- Custom CSS for Material Dashboard 3 look -->
    <style>
        body {
            font-family: 'Inter', sans-serif; /* Material Dashboard 3 폰트 */
            background-color: #f8f9fa; /* Material Dashboard 3 배경색 */
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            border-radius: 0.75rem; /* 둥근 모서리 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
            padding: 2rem;
            max-width: 800px; /* 팝업 최대 너비 설정 */
            margin-top: 2rem;
        }
        h5.text-primary { /* h5 태그에 맞게 셀렉터 변경 */
            color: #344767 !important; /* Material Dashboard 3 기본 텍스트 색상 */
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem !important;
        }
        .table {
            border-radius: 0.5rem; /* 테이블 자체도 둥근 모서리 */
            overflow: hidden; /* 둥근 모서리 적용을 위해 */
        }
        .table thead {
            background-color: #f0f2f5; /* 헤더 배경색 */
        }
        .table th {
            color: #6c757d;
            font-weight: 600;
            padding: 1rem 0.75rem; /* 헤더 패딩 조정 */
            text-align: center; /* 헤더 텍스트 가운데 정렬 */
            border-bottom: 2px solid #e9ecef;
        }
        .table td {
            padding: 0.8rem 0.75rem; /* 셀 패딩 조정 */
            vertical-align: middle;
            text-align: center; /* 모든 셀 텍스트 가운데 정렬 */
            border-top: 1px solid #e9ecef;
        }
        .table-hover tbody tr:hover {
            background-color: #e9ecef; /* 호버 시 배경색 */
            cursor: pointer;
        }
        .btn-outline-primary { /* 버튼 스타일을 Material Dashboard 3에 맞게 변경 */
            color: #2D4470; /* KD 손해보험 네이비 */
            border-color: #2D4470;
            border-radius: 0.5rem; /* 둥근 버튼 */
            transition: all 0.2s ease-in-out;
        }
        .btn-outline-primary:hover {
            background-color: #2D4470;
            color: #ffffff;
            box-shadow: 0 2px 5px rgba(45, 68, 112, 0.3); /* 호버 시 그림자 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h5 class="text-primary mb-3">
            <i class="fas fa-user-plus me-2"></i>고객 검색
        </h5>
        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th scope="col">고객 ID</th>
                        <th scope="col">이름</th>
                        <th scope="col">선택</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customerList}">
                        <tr>
                            <td>${customer.customer_id}</td>
                            <td>${customer.name}</td>
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
                            <td colspan="3" class="text-center py-4">
                                <i class="fas fa-info-circle me-2"></i>검색된 고객이 없습니다.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // 선택한 고객 정보를 부모창으로 전달
        function selectCustomer(id, name) {
            if (window.opener && !window.opener.closed) {
                opener.setCustomer(id, name); // 부모창 함수 호출
                window.close();               // 팝업 닫기
            } else {
                // 경고 메시지 대신 사용자에게 안내하는 메시지 박스 또는 UI 요소 사용 권장
                const container = document.querySelector('.container');
                const alertDiv = document.createElement('div');
                alertDiv.className = 'alert alert-warning alert-dismissible fade show mt-3';
                alertDiv.setAttribute('role', 'alert');
                alertDiv.innerHTML = `
                    부모창이 닫혔거나 존재하지 않습니다.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                `;
                container.prepend(alertDiv); // 컨테이너 상단에 메시지 추가
                setTimeout(() => alertDiv.remove(), 5000); // 5초 후 메시지 자동 제거
            }
        }

        // 테이블 행 클릭 시에도 선택 기능 동작 (선택 버튼 클릭과 동일)
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('.table tbody tr');
            rows.forEach(row => {
                row.addEventListener('click', function(event) {
                    // 선택 버튼 클릭이 아닌 경우에만 동작
                    if (!event.target.closest('button')) {
                        const customerId = row.cells[0].innerText;
                        const customerName = row.cells[1].innerText;
                        selectCustomer(customerId, customerName);
                    }
                });
            });
        });
    </script>
    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
