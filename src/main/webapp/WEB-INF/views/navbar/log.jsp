<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value="시스템 로그" />
<%@ include file="../includes/header.jsp" %>

<div class="system-log-container">
  <div class="system-log-title">📋 시스템 로그</div>
  
  <table class="system-log-table">
    <thead>
      <tr>
        <th>#</th>
        <th>사용자 ID</th>
        <th>동작</th>
        <th>IP 주소</th>
        <th>결과</th>
        <th>발생일시</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>admin</td>
        <td>로그인</td>
        <td>192.168.0.2</td>
        <td><span class="badge badge-success">성공</span></td>
        <td>2025-07-18 09:23:45</td>
      </tr>
      <tr>
        <td>2</td>
        <td>jyj</td>
        <td>고객 정보 수정</td>
        <td>192.168.0.5</td>
        <td><span class="badge badge-success">성공</span></td>
        <td>2025-07-17 15:48:21</td>
      </tr>
      <tr>
        <td>3</td>
        <td>guest</td>
        <td>로그인</td>
        <td>192.168.0.12</td>
        <td><span class="badge badge-fail">실패</span></td>
        <td>2025-07-17 11:03:10</td>
      </tr>
      <tr>
        <td>4</td>
        <td>admin</td>
        <td>상품 삭제</td>
        <td>192.168.0.2</td>
        <td><span class="badge badge-success">성공</span></td>
        <td>2025-07-16 14:12:34</td>
      </tr>
      <tr>
        <td>5</td>
        <td>sjh950303</td>
        <td>고객 삭제</td>
        <td>192.168.0.5</td>
        <td><span class="badge badge-fail">실패</span></td>
        <td>2025-07-15 09:40:55</td>
      </tr>
    </tbody>
  </table>
</div>
<%@ include file="../includes/footer.jsp" %>