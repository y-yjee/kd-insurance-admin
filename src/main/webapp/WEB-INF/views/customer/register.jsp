<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="고객 관리 - 고객 등록" />
<%@ include file="../includes/header.jsp"%>

<div class="container mt-5">
    <div class="card shadow-lg w-100">
	    <div class="card-header">
	      <h5 class="mb-0">고객 등록</h5>
	    </div>
        <div class="card-body">            
           <form action="${pageContext.request.contextPath}/customer/register" method="post">
               <div class="row">
                   <!-- 왼쪽 -->
                   <div class="col-md-6">
                       <div class="mb-3">
                           <label for="customerId" class="form-label">고객 ID</label>
                           <input type="text" class="form-control form-control-sm" id="customerId" name="customer_id" required>
                       </div>

                       <div class="mb-3">
                           <label for="password" class="form-label">비밀번호</label>
                           <input type="password" class="form-control form-control-sm" id="password" name="password" required>
                       </div>

                       <div class="mb-3">
                           <label for="name" class="form-label">이름</label>
                           <input type="text" class="form-control form-control-sm" id="name" name="name" required>
                       </div>

                       <div class="mb-3">
                           <label for="birthDate" class="form-label">생년월일</label>
                           <input type="date" class="form-control form-control-sm" id="birthDate" name="birth_date" required>
                       </div>

                       <div class="mb-3">
                           <label class="form-label">성별</label>
                           <div>
                               <div class="form-check-inline">
                                   <input class="form-check-input" type="radio" name="gender" id="genderM" value="M" required>
                                   <label class="form-check-label" for="genderM" style="color: #2D4470;">남</label>
                               </div>
                               <div class="form-check-inline">
                                   <input class="form-check-input" type="radio" name="gender" id="genderF" value="F">
                                   <label class="form-check-label" for="genderF" style="color: #2D4470;">여</label>
                               </div>
                           </div>
                       </div>

                   </div>

                   <!-- 오른쪽 -->
                   <div class="col-md-6">
                   
                       <div class="mb-3">
                           <label for="phone" class="form-label">연락처</label>
                           <input type="tel" class="form-control form-control-sm" id="phone" name="phone" required>
                       </div>
                       
                       <div class="mb-3">
                           <label for="email" class="form-label">이메일</label>
                           <input type="email" class="form-control form-control-sm" id="email" name="email">
                       </div>

                       <div class="mb-3">
                           <label for="address" class="form-label">기본 주소</label>
                           <input type="text" class="form-control form-control-sm" id="address" name="address">
                       </div>

                       <div class="mb-3">
                           <label for="role" class="form-label">권한</label>
                           <select class="form-select form-select-sm" id="role" name="role">
                               <option value="ROLE_USER" selected>회원</option>
                               <option value="ROLE_ADMIN">관리자</option>
                           </select>
                       </div>

                       <div class="mb-3">
                           <label for="regDate" class="form-label">등록일</label>
                           <input type="date" class="form-control form-control-sm" id="regDate" name="reg_date">
                           <script>
                               document.getElementById("regDate").value = new Date().toISOString().split('T')[0];
                           </script>
                       </div>
                   </div>
               </div>

               <div class="d-flex justify-content-end gap-2 mt-3">
                   <button type="submit" class="btn text-white btn-sm" style="background: #2d4470; box-shadow: 1px 1px 1px #2d4470;">등록</button>
                   <button type="button" class="btn btn-secondary btn-sm">취소</button>
                   <a href="${pageContext.request.contextPath}/customer/list" class="btn bg-gradient-light border btn-sm">목록</a>
               </div>
           </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../includes/footer.jsp"%>