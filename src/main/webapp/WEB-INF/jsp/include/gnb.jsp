<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex">
	<div class="logo">
		<h1 class="textGray p-4 font-weight-bold">OnLife</h1>
	</div>
	<div class="login-info d-flex justify-content-end">
		
		<%-- 로그인이 된 경우 --%>
		<c:if test="${not empty userName }">
			<div class="mt-5 mr-5">
				<span class="textGray"><b>${userName}</b>님 안녕하세요</span>
				<a href="/user/sign_out" class="textPink font-weight-bold ml-3">로그아웃</a>
			</div>
		</c:if>
		
		<%-- 로그인이 안된 경우 --%>
		<c:if test="${empty userName }">
			<div class="mt-5 mr-5">
				<a href="/user/sign_in_view" class="textGray font-weight-bold ml-3">로그인</a>
			</div>
		</c:if>
	</div>
</div>