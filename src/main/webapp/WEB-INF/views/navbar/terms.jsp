<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header.jsp 포함 --%>
<%@ include file="../includes/terms.jsp"%>

<div class="d-flex" style="min-height: 100vh;">
    <%-- 왼쪽 사이드바 - 설정 메뉴 --%>
    <div class="text-white p-3 shadow-sm" style="width: 250px; flex-shrink: 0; background-color: #2D4470 !important;">
        <!-- <h5 class="fw-bold mb-4">시스템 설정</h5> -->
        <h5 class="fw-bold mb-4">
        <a href="${pageContext.request.contextPath}/navbar/dashboard" style="text-decoration: none; color: inherit;">
            <img src="${pageContext.request.contextPath}/resources/img/logo-ct-dark4.png" alt="KD 손해보험 로고"
                 alt="시스템 설정 아이콘" 
                 style="height: 24px; vertical-align: middle; margin-right: 8px;"> 
            손해보험 
        </h5>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a href="#" class="nav-link text-white-50 py-2 hover-white rounded-0">회사 정보</a>
            </li>
            <li class="nav-item">
                <a href="/navbar/auth" class="nav-link text-white-50 py-2 hover-white rounded-0">관리자</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link text-white-50 py-2 hover-white rounded-0">근무 정책</a>
            </li>
            <li class="nav-item">
                <a href="/navbar/system" class="nav-link text-white-50 py-2 hover-white rounded-0">보안</a>
            </li>
            <li class="nav-item">
                <%-- '약관 관리' 메뉴 활성화 상태로 표시 --%>
                <a href="/navbar/terms" class="nav-link active fw-bold py-2 rounded-0" style="background-color: rgba(255,255,255,0.1); color: #fff !important;" aria-current="page">약관 관리</a>
            </li>
        </ul>
    </div>

    <%-- 메인 콘텐츠 영역 --%>
    <div class="flex-grow-1" style="background-color: #ffffff;">
        <div class="card border-0 rounded-0 shadow-sm h-100">
            <div class="card-header text-white py-3 rounded-0" style="background-color: #2D4470 !important;">
                <h4 class="mb-0 fw-bold"><i class="fas fa-file-alt me-2"></i> 약관 관리</h4>
            </div>
            <div class="card-body p-4">
                <p class="text-muted mb-4">
                    Alegria_Insurance의 보험 약관을 효율적으로 관리하고 최신 버전을 유지합니다.<br>
                    실손 보험, 암 보험, 운전자 보험, 여행자 보험, 치아 보험, 어린이 보험 등 각 보험 종류별 약관을 추가, 수정, 삭제할 수 있습니다.
                </p>

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h5 class="mb-0">
                            총 <span class="badge rounded-pill ms-1" style="background-color: #e2f0ff; color: #2D4470;">12개</span>의 약관
                        </h5>
                    </div>
                    <button class="btn px-4 py-2 shadow-sm" style="background-color: #2D4470; color: #fff; border-radius: 0.35rem;" data-bs-toggle="modal" data-bs-target="#addEditModal">
                        <i class="fas fa-plus me-2"></i> 새 약관 추가
                    </button>
                </div>

                <div class="table-responsive border rounded" style="border-color: #e0e0e0 !important;">
                    <table class="table table-hover table-borderless text-center align-middle mb-0" id="termsTable">
                        <thead class="bg-white">
                            <tr>
                                <th scope="col" class="text-center" style="width: 5%;"><input type="checkbox" class="form-check-input"></th>
                                <th scope="col" class="text-start" style="width: 25%;">약관명</th>
                                <th scope="col" style="width: 15%;">보험 종류</th>
                                <th scope="col" style="width: 15%;">버전</th>
                                <th scope="col" style="width: 20%;">최종 수정일</th>
                                <th scope="col" style="width: 20%;">관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- 예시 데이터: data-* 속성 추가 --%>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_실손보험_표준약관_2024</td>
                                <td>실손 보험</td>
                                <td>V 1.2</td>
                                <td>2024-06-15</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_실손보험_표준약관_2024"
                                            data-type="실손 보험"
                                            data-version="V 1.2"
                                            data-date="2024-06-15"
                                            data-content="실손 보험 표준약관 내용입니다. 국민건강보험 또는 의료급여법에 의해 보장하지 않는 비급여 의료비를 보장합니다. 본 약관은 2024년 6월 15일부로 시행됩니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_실손보험_표준약관_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_실손보험_특약1_2024</td>
                                <td>실손 보험</td>
                                <td>V 1.0</td>
                                <td>2024-01-01</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_실손보험_특약1_2024"
                                            data-type="실손 보험"
                                            data-version="V 1.0"
                                            data-date="2024-01-01"
                                            data-content="실손 보험 특약1에 대한 상세 내용입니다. 특정 질병 및 치료에 대한 추가 보장 내용을 포함합니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_실손보험_특약1_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_암보험_기본형_2023</td>
                                <td>암 보험</td>
                                <td>V 2.1</td>
                                <td>2023-11-20</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_암보험_기본형_2023"
                                            data-type="암 보험"
                                            data-version="V 2.1"
                                            data-date="2023-11-20"
                                            data-content="암 보험 기본형 약관입니다. 진단비, 수술비, 입원비 등 암 관련 비용을 보장합니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_암보험_기본형_2023.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_암보험_고급형_2024</td>
                                <td>암 보험</td>
                                <td>V 1.0</td>
                                <td>2024-03-01</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_암보험_고급형_2024"
                                            data-type="암 보험"
                                            data-version="V 1.0"
                                            data-date="2024-03-01"
                                            data-content="암 보험 고급형 약관입니다. 기본형보다 넓은 범위의 암 관련 비용을 보장하며, 특정 고액암에 대한 보장이 강화되었습니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_암보험_고급형_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_운전자보험_기본약관_2024</td>
                                <td>운전자 보험</td>
                                <td>V 1.1</td>
                                <td>2024-04-10</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_운전자보험_기본약관_2024"
                                            data-type="운전자 보험"
                                            data-version="V 1.1"
                                            data-date="2024-04-10"
                                            data-content="운전자 보험 기본약관입니다. 교통사고처리지원금, 변호사 선임비용, 벌금 등을 보장합니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_운전자보험_기본약관_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                             <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_운전자보험_특약_변동사항_2024</td>
                                <td>운전자 보험</td>
                                <td>V 1.0</td>
                                <td>2024-05-01</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_운전자보험_특약_변동사항_2024"
                                            data-type="운전자 보험"
                                            data-version="V 1.0"
                                            data-date="2024-05-01"
                                            data-content="운전자 보험 특약 변동사항입니다. 특정 상황에서의 보장 확대 또는 축소 내용입니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_운전자보험_특약_변동사항_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_여행자보험_기본_2024</td>
                                <td>여행자 보험</td>
                                <td>V 1.0</td>
                                <td>2024-07-01</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_여행자보험_기본_2024"
                                            data-type="여행자 보험"
                                            data-version="V 1.0"
                                            data-date="2024-07-01"
                                            data-content="여행자 보험 기본약관입니다. 해외여행 중 발생할 수 있는 상해, 질병, 휴대품 손해 등을 보장합니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_여행자보험_기본_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_여행자보험_해외_특약_2024</td>
                                <td>여행자 보험</td>
                                <td>V 1.0</td>
                                <td>2024-07-05</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_여행자보험_해외_특약_2024"
                                            data-type="여행자 보험"
                                            data-version="V 1.0"
                                            data-date="2024-07-05"
                                            data-content="여행자 보험 해외 특약입니다. 해외 의료비, 긴급 송환 비용 등 해외 여행에 특화된 추가 보장 내용입니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_여행자보험_해외_특약_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_치아보험_일반형_2024</td>
                                <td>치아 보험</td>
                                <td>V 1.0</td>
                                <td>2024-06-20</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_치아보험_일반형_2024"
                                            data-type="치아 보험"
                                            data-version="V 1.0"
                                            data-date="2024-06-20"
                                            data-content="치아 보험 일반형 약관입니다. 충치 치료, 잇몸 질환, 스케일링 등 일반적인 치과 치료 비용을 보장합니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_치아보험_일반형_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_치아보험_프리미엄_2024</td>
                                <td>치아 보험</td>
                                <td>V 1.0</td>
                                <td>2024-06-25</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_치아보험_프리미엄_2024"
                                            data-type="치아 보험"
                                            data-version="V 1.0"
                                            data-date="2024-06-25"
                                            data-content="치아 보험 프리미엄 약관입니다. 임플란트, 브릿지, 크라운 등 고액 치료 비용에 대한 보장이 강화된 내용입니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_치아보험_프리미엄_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr class="border-bottom">
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_어린이보험_기본_2024</td>
                                <td>어린이 보험</td>
                                <td>V 1.0</td>
                                <td>2024-07-10</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_어린이보험_기본_2024"
                                            data-type="어린이 보험"
                                            data-version="V 1.0"
                                            data-date="2024-07-10"
                                            data-content="어린이 보험 기본 약관입니다. 어린이에게 흔한 질병, 상해, 배상 책임 등을 종합적으로 보장합니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_어린이보험_기본_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center"><input type="checkbox" class="form-check-input"></td>
                                <td class="text-start">Alegria_어린이보험_성장기_특약_2024</td>
                                <td>어린이 보험</td>
                                <td>V 1.0</td>
                                <td>2024-07-15</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1 edit-btn"
                                            data-bs-toggle="modal" data-bs-target="#detailModal"
                                            data-title="Alegria_어린이보험_성장기_특약_2024"
                                            data-type="어린이 보험"
                                            data-version="V 1.0"
                                            data-date="2024-07-15"
                                            data-content="어린이 보험 성장기 특약입니다. 아동기 및 청소년기 성장 단계별로 발생할 수 있는 추가적인 위험을 보장합니다.">수정</button>
                                    <button class="btn btn-sm btn-outline-secondary download-btn" data-file="Alegria_어린이보험_성장기_특약_2024.pdf">다운로드</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="text-start mt-4">
                    <button class="btn btn-danger px-4 py-2 shadow-sm rounded-0"><i class="fas fa-trash-alt me-2"></i> 선택 약관 삭제</button>
                </div>

            </div>
        </div>
    </div>
</div>

<%-- 약관 상세 정보 및 수정 모달 --%>
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #2D4470; color: white;">
                <h5 class="modal-title" id="detailModalLabel">약관 상세 정보 및 수정</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="termsDetailForm">
                    <div class="mb-3">
                        <label for="modalTermsName" class="form-label fw-bold">약관명</label>
                        <input type="text" class="form-control" id="modalTermsName" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="modalTermsType" class="form-label fw-bold">보험 종류</label>
                        <input type="text" class="form-control" id="modalTermsType" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="modalTermsVersion" class="form-label fw-bold">버전</label>
                        <input type="text" class="form-control" id="modalTermsVersion" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="modalTermsDate" class="form-label fw-bold">최종 수정일</label>
                        <input type="text" class="form-control" id="modalTermsDate" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="modalTermsContent" class="form-label fw-bold">약관 내용</label>
                        <textarea class="form-control" id="modalTermsContent" rows="10" readonly></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="modalTermsFile" class="form-label fw-bold">약관 파일</label>
                        <input type="file" class="form-control" id="modalTermsFile" disabled>
                        <small class="form-text text-muted">새로운 파일을 업로드하여 약관을 업데이트할 수 있습니다.</small>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="enableEditBtn" style="background-color: #2D4470; border-color: #2D4470;">수정 모드</button>
                <button type="button" class="btn btn-success" id="saveChangesBtn" style="background-color: #28a745; border-color: #28a745; display: none;">변경 사항 저장</button>
            </div>
        </div>
    </div>
</div>

<%-- 새 약관 추가 모달 (기존 새 약관 추가 버튼과 연결) --%>
<div class="modal fade" id="addEditModal" tabindex="-1" aria-labelledby="addEditModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #2D4470; color: white;">
                <h5 class="modal-title" id="addEditModalLabel">새 약관 추가</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addTermsForm">
                    <div class="mb-3">
                        <label for="addTermsName" class="form-label fw-bold">약관명</label>
                        <input type="text" class="form-control" id="addTermsName" required>
                    </div>
                    <div class="mb-3">
                        <label for="addTermsType" class="form-label fw-bold">보험 종류</label>
                        <select class="form-select" id="addTermsType" required>
                            <option value="">선택하세요</option>
                            <option value="실손 보험">실손 보험</option>
                            <option value="암 보험">암 보험</option>
                            <option value="운전자 보험">운전자 보험</option>
                            <option value="여행자 보험">여행자 보험</option>
                            <option value="치아 보험">치아 보험</option>
                            <option value="어린이 보험">어린이 보험</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="addTermsVersion" class="form-label fw-bold">버전</label>
                        <input type="text" class="form-control" id="addTermsVersion" required>
                    </div>
                    <div class="mb-3">
                        <label for="addTermsContent" class="form-label fw-bold">약관 내용</label>
                        <textarea class="form-control" id="addTermsContent" rows="10"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="addTermsFile" class="form-label fw-bold">약관 파일 업로드</label>
                        <input type="file" class="form-control" id="addTermsFile">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="addTermsSubmitBtn" style="background-color: #2D4470; border-color: #2D4470;">약관 추가</button>
            </div>
        </div>
    </div>
</div>


<script>
    // 기존 스크립트 (테이블에 새 약관 추가 로직 - 현재 이 페이지에서 사용 안 됨)
    // document.getElementById("termsForm").addEventListener("submit", function(e) {
    //   e.preventDefault();
    //   const title = document.getElementById("title").value;
    //   const content = document.getElementById("content").value;
    //   const table = document.getElementById("termsList");
    //   const row = table.insertRow();
    //   const now = new Date().toISOString().slice(0, 10);

    //   row.innerHTML = `
    //     <td>${table.rows.length}</td>
    //     <td>${title}</td>
    //     <td>${now}</td>
    //     <td>
    //       <button class="btn btn-sm btn-secondary">수정</button>
    //       <button class="btn btn-sm btn-danger">다운로드</button>
    //     </td>
    //   `;

    //   document.getElementById("title").value = "";
    //   document.getElementById("content").value = "";
    // });

    // 1. "수정" 버튼 클릭 시 모달 열기 및 데이터 채우기
    document.addEventListener('DOMContentLoaded', function() {
        const detailModal = new bootstrap.Modal(document.getElementById('detailModal'));
        const modalTermsName = document.getElementById('modalTermsName');
        const modalTermsType = document.getElementById('modalTermsType');
        const modalTermsVersion = document.getElementById('modalTermsVersion');
        const modalTermsDate = document.getElementById('modalTermsDate');
        const modalTermsContent = document.getElementById('modalTermsContent');
        const modalTermsFile = document.getElementById('modalTermsFile');
        const enableEditBtn = document.getElementById('enableEditBtn');
        const saveChangesBtn = document.getElementById('saveChangesBtn');

        document.querySelectorAll('.edit-btn').forEach(button => {
            button.addEventListener('click', function() {
                const title = this.dataset.title;
                const type = this.dataset.type;
                const version = this.dataset.version;
                const date = this.dataset.date;
                const content = this.dataset.content;

                modalTermsName.value = title;
                modalTermsType.value = type;
                modalTermsVersion.value = version;
                modalTermsDate.value = date;
                modalTermsContent.value = content;

                // 수정 모드 비활성화 (초기 상태)
                modalTermsName.readOnly = true;
                modalTermsType.readOnly = true;
                modalTermsVersion.readOnly = true;
                modalTermsDate.readOnly = true;
                modalTermsContent.readOnly = true;
                modalTermsFile.disabled = true;

                enableEditBtn.style.display = 'inline-block'; // 수정 모드 버튼 보이기
                saveChangesBtn.style.display = 'none'; // 저장 버튼 숨기기
            });
        });

        // 2. "수정 모드" 버튼 클릭 시 입력 필드 활성화
        enableEditBtn.addEventListener('click', function() {
            modalTermsName.readOnly = false;
            modalTermsType.readOnly = false;
            modalTermsVersion.readOnly = false;
            modalTermsDate.readOnly = false; // 날짜도 수정 가능하게 하려면
            modalTermsContent.readOnly = false;
            modalTermsFile.disabled = false;

            this.style.display = 'none'; // 수정 모드 버튼 숨기기
            saveChangesBtn.style.display = 'inline-block'; // 저장 버튼 보이기
        });

        // 3. "변경 사항 저장" 버튼 클릭 시 (실제 서버 통신 필요)
        saveChangesBtn.addEventListener('click', function() {
            // 여기에 수정된 약관 데이터를 서버로 전송하는 AJAX 또는 form submit 로직 구현
            // 예시:
            const updatedData = {
                title: modalTermsName.value,
                type: modalTermsType.value,
                version: modalTermsVersion.value,
                date: modalTermsDate.value,
                content: modalTermsContent.value,
                // file: modalTermsFile.files[0] // 파일 업로드 처리
            };
            console.log('변경된 약관 데이터:', updatedData);

            alert('변경 사항이 저장되었습니다. (실제 서버에는 전송되지 않았습니다)');
            detailModal.hide(); // 모달 닫기
            // 성공 시 테이블 데이터도 업데이트 (필요시)
        });

        // 4. "다운로드" 버튼 클릭 시 파일 다운로드 (실제 파일 경로 필요)
        document.querySelectorAll('.download-btn').forEach(button => {
            button.addEventListener('click', function() {
                const fileName = this.dataset.file;
                // 실제 다운로드할 파일의 경로로 변경해야 합니다.
                // 예: /resources/terms/Alegria_실손보험_표준약관_2024.pdf
                const fileUrl = "${pageContext.request.contextPath}/resources/terms/" + fileName;
                window.open(fileUrl, '_blank'); // 새 탭에서 열어 다운로드 유도
            });
        });

        // 5. "새 약관 추가" 버튼 클릭 시 모달 초기화
        const addEditModal = document.getElementById('addEditModal');
        addEditModal.addEventListener('show.bs.modal', function () {
            document.getElementById('addTermsForm').reset(); // 폼 필드 초기화
            document.getElementById('addEditModalLabel').textContent = '새 약관 추가'; // 제목 설정 (재사용 대비)
            document.getElementById('addTermsSubmitBtn').textContent = '약관 추가'; // 버튼 텍스트 설정
        });

        // 6. "약관 추가" 버튼 클릭 시 (실제 서버 통신 필요)
        document.getElementById('addTermsSubmitBtn').addEventListener('click', function() {
            const addTermsName = document.getElementById('addTermsName').value;
            const addTermsType = document.getElementById('addTermsType').value;
            const addTermsVersion = document.getElementById('addTermsVersion').value;
            const addTermsContent = document.getElementById('addTermsContent').value;
            const addTermsFile = document.getElementById('addTermsFile').files[0];

            if (!addTermsName || !addTermsType || !addTermsVersion) {
                alert('필수 입력 필드를 채워주세요 (약관명, 보험 종류, 버전).');
                return;
            }

            const newTermsData = {
                name: addTermsName,
                type: addTermsType,
                version: addTermsVersion,
                content: addTermsContent,
                file: addTermsFile ? addTermsFile.name : null // 파일 이름만 예시로
            };
            console.log('새 약관 데이터:', newTermsData);

            alert('새 약관이 추가되었습니다. (실제 서버에는 전송되지 않았습니다)');
            // 실제로는 서버로 데이터 전송 후 성공 시 테이블에 새 행 추가
            addEditModal.querySelector('.btn-close').click(); // 모달 닫기
            location.reload(); // 페이지 새로고침 (간단한 예시, 실제로는 AJAX 후 DOM 조작 권장)
        });
    });
</script>

<%-- footer.jsp 포함 --%>
<%@ include file="../includes/footer.jsp"%>