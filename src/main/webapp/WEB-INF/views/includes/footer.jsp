<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="footer py-3 mt-3 bg-light">
  <div class="container mx-auto" style="max-width: 1100px;">
    <div class="row d-flex justify-content-between align-items-center flex-wrap">

      <div class="col-lg-6 col-md-12 text-center text-lg-start mb-4 mb-lg-0">
        <div class="text-muted text-sm mb-2">
          (우)01695 서울 노원구 상계동 617 KD 손해보험(상계동) (주) KD손해보험
        </div>
        <div class="text-muted text-sm mb-2">
          사업자등록번호: 202-81-48370 | KD 손해보험 준법감시인 심의필 제2025-1007호(2025.04.23~2026.04.22)
        </div>
        <div class="text-muted text-sm">
          COPYRIGHT &copy; KD INSURANCE CO. LTD. ALL RIGHTS RESERVED.
        </div>
      </div>

      <%-- 오른쪽 섹션을 왼쪽으로 옮기기 위해 col-lg-4 대신 col-lg-5를 사용하고, 정렬을 조정합니다. --%>
      <%-- text-lg-start를 사용하여 큰 화면에서 왼쪽 정렬로 변경했습니다. --%>
      <div class="col-lg-3 col-md-12 text-center text-lg-start">
        <div class="d-flex flex-column align-items-center align-items-lg-start mb-4">
          <div class="d-flex align-items-center mb-3">
            <img src="${pageContext.request.contextPath}/resources/img/logo-ct-dark5.png" alt="KD손해보험 로고" style="height: 40px; margin-right: 10px;">
            <h6 class="text-dark text-uppercase mb-0">KD 손해보험</h6>
          </div>
          <div class="d-flex justify-content-center justify-content-lg-start gap-1 flex-wrap">
            <img src="${pageContext.request.contextPath}/resources/img/footer-mark1.png" alt="마크1" style="height: 35px;">
            <img src="${pageContext.request.contextPath}/resources/img/footer-mark2.png" alt="마크2" style="height: 35px;">
            <img src="${pageContext.request.contextPath}/resources/img/footer-mark4.png" alt="마크3" style="height: 35px;">
          </div>
        </div>
      </div>

    </div>
  </div>
</footer>

<script src="https://kit.fontawesome.com/YOUR_KIT_CODE.js" crossorigin="anonymous"></script>

</body>
</html>

