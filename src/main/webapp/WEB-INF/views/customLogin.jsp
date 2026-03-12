<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커스텀 로그인 폼</title>
</head>
<body>
	<h1>커스텀 로그인 폼</h1>
	<h2>
		<c:out value="${error }" />
	</h2>
	<h2>
		<c:out value="${logout }" />
	</h2>
<!-- action 속성값이 /login으로 지정 됨
	 = 실제로 로그인 처리 작업은 /login을 통해서 이루어지는데 (반드시) POST방식으로 데이터를 전송해야만 한다. -->
	<form action="/login" method="post">
		<div>
			<input type="text" name="username" value="admin">
		</div>
		<div>
			<input type="password" name="password" value="1111">
		</div>
		<div>
			<input type="submit" value="로그인" />
		</div>
		<!-- CSSF의 토큰과 값을 같이 넘겨줘야 함 | name EL값은 _csrf 속성명으로 처리, value값은 임의의 토큰값 지정 -->
		<input type="hidden" name="${_csrf.parameterName }" value="${_rsrf.token }" />
	</form>
</body>
</html>